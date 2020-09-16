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

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.converts.OracleTypeConvert;
import com.baomidou.mybatisplus.generator.config.converts.PostgreSqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
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
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.modules.develop.entity.Datasource;
import org.springblade.modules.develop.entity.Model;
import org.springblade.modules.develop.entity.ModelPrototype;
import org.springblade.modules.develop.service.IDatasourceService;
import org.springblade.modules.develop.service.IModelPrototypeService;
import org.springblade.modules.develop.service.IModelService;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 代码模型表 控制器
 *
 * @author Chill
 */
@RestController
@AllArgsConstructor
@RequestMapping(AppConstant.APPLICATION_DEVELOP_NAME + "/model")
@Api(value = "代码模型表", tags = "代码模型表接口")
public class ModelController extends BladeController {

	private IModelService modelService;
	private IModelPrototypeService modelPrototypeService;
	private IDatasourceService datasourceService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入model")
	public R<Model> detail(Model model) {
		Model detail = modelService.getOne(Condition.getQueryWrapper(model));
		return R.data(detail);
	}

	/**
	 * 分页 代码模型表
	 */
	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入model")
	public R<IPage<Model>> list(Model model, Query query) {
		IPage<Model> pages = modelService.page(Condition.getPage(query), Condition.getQueryWrapper(model));
		return R.data(pages);
	}

	/**
	 * 新增 代码模型表
	 */
	@PostMapping("/save")
	@ApiOperationSupport(order = 3)
	@ApiOperation(value = "新增", notes = "传入model")
	public R save(@Valid @RequestBody Model model) {
		return R.status(modelService.save(model));
	}

	/**
	 * 修改 代码模型表
	 */
	@PostMapping("/update")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "修改", notes = "传入model")
	public R update(@Valid @RequestBody Model model) {
		return R.status(modelService.updateById(model));
	}

	/**
	 * 新增或修改 代码模型表
	 */
	@PostMapping("/submit")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "新增或修改", notes = "传入model")
	public R submit(@Valid @RequestBody Model model) {
		return R.status(modelService.saveOrUpdate(model));
	}

	/**
	 * 删除 代码模型表
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(modelService.deleteLogic(Func.toIntList(ids)));
	}

	/**
	 * 模型列表
	 */
	@GetMapping("/select")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "模型列表", notes = "模型列表")
	public R<List<Model>> select() {
		List<Model> list = modelService.list();
		list.forEach(model -> model.setModelName(model.getModelName() + StringPool.LEFT_BRACKET + model.getModelCode() + StringPool.RIGHT_BRACKET));
		return R.data(list);
	}

	/**
	 * 获取物理表列表
	 */
	@GetMapping("/table-list")
	@ApiOperationSupport(order = 8)
	@ApiOperation(value = "物理表列表", notes = "传入model")
	public R<List<TableInfo>> tableList(Integer datasourceId) {
		Datasource datasource = datasourceService.getById(datasourceId);
		ConfigBuilder config = getConfigBuilder(datasource);
		List<TableInfo> tableInfoList = config.getTableInfoList();
		tableInfoList.forEach(tableInfo -> tableInfo.setComment(tableInfo.getName() + StringPool.COLON + tableInfo.getComment()));
		return R.data(tableInfoList);
	}

	/**
	 * 获取物理表信息
	 */
	@GetMapping("/table-info")
	@ApiOperationSupport(order = 9)
	@ApiOperation(value = "物理表信息", notes = "传入model")
	public R<TableInfo> tableInfo(Integer modelId, String tableName, Integer datasourceId) {
		if (StringUtil.isEmpty(tableName)) {
			Model model = modelService.getById(modelId);
			tableName = model.getModelTable();
		}
		TableInfo tableInfo = getTableInfo(tableName, datasourceId);
		return R.data(tableInfo);
	}

	/**
	 * 获取字段信息
	 */
	@GetMapping("/model-prototype")
	@ApiOperationSupport(order = 9)
	@ApiOperation(value = "物理表信息", notes = "传入model")
	public R modelPrototype(Integer modelId, Integer datasourceId) {
		List<ModelPrototype> modelPrototypeList = modelPrototypeService.list(Wrappers.<ModelPrototype>query().lambda().eq(ModelPrototype::getModelId, modelId));
		if (modelPrototypeList.size() > 0) {
			return R.data(modelPrototypeList);
		}
		Model model = modelService.getById(modelId);
		String tableName = model.getModelTable();
		TableInfo tableInfo = getTableInfo(tableName, datasourceId);
		if (tableInfo != null) {
			return R.data(tableInfo.getFields());
		} else {
			return R.fail("未获得相关表信息");
		}
	}

	/**
	 * 获取表信息
	 *
	 * @param tableName    表名
	 * @param datasourceId 数据源主键
	 */
	private TableInfo getTableInfo(String tableName, Integer datasourceId) {
		Datasource datasource = datasourceService.getById(datasourceId);
		ConfigBuilder config = getConfigBuilder(datasource);
		List<TableInfo> tableInfoList = config.getTableInfoList();
		TableInfo tableInfo = null;
		Iterator<TableInfo> iterator = tableInfoList.stream().filter(table -> table.getName().equals(tableName)).collect(Collectors.toList()).iterator();
		if (iterator.hasNext()) {
			tableInfo = iterator.next();
			tableInfo.setName(tableName.replace(tableName.split(StringPool.UNDERSCORE)[0] + StringPool.UNDERSCORE, StringPool.EMPTY));
			tableInfo.setEntityName(tableInfo.getEntityName().replace(StringUtil.upperFirst(tableName.split(StringPool.UNDERSCORE)[0]), StringPool.EMPTY));
		}
		return tableInfo;
	}

	/**
	 * 获取表配置信息
	 *
	 * @param datasource 数据源信息
	 */
	private ConfigBuilder getConfigBuilder(Datasource datasource) {
		StrategyConfig strategy = new StrategyConfig();
		strategy.setNaming(NamingStrategy.underline_to_camel);
		strategy.setColumnNaming(NamingStrategy.underline_to_camel);
		DataSourceConfig datasourceConfig = new DataSourceConfig();
		String driverName = datasource.getDriverClass();
		if (StringUtil.containsAny(driverName, DbType.MYSQL.getDb())) {
			datasourceConfig.setDbType(DbType.MYSQL);
			datasourceConfig.setTypeConvert(new MySqlTypeConvert());
		} else if (StringUtil.containsAny(driverName, DbType.POSTGRE_SQL.getDb())) {
			datasourceConfig.setDbType(DbType.POSTGRE_SQL);
			datasourceConfig.setTypeConvert(new PostgreSqlTypeConvert());
		} else {
			datasourceConfig.setDbType(DbType.ORACLE);
			datasourceConfig.setTypeConvert(new OracleTypeConvert());
		}
		datasourceConfig.setDriverName(driverName);
		datasourceConfig.setUrl(datasource.getUrl());
		datasourceConfig.setUsername(datasource.getUsername());
		datasourceConfig.setPassword(datasource.getPassword());
		return new ConfigBuilder(null, datasourceConfig, strategy, null, null);
	}


}
