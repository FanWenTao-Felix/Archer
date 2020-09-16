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
import org.springblade.core.tool.utils.StringPool;
import org.springblade.modules.develop.entity.CustomQuery;
import org.springblade.modules.develop.service.ICustomQueryService;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 代码自定义查询 控制器
 *
 * @author Chill
 */
@RestController
@AllArgsConstructor
@RequestMapping(AppConstant.APPLICATION_DEVELOP_NAME + "/custom-query")
@Api(value = "代码自定义查询", tags = "代码自定义查询接口")
public class CustomQueryController extends BladeController {

	private ICustomQueryService customQueryService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入customQuery")
	public R<CustomQuery> detail(CustomQuery customQuery) {
		CustomQuery detail = customQueryService.getOne(Condition.getQueryWrapper(customQuery));
		return R.data(detail);
	}

	/**
	 * 分页 代码自定义查询
	 */
	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入customQuery")
	public R<IPage<CustomQuery>> list(CustomQuery customQuery, Query query) {
		IPage<CustomQuery> pages = customQueryService.page(Condition.getPage(query), Condition.getQueryWrapper(customQuery).orderByAsc(CommonConstant.SORT_FIELD));
		return R.data(pages);
	}

	/**
	 * 新增 代码自定义查询
	 */
	@PostMapping("/save")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "新增", notes = "传入customQuery")
	public R save(@Valid @RequestBody CustomQuery customQuery) {
		return R.status(customQueryService.save(customQuery));
	}

	/**
	 * 修改 代码自定义查询
	 */
	@PostMapping("/update")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "修改", notes = "传入customQuery")
	public R update(@Valid @RequestBody CustomQuery customQuery) {
		return R.status(customQueryService.updateById(customQuery));
	}

	/**
	 * 新增或修改 代码自定义查询
	 */
	@PostMapping("/submit")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "新增或修改", notes = "传入customQuery")
	public R submit(@Valid @RequestBody CustomQuery customQuery) {
		return R.status(customQueryService.saveOrUpdate(customQuery));
	}


	/**
	 * 删除 代码自定义查询
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(customQueryService.deleteLogic(Func.toIntList(ids)));
	}

	/**
	 * 查询列表
	 */
	@GetMapping("/select")
	@ApiOperationSupport(order = 8)
	@ApiOperation(value = "查询列表", notes = "查询列表")
	public R<List<CustomQuery>> select() {
		List<CustomQuery> list = customQueryService.list(Wrappers.<CustomQuery>query().lambda().orderByAsc(CustomQuery::getSort));
		list.forEach(customQuery -> customQuery.setQueryName(customQuery.getQueryName() + StringPool.LEFT_BRACKET + customQuery.getQueryKey() + StringPool.RIGHT_BRACKET));
		return R.data(list);
	}


}
