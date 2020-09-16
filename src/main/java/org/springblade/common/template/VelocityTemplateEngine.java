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

import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.config.ConstVal;
import lombok.extern.slf4j.Slf4j;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;
import org.springblade.common.build.CodeBuilder;
import org.springblade.core.tool.utils.Charsets;
import org.springblade.modules.develop.dto.ModelDTO;
import org.springblade.modules.develop.entity.TemplateFile;

import java.io.*;
import java.util.Map;
import java.util.Properties;

/**
 * VelocityTemplateEngine
 *
 * @author Chill
 */
@Slf4j
public class VelocityTemplateEngine implements TemplateEngine {

	private static VelocityEngine velocityEngine;

	static {
		Properties properties = new Properties();
		properties.setProperty(ConstVal.VM_LOAD_PATH_KEY, ConstVal.VM_LOAD_PATH_VALUE);
		properties.setProperty(Velocity.FILE_RESOURCE_LOADER_PATH, StringPool.EMPTY);
		properties.setProperty(Velocity.ENCODING_DEFAULT, Charsets.UTF_8_NAME);
		properties.setProperty(Velocity.INPUT_ENCODING, Charsets.UTF_8_NAME);
		properties.setProperty("file.resource.loader.unicode", StringPool.TRUE);
		velocityEngine = new VelocityEngine(properties);
	}

	@Override
	public void build(TemplateFile templateFile, CodeBuilder codeBuilder, ModelDTO model, String outputPath, boolean isCover) {
		File dir = new File(outputPath);
		File parentDir = dir.getParentFile();
		boolean exists = parentDir.exists();
		if (!exists && !parentDir.mkdirs()) {
			throw new RuntimeException("目录创建出错");
		}
		if (!dir.exists() || isCover) {
			try (PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(outputPath), Charsets.UTF_8_NAME))) {
				VelocityContext context = new VelocityContext();
				Map<String, Object> variable = TemplateEngineBuilder.getVariable(templateFile, codeBuilder, model, null);
				variable.forEach(context::put);
				velocityEngine.evaluate(context, printWriter, "build", templateFile.getFileContent());
				log.info("模板引擎[VelocityEngine]=>生成文件:[" + outputPath + "]成功");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}

	@Override
	public String process(String templateStr, Map<String, Object> vars) {
		return process(templateStr, null, null, null, vars);
	}

	@Override
	public String process(String templateStr, TemplateFile templateFile, CodeBuilder codeBuilder, ModelDTO model, Map<String, Object> vars) {
		StringWriter stringWriter = new StringWriter();
		VelocityContext context = new VelocityContext();
		Map<String, Object> variable = TemplateEngineBuilder.getVariable(templateFile, codeBuilder, model, vars);
		variable.forEach(context::put);
		velocityEngine.evaluate(context, stringWriter, "build", templateStr);
		return stringWriter.toString();
	}

}
