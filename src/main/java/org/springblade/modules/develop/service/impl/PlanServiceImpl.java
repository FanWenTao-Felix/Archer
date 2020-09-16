/*
 *      Copyright (c) 2018-2028, Chill Zhuang All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 *  Redistributions of source code must retain the above copyright notice,
 *  this list of conditions and the following disclaimer.
 *  Redistributions in binary form must reproduce the above copyright
 *  notice, this list of conditions and the following disclaimer in the
 *  documentation and/or other materials provided with the distribution.
 *  Neither the name of the dreamlu.net developer nor the names of its
 *  contributors may be used to endorse or promote products derived from
 *  this software without specific prior written permission.
 *  Author: Chill 庄骞 (smallchill@163.com)
 */
package org.springblade.modules.develop.service.impl;

import cn.hutool.core.util.ZipUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springblade.common.build.CodeBuilder;
import org.springblade.common.constant.CommonConstant;
import org.springblade.common.enums.PlanEnum;
import org.springblade.common.template.TemplateEngine;
import org.springblade.common.template.TemplateEngineBuilder;
import org.springblade.common.tool.CommonUtil;
import org.springblade.core.log.exception.ServiceException;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springblade.core.tool.jackson.JsonUtil;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.StringPool;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.modules.develop.dto.ModelDTO;
import org.springblade.modules.develop.dto.TemplateDTO;
import org.springblade.modules.develop.entity.*;
import org.springblade.modules.develop.mapper.PlanMapper;
import org.springblade.modules.develop.service.*;
import org.springblade.modules.develop.vo.PlanVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

import static org.springblade.common.tool.CommonUtil.*;

/**
 * 代码方案表 服务实现类
 *
 * @author Chill
 */
@Slf4j
@Service
@AllArgsConstructor
public class PlanServiceImpl extends BaseServiceImpl<PlanMapper, Plan> implements IPlanService {

