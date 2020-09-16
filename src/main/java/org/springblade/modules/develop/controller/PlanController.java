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
package org.springblade.modules.develop.controller;

import cn.hutool.core.io.FileUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springblade.common.enums.PlanEnum;
import org.springblade.common.tool.CommonUtil;
import org.springblade.core.boot.ctrl.BladeController;
import org.springblade.core.launch.constant.AppConstant;
import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.StringPool;
import org.springblade.modules.develop.entity.Plan;
import org.springblade.modules.develop.service.IPlanModelService;
import org.springblade.modules.develop.service.IPlanService;
import org.springblade.modules.develop.vo.PlanModelVO;
import org.springblade.modules.develop.vo.PlanVO;
import org.springblade.modules.develop.wrapper.PlanWrapper;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import static org.springblade.common.tool.CommonUtil.*;

/**
 * 代码方案表 控制器
 *
 * @author Chill
 */
@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping(AppConstant.APPLICATION_DEVELOP_NAME + "/plan")
@Api(value = "代码方案表", tags = "代码方案表接口")
public class PlanController extends BladeController {

	private IPlanService planService;
	private IPlanModelService planModelService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入plan")
	public R<PlanVO> detail(Plan plan) {
		Plan detail = planService.getOne(Condition.getQueryWrapper(plan));
		return R.data(PlanWrapper.build().entityVO(detail));
	}

	/**
	 * 分页 代码方案表
	 */
	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入plan")
	public R<IPage<Plan>> list(Plan plan, Query query) {
		IPage<Plan> pages = planService.page(Condition.getPage(query), Condition.getQueryWrapper(plan));
		return R.data(pages);
	}

	/**
	 * 新增 代码方案表
	 */
	@PostMapping("/save")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "新增", notes = "传入planVO")
	public R save(@Valid @RequestBody PlanVO planVO) {
		return R.status(planService.savePlan(planVO));
	}

	/**
	 * 修改 代码方案表
	 */
	@PostMapping("/update")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "修改", notes = "传入planVO")
	public R update(@Valid @RequestBody PlanVO planVO) {
		return R.status(planService.updatePlan(planVO));
	}

	/**
	 * 代码生成
	 */
	@PostMapping("/build-code")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "代码生成", notes = "传入ids")
	public R buildCode(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		planService.generatePlan(ids, PlanEnum.BUILD);
		return R.success("代码生成成功");
	}

	/**
	 * 代码导出
	 */
	@PostMapping("/zip-code")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "代码导出", notes = "传入id")
	public R zipCode(@ApiParam(value = "主键集合", required = true) @RequestParam String id) {
		planService.generatePlan(id, PlanEnum.ZIP);
		return R.success("代码导出成功");
	}

	/**
	 * 代码下载
	 */
	@SneakyThrows
	@GetMapping("/download-code")
	@ApiOperationSupport(order = 8)
	@ApiOperation(value = "代码下载", notes = "传入id")
	public void downloadCode(Integer id, HttpServletResponse response) {
		Plan plan = planService.getById(id);
		String path = CommonUtil.getCodePath() + StringPool.SLASH;
		String srcPath = path + StringPool.SLASH + GEN_NAME + StringPool.SLASH + plan.getPlanCode();
		String zipName = plan.getPlanCode() + ZIP_SUFFIX;
		String zipPath = path + StringPool.SLASH + ZIP_NAME + StringPool.SLASH + zipName;
		//创建输出流，下载zip
		try (OutputStream out = response.getOutputStream(); FileInputStream in = new FileInputStream(new File(zipPath))) {
			byte[] buffer = new byte[1024];
			int read;
			//设置响应头，控制浏览器下载该文件
			response.setHeader("Content-Type", "application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(zipName, "UTF-8"));
			while ((read = in.read(buffer)) != -1) {
				out.write(buffer, 0, read);
			}
		} finally {
			try {
				//删除文件压缩包
				FileUtil.del(srcPath);
				FileUtil.del(zipPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * 方案模型列表
	 */
	@GetMapping("/plan-models")
	@ApiOperationSupport(order = 9)
	public R<List<PlanModelVO>> planModels(@RequestParam Integer planId) {
		List<PlanModelVO> list = planModelService.planModels(planId);
		return R.data(list);
	}

	/**
	 * 删除 代码方案表
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 10)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(planService.deleteLogic(Func.toIntList(ids)));
	}


}
