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

import org.springblade.core.tool.utils.StringUtil;

/**
 * 路径获取
 *
 * @author Chill
 */
public class JarResource {

	/**
	 * 获取jar所在目录
	 *
	 * @return 目录
	 */
	public String getPath() {
		String path = this.getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		if (System.getProperty("os.name").contains("dows")) {
			path = path.substring(1, path.length());
		}
		if (path.contains("jar")) {
			path = path.substring(0, path.lastIndexOf("."));
			path = path.substring(0, path.lastIndexOf("/"));
		} else {
			path = path.replace("target/classes/", "");
		}
		path = StringUtil.removePrefix(path, "file:");
		path = path + "/codes";
		return System.getProperty("user.dir") + "/codes";
	}

}
