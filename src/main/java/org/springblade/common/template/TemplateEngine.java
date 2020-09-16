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

import org.springblade.common.build.CodeBuilder;
import org.springblade.modules.develop.dto.ModelDTO;
import org.springblade.modules.develop.entity.TemplateFile;

import java.util.Map;

/**
 * 模板引擎
 *
 * @author Chill
 */
public interface TemplateEngine {

	/**
	 * 输出模板
	 *
	 * @param templateFile 模板文件
	 * @param codeBuilder  模板参数
	 * @param model        代码模型
	 * @param outputPath   输出路径
	 * @param isCover      是否覆盖
	 */
	void build(TemplateFile templateFile, CodeBuilder codeBuilder, ModelDTO model, String outputPath, boolean isCover);

	/**
	 * 解析模板
	 *
	 * @param templateStr 模板内容
	 * @param vars        绑定参数
	 * @return String
	 */
	String process(String templateStr, Map<String, Object> vars);

	/**
	 * 解析模板
	 *
	 * @param templateStr  模板内容
	 * @param templateFile 模板文件
	 * @param codeBuilder  模板参数
	 * @param model        代码模型
	 * @param vars         绑定参数
	 * @return String
	 */
	String process(String templateStr, TemplateFile templateFile, CodeBuilder codeBuilder, ModelDTO model, Map<String, Object> vars);

}
