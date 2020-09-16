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
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import org.springblade.common.constant.CommonConstant;
import org.springblade.core.boot.ctrl.BladeController;
import org.springblade.core.launch.constant.AppConstant;
import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.Func;
import org.springblade.modules.develop.entity.CustomComponent;
import org.springblade.modules.develop.service.ICustomComponentService;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 代码自定义组件 控制器
 *
 * @author Chill
 */
@RestController
@AllArgsConstructor
@RequestMapping(AppConstant.APPLICATION_DEVELOP_NAME + "/custom-component")
@Api(value = "代码自定义组件", tags = "代码自定义组件接口")
public class CustomComponentController extends BladeController {

	private ICustomComponentService customComponentService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入customComponent")
	public R<CustomComponent> detail(CustomComponent customComponent) {
		CustomComponent detail = customComponentService.getOne(Condition.getQueryWrapper(customComponent));
		return R.data(detail);
	}

	/**
	 * 分页 代码自定义组件
	 */
	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入customComponent")
	public R<IPage<CustomComponent>> list(CustomComponent customComponent, Query query) {
		IPage<CustomComponent> pages = customComponentService.page(Condition.getPage(query), Condition.getQueryWrapper(customComponent).orderByAsc(CommonConstant.SORT_FIELD));
		return R.data(pages);
	}

	/**
	 * 新增 代码自定义组件
	 */
	@PostMapping("/save")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "新增", notes = "传入customComponent")
	public R save(@Valid @RequestBody CustomComponent customComponent) {
		return R.status(customComponentService.save(customComponent));
	}

	/**
	 * 修改 代码自定义组件
	 */
	@PostMapping("/update")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "修改", notes = "传入customComponent")
	public R update(@Valid @RequestBody CustomComponent customComponent) {
		return R.status(customComponentService.updateById(customComponent));
	}

	/**
	 * 新增或修改 代码自定义组件
	 */
	@PostMapping("/submit")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "新增或修改", notes = "传入customComponent")
	public R submit(@Valid @RequestBody CustomComponent customComponent) {
		return R.status(customComponentService.saveOrUpdate(customComponent));
	}


	/**
	 * 删除 代码自定义组件
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(customComponentService.deleteLogic(Func.toIntList(ids)));
	}

	/**
	 * 组件列表
	 */
	@GetMapping("/select")
	@ApiOperationSupport(order = 8)
	@ApiOperation(value = "组件列表", notes = "组件列表")
	public R<List<CustomComponent>> select() {
		List<CustomComponent> list = customComponentService.list(Wrappers.<CustomComponent>query().lambda().orderByAsc(CustomComponent::getSort));
		return R.data(list);
	}

}
