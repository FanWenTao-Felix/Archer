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
package org.springblade.modules.develop.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springblade.modules.develop.entity.Plan;
import org.springblade.modules.develop.entity.PlanModel;

import java.util.List;

/**
 * 代码方案表视图实体类
 *
 * @author Chill
 */
@Data
@ApiModel(value = "PlanVO对象", description = "代码方案表")
public class PlanVO {
	private static final long serialVersionUID = 1L;

	/**
	 * 代码方案
	 */
	@ApiModelProperty(value = "代码方案")
	private Plan plan;
	/**
	 * 代码方案模型
	 */
	@ApiModelProperty(value = "代码方案模型")
	private List<PlanModel> model;

}
