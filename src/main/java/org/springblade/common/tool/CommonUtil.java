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
package org.springblade.common.tool;

import org.springblade.core.tool.utils.StringPool;

/**
 * 通用工具类
 *
 * @author Chill
 */
public class CommonUtil {

	public static String BACKEND_NAME = "backend";
	public static String FRONTEND_NAME = "frontend";
	public static String GEN_NAME = "gen";
	public static String ZIP_NAME = "zip";
	public static String ZIP_SUFFIX = ".zip";

	/**
	 * 根据后端包名获取包路径
	 *
	 * @param packageName 包名
	 */
	public static String getRealPathByPackage(String packageName) {
		return packageName.replace(StringPool.DOT, StringPool.SLASH);
	}

	/**
	 * 获取前端模块名
	 *
	 * @param srcPath 模块名
	 */
	public static String getFrontModuleBySrc(String srcPath) {
		return getFrontModuleBySrc(srcPath, 2);
	}

	/**
	 * 获取前端模块名
	 *
	 * @param srcPath      模块名
	 * @param fileCategory 文件类型
	 */
	public static String getFrontModuleBySrc(String srcPath, Integer fileCategory) {
		return (fileCategory == 1) ? StringPool.EMPTY : srcPath;
	}

	/**
	 * 获取代码生成路径
	 *
	 * @return 路径
	 */
	public static String getCodePath() {
		return System.getProperty("user.dir") + "/codes";
	}

}
