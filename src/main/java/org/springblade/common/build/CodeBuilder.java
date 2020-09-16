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
package org.springblade.common.build;

import lombok.Data;
import org.springblade.modules.develop.dto.ModelDTO;
import org.springblade.modules.develop.dto.TemplateDTO;
import org.springblade.modules.develop.entity.Plan;

import java.io.Serializable;
import java.util.List;

/**
 * 代码构建类
 *
 * @author Chill
 */
@Data
public class CodeBuilder implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 代码方案
	 */
	private Plan plan;

	/**
	 * 代码模板
	 */
	private TemplateDTO template;

	/**
	 * 代码模型
	 */
	private List<ModelDTO> models;

}
