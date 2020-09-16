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
 * 代码模板表实体类
 *
 * @author Chill
 */
@Data
@TableName("gen_template")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "Template对象", description = "代码模板表")
public class Template extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@ApiModelProperty(value = "主键")
	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;
	/**
	 * 模板名
	 */
	@ApiModelProperty(value = "模板名")
	private String templateName;
	/**
	 * 模板编号
	 */
	@ApiModelProperty(value = "模板编号")
	private String templateCode;
	/**
	 * 模板引擎
	 */
	@ApiModelProperty(value = "模板引擎")
	private Integer templateEngine;
	/**
	 * 是否覆盖
	 */
	@ApiModelProperty(value = "是否覆盖")
	private Integer isCover;
	/**
	 * 模板备注
	 */
	@ApiModelProperty(value = "模板备注")
	private String templateRemark;


}
