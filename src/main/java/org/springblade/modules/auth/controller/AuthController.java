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
package org.springblade.modules.auth.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import org.springblade.core.log.annotation.ApiLog;
import org.springblade.core.secure.AuthInfo;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.WebUtil;
import org.springblade.modules.auth.granter.ITokenGranter;
import org.springblade.modules.auth.granter.TokenGranterBuilder;
import org.springblade.modules.auth.granter.TokenParameter;
import org.springblade.modules.auth.utils.TokenUtil;
import org.springblade.modules.system.entity.UserInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 认证模块
 *
 * @author Chill
 */
@RestController
@AllArgsConstructor
@RequestMapping("blade-auth")
@Api(value = "用户授权认证", tags = "授权接口")
public class AuthController {

	@ApiLog("登录用户验证")
	@PostMapping("token")
	@ApiOperation(value = "获取认证token", notes = "传入租户ID:tenantId,账号:account,密码:password")
	public R<AuthInfo> token(@ApiParam(value = "授权类型", required = true) @RequestParam(defaultValue = "password", required = false) String grantType,
							 @ApiParam(value = "刷新令牌") @RequestParam(required = false) String refreshToken,
							 @ApiParam(value = "租户ID", required = true) @RequestParam(defaultValue = "000000", required = false) String tenantId,
							 @ApiParam(value = "账号") @RequestParam(required = false) String account,
							 @ApiParam(value = "密码") @RequestParam(required = false) String password) {

		String userType = Func.toStr(WebUtil.getRequest().getHeader(TokenUtil.USER_TYPE_HEADER_KEY), TokenUtil.DEFAULT_USER_TYPE);

		TokenParameter tokenParameter = new TokenParameter();
		tokenParameter.getArgs().set("tenantId", tenantId).set("account", account).set("password", password).set("grantType", grantType).set("refreshToken", refreshToken).set("userType", userType);

		ITokenGranter granter = TokenGranterBuilder.getGranter(grantType);
		UserInfo userInfo = granter.grant(tokenParameter);

		if (userInfo == null || userInfo.getUser() == null) {
			return R.fail(TokenUtil.USER_NOT_FOUND);
		}

		return R.data(TokenUtil.createAuthInfo(userInfo));
	}

}
