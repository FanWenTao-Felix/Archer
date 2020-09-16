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
package org.springblade.modules.develop.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import org.springblade.core.boot.ctrl.BladeController;
import org.springblade.core.launch.constant.AppConstant;
import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.StringPool;
import org.springblade.modules.develop.entity.Template;
import org.springblade.modules.develop.service.ITemplateService;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 代码模板表 控制器
 *
 * @author Chill
 */
@RestController
@AllArgsConstructor
@RequestMapping(AppConstant.APPLICATION_DEVELOP_NAME + "/template")
@Api(value = "代码模板表", tags = "代码模板表接口")
public class TemplateController extends BladeController {

	private ITemplateService templateService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入template")
	public R<Template> detail(Template template) {
		Template detail = templateService.getOne(Condition.getQueryWrapper(template));
		return R.data(detail);
	}

	/**
	 * 分页 代码模板表
	 */
	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入template")
	public R<IPage<Template>> list(Template template, Query query) {
		IPage<Template> pages = templateService.page(Condition.getPage(query), Condition.getQueryWrapper(template));
		return R.data(pages);
	}

	/**
	 * 新增 代码模板表
	 */
	@PostMapping("/save")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "新增", notes = "传入template")
	public R save(@Valid @RequestBody Template template) {
		return R.status(templateService.save(template));
	}

	/**
	 * 修改 代码模板表
	 */
	@PostMapping("/update")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "修改", notes = "传入template")
	public R update(@Valid @RequestBody Template template) {
		return R.status(templateService.updateById(template));
	}

	/**
	 * 新增或修改 代码模板表
	 */
	@PostMapping("/submit")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "新增或修改", notes = "传入template")
	public R submit(@Valid @RequestBody Template template) {
		return R.status(templateService.saveOrUpdate(template));
	}


	/**
	 * 删除 代码模板表
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(templateService.deleteLogic(Func.toIntList(ids)));
	}

	/**
	 * 模板列表
	 */
	@GetMapping("/select")
	@ApiOperationSupport(order = 8)
	@ApiOperation(value = "模板列表", notes = "模板列表")
	public R<List<Template>> select() {
		List<Template> list = templateService.list();
		list.forEach(template -> template.setTemplateName(template.getTemplateName() + StringPool.LEFT_BRACKET + template.getTemplateCode() + StringPool.RIGHT_BRACKET));
		return R.data(list);
	}


}
