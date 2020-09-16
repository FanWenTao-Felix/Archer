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
package org.springblade.modules.develop.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import org.springblade.core.mp.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 代码方案表实体类
 *
 * @author Chill
 */
@Data
@TableName("gen_plan")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "Plan对象", description = "代码方案表")
public class Plan extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@ApiModelProperty(value = "主键")
	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;
	/**
	 * 方案名称
	 */
	@ApiModelProperty(value = "方案名称")
	private String planName;
	/**
	 * 方案编号
	 */
	@ApiModelProperty(value = "方案编号")
	private String planCode;
	/**
	 * 方案类型
	 */
	@ApiModelProperty(value = "方案类型")
	private Integer planType;
	/**
	 * 模板id
	 */
	@ApiModelProperty(value = "模板id")
	private Integer templateId;
	/**
	 * 前端根目录
	 */
	@ApiModelProperty(value = "前端根目录")
	private String frontendPath;
	/**
	 * 前端源码目录
	 */
	@ApiModelProperty(value = "前端源码目录")
	private String srcPath;
	/**
	 * 后端根目录
	 */
	@ApiModelProperty(value = "后端根目录")
	private String backendPath;
	/**
	 * 后端包名
	 */
	@ApiModelProperty(value = "后端包名")
	private String packagePath;


}
