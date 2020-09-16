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
import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import lombok.extern.slf4j.Slf4j;
import org.springblade.common.build.CodeBuilder;
import org.springblade.core.tool.utils.Charsets;
import org.springblade.modules.develop.dto.ModelDTO;
import org.springblade.modules.develop.entity.TemplateFile;

import java.io.*;
import java.util.Map;

/**
 * FreemarkerTemplateEngine
 *
 * @author Chill
 */
@Slf4j
public class FreemarkerTemplateEngine implements TemplateEngine {

	private static Configuration configuration;

	static {
		StringTemplateLoader templateLoader = new StringTemplateLoader();
		configuration = new Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
		configuration.setTemplateLoader(templateLoader);
		configuration.setDefaultEncoding(Charsets.UTF_8_NAME);
		configuration.setClassForTemplateLoading(FreemarkerTemplateEngine.class, StringPool.SLASH);
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
				Template template = new Template(templateFile.getFileContent(), templateFile.getFileContent(), configuration);
				Map<String, Object> variable = TemplateEngineBuilder.getVariable(templateFile, codeBuilder, model, null);
				template.process(variable, printWriter);
				log.info("模板引擎[FreemarkerEngine]=>生成文件:[" + outputPath + "]成功");
			} catch (IOException | TemplateException ex) {
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
		try {
			StringWriter stringWriter = new StringWriter();
			Template template = new Template(templateStr, templateStr, configuration);
			Map<String, Object> variable = TemplateEngineBuilder.getVariable(templateFile, codeBuilder, model, vars);
			template.process(variable, stringWriter);
			return stringWriter.toString();
		} catch (IOException | TemplateException e) {
			e.printStackTrace();
			return null;
		}
	}

}
