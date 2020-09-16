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

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springblade.core.mp.base.BaseEntity;

import java.time.LocalDateTime;

/**
 * 代码自定义查询实体类
 *
 * @author Chill
 */
@Data
@TableName("gen_custom_query")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "CustomQuery对象", description = "代码自定义查询")
public class CustomQuery extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@ApiModelProperty(value = "主键")
	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;
	/**
	 * 验证名
	 */
	@ApiModelProperty(value = "查询名")
	private String queryName;
	/**
	 * 验证键值
	 */
	@ApiModelProperty(value = "查询键值")
	private String queryKey;
	/**
	 * 验证规则增强
	 */
	@ApiModelProperty(value = "查询规则增强")
	private LocalDateTime queryRule;
	/**
	 * 排序
	 */
	@ApiModelProperty(value = "排序")
	private Integer sort;


}
