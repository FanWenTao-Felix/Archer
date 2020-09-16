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
import org.springblade.core.boot.ctrl.BladeController;
import org.springblade.core.launch.constant.AppConstant;
import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.StringPool;
import org.springblade.modules.develop.entity.CustomPath;
import org.springblade.modules.develop.service.ICustomPathService;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 代码自定义路径 控制器
 *
 * @author Chill
 */
@RestController
@AllArgsConstructor
@RequestMapping(AppConstant.APPLICATION_DEVELOP_NAME + "/custom-path")
@Api(value = "代码自定义路径", tags = "代码自定义路径接口")
public class CustomPathController extends BladeController {

	private ICustomPathService customPathService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入customPath")
	public R<CustomPath> detail(CustomPath customPath) {
		CustomPath detail = customPathService.getOne(Condition.getQueryWrapper(customPath));
		return R.data(detail);
	}

	/**
	 * 分页 代码自定义路径
	 */
	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入customPath")
	public R<IPage<CustomPath>> list(CustomPath customPath, Query query) {
		IPage<CustomPath> pages = customPathService.page(Condition.getPage(query), Condition.getQueryWrapper(customPath).orderByAsc("path_category", "sort"));
		return R.data(pages);
	}

	/**
	 * 新增 代码自定义路径
	 */
	@PostMapping("/save")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "新增", notes = "传入customPath")
	public R save(@Valid @RequestBody CustomPath customPath) {
		return R.status(customPathService.save(customPath));
	}

	/**
	 * 修改 代码自定义路径
	 */
	@PostMapping("/update")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "修改", notes = "传入customPath")
	public R update(@Valid @RequestBody CustomPath customPath) {
		return R.status(customPathService.updateById(customPath));
	}

	/**
	 * 新增或修改 代码自定义路径
	 */
	@PostMapping("/submit")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "新增或修改", notes = "传入customPath")
	public R submit(@Valid @RequestBody CustomPath customPath) {
		return R.status(customPathService.saveOrUpdate(customPath));
	}


	/**
	 * 删除 代码自定义路径
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(customPathService.deleteLogic(Func.toIntList(ids)));
	}

	/**
	 * 组件列表
	 */
	@GetMapping("/select")
	@ApiOperationSupport(order = 8)
	@ApiOperation(value = "路径列表", notes = "路径列表")
	public R<List<CustomPath>> select(@RequestParam Integer category) {
		List<CustomPath> list = customPathService.list(Wrappers.<CustomPath>query().lambda().eq(CustomPath::getPathCategory, category).orderByAsc(CustomPath::getSort));
		list.forEach(customPath -> customPath.setPathName(customPath.getPathName() + StringPool.LEFT_BRACKET + customPath.getPathValue() + StringPool.RIGHT_BRACKET));
		return R.data(list);
	}


}
