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
package org.springblade.common.template;

import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import org.springblade.common.build.CodeBuilder;
import org.springblade.common.tool.CommonUtil;
import org.springblade.modules.develop.dto.ModelDTO;
import org.springblade.modules.develop.entity.TemplateFile;

import java.util.HashMap;
import java.util.Map;

/**
 * 模板引擎构建类
 *
 * @author Chill
 */
public class TemplateEngineBuilder {

	/**
	 * 获取模板引擎
	 *
	 * @param templateEngine 引擎类型
	 */
	public static TemplateEngine getEngine(Integer templateEngine) {
		if (TemplateEnum.FREEMARKER.getCategory() == templateEngine) {
			return new FreemarkerTemplateEngine();
		} else if (TemplateEnum.BEETL.getCategory() == templateEngine) {
			return new BeetlTemplateEngine();
		} else {
			return new VelocityTemplateEngine();
		}
	}

	/**
	 * 获取模板绑定
	 *
	 * @param templateFile 模板文件
	 * @param codeBuilder  模板参数
	 * @param model        代码模型
	 */
	public static Map<String, Object> getVariable(TemplateFile templateFile, CodeBuilder codeBuilder, ModelDTO model, Map<String, Object> vars) {
		Map<String, Object> variable = new HashMap<>(16);
		if (vars != null) {
			variable.putAll(vars);
		}
		if (codeBuilder != null) {
			variable.put("code", codeBuilder);
			variable.put("plan", codeBuilder.getPlan());
			variable.put("models", codeBuilder.getModels());
			variable.put("template", codeBuilder.getTemplate());
			String frontModule = CommonUtil.getFrontModuleBySrc(codeBuilder.getPlan().getSrcPath());
			variable.put("serviceName", "blade-".concat(frontModule));
			variable.put("serviceKey", frontModule);
			variable.put("menuId", IdWorker.getId());
			variable.put("addMenuId", IdWorker.getId());
			variable.put("editMenuId", IdWorker.getId());
			variable.put("removeMenuId", IdWorker.getId());
			variable.put("viewMenuId", IdWorker.getId());
		}
		if (model != null) {
			variable.put("model", model);
		}
		if (templateFile != null) {
			variable.put("file", templateFile);
		}
		return variable;
	}

}
