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
 * 代码模板文件表实体类
 *
 * @author Chill
 */
@Data
@TableName("gen_template_file")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "TemplateFile对象", description = "代码模板文件表")
public class TemplateFile extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@ApiModelProperty(value = "主键")
	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;
	/**
	 * 模板主键
	 */
	@ApiModelProperty(value = "模板主键")
	private Integer templateId;
	/**
	 * 名称
	 */
	@ApiModelProperty(value = "文件名称")
	private String fileName;
	/**
	 * 编号
	 */
	@ApiModelProperty(value = "文件编号")
	private String fileCode;
	/**
	 * 构建代号
	 */
	@ApiModelProperty(value = "构建代号")
	private String buildCode;
	/**
	 * 系统分类
	 */
	@ApiModelProperty(value = "系统分类")
	private Integer fileCategory;
	/**
	 * 相对路径
	 */
	@ApiModelProperty(value = "相对路径")
	private String filePath;
	/**
	 * 备注
	 */
	@ApiModelProperty(value = "备注")
	private String fileRemark;
	/**
	 * 内容
	 */
	@ApiModelProperty(value = "内容")
	private String fileContent;


}