	private IPlanModelService planModelService;
	private ITemplateService templateService;
	private ITemplateFileService templateFileService;
	private IModelService modelService;
	private IModelPrototypeService modelPrototypeService;
	private ICustomValidateService customValidateService;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean savePlan(PlanVO planVO) {
		Plan plan = planVO.getPlan();
		List<PlanModel> model = planVO.getModel();
		boolean temp = this.save(plan);
		if (temp) {
			Integer planId = plan.getId();
			// 批量新增模型
			model.forEach(planModel -> {
				planModel.setPlanId(planId);
				planModelService.save(planModel);
			});
		} else {
			throw new ServiceException("代码方案新增失败");
		}
		return true;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean updatePlan(PlanVO planVO) {
		Plan plan = planVO.getPlan();
		List<PlanModel> model = planVO.getModel();
		boolean temp = this.updateById(plan);
		if (temp) {
			Integer planId = plan.getId();
			// 删除绑定的模型
			planModelService.remove(Wrappers.<PlanModel>query().lambda().eq(PlanModel::getPlanId, planId));
			// 批量新增模型
			model.forEach(planModel -> {
				planModel.setPlanId(planId);
				planModelService.save(planModel);
			});
		} else {
			throw new ServiceException("代码方案修改失败");
		}
		return true;
	}

	@Override
	public void generatePlan(String ids, PlanEnum planEnum) {
		Collection<Plan> plans = this.listByIds(Func.toIntList(ids));
		plans.forEach(plan -> {
			CodeBuilder codeBuilder = new CodeBuilder();
			// 构建方案数据
			codeBuilder.setPlan(plan);
			// 构建模板数据
			Template template = templateService.getById(plan.getTemplateId());
			// 获取模板解析器
			Integer templateEngine = template.getTemplateEngine();
			TemplateEngine engine = TemplateEngineBuilder.getEngine(templateEngine);
			// 构建模板文件数据
			List<TemplateFile> files = templateFileService.list(Wrappers.<TemplateFile>query().lambda().eq(TemplateFile::getTemplateId, template.getId()));
			TemplateDTO templateDTO = BeanUtil.copy(template, TemplateDTO.class);
			templateDTO.setFiles(files);
			codeBuilder.setTemplate(templateDTO);
			// 构建模型数据
			List<PlanModel> planModels = planModelService.list(Wrappers.<PlanModel>query().lambda().eq(PlanModel::getPlanId, plan.getId()));
			List<ModelDTO> models = new ArrayList<>();
			planModels.forEach(planModel -> {
				Model model = modelService.getById(planModel.getModelId());
				ModelDTO modelDTO = BeanUtil.copy(model, ModelDTO.class);
				List<ModelPrototype> prototypes = modelPrototypeService.list(Wrappers.<ModelPrototype>query().lambda().eq(ModelPrototype::getModelId, model.getId()));
				modelDTO.setPrototypes(prototypes);
				modelDTO.setBuildCode(planModel.getBuildCode());
				models.add(modelDTO);
			});
			codeBuilder.setModels(models);
			// 循环进行代码生成
			files.forEach(templateFile -> models.forEach(model -> {
				List<ModelPrototype> prototypes = model.getPrototypes();
				// 循环获取验证规则
				prototypes.forEach(prototype -> {
					// 动态解析验证规则
					CustomValidate validate = customValidateService.getOne(Wrappers.<CustomValidate>query().lambda().eq(CustomValidate::getValidateKey, prototype.getValidateType()));
					if (validate != null && StringUtil.isNotBlank(validate.getValidateRule())) {
						Map<String, Object> vars = new HashMap<>(8);
						vars.put("propertyName", prototype.getPropertyName());
						String validateRule = engine.process(validate.getValidateRule(), templateFile, codeBuilder, model, vars);
						prototype.setValidateRule(validateRule);
					}
				});
				// 循环构建代号
				Arrays.stream(templateFile.getBuildCode().split(StringPool.COMMA)).forEach(buildCode -> {
					// 匹配构建代号并生成文件
					if (StringUtil.isNoneBlank(model.getBuildCode(), buildCode) && model.getBuildCode().equals(buildCode)) {
						// 根据配置组合出绝对路径
						String rootPath = CommonUtil.getCodePath() + StringPool.SLASH + GEN_NAME + StringPool.SLASH + plan.getPlanCode();
						String backendPath = planEnum == PlanEnum.BUILD ? plan.getBackendPath() : rootPath + StringPool.SLASH + BACKEND_NAME;
						String frontendPath = planEnum == PlanEnum.BUILD ? plan.getFrontendPath() : rootPath + StringPool.SLASH + FRONTEND_NAME;
						String realPath = templateFile.getFileCategory() == 1
							? (backendPath + CommonConstant.JAVA_COMMON_PATH + StringPool.SLASH + CommonUtil.getRealPathByPackage(plan.getPackagePath()))
							: (frontendPath + CommonConstant.WEB_COMMON_PATH);
						String frontModule = CommonUtil.getFrontModuleBySrc(plan.getSrcPath(), templateFile.getFileCategory());
						String outputPath = realPath + templateFile.getFilePath() + StringPool.SLASH + frontModule + StringPool.SLASH + engine.process(templateFile.getFileName(), templateFile, codeBuilder, model, null);
						engine.build(templateFile, codeBuilder, model, outputPath, template.getIsCover() == 1);
					}
				});
			}));
			// 代码压缩
			if (planEnum == PlanEnum.ZIP) {
				String path = CommonUtil.getCodePath() + StringPool.SLASH;
				String srcPath = path + StringPool.SLASH + GEN_NAME + StringPool.SLASH + plan.getPlanCode();
				String zipPath = path + StringPool.SLASH + ZIP_NAME + StringPool.SLASH + plan.getPlanCode() + ZIP_SUFFIX;
				ZipUtil.zip(srcPath, zipPath, true);
			}
			log.info("构建对象Json:" + JsonUtil.toJson(codeBuilder));
		});
	}
}
