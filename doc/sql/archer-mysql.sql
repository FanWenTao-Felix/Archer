/*
 Navicat Premium Data Transfer

 Source Server         : mysql_localhost
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : archer

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 15/04/2020 18:14:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blade_client
-- ----------------------------
DROP TABLE IF EXISTS `blade_client`;
CREATE TABLE `blade_client`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_id` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端id',
  `client_secret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端密钥',
  `resource_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源集合',
  `scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '授权范围',
  `authorized_grant_types` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '授权类型',
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回调地址',
  `authorities` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限',
  `access_token_validity` int(11) NOT NULL COMMENT '令牌过期秒数',
  `refresh_token_validity` int(11) NOT NULL COMMENT '刷新令牌过期秒数',
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加说明',
  `autoapprove` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自动授权',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NOT NULL COMMENT '状态',
  `is_deleted` int(2) NOT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户端表';

-- ----------------------------
-- Records of blade_client
-- ----------------------------
BEGIN;
INSERT INTO `blade_client` VALUES (1, 'archer', 'archer_secret', '', 'all', 'refresh_token,password,authorization_code', 'http://localhost:8888', '', 3600, 604800, '', '', 1, '2019-03-24 10:40:55', 1, '2019-09-02 14:07:06', 1, 0), (2, 'saber', 'saber_secret', NULL, 'all', 'refresh_token,password,authorization_code', 'http://localhost:8080', NULL, 3600, 604800, NULL, NULL, 1, '2019-03-24 10:42:29', 1, '2019-03-24 10:42:32', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for blade_dept
-- ----------------------------
DROP TABLE IF EXISTS `blade_dept`;
CREATE TABLE `blade_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户ID',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父主键',
  `dept_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名',
  `full_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门全称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int(2) NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表';

-- ----------------------------
-- Records of blade_dept
-- ----------------------------
BEGIN;
INSERT INTO `blade_dept` VALUES (1, '000000', 0, '刀锋科技', '江苏刀锋科技有限公司', 1, NULL, 0), (2, '000000', 1, '常州刀锋', '常州刀锋科技有限公司', 1, NULL, 0), (3, '000000', 1, '苏州刀锋', '苏州刀锋科技有限公司', 1, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_dict
-- ----------------------------
DROP TABLE IF EXISTS `blade_dict`;
CREATE TABLE `blade_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典码',
  `dict_key` int(2) NULL DEFAULT NULL COMMENT '字典值',
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典备注',
  `is_deleted` int(2) NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表';

-- ----------------------------
-- Records of blade_dict
-- ----------------------------
BEGIN;
INSERT INTO `blade_dict` VALUES (1, 0, 'sex', -1, '性别', 1, NULL, 0), (2, 1, 'sex', 1, '男', 1, NULL, 0), (3, 1, 'sex', 2, '女', 2, NULL, 0), (4, 0, 'notice', -1, '通知类型', 2, NULL, 0), (5, 4, 'notice', 1, '发布通知', 1, NULL, 0), (6, 4, 'notice', 2, '批转通知', 2, NULL, 0), (7, 4, 'notice', 3, '转发通知', 3, NULL, 0), (8, 4, 'notice', 4, '指示通知', 4, NULL, 0), (9, 4, 'notice', 5, '任免通知', 5, NULL, 0), (10, 4, 'notice', 6, '事务通知', 6, NULL, 0), (11, 0, 'menu_category', -1, '菜单类型', 3, NULL, 0), (12, 11, 'menu_category', 1, '菜单', 1, NULL, 0), (13, 11, 'menu_category', 2, '按钮', 2, NULL, 0), (14, 0, 'button_func', -1, '按钮功能', 4, NULL, 0), (15, 14, 'button_func', 1, '工具栏', 1, NULL, 0), (16, 14, 'button_func', 2, '操作栏', 2, NULL, 0), (17, 14, 'button_func', 3, '工具操作栏', 3, NULL, 0), (18, 0, 'yes_no', -1, '是否', 5, NULL, 0), (19, 18, 'yes_no', 1, '否', 1, NULL, 0), (20, 18, 'yes_no', 2, '是', 2, NULL, 0), (21, 0, 'system_category', -1, '系统分类', 6, '', 0), (22, 21, 'system_category', 1, '后端系统', 1, '', 0), (23, 21, 'system_category', 2, '前端系统', 2, '', 0), (24, 0, 'path_category', -1, '路径分类', 7, NULL, 0), (25, 24, 'path_category', 1, '相对路径', 1, NULL, 0), (26, 24, 'path_category', 2, '绝对路径', 2, NULL, 0), (27, 0, 'template_category', -1, '模板引擎类型', 8, NULL, 0), (28, 27, 'template_category', 1, 'beetl', 1, NULL, 0), (29, 27, 'template_category', 2, 'freemarker', 2, NULL, 0), (30, 27, 'template_category', 3, 'velocity', 3, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_log_api
-- ----------------------------
DROP TABLE IF EXISTS `blade_log_api`;
CREATE TABLE `blade_log_api`  (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器环境',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `remote_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法类',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作提交的数据',
  `time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口日志表';

-- ----------------------------
-- Records of blade_log_api
-- ----------------------------
BEGIN;
INSERT INTO `blade_log_api` VALUES (1250366523164356610, '000000', 'archer-api', 'MacBook-Pro.local', '192.168.0.103:2828', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.controller.AuthController', 'token', 'tenantId=000000&account=admin&password=admin&type=account', '496', '', '2020-04-15 18:13:04');
COMMIT;

-- ----------------------------
-- Table structure for blade_log_error
-- ----------------------------
DROP TABLE IF EXISTS `blade_log_error`;
CREATE TABLE `blade_log_error`  (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统环境',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `stack_trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '堆栈',
  `exception_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常名',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常信息',
  `line_number` int(11) NULL DEFAULT NULL COMMENT '错误行数',
  `remote_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法类',
  `file_name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作提交的数据',
  `time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '错误日志表';

-- ----------------------------
-- Table structure for blade_menu
-- ----------------------------
DROP TABLE IF EXISTS `blade_menu`;
CREATE TABLE `blade_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父级菜单',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单别名',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单资源',
  `sort` int(2) NULL DEFAULT NULL COMMENT '排序',
  `category` int(2) NULL DEFAULT NULL COMMENT '菜单类型',
  `action` int(2) NULL DEFAULT 0 COMMENT '操作按钮类型',
  `is_open` int(2) NULL DEFAULT 1 COMMENT '是否打开新页面',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int(2) NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表';

-- ----------------------------
-- Records of blade_menu
-- ----------------------------
BEGIN;
INSERT INTO `blade_menu` VALUES (1, 0, 'desk', '工作台', 'menu', '/desk', 'iconfont iconicon_airplay', 1, 1, 0, 1, NULL, 1), (2, 1, 'notice', '通知公告', 'menu', '/desk/notice', 'iconfont iconicon_sms', 1, 1, 0, 1, NULL, 1), (3, 0, 'system', '系统管理', 'menu', '/system', 'iconfont iconicon_setting', 2, 1, 0, 1, NULL, 0), (4, 3, 'user', '用户管理', 'menu', '/system/user', 'iconfont iconicon_principal', 1, 1, 0, 1, NULL, 0), (5, 3, 'dept', '部门管理', 'menu', '/system/dept', 'iconfont iconicon_group', 2, 1, 0, 1, NULL, 0), (6, 3, 'dict', '字典管理', 'menu', '/system/dict', 'iconfont iconicon_addresslist', 3, 1, 0, 1, NULL, 0), (7, 3, 'menu', '菜单管理', 'menu', '/system/menu', 'iconfont iconicon_subordinate', 4, 1, 0, 1, NULL, 0), (8, 3, 'role', '角色管理', 'menu', '/system/role', 'iconfont iconicon_boss', 5, 1, 0, 1, NULL, 0), (9, 3, 'param', '参数管理', 'menu', '/system/param', 'iconfont iconicon_community_line', 6, 1, 0, 1, NULL, 0), (10, 0, 'monitor', '系统监控', 'menu', '/monitor', 'iconfont icon-yanzhengma', 3, 1, 0, 1, NULL, 0), (11, 10, 'doc', '接口文档', 'menu', 'http://localhost/doc.html', 'iconfont iconicon_study', 1, 1, 0, 2, NULL, 0), (12, 10, 'admin', '服务治理', 'menu', 'http://localhost:7002', 'iconfont icon-canshu', 2, 1, 0, 2, NULL, 1), (13, 10, 'log', '日志管理', 'menu', '/monitor/log', 'iconfont iconicon_doc', 3, 1, 0, 1, NULL, 0), (14, 13, 'log_api', '接口日志', 'menu', '/monitor/log/api', NULL, 2, 1, 0, 1, NULL, 0), (15, 13, 'log_error', '错误日志', 'menu', '/monitor/log/error', NULL, 3, 1, 0, 1, NULL, 0), (16, 0, 'base', '基础配置', 'menu', '/base', 'iconfont icon-quanxian', 4, 1, 0, 1, '', 0), (17, 0, 'tool', '业务建模', 'menu', '/tool', 'iconfont icon-wxbgongju', 5, 1, 0, 1, NULL, 0), (18, 17, 'code', '快速生成', 'menu', '/tool/code', 'iconfont iconicon_savememo', 1, 1, 0, 1, NULL, 0), (19, 2, 'notice_add', '新增', 'add', '/desk/notice/add', 'plus', 1, 2, 1, 1, NULL, 1), (20, 2, 'notice_edit', '修改', 'edit', '/desk/notice/edit', 'form', 2, 2, 2, 1, NULL, 1), (21, 2, 'notice_delete', '删除', 'delete', '/api/blade-desk/notice/remove', 'delete', 3, 2, 3, 1, NULL, 1), (22, 2, 'notice_view', '查看', 'view', '/desk/notice/view', 'file-text', 4, 2, 2, 1, NULL, 1), (23, 4, 'user_add', '新增', 'add', '/system/user/add', 'plus', 1, 2, 1, 1, NULL, 0), (24, 4, 'user_edit', '修改', 'edit', '/system/user/edit', 'form', 2, 2, 2, 1, NULL, 0), (25, 4, 'user_delete', '删除', 'delete', '/api/blade-user/remove', 'delete', 3, 2, 3, 1, NULL, 0), (26, 4, 'user_role', '角色配置', 'role', NULL, 'user-add', 4, 2, 1, 1, NULL, 0), (27, 4, 'user_reset', '密码重置', 'reset-password', '/api/blade-user/reset-password', 'retweet', 5, 2, 1, 1, NULL, 0), (28, 4, 'user_view', '查看', 'view', '/system/user/view', 'file-text', 6, 2, 2, 1, NULL, 0), (29, 5, 'dept_add', '新增', 'add', '/system/dept/add', 'plus', 1, 2, 1, 1, NULL, 0), (30, 5, 'dept_edit', '修改', 'edit', '/system/dept/edit', 'form', 2, 2, 2, 1, NULL, 0), (31, 5, 'dept_delete', '删除', 'delete', '/api/blade-system/dept/remove', 'delete', 3, 2, 3, 1, NULL, 0), (32, 5, 'dept_view', '查看', 'view', '/system/dept/view', 'file-text', 4, 2, 2, 1, NULL, 0), (33, 6, 'dict_add', '新增', 'add', '/system/dict/add', 'plus', 1, 2, 1, 1, NULL, 0), (34, 6, 'dict_edit', '修改', 'edit', '/system/dict/edit', 'form', 2, 2, 2, 1, NULL, 0), (35, 6, 'dict_delete', '删除', 'delete', '/api/blade-system/dict/remove', 'delete', 3, 2, 3, 1, NULL, 0), (36, 6, 'dict_view', '查看', 'view', '/system/dict/view', 'file-text', 4, 2, 2, 1, NULL, 0), (37, 7, 'menu_add', '新增', 'add', '/system/menu/add', 'plus', 1, 2, 1, 1, NULL, 0), (38, 7, 'menu_edit', '修改', 'edit', '/system/menu/edit', 'form', 2, 2, 2, 1, NULL, 0), (39, 7, 'menu_delete', '删除', 'delete', '/api/blade-system/menu/remove', 'delete', 3, 2, 3, 1, NULL, 0), (40, 7, 'menu_view', '查看', 'view', '/system/menu/view', 'file-text', 4, 2, 2, 1, NULL, 0), (41, 8, 'role_add', '新增', 'add', '/system/role/add', 'plus', 1, 2, 1, 1, NULL, 0), (42, 8, 'role_edit', '修改', 'edit', '/system/role/edit', 'form', 2, 2, 2, 1, NULL, 0), (43, 8, 'role_delete', '删除', 'delete', '/api/blade-system/role/remove', 'delete', 3, 2, 3, 1, NULL, 0), (44, 8, 'role_view', '查看', 'view', '/system/role/view', 'file-text', 4, 2, 2, 1, NULL, 0), (45, 9, 'param_add', '新增', 'add', '/system/param/add', 'plus', 1, 2, 1, 1, NULL, 0), (46, 9, 'param_edit', '修改', 'edit', '/system/param/edit', 'form', 2, 2, 2, 1, NULL, 0), (47, 9, 'param_delete', '删除', 'delete', '/api/blade-system/param/remove', 'delete', 3, 2, 3, 1, NULL, 0), (48, 9, 'param_view', '查看', 'view', '/system/param/view', 'file-text', 4, 2, 2, 1, NULL, 0), (49, 14, 'log_usual_view', '查看', 'view', '/monitor/log/usual/view', 'file-text', 4, 2, 2, 1, NULL, 0), (50, 15, 'log_api_view', '查看', 'view', '/monitor/log/api/view', 'file-text', 4, 2, 2, 1, NULL, 0), (51, 16, 'log_error_view', '查看', 'view', '/monitor/log/error/view', 'file-text', 4, 2, 2, 1, NULL, 0), (52, 18, 'code_add', '新增', 'add', '/tool/code/add', 'plus', 1, 2, 1, 1, NULL, 0), (53, 18, 'code_edit', '修改', 'edit', '/tool/code/edit', 'form', 2, 2, 2, 1, NULL, 0), (54, 18, 'code_delete', '删除', 'delete', '/api/blade-system/code/remove', 'delete', 3, 2, 3, 1, NULL, 0), (55, 18, 'code_view', '查看', 'view', '/tool/code/view', 'file-text', 4, 2, 2, 1, NULL, 0), (56, 3, 'tenant', '租户管理', 'menu', '/system/tenant', 'iconfont icon-quanxian', 7, 1, 0, 1, NULL, 1), (57, 56, 'tenant_add', '新增', 'add', '/system/tenant/add', 'plus', 1, 2, 1, 1, NULL, 1), (58, 56, 'tenant_edit', '修改', 'edit', '/system/tenant/edit', 'form', 2, 2, 2, 1, NULL, 1), (59, 56, 'tenant_delete', '删除', 'delete', '/api/blade-system/tenant/remove', 'delete', 3, 2, 3, 1, NULL, 1), (60, 56, 'tenant_view', '查看', 'view', '/system/tenant/view', 'file-text', 4, 2, 2, 1, NULL, 1), (61, 3, 'client', '应用管理', 'menu', '/system/client', 'iconfont iconicon_mobilephone', 8, 1, 0, 1, NULL, 0), (62, 61, 'client_add', '新增', 'add', '/system/client/add', 'plus', 1, 2, 1, 1, NULL, 0), (63, 61, 'client_edit', '修改', 'edit', '/system/client/edit', 'form', 2, 2, 2, 2, NULL, 0), (64, 61, 'client_delete', '删除', 'delete', '/api/blade-system/client/remove', 'delete', 3, 2, 3, 3, NULL, 0), (65, 61, 'client_view', '查看', 'view', '/system/client/view', 'file-text', 4, 2, 2, 2, NULL, 0), (66, 16, 'datasource', '数据源配置', 'menu', '/base/datasource', 'iconfont icon-caidanguanli', 12, 1, 0, 1, NULL, 0), (67, 66, 'datasource_add', '新增', 'add', '/base/datasource/add', 'plus', 1, 2, 1, 1, NULL, 0), (68, 66, 'datasource_edit', '修改', 'edit', '/base/datasource/edit', 'form', 2, 2, 2, 2, NULL, 0), (69, 66, 'datasource_delete', '删除', 'delete', '/api/blade-develop/datasource/remove', 'delete', 3, 2, 3, 3, NULL, 0), (70, 66, 'datasource_view', '查看', 'view', '/base/datasource/view', 'file-text', 4, 2, 2, 2, NULL, 0), (71, 17, 'plan', '方案设计', 'menu', '/tool/plan', 'iconfont iconicon_discovery', 2, 1, 0, 1, '', 0), (72, 17, 'model', '模型设计', 'menu', '/tool/model', 'iconfont icon-biaodan', 3, 1, 0, 1, '', 0), (73, 17, 'template', '模板设计', 'menu', '/tool/template', 'iconfont icon-iframe', 4, 1, 0, 1, '', 0), (74, 16, 'customentity', '类名配置', 'menu', '/base/customentity', 'iconfont icon-iconset0216', 5, 1, 0, 1, '', 0), (75, 16, 'customcomponent', '组件配置', 'menu', '/base/customcomponent', 'iconfont iconicon_affiliations_li', 6, 1, 0, 1, '', 0), (76, 16, 'customvalidate', '验证配置', 'menu', '/base/customvalidate', 'iconfont iconicon_task_done', 7, 1, 0, 1, '', 0), (77, 16, 'customquery', '查询配置', 'menu', '/base/customquery', 'iconfont iconicon_glass', 8, 1, 0, 1, '', 0), (78, 16, 'custompath', '路径配置', 'menu', '/base/custompath', 'iconfont icon-canshu', 9, 1, 0, 1, NULL, 0), (79, 16, 'customtype', '方案类型', 'menu', '/base/customtype', 'iconfont iconicon_search', 10, 1, 0, 1, '', 0), (80, 16, 'customcode', '构建代号', 'menu', '/base/customcode', 'iconfont iconicon_scan_namecard', 11, 1, 0, 1, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_param
-- ----------------------------
DROP TABLE IF EXISTS `blade_param`;
CREATE TABLE `blade_param`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `param_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数名',
  `param_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数键',
  `param_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数表';

-- ----------------------------
-- Records of blade_param
-- ----------------------------
BEGIN;
INSERT INTO `blade_param` VALUES (1, '是否开启注册功能', 'account.registerUser', 'true', '开启注册', 1, '2018-12-28 12:19:01', 1, '2018-12-28 12:19:01', 1, 0), (2, '账号初始密码', 'account.initPassword', '123456', '初始密码', 1, '2018-12-28 12:19:01', 1, '2018-12-28 12:19:01', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_role
-- ----------------------------
DROP TABLE IF EXISTS `blade_role`;
CREATE TABLE `blade_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户ID',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父主键',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `role_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色别名',
  `is_deleted` int(2) NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表';

-- ----------------------------
-- Records of blade_role
-- ----------------------------
BEGIN;
INSERT INTO `blade_role` VALUES (1, '000000', 0, '超级管理员', 1, 'administrator', 0), (2, '000000', 0, '用户', 2, 'user', 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `blade_role_menu`;
CREATE TABLE `blade_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色菜单表';

-- ----------------------------
-- Records of blade_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `blade_role_menu` VALUES (1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 4, 1), (5, 5, 1), (6, 6, 1), (7, 7, 1), (8, 8, 1), (9, 9, 1), (10, 10, 1), (11, 11, 1), (12, 12, 1), (13, 13, 1), (14, 14, 1), (15, 15, 1), (16, 16, 1), (17, 17, 1), (18, 18, 1), (19, 19, 1), (20, 20, 1), (21, 21, 1), (22, 22, 1), (23, 23, 1), (24, 24, 1), (25, 25, 1), (26, 26, 1), (27, 27, 1), (28, 28, 1), (29, 29, 1), (30, 30, 1), (31, 31, 1), (32, 32, 1), (33, 33, 1), (34, 34, 1), (35, 35, 1), (36, 36, 1), (37, 37, 1), (38, 38, 1), (39, 39, 1), (40, 40, 1), (41, 41, 1), (42, 42, 1), (43, 43, 1), (44, 44, 1), (45, 45, 1), (46, 46, 1), (47, 47, 1), (48, 48, 1), (49, 49, 1), (50, 50, 1), (51, 51, 1), (52, 52, 1), (53, 53, 1), (54, 54, 1), (55, 55, 1), (56, 56, 1), (57, 57, 1), (58, 58, 1), (59, 59, 1), (60, 60, 1), (61, 61, 1), (62, 62, 1), (63, 63, 1), (64, 64, 1), (65, 65, 1), (66, 66, 1), (67, 67, 1), (68, 68, 1), (69, 69, 1), (70, 70, 1), (71, 71, 1), (72, 72, 1), (73, 73, 1), (74, 74, 1), (75, 75, 1), (76, 76, 1), (77, 77, 1), (78, 78, 1), (79, 79, 1), (80, 80, 1);
COMMIT;

-- ----------------------------
-- Table structure for blade_tenant
-- ----------------------------
DROP TABLE IF EXISTS `blade_tenant`;
CREATE TABLE `blade_tenant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户ID',
  `tenant_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户名称',
  `linkman` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户表';

-- ----------------------------
-- Records of blade_tenant
-- ----------------------------
BEGIN;
INSERT INTO `blade_tenant` VALUES (1, '000000', '管理组', 'admin', '666666', '管理组', 1, '2019-01-01 00:00:39', 1, '2019-01-01 00:00:39', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_user
-- ----------------------------
DROP TABLE IF EXISTS `blade_user`;
CREATE TABLE `blade_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户ID',
  `account` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真名',
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` smallint(6) NULL DEFAULT NULL COMMENT '性别',
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `dept_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表';

-- ----------------------------
-- Records of blade_user
-- ----------------------------
BEGIN;
INSERT INTO `blade_user` VALUES (1, '000000', 'admin', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', '管理员', '管理员', 'admin@bladex.vip', '22233322', '2018-08-08 00:00:00', 1, '1', '1', 1, '2018-08-08 00:00:00', 1, '2018-08-08 00:00:00', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_code
-- ----------------------------
DROP TABLE IF EXISTS `gen_code`;
CREATE TABLE `gen_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `datasource_id` bigint(64) NULL DEFAULT NULL COMMENT '数据源主键',
  `system_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统名称',
  `service_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `code_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `table_prefix` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表前缀',
  `pk_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主键名',
  `package_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后端包名',
  `base_mode` int(2) NULL DEFAULT NULL COMMENT '基础业务模式',
  `wrap_mode` int(2) NULL DEFAULT NULL COMMENT '包装器模式',
  `api_path` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后端路径',
  `web_path` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端路径',
  `is_deleted` int(2) NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成表';

-- ----------------------------
-- Records of gen_code
-- ----------------------------
BEGIN;
INSERT INTO `gen_code` VALUES (1, 1, 'saber', 'blade-demo', '通知公告', 'test_notice', 'blade_', 'id', 'org.springblade.desktop', 1, 1, 'D:\\Develop\\WorkSpace\\Git\\SpringBlade\\blade-ops\\blade-develop', 'D:\\Develop\\WorkSpace\\Git\\Sword', 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_custom_code
-- ----------------------------
DROP TABLE IF EXISTS `gen_custom_code`;
CREATE TABLE `gen_custom_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代号名',
  `code_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代号键值',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码自定义代号';

-- ----------------------------
-- Records of gen_custom_code
-- ----------------------------
BEGIN;
INSERT INTO `gen_custom_code` VALUES (1, '主表', 'main', 1, 1, '2019-09-12 16:35:56', 1, '2019-09-12 16:35:56', 1, 0), (2, '子表', 'sub', 2, 1, '2019-09-12 16:38:26', 1, '2019-10-20 14:37:02', 1, 0), (3, '树表', 'tree', 3, 1, '2019-09-12 16:38:53', 1, '2019-09-12 16:38:53', 1, 0), (4, '流程表', 'flow', 4, 1, '2019-09-12 16:39:20', 1, '2019-09-12 16:39:20', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_custom_component
-- ----------------------------
DROP TABLE IF EXISTS `gen_custom_component`;
CREATE TABLE `gen_custom_component`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `component_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件名',
  `component_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件键值',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码自定义组件';

-- ----------------------------
-- Records of gen_custom_component
-- ----------------------------
BEGIN;
INSERT INTO `gen_custom_component` VALUES (1, '单行文本', 'input', 10, 1, '2019-09-06 17:52:39', 1, '2019-09-09 22:25:48', 1, 0), (2, '多行文本', 'textarea', 20, 1, '2019-09-09 22:26:10', 1, '2019-09-09 22:26:23', 1, 0), (3, '下拉选项', 'select', 30, 1, '2019-09-09 22:26:37', 1, '2019-09-09 22:26:37', 1, 0), (4, '树型下拉选项', 'tree', 40, 1, '2019-09-09 22:27:07', 1, '2019-09-10 16:33:16', 1, 0), (5, '单选框', 'radio', 50, 1, '2019-09-09 22:28:07', 1, '2019-09-09 22:28:07', 1, 0), (6, '多选框', 'checkbox', 60, 1, '2019-09-09 22:28:50', 1, '2019-09-09 22:28:50', 1, 0), (7, '开关框', 'switch', 70, 1, '2019-09-09 22:29:13', 1, '2019-09-09 22:29:13', 1, 0), (8, '日期框', 'date', 80, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (9, '日期范围框', 'daterange', 90, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (10, '人员选择', 'user', 100, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (11, '部门选择', 'dept', 110, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_custom_entity
-- ----------------------------
DROP TABLE IF EXISTS `gen_custom_entity`;
CREATE TABLE `gen_custom_entity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `entity_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实体类名',
  `entity_full_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整类名',
  `entity_table` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物理表名',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码自定义类表';

-- ----------------------------
-- Records of gen_custom_entity
-- ----------------------------
BEGIN;
INSERT INTO `gen_custom_entity` VALUES (1, 'String', 'java.lang.String', '', 10, 1, '2019-09-06 17:52:39', 1, '2019-09-12 17:15:27', 1, 0), (2, 'Integer', 'java.lang.Integer', '', 20, 1, '2019-09-09 22:26:10', 1, '2019-09-09 22:26:23', 1, 0), (3, 'Long', 'java.lang.Long', '', 30, 1, '2019-09-09 22:26:37', 1, '2019-09-09 22:26:37', 1, 0), (4, 'Double', 'java.lang.Double', '', 40, 1, '2019-09-09 22:27:07', 1, '2019-09-09 22:27:07', 1, 0), (5, 'Date', 'java.util.Date', '', 50, 1, '2019-09-09 22:28:07', 1, '2019-09-09 22:28:07', 1, 0), (6, 'LocalDateTime', 'java.time.LocalDateTime', '', 60, 1, '2019-09-09 22:28:50', 1, '2019-09-09 22:28:50', 1, 0), (7, 'Dept', 'org.springblade.modules.system.entity.Dept', 'blade_dept', 70, 1, '2019-09-09 22:29:13', 1, '2019-09-12 17:15:32', 1, 0), (8, 'Role', 'org.springblade.modules.system.entity.Role', 'blade_role', 80, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (9, 'User', 'org.springblade.modules.system.entity.User', 'blade_user', 90, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_custom_path
-- ----------------------------
DROP TABLE IF EXISTS `gen_custom_path`;
CREATE TABLE `gen_custom_path`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径名',
  `path_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径值',
  `path_category` int(2) NULL DEFAULT NULL COMMENT '路径分类',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码自定义路径';

-- ----------------------------
-- Records of gen_custom_path
-- ----------------------------
BEGIN;
INSERT INTO `gen_custom_path` VALUES (1, 'controller', '/controller', 1, 10, 1, '2019-09-06 17:52:39', 1, '2019-09-09 22:25:48', 1, 0), (2, 'mapper', '/mapper', 1, 20, 1, '2019-09-09 22:26:10', 1, '2019-09-09 22:26:23', 1, 0), (3, 'service', '/service', 1, 30, 1, '2019-09-09 22:26:37', 1, '2019-09-09 22:26:37', 1, 0), (4, 'serviceimpl', '/service/impl', 1, 40, 1, '2019-09-09 22:27:07', 1, '2019-09-10 16:33:16', 1, 0), (5, 'entity', '/entity', 1, 50, 1, '2019-09-09 22:28:07', 1, '2019-09-09 22:28:07', 1, 0), (6, 'dto', '/dto', 1, 60, 1, '2019-09-09 22:28:50', 1, '2019-09-09 22:28:50', 1, 0), (7, 'vo', '/vo', 1, 70, 1, '2019-09-09 22:29:13', 1, '2019-09-09 22:29:13', 1, 0), (8, 'wrapper', '/wrapper', 1, 80, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (9, 'api', '/api', 1, 100, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (10, 'const', '/const', 1, 110, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (11, 'views', '/views', 1, 90, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (12, 'saber', '/Users/chill/Workspaces/gen/Saber', 2, 10, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (13, 'bladex', '/Users/chill/Workspaces/gen/BladeX-Boot', 2, 20, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_custom_query
-- ----------------------------
DROP TABLE IF EXISTS `gen_custom_query`;
CREATE TABLE `gen_custom_query`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `query_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询名',
  `query_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询键值',
  `query_rule` datetime(0) NULL DEFAULT NULL COMMENT '查询规则增强',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码自定义查询';

-- ----------------------------
-- Records of gen_custom_query
-- ----------------------------
BEGIN;
INSERT INTO `gen_custom_query` VALUES (1, '等于', 'equal', NULL, 10, 1, '2019-09-06 17:52:39', 1, '2019-09-09 22:25:48', 1, 0), (2, '不等于', 'notequal', NULL, 20, 1, '2019-09-09 22:26:10', 1, '2019-09-09 22:26:23', 1, 0), (3, '大于', 'gt', NULL, 30, 1, '2019-09-09 22:26:37', 1, '2019-09-12 17:15:23', 1, 0), (4, '大于等于', 'ge', NULL, 40, 1, '2019-09-09 22:27:07', 1, '2019-09-10 16:33:16', 1, 0), (5, '小于', 'lt', NULL, 50, 1, '2019-09-09 22:28:07', 1, '2019-09-09 22:28:07', 1, 0), (6, '小于等于', 'le', NULL, 60, 1, '2019-09-09 22:28:50', 1, '2019-09-09 22:28:50', 1, 0), (7, '区间', 'between', NULL, 70, 1, '2019-09-09 22:29:13', 1, '2019-09-09 22:29:13', 1, 0), (8, '模糊', 'like', NULL, 80, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (9, '左模糊', 'likeleft', NULL, 90, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (10, '右模糊', 'likeright', NULL, 100, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (11, '无', 'none', NULL, 110, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_custom_type
-- ----------------------------
DROP TABLE IF EXISTS `gen_custom_type`;
CREATE TABLE `gen_custom_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名',
  `type_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型键值',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码自定义类型';

-- ----------------------------
-- Records of gen_custom_type
-- ----------------------------
BEGIN;
INSERT INTO `gen_custom_type` VALUES (1, '单表', 'single', 1, 1, '2019-09-12 16:35:56', 1, '2019-09-12 16:35:56', 1, 0), (2, '主子表', 'mainchild', 2, 1, '2019-09-12 16:38:26', 1, '2019-09-15 16:07:51', 1, 0), (3, '树型表', 'tree', 3, 1, '2019-09-12 16:38:53', 1, '2019-09-12 16:38:53', 1, 0), (4, '左树右表', 'treetable', 4, 1, '2019-09-12 16:39:20', 1, '2019-09-12 16:39:20', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_custom_validate
-- ----------------------------
DROP TABLE IF EXISTS `gen_custom_validate`;
CREATE TABLE `gen_custom_validate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `validate_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证名',
  `validate_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证键值',
  `validate_rule` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证规则增强',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码自定义验证';

-- ----------------------------
-- Records of gen_custom_validate
-- ----------------------------
BEGIN;
INSERT INTO `gen_custom_validate` VALUES (1, '数字', 'number', 'const ${propertyName}Validate = (rule, value, callback) => {\n        if (value === \'\') {\n          callback(new Error(\'请输入参数\'));\n        } else if(isNaN(value)){\n          callback(new Error(\'请输入数字型参数\'));\n        } else {\n          callback();\n        }\n      };', 10, 1, '2019-09-06 17:52:39', 1, '2019-10-17 23:51:52', 1, 0), (2, '整数', 'int', NULL, 20, 1, '2019-09-09 22:26:10', 1, '2019-09-09 22:26:23', 1, 0), (3, '字母', 'char', NULL, 30, 1, '2019-09-09 22:26:37', 1, '2019-09-09 22:26:37', 1, 0), (4, '身份证号码', 'idcard', NULL, 40, 1, '2019-09-09 22:27:07', 1, '2019-09-10 16:33:16', 1, 0), (5, '网址', 'website', NULL, 50, 1, '2019-09-09 22:28:07', 1, '2019-09-09 22:28:07', 1, 0), (6, '电子邮件', 'email', NULL, 60, 1, '2019-09-09 22:28:50', 1, '2019-09-09 22:28:50', 1, 0), (7, '手机号码', 'phone', NULL, 70, 1, '2019-09-09 22:29:13', 1, '2019-09-09 22:29:13', 1, 0), (8, 'QQ号码', 'qq', NULL, 80, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (9, '数字大于0', 'numbergtzero', NULL, 90, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (10, '整数大于等于0', 'intgtezero', NULL, 100, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0), (11, '字符大于0', 'chargtzero', NULL, 110, 1, '2019-09-09 22:29:31', 1, '2019-09-09 22:29:31', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_datasource
-- ----------------------------
DROP TABLE IF EXISTS `gen_datasource`;
CREATE TABLE `gen_datasource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `driver_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驱动类',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '连接地址',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) NULL DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源配置表';

-- ----------------------------
-- Records of gen_datasource
-- ----------------------------
BEGIN;
INSERT INTO `gen_datasource` VALUES (1, 'mysql', 'com.mysql.cj.jdbc.Driver', 'jdbc:mysql://localhost:3306/archer?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true', 'root', 'root', 'mysql', 1, 1, '2019-08-14 11:43:06', 1, '2019-09-05 10:49:02', 1, 0), (2, 'postgresql', 'org.postgresql.Driver', 'jdbc:postgresql://localhost:5432/blade', 'postgres', '123456', 'postgresql', 1, 1, '2019-08-14 11:43:41', 1, '2019-09-07 22:09:01', 1, 0), (3, 'oracle', 'oracle.jdbc.OracleDriver', 'jdbc:oracle:thin:@127.0.0.1:49161:orcl', 'BLADE', 'blade', 'oracle', 1, 1, '2019-08-14 11:44:03', 1, '2019-08-14 11:44:03', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_model
-- ----------------------------
DROP TABLE IF EXISTS `gen_model`;
CREATE TABLE `gen_model`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `datasource_id` int(11) NULL DEFAULT NULL COMMENT '数据源主键',
  `model_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型名称',
  `model_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型编号',
  `model_table` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物理表名',
  `model_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型类名',
  `model_remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型备注',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码模型表';

-- ----------------------------
-- Records of gen_model
-- ----------------------------
BEGIN;
INSERT INTO `gen_model` VALUES (1, 1, '通知公告', 'notice', 'test_notice', 'Notice', '', 1, '2019-09-06 18:06:48', 1, '2019-09-07 21:31:01', 1, 0), (2, 1, '通知公告清单', 'noticeList', 'test_notice_list', 'NoticeList', '', 1, '2019-09-07 23:56:47', 1, '2019-09-07 23:56:47', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_model_prototype
-- ----------------------------
DROP TABLE IF EXISTS `gen_model_prototype`;
CREATE TABLE `gen_model_prototype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `model_id` int(11) NULL DEFAULT NULL COMMENT '模型主键',
  `jdbc_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物理列名',
  `jdbc_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物理类型',
  `comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注释说明',
  `property_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实体类型',
  `property_entity` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实体类型引用',
  `property_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实体列名',
  `is_form` int(2) NULL DEFAULT NULL COMMENT '表单显示',
  `is_row` int(2) NULL DEFAULT NULL COMMENT '独占一行',
  `component_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件类型',
  `dict_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `is_required` int(2) NULL DEFAULT NULL COMMENT '是否必填',
  `validate_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证类型',
  `is_list` int(2) NULL DEFAULT NULL COMMENT '列表显示',
  `is_query` int(2) NULL DEFAULT NULL COMMENT '查询配置',
  `query_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询类型',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码建模原型表';

-- ----------------------------
-- Records of gen_model_prototype
-- ----------------------------
BEGIN;
INSERT INTO `gen_model_prototype` VALUES (1, 1, 'id', 'bigint(64)', '主键', 'Long', 'java.lang.Long', 'id', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (2, 1, 'tenant_id', 'varchar(12)', '租户ID', 'String', 'java.lang.String', 'tenantId', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (3, 1, 'title', 'varchar(255)', '标题', 'String', 'java.lang.String', 'title', 1, 0, 'input', '', 1, '', 1, 1, 'like', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (4, 1, 'category', 'int(11)', '类型', 'Integer', 'java.lang.Integer', 'category', 1, 0, 'select', 'notice', 1, '', 1, 1, 'equal', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (5, 1, 'release_time', 'datetime', '发布时间', 'LocalDateTime', 'java.time.LocalDateTime', 'releaseTime', 1, 1, 'date', '', 1, '', 1, 0, '', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (6, 1, 'content', 'varchar(255)', '内容', 'String', 'java.lang.String', 'content', 1, 1, 'textarea', '', 1, '', 1, 0, '', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (7, 1, 'create_user', 'bigint(64)', '创建人', 'Long', 'java.lang.Long', 'createUser', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (8, 1, 'create_dept', 'bigint(64)', '创建部门', 'Long', 'java.lang.Long', 'createDept', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (9, 1, 'create_time', 'datetime', '创建时间', 'LocalDateTime', 'java.time.LocalDateTime', 'createTime', 0, 0, 'input', '', 0, '', 1, 0, '', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (10, 1, 'update_user', 'bigint(64)', '修改人', 'Long', 'java.lang.Long', 'updateUser', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (11, 1, 'update_time', 'datetime', '修改时间', 'LocalDateTime', 'java.time.LocalDateTime', 'updateTime', 0, 0, 'input', '', 0, '', 1, 0, '', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (12, 1, 'status', 'int(2)', '状态', 'Integer', 'java.lang.Integer', 'status', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (13, 1, 'is_deleted', 'int(2)', '是否已删除', 'Integer', 'java.lang.Integer', 'isDeleted', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:12:58', 1, '2019-10-20 21:37:55', 1, 0), (14, 2, 'id', 'bigint(64)', '主键', 'Long', 'java.lang.Long', 'id', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:13:04', 1, '2019-10-20 21:38:45', 1, 0), (15, 2, 'notice_id', 'bigint(64)', '公告id', 'Long', 'java.lang.Long', 'noticeId', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:13:04', 1, '2019-10-20 21:38:45', 1, 0), (16, 2, 'list_name', 'varchar(255)', '事项名', 'String', 'java.lang.String', 'listName', 1, 1, 'input', '', 1, '', 1, 1, 'like', 1, '2019-10-20 21:13:04', 1, '2019-10-20 21:38:45', 1, 0), (17, 2, 'end_time', 'datetime', '截止日期', 'LocalDateTime', 'java.time.LocalDateTime', 'endTime', 1, 1, 'date', '', 1, '', 1, 0, '', 1, '2019-10-20 21:13:04', 1, '2019-10-20 21:38:45', 1, 0), (18, 2, 'create_user', 'bigint(64)', '创建人', 'Long', 'java.lang.Long', 'createUser', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:13:04', 1, '2019-10-20 21:38:45', 1, 0), (19, 2, 'create_dept', 'bigint(64)', '创建部门', 'Long', 'java.lang.Long', 'createDept', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:13:04', 1, '2019-10-20 21:38:45', 1, 0), (20, 2, 'create_time', 'datetime', '创建时间', 'LocalDateTime', 'java.time.LocalDateTime', 'createTime', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:13:04', 1, '2019-10-20 21:38:45', 1, 0), (21, 2, 'update_user', 'bigint(64)', '修改人', 'Long', 'java.lang.Long', 'updateUser', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:13:04', 1, '2019-10-20 21:38:45', 1, 0), (22, 2, 'update_time', 'datetime', '修改时间', 'LocalDateTime', 'java.time.LocalDateTime', 'updateTime', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:13:04', 1, '2019-10-20 21:38:45', 1, 0), (23, 2, 'status', 'int(2)', '状态', 'Integer', 'java.lang.Integer', 'status', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:13:04', 1, '2019-10-20 21:38:45', 1, 0), (24, 2, 'is_deleted', 'int(2)', '是否已删除', 'Integer', 'java.lang.Integer', 'isDeleted', 0, 0, 'input', '', 0, '', 0, 0, '', 1, '2019-10-20 21:13:04', 1, '2019-10-20 21:38:45', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_plan
-- ----------------------------
DROP TABLE IF EXISTS `gen_plan`;
CREATE TABLE `gen_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plan_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方案名称',
  `plan_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方案编号',
  `plan_type` int(2) NULL DEFAULT NULL COMMENT '方案类型',
  `template_id` int(11) NULL DEFAULT NULL COMMENT '模板id',
  `frontend_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端根目录',
  `src_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端源码目录',
  `backend_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后端根目录',
  `package_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后端包名',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码方案表';

-- ----------------------------
-- Records of gen_plan
-- ----------------------------
BEGIN;
INSERT INTO `gen_plan` VALUES (1, '通知公告单表方案', 'PLAN-001', 1, 1, '/Users/chill/Workspaces/gen/Saber', 'desk', '/Users/chill/Workspaces/gen/BladeX-Boot', 'org.springblade.modules.desk', 1, '2019-09-12 22:11:00', 1, '2019-10-20 16:08:55', 1, 0), (2, '通知公告主子表方案', 'PLAN-002', 2, 2, '/Users/chill/Workspaces/gen/Saber', 'desk', '/Users/chill/Workspaces/gen/BladeX-Boot', 'org.springblade.modules.desk', 1, '2019-10-17 22:14:48', 1, '2019-10-20 16:08:51', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_plan_model
-- ----------------------------
DROP TABLE IF EXISTS `gen_plan_model`;
CREATE TABLE `gen_plan_model`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plan_id` int(11) NULL DEFAULT NULL COMMENT '方案主键',
  `model_id` int(11) NULL DEFAULT NULL COMMENT '模型主键',
  `build_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '构建代号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码方案模型表';

-- ----------------------------
-- Records of gen_plan_model
-- ----------------------------
BEGIN;
INSERT INTO `gen_plan_model` VALUES (1, 2, 1, 'main'), (2, 2, 2, 'sub'), (3, 1, 1, 'main');
COMMIT;

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名',
  `template_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板编号',
  `template_engine` int(2) NULL DEFAULT NULL COMMENT '模板引擎',
  `is_cover` int(2) NULL DEFAULT NULL COMMENT '是否覆盖',
  `template_remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板备注',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码模板表';

-- ----------------------------
-- Records of gen_template
-- ----------------------------
BEGIN;
INSERT INTO `gen_template` VALUES (1, '单表生成', 'single_code', 1, 1, '单表', 1, '2019-09-05 11:22:19', 1, '2019-09-15 21:15:57', 1, 0), (2, '主子表生成', 'mainsub_code', 1, 1, '主子表', 1, '2019-09-05 23:22:48', 1, '2019-10-20 16:18:38', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for gen_template_file
-- ----------------------------
DROP TABLE IF EXISTS `gen_template_file`;
CREATE TABLE `gen_template_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_id` int(11) NULL DEFAULT NULL COMMENT '模板主键',
  `file_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_category` int(11) NULL DEFAULT NULL COMMENT '系统分类',
  `file_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件编号',
  `build_code` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '构建代号',
  `file_path` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相对路径',
  `file_remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `file_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码模板文件表';

-- ----------------------------
-- Records of gen_template_file
-- ----------------------------
BEGIN;
INSERT INTO `gen_template_file` VALUES (1, 1, '${model.modelClass}Controller.java', 1, '001', 'main', '/controller', '控制器', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport io.swagger.annotations.Api;\nimport com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;\nimport io.swagger.annotations.ApiOperation;\nimport io.swagger.annotations.ApiParam;\nimport lombok.AllArgsConstructor;\nimport javax.validation.Valid;\nimport org.springblade.core.boot.ctrl.BladeController;\nimport org.springblade.common.constant.CommonConstant;\n\nimport org.springblade.core.mp.support.Condition;\nimport org.springblade.core.mp.support.Query;\nimport org.springblade.core.tool.api.R;\nimport org.springblade.core.tool.utils.Func;\nimport org.springframework.web.bind.annotation.*;\nimport com.baomidou.mybatisplus.core.metadata.IPage;\n\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\nimport ${plan.packagePath!}.vo.${model.modelClass!}VO;\nimport ${plan.packagePath!}.wrapper.${model.modelClass!}Wrapper;\nimport ${plan.packagePath!}.service.I${model.modelClass!}Service;\n\n\n/**\n * ${model.modelRemark!} 控制器\n *\n * @author Chill\n */\n@RestController\n@AllArgsConstructor\n@RequestMapping(\"/${serviceName!}/${model.modelCode!}\")\n@Api(value = \"${model.modelRemark!}\", tags = \"${model.modelRemark!}\")\npublic class ${model.modelClass!}Controller extends BladeController {\n\n	private final I${model.modelClass!}Service ${model.modelCode!}Service;\n\n	/**\n	 * 详情\n	 */\n	@GetMapping(\"/detail\")\n	@ApiOperationSupport(order = 1)\n	@ApiOperation(value = \"详情\", notes = \"传入${model.modelCode!}\")\n	public R<${model.modelClass!}Entity> detail(${model.modelClass!}Entity ${model.modelCode!}) {\n		${model.modelClass!}Entity detail = ${model.modelCode!}Service.getOne(Condition.getQueryWrapper(${model.modelCode!}));\n		return R.data(detail);\n	}\n\n	/**\n	 * 分页 代码自定义代号\n	 */\n	@GetMapping(\"/list\")\n	@ApiOperationSupport(order = 2)\n	@ApiOperation(value = \"分页\", notes = \"传入${model.modelCode!}\")\n	public R<IPage<${model.modelClass!}Entity>> list(${model.modelClass!}Entity ${model.modelCode!}, Query query) {\n		IPage<${model.modelClass!}Entity> pages = ${model.modelCode!}Service.page(Condition.getPage(query), Condition.getQueryWrapper(${model.modelCode!}));\n		return R.data(pages);\n	}\n\n	/**\n	 * 新增 代码自定义代号\n	 */\n	@PostMapping(\"/save\")\n	@ApiOperationSupport(order = 4)\n	@ApiOperation(value = \"新增\", notes = \"传入${model.modelCode!}\")\n	public R save(@Valid @RequestBody ${model.modelClass!}Entity ${model.modelCode!}) {\n		return R.status(${model.modelCode!}Service.save(${model.modelCode!}));\n	}\n\n	/**\n	 * 修改 代码自定义代号\n	 */\n	@PostMapping(\"/update\")\n	@ApiOperationSupport(order = 5)\n	@ApiOperation(value = \"修改\", notes = \"传入${model.modelCode!}\")\n	public R update(@Valid @RequestBody ${model.modelClass!}Entity ${model.modelCode!}) {\n		return R.status(${model.modelCode!}Service.updateById(${model.modelCode!}));\n	}\n\n	/**\n	 * 新增或修改 代码自定义代号\n	 */\n	@PostMapping(\"/submit\")\n	@ApiOperationSupport(order = 6)\n	@ApiOperation(value = \"新增或修改\", notes = \"传入${model.modelCode!}\")\n	public R submit(@Valid @RequestBody ${model.modelClass!}Entity ${model.modelCode!}) {\n		return R.status(${model.modelCode!}Service.saveOrUpdate(${model.modelCode!}));\n	}\n\n\n	/**\n	 * 删除 代码自定义代号\n	 */\n	@PostMapping(\"/remove\")\n	@ApiOperationSupport(order = 7)\n	@ApiOperation(value = \"逻辑删除\", notes = \"传入ids\")\n	public R remove(@ApiParam(value = \"主键集合\", required = true) @RequestParam String ids) {\n		return R.status(${model.modelCode!}Service.deleteLogic(Func.toLongList(ids)));\n	}\n\n}\n', 1, '2019-09-05 23:22:42', 1, '2019-10-20 21:06:00', 1, 0), (2, 1, '${model.modelClass}Entity.java', 1, '002', 'main', '/entity', '实体类', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport com.baomidou.mybatisplus.annotation.TableName;\nimport org.springblade.core.mp.base.BaseEntity;\nimport lombok.Data;\nimport lombok.EqualsAndHashCode;\nimport io.swagger.annotations.ApiModel;\nimport io.swagger.annotations.ApiModelProperty;\nimport java.util.Date;\nimport java.time.LocalDateTime;\n\n\n/**\n * ${model.modelRemark!} 实体类\n *\n * @author Chill\n */\n@Data\n@TableName(\"${model.modelTable!}\")\n@EqualsAndHashCode(callSuper = true)\n@ApiModel(value = \"${model.modelClass!}对象\", description = \"${model.modelRemark!}\")\npublic class ${model.modelClass!}Entity extends BaseEntity {\n\n	private static final long serialVersionUID = 1L;\n\n	#for(x in model.prototypes) {\n	#if(x.propertyName!=\"id\"&&x.propertyName!=\"createUser\"&&x.propertyName!=\"createDept\"&&x.propertyName!=\"createTime\"&&x.propertyName!=\"updateUser\"&&x.propertyName!=\"updateTime\"&&x.propertyName!=\"status\"&&x.propertyName!=\"isDeleted\"&&x.propertyName!=\"tenantId\"){\n	/**\n	 * ${x.comment!}\n	 */\n	@ApiModelProperty(value = \"${x.comment!}\")\n	private ${x.propertyType!} ${x.propertyName!};\n	#}\n	#}\n\n}\n', 1, '2019-09-12 22:07:39', 1, '2019-10-20 21:14:30', 1, 0), (3, 1, '${model.modelClass}DTO.java', 1, '003', 'main', '/dto', '实体类DTO', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport lombok.Data;\nimport lombok.EqualsAndHashCode;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\n\n/**\n * ${model.modelRemark!} 模型DTO\n *\n * @author Chill\n */\n@Data\n@EqualsAndHashCode(callSuper = true)\npublic class ${model.modelClass!}DTO extends ${model.modelClass!}Entity {\n\n	private static final long serialVersionUID = 1L;\n\n}\n', 1, '2019-09-15 19:52:53', 1, '2019-10-17 17:33:43', 1, 0), (4, 1, '${model.modelClass}VO.java', 1, '004', 'main', '/vo', '实体类VO', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport lombok.Data;\nimport lombok.EqualsAndHashCode;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\n\n/**\n * ${model.modelRemark!} 模型VO\n *\n * @author Chill\n */\n@Data\n@EqualsAndHashCode(callSuper = true)\npublic class ${model.modelClass!}VO extends ${model.modelClass!}Entity {\n\n	private static final long serialVersionUID = 1L;\n\n}\n', 1, '2019-09-15 19:53:14', 1, '2019-10-17 17:33:54', 1, 0), (5, 1, '${model.modelClass}Mapper.java', 1, '005', 'main', '/mapper', 'Mapper类', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport com.baomidou.mybatisplus.core.mapper.BaseMapper;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\n\n/**\n * ${model.modelRemark!} Mapper 接口\n *\n * @author Chill\n */\npublic interface ${model.modelClass!}Mapper extends BaseMapper<${model.modelClass!}Entity> {\n\n}\n', 1, '2019-10-17 16:10:25', 1, '2019-10-17 17:32:37', 1, 0), (6, 1, '${model.modelClass}Mapper.xml', 1, '006', 'main', '/mapper', 'MapperXml', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n<mapper namespace=\"${plan.packagePath!}.mapper.${model.modelClass!}Mapper\">\n\n    <!-- 通用查询映射结果 -->\n    <resultMap id=\"${model.modelCode!}ResultMap\" type=\"${plan.packagePath!}.entity.${model.modelClass!}Entity\">\n        #for(x in model.prototypes) {\n        <result column=\"${x.jdbcName!}\" property=\"${x.propertyName!}\"/>\n        #}\n    </resultMap>\n\n</mapper>\n', 1, '2019-10-17 16:11:03', 1, '2019-10-20 21:05:47', 1, 0), (7, 1, 'I${model.modelClass}Service.java', 1, '007', 'main', '/service', '服务类', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport org.springblade.core.mp.base.BaseService;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\n\n/**\n * ${model.modelRemark!} 服务类\n *\n * @author Chill\n */\npublic interface I${model.modelClass!}Service extends BaseService<${model.modelClass!}Entity> {\n\n}\n', 1, '2019-10-17 16:11:27', 1, '2019-10-17 17:32:42', 1, 0), (8, 1, '${model.modelClass}ServiceImpl.java', 1, '008', 'main', '/service/impl', '服务实现类', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport org.springblade.core.mp.base.BaseServiceImpl;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\nimport ${plan.packagePath!}.mapper.${model.modelClass!}Mapper;\nimport ${plan.packagePath!}.service.I${model.modelClass!}Service;\nimport org.springframework.stereotype.Service;\n\n/**\n * ${model.modelRemark!} 服务实现类\n *\n * @author Chill\n */\n@Service\npublic class ${model.modelClass!}ServiceImpl extends BaseServiceImpl<${model.modelClass!}Mapper, ${model.modelClass!}Entity> implements I${model.modelClass!}Service {\n\n}\n', 1, '2019-10-17 16:12:03', 1, '2019-10-17 17:33:02', 1, 0), (9, 1, '${model.modelClass}Wrapper.java', 1, '009', 'main', '/wrapper', '包装类', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport org.springblade.core.mp.support.BaseEntityWrapper;\nimport org.springblade.core.tool.utils.BeanUtil;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\nimport ${plan.packagePath!}.vo.${model.modelClass!}VO;\n\n/**\n * ${model.modelRemark!} 包装类,返回视图层所需的字段\n *\n * @author Chill\n */\npublic class ${model.modelClass!}Wrapper extends BaseEntityWrapper<${model.modelClass!}Entity, ${model.modelClass!}VO>  {\n\n	public static ${model.modelClass!}Wrapper build() {\n		return new ${model.modelClass!}Wrapper();\n 	}\n\n	@Override\n	public ${model.modelClass!}VO entityVO(${model.modelClass!}Entity ${model.modelCode!}) {\n		${model.modelClass!}VO ${model.modelCode!}VO = BeanUtil.copy(${model.modelCode!}, ${model.modelClass!}VO.class);\n\n		//User createUser = UserCache.getUser(${model.modelCode!}.getCreateUser());\n		//User updateUser = UserCache.getUser(${model.modelCode!}.getUpdateUser());\n		//${model.modelCode!}VO.setCreateUserName(createUser.getName());\n		//${model.modelCode!}VO.setUpdateUserName(updateUser.getName());\n\n		return ${model.modelCode!}VO;\n	}\n\n}\n', 1, '2019-10-17 16:12:37', 1, '2020-03-20 22:39:54', 1, 0), (10, 1, '${model.modelCode}.js', 2, '010', 'main', '/api', 'api文件', 'import request from \'@/router/axios\';\n\nexport const getList = (current, size, params) => {\n  return request({\n    url: \'/api/${serviceName!}/${model.modelCode!}/list\',\n    method: \'get\',\n    params: {\n      ...params,\n      current,\n      size,\n    }\n  })\n}\n\nexport const getDetail = (id) => {\n  return request({\n    url: \'/api/${serviceName!}/${model.modelCode!}/detail\',\n    method: \'get\',\n    params: {\n      id\n    }\n  })\n}\n\nexport const remove = (ids) => {\n  return request({\n    url: \'/api/${serviceName!}/${model.modelCode!}/remove\',\n    method: \'post\',\n    params: {\n      ids,\n    }\n  })\n}\n\nexport const add = (row) => {\n  return request({\n    url: \'/api/${serviceName!}/${model.modelCode!}/submit\',\n    method: \'post\',\n    data: row\n  })\n}\n\nexport const update = (row) => {\n  return request({\n    url: \'/api/${serviceName!}/${model.modelCode!}/submit\',\n    method: \'post\',\n    data: row\n  })\n}\n\n', 1, '2019-10-17 16:13:50', 1, '2019-10-17 16:48:36', 1, 0), (11, 1, '${model.modelCode}.vue', 2, '011', 'main', '/views', 'view文件', '<template>\n  <basic-container>\n    <avue-crud :option=\"option\"\n               :table-loading=\"loading\"\n               :data=\"data\"\n               :page=\"page\"\n               :permission=\"permissionList\"\n               :before-open=\"beforeOpen\"\n               v-model=\"form\"\n               ref=\"crud\"\n               @row-update=\"rowUpdate\"\n               @row-save=\"rowSave\"\n               @row-del=\"rowDel\"\n               @search-change=\"searchChange\"\n               @search-reset=\"searchReset\"\n               @selection-change=\"selectionChange\"\n               @current-change=\"currentChange\"\n               @size-change=\"sizeChange\"\n               @refresh-change=\"refreshChange\"\n               @on-load=\"onLoad\">\n      <template slot=\"menuLeft\">\n        <el-button type=\"danger\"\n                   size=\"small\"\n                   icon=\"el-icon-delete\"\n                   plain\n                   v-if=\"permission.${model.modelCode!}_delete\"\n                   @click=\"handleDelete\">删 除\n        </el-button>\n      </template>\n    </avue-crud>\n  </basic-container>\n</template>\n\n<script>\n  import {getList, getDetail, add, update, remove} from \"@/api/${serviceKey!}/${model.modelCode!}\";\n  import {mapGetters} from \"vuex\";\n\n  export default {\n    data() {\n#for(x in model.prototypes) {\n#if(x.isRequired==1&&isNotEmpty(x.validateRule)){\n      ${x.validateRule!}\n#}\n#}\n      return {\n        form: {},\n        query: {},\n        loading: true,\n        page: {\n          pageSize: 10,\n          currentPage: 1,\n          total: 0\n        },\n        selectionList: [],\n        option: {\n          height:\'auto\',\n          calcHeight: 30,\n          tip: false,\n          border: true,\n          index: true,\n          viewBtn: true,\n          selection: true,\n          column: [\n#for(x in model.prototypes) {\n            {\n              label: \"${x.comment!}\",\n              prop: \"${x.propertyName!}\",\n              type: \"${x.componentType!}\",\n#if(strutil.contain(x.componentType,\"date\")||strutil.contain(x.componentType,\"time\")){\n              format: \"yyyy-MM-dd hh:mm:ss\",\n              valueFormat: \"yyyy-MM-dd hh:mm:ss\",\n#}\n#if(isNotEmpty(x.dictCode)){\n              dicUrl: \"/api/blade-system/dict/dictionary?code=${x.dictCode!}\",\n              props: {\n                label: \"dictValue\",\n                value: \"dictKey\"\n              },\n#}\n#if(x.isForm==0){\n              addDisplay: false,\n              editDisplay: false,\n              viewDisplay: false,\n#}\n#if(x.isRow==1){\n              span: 24,\n#}\n#if(x.isList==0){\n              hide: true,\n#}\n#if(x.isQuery==1){\n              search: true,\n#}\n#if(x.isRequired==1&&isEmpty(x.validateRule)){\n              rules: [{\n                required: true,\n                message: \"请输入${x.comment!}\",\n                trigger: \"blur\"\n              }],\n#}\n#if(x.isRequired==1&&isNotEmpty(x.validateRule)){\n              rules: [\n                {\n                  required: true,\n                  validator: ${x.propertyName!}Validate,\n                  trigger: \'blur\'\n                }\n              ],\n#}\n            },\n#}\n          ]\n        },\n        data: []\n      };\n    },\n    computed: {\n      ...mapGetters([\"permission\"]),\n      permissionList() {\n        return {\n          addBtn: this.vaildData(this.permission.${model.modelCode!}_add, false),\n          viewBtn: this.vaildData(this.permission.${model.modelCode!}_view, false),\n          delBtn: this.vaildData(this.permission.${model.modelCode!}_delete, false),\n          editBtn: this.vaildData(this.permission.${model.modelCode!}_edit, false)\n        };\n      },\n      ids() {\n        let ids = [];\n        this.selectionList.forEach(ele => {\n          ids.push(ele.id);\n        });\n        return ids.join(\",\");\n      }\n    },\n    methods: {\n      rowSave(row, done, loading) {\n        add(row).then(() => {\n          this.onLoad(this.page);\n          this.$message({\n            type: \"success\",\n            message: \"操作成功!\"\n          });\n          done();\n        }, error => {\n          loading();\n          window.console.log(error);\n        });\n      },\n      rowUpdate(row, index, done, loading) {\n        update(row).then(() => {\n          this.onLoad(this.page);\n          this.$message({\n            type: \"success\",\n            message: \"操作成功!\"\n          });\n          done();\n        }, error => {\n          loading();\n          window.console.log(error);\n        });\n      },\n      rowDel(row) {\n        this.$confirm(\"确定将选择数据删除?\", {\n          confirmButtonText: \"确定\",\n          cancelButtonText: \"取消\",\n          type: \"warning\"\n        })\n          .then(() => {\n            return remove(row.id);\n          })\n          .then(() => {\n            this.onLoad(this.page);\n            this.$message({\n              type: \"success\",\n              message: \"操作成功!\"\n            });\n          });\n      },\n      handleDelete() {\n        if (this.selectionList.length === 0) {\n          this.$message.warning(\"请选择至少一条数据\");\n          return;\n        }\n        this.$confirm(\"确定将选择数据删除?\", {\n          confirmButtonText: \"确定\",\n          cancelButtonText: \"取消\",\n          type: \"warning\"\n        })\n          .then(() => {\n            return remove(this.ids);\n          })\n          .then(() => {\n            this.onLoad(this.page);\n            this.$message({\n              type: \"success\",\n              message: \"操作成功!\"\n            });\n            this.$refs.crud.toggleSelection();\n          });\n      },\n      beforeOpen(done, type) {\n        if ([\"edit\", \"view\"].includes(type)) {\n          getDetail(this.form.id).then(res => {\n            this.form = res.data.data;\n          });\n        }\n        done();\n      },\n      searchReset() {\n        this.query = {};\n        this.onLoad(this.page);\n      },\n      searchChange(params, done) {\n        this.query = params;\n        this.page.currentPage = 1\n        this.onLoad(this.page, params);\n        done();\n      },\n      selectionChange(list) {\n        this.selectionList = list;\n      },\n      selectionClear() {\n        this.selectionList = [];\n        this.$refs.crud.toggleSelection();\n      },\n      currentChange(currentPage){\n        this.page.currentPage = currentPage;\n      },\n      sizeChange(pageSize){\n        this.page.pageSize = pageSize;\n      },\n      refreshChange() {\n        this.onLoad(this.page, this.query);\n      },\n      onLoad(page, params = {}) {\n        this.loading = true;\n        getList(page.currentPage, page.pageSize, Object.assign(params, this.query)).then(res => {\n          const data = res.data.data;\n          this.page.total = data.total;\n          this.data = data.records;\n          this.loading = false;\n          this.selectionClear();\n        });\n      }\n    }\n  };\n</script>\n\n<style>\n</style>\n', 1, '2019-10-17 16:14:12', 1, '2020-04-15 18:13:29', 1, 0), (12, 2, '${model.modelClass}Controller.java', 1, '001', 'main,sub', '/controller', '控制器', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport io.swagger.annotations.Api;\nimport com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;\nimport io.swagger.annotations.ApiOperation;\nimport io.swagger.annotations.ApiParam;\nimport lombok.AllArgsConstructor;\nimport javax.validation.Valid;\nimport org.springblade.core.boot.ctrl.BladeController;\nimport org.springblade.common.constant.CommonConstant;\n\nimport org.springblade.core.mp.support.Condition;\nimport org.springblade.core.mp.support.Query;\nimport org.springblade.core.tool.api.R;\nimport org.springblade.core.tool.utils.Func;\nimport org.springframework.web.bind.annotation.*;\nimport com.baomidou.mybatisplus.core.metadata.IPage;\n\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\nimport ${plan.packagePath!}.vo.${model.modelClass!}VO;\nimport ${plan.packagePath!}.wrapper.${model.modelClass!}Wrapper;\nimport ${plan.packagePath!}.service.I${model.modelClass!}Service;\n\n\n/**\n * ${model.modelRemark!} 控制器\n *\n * @author Chill\n */\n@RestController\n@AllArgsConstructor\n@RequestMapping(\"/${serviceName!}/${model.modelCode!}\")\n@Api(value = \"${model.modelRemark!}\", tags = \"${model.modelRemark!}\")\npublic class ${model.modelClass!}Controller extends BladeController {\n\n	private final I${model.modelClass!}Service ${model.modelCode!}Service;\n\n	/**\n	 * 详情\n	 */\n	@GetMapping(\"/detail\")\n	@ApiOperationSupport(order = 1)\n	@ApiOperation(value = \"详情\", notes = \"传入${model.modelCode!}\")\n	public R<${model.modelClass!}Entity> detail(${model.modelClass!}Entity ${model.modelCode!}) {\n		${model.modelClass!}Entity detail = ${model.modelCode!}Service.getOne(Condition.getQueryWrapper(${model.modelCode!}));\n		return R.data(detail);\n	}\n\n	/**\n	 * 分页 代码自定义代号\n	 */\n	@GetMapping(\"/list\")\n	@ApiOperationSupport(order = 2)\n	@ApiOperation(value = \"分页\", notes = \"传入${model.modelCode!}\")\n	public R<IPage<${model.modelClass!}Entity>> list(${model.modelClass!}Entity ${model.modelCode!}, Query query) {\n		IPage<${model.modelClass!}Entity> pages = ${model.modelCode!}Service.page(Condition.getPage(query), Condition.getQueryWrapper(${model.modelCode!}));\n		return R.data(pages);\n	}\n\n	/**\n	 * 新增 代码自定义代号\n	 */\n	@PostMapping(\"/save\")\n	@ApiOperationSupport(order = 4)\n	@ApiOperation(value = \"新增\", notes = \"传入${model.modelCode!}\")\n	public R save(@Valid @RequestBody ${model.modelClass!}Entity ${model.modelCode!}) {\n		return R.status(${model.modelCode!}Service.save(${model.modelCode!}));\n	}\n\n	/**\n	 * 修改 代码自定义代号\n	 */\n	@PostMapping(\"/update\")\n	@ApiOperationSupport(order = 5)\n	@ApiOperation(value = \"修改\", notes = \"传入${model.modelCode!}\")\n	public R update(@Valid @RequestBody ${model.modelClass!}Entity ${model.modelCode!}) {\n		return R.status(${model.modelCode!}Service.updateById(${model.modelCode!}));\n	}\n\n	/**\n	 * 新增或修改 代码自定义代号\n	 */\n	@PostMapping(\"/submit\")\n	@ApiOperationSupport(order = 6)\n	@ApiOperation(value = \"新增或修改\", notes = \"传入${model.modelCode!}\")\n	public R submit(@Valid @RequestBody ${model.modelClass!}Entity ${model.modelCode!}) {\n		return R.status(${model.modelCode!}Service.saveOrUpdate(${model.modelCode!}));\n	}\n\n\n	/**\n	 * 删除 代码自定义代号\n	 */\n	@PostMapping(\"/remove\")\n	@ApiOperationSupport(order = 7)\n	@ApiOperation(value = \"逻辑删除\", notes = \"传入ids\")\n	public R remove(@ApiParam(value = \"主键集合\", required = true) @RequestParam String ids) {\n		return R.status(${model.modelCode!}Service.deleteLogic(Func.toLongList(ids)));\n	}\n\n}\n', 1, '2019-09-05 23:22:42', 1, '2019-10-20 17:02:42', 1, 0), (13, 2, '${model.modelClass}Entity.java', 1, '002', 'main,sub', '/entity', '实体类', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport com.baomidou.mybatisplus.annotation.TableName;\nimport org.springblade.core.mp.base.BaseEntity;\nimport lombok.Data;\nimport lombok.EqualsAndHashCode;\nimport io.swagger.annotations.ApiModel;\nimport io.swagger.annotations.ApiModelProperty;\nimport java.util.Date;\nimport java.time.LocalDateTime;\n\n\n/**\n * ${model.modelRemark!} 实体类\n *\n * @author Chill\n */\n@Data\n@TableName(\"${model.modelTable!}\")\n@EqualsAndHashCode(callSuper = true)\n@ApiModel(value = \"${model.modelClass!}对象\", description = \"${model.modelRemark!}\")\npublic class ${model.modelClass!}Entity extends BaseEntity {\n\n	private static final long serialVersionUID = 1L;\n\n	#for(x in model.prototypes) {\n	#if(x.propertyName!=\"id\"&&x.propertyName!=\"createUser\"&&x.propertyName!=\"createDept\"&&x.propertyName!=\"createTime\"&&x.propertyName!=\"updateUser\"&&x.propertyName!=\"updateTime\"&&x.propertyName!=\"status\"&&x.propertyName!=\"isDeleted\"&&x.propertyName!=\"tenantId\"){\n	/**\n	 * ${x.comment!}\n	 */\n	@ApiModelProperty(value = \"${x.comment!}\")\n	private ${x.propertyType!} ${x.propertyName!};\n	#}\n	#}\n\n}\n', 1, '2019-09-12 22:07:39', 1, '2019-10-20 21:14:36', 1, 0), (14, 2, '${model.modelClass}DTO.java', 1, '003', 'main,sub', '/dto', '实体类DTO', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport lombok.Data;\nimport lombok.EqualsAndHashCode;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\n\n/**\n * ${model.modelRemark!} 模型DTO\n *\n * @author Chill\n */\n@Data\n@EqualsAndHashCode(callSuper = true)\npublic class ${model.modelClass!}DTO extends ${model.modelClass!}Entity {\n\n	private static final long serialVersionUID = 1L;\n\n}\n', 1, '2019-09-15 19:52:53', 1, '2019-10-17 17:33:43', 1, 0), (15, 2, '${model.modelClass}VO.java', 1, '004', 'main,sub', '/vo', '实体类VO', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport lombok.Data;\nimport lombok.EqualsAndHashCode;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\n\n/**\n * ${model.modelRemark!} 模型VO\n *\n * @author Chill\n */\n@Data\n@EqualsAndHashCode(callSuper = true)\npublic class ${model.modelClass!}VO extends ${model.modelClass!}Entity {\n\n	private static final long serialVersionUID = 1L;\n\n}\n', 1, '2019-09-15 19:53:14', 1, '2019-10-17 17:33:54', 1, 0), (16, 2, '${model.modelClass}Mapper.java', 1, '005', 'main,sub', '/mapper', 'Mapper类', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport com.baomidou.mybatisplus.core.mapper.BaseMapper;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\n\n/**\n * ${model.modelRemark!} Mapper 接口\n *\n * @author Chill\n */\npublic interface ${model.modelClass!}Mapper extends BaseMapper<${model.modelClass!}Entity> {\n\n}\n', 1, '2019-10-17 16:10:25', 1, '2019-10-17 17:32:37', 1, 0), (17, 2, '${model.modelClass}Mapper.xml', 1, '006', 'main,sub', '/mapper', 'MapperXml', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n<mapper namespace=\"${plan.packagePath!}.mapper.${model.modelClass!}Mapper\">\n\n    <!-- 通用查询映射结果 -->\n    <resultMap id=\"${model.modelCode!}ResultMap\" type=\"${plan.packagePath!}.entity.${model.modelClass!}Entity\">\n        #for(x in model.prototypes) {\n        <result column=\"${x.jdbcName!}\" property=\"${x.propertyName!}\"/>\n        #}\n    </resultMap>\n\n</mapper>\n', 1, '2019-10-17 16:11:03', 1, '2019-10-20 21:05:34', 1, 0), (18, 2, 'I${model.modelClass}Service.java', 1, '007', 'main,sub', '/service', '服务类', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport org.springblade.core.mp.base.BaseService;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\n\n/**\n * ${model.modelRemark!} 服务类\n *\n * @author Chill\n */\npublic interface I${model.modelClass!}Service extends BaseService<${model.modelClass!}Entity> {\n\n}\n', 1, '2019-10-17 16:11:27', 1, '2019-10-17 17:32:42', 1, 0), (19, 2, '${model.modelClass}ServiceImpl.java', 1, '008', 'main,sub', '/service/impl', '服务实现类', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport org.springblade.core.mp.base.BaseServiceImpl;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\nimport ${plan.packagePath!}.mapper.${model.modelClass!}Mapper;\nimport ${plan.packagePath!}.service.I${model.modelClass!}Service;\nimport org.springframework.stereotype.Service;\n\n/**\n * ${model.modelRemark!} 服务实现类\n *\n * @author Chill\n */\n@Service\npublic class ${model.modelClass!}ServiceImpl extends BaseServiceImpl<${model.modelClass!}Mapper, ${model.modelClass!}Entity> implements I${model.modelClass!}Service {\n\n}\n', 1, '2019-10-17 16:12:03', 1, '2019-10-17 17:33:02', 1, 0), (20, 2, '${model.modelClass}Wrapper.java', 1, '009', 'main,sub', '/wrapper', '包装类', 'package ${plan.packagePath!}${strutil.replace(file.filePath,\"/\",\".\")};\n\nimport org.springblade.core.mp.support.BaseEntityWrapper;\nimport org.springblade.core.tool.utils.BeanUtil;\nimport ${plan.packagePath!}.entity.${model.modelClass!}Entity;\nimport ${plan.packagePath!}.vo.${model.modelClass!}VO;\n\n/**\n * ${model.modelRemark!} 包装类,返回视图层所需的字段\n *\n * @author Chill\n */\npublic class ${model.modelClass!}Wrapper extends BaseEntityWrapper<${model.modelClass!}Entity, ${model.modelClass!}VO>  {\n\n	public static ${model.modelClass!}Wrapper build() {\n		return new ${model.modelClass!}Wrapper();\n 	}\n\n	@Override\n	public ${model.modelClass!}VO entityVO(${model.modelClass!}Entity ${model.modelCode!}) {\n		${model.modelClass!}VO ${model.modelCode!}VO = BeanUtil.copy(${model.modelCode!}, ${model.modelClass!}VO.class);\n\n		return ${model.modelCode!}VO;\n	}\n\n}\n', 1, '2019-10-17 16:12:37', 1, '2019-10-17 17:33:32', 1, 0), (21, 2, '${model.modelCode}.js', 2, '010', 'main,sub', '/api', 'api文件', 'import request from \'@/router/axios\';\n\nexport const getList = (current, size, params) => {\n  return request({\n    url: \'/api/${serviceName!}/${model.modelCode!}/list\',\n    method: \'get\',\n    params: {\n      ...params,\n      current,\n      size,\n    }\n  })\n}\n\nexport const getDetail = (id) => {\n  return request({\n    url: \'/api/${serviceName!}/${model.modelCode!}/detail\',\n    method: \'get\',\n    params: {\n      id\n    }\n  })\n}\n\nexport const remove = (ids) => {\n  return request({\n    url: \'/api/${serviceName!}/${model.modelCode!}/remove\',\n    method: \'post\',\n    params: {\n      ids,\n    }\n  })\n}\n\nexport const add = (row) => {\n  return request({\n    url: \'/api/${serviceName!}/${model.modelCode!}/submit\',\n    method: \'post\',\n    data: row\n  })\n}\n\nexport const update = (row) => {\n  return request({\n    url: \'/api/${serviceName!}/${model.modelCode!}/submit\',\n    method: \'post\',\n    data: row\n  })\n}\n\n', 1, '2019-10-17 16:13:50', 1, '2019-10-20 14:46:09', 1, 0), (22, 2, '${model.modelCode}.js', 2, '011', 'main,sub', '/const', 'const文件', 'export default {\n     height:\'auto\',\n     calcHeight: 30,\n     tip: false,\n     border: true,\n     index: true,\n     viewBtn: true,\n     selection: true,\n     column: [\n#for(x in model.prototypes) {\n       {\n         label: \"${x.comment!}\",\n         prop: \"${x.propertyName!}\",\n         type: \"${x.componentType!}\",\n#if(strutil.contain(x.componentType,\"date\")||strutil.contain(x.componentType,\"time\")){\n         format: \"yyyy-MM-dd hh:mm:ss\",\n         valueFormat: \"yyyy-MM-dd hh:mm:ss\",\n#}\n#if(isNotEmpty(x.dictCode)){\n         dicUrl: \"/api/blade-system/dict/dictionary?code=${x.dictCode!}\",\n         props: {\n           label: \"dictValue\",\n           value: \"dictKey\"\n         },\n#}\n#if(x.isForm==0){\n         addDisplay: false,\n         editDisplay: false,\n         viewDisplay: false,\n#}\n#if(x.isRow==1){\n         span: 24,\n#}\n#if(x.isList==0){\n         hide: true,\n#}\n#if(x.isQuery==1){\n         search: true,\n#}\n#if(x.isRequired==1&&isEmpty(x.validateRule)){\n         rules: [{\n           required: true,\n           message: \"请输入${x.comment!}\",\n           trigger: \"blur\"\n         }],\n#}\n#if(x.isRequired==1&&isNotEmpty(x.validateRule)){\n         rules: [\n           {\n             required: true,\n             validator: ${x.propertyName!}Validate,\n             trigger: \'blur\'\n           }\n         ],\n#}\n       },\n#}\n     ]\n}\n', 1, '2019-10-17 16:14:12', 1, '2019-10-20 21:41:41', 1, 0), (23, 2, '${model.modelCode}.vue', 2, '012', 'main', '/views', 'view文件', '#var subModel;\n#for(x in models){\n    #if (x.buildCode == \"sub\"){\n        @subModel = x;\n    #}\n#}\n<template>\n  <basic-container>\n    <avue-crud :option=\"option\"\n               :table-loading=\"loading\"\n               :data=\"data\"\n               :page=\"page\"\n               :permission=\"permissionList\"\n               :before-open=\"beforeOpen\"\n               v-model=\"form\"\n               ref=\"crud\"\n               @row-update=\"rowUpdate\"\n               @row-save=\"rowSave\"\n               @row-del=\"rowDel\"\n               @search-change=\"searchChange\"\n               @search-reset=\"searchReset\"\n               @selection-change=\"selectionChange\"\n               @current-change=\"currentChange\"\n               @size-change=\"sizeChange\"\n               @refresh-change=\"refreshChange\"\n               @on-load=\"onLoad\">\n      <template slot=\"menuLeft\">\n        <el-button type=\"danger\"\n                   size=\"small\"\n                   icon=\"el-icon-delete\"\n                   plain\n                   v-if=\"permission.${model.modelCode!}_delete\"\n                   @click=\"handleDelete\">删 除\n        </el-button>\n      </template>\n      <template slot-scope=\"{row}\" slot=\"menu\">\n        <el-button type=\"text\"\n                   icon=\"el-icon-setting\"\n                   size=\"small\"\n                   plain\n                   style=\"border: 0;background-color: transparent !important;\"\n                   @click.stop=\"handleDataSub(row)\">配 置\n        </el-button>\n      </template>\n    </avue-crud>\n    <el-drawer :title=\"`[\\${${model.modelCode!}Name}] 配置`\" :visible.sync=\"subVisible\" :direction=\"direction\"\n               :before-close=\"handleSubClose\" size=\"1000px\">\n      <basic-container>\n        <avue-crud :option=\"optionSub\"\n                   :data=\"dataSub\"\n                   :page=\"pageSub\"\n                   v-model=\"formSub\"\n                   :table-loading=\"loadingSub\"\n                   ref=\"crudSub\"\n                   @row-del=\"rowDelSub\"\n                   @row-update=\"rowUpdateSub\"\n                   @row-save=\"rowSaveSub\"\n                   :before-open=\"beforeOpenSub\"\n                   @search-change=\"searchChangeSub\"\n                   @search-reset=\"searchResetSub\"\n                   @selection-change=\"selectionChangeSub\"\n                   @current-change=\"currentChangeSub\"\n                   @size-change=\"sizeChangeSub\"\n                   @on-load=\"onLoadSub\">\n          <template slot=\"menuLeft\">\n            <el-button type=\"danger\"\n                       size=\"small\"\n                       icon=\"el-icon-delete\"\n                       plain\n                       @click=\"handleDeleteSub\">删 除\n            </el-button>\n          </template>\n        </avue-crud>\n      </basic-container>\n    </el-drawer>\n  </basic-container>\n</template>\n\n<script>\n  import {getList, getDetail, add, update, remove} from \"@/api/${serviceKey!}/${model.modelCode!}\";\n  import {getList as getListSub, getDetail as getDetailSub, add as addSub, update as updateSub, remove as removeSub} from \"@/api/${serviceKey!}/${subModel.modelCode!}\";\n  import option from \"@/const/${serviceKey!}/${model.modelCode!}\";\n  import optionSub from \"@/const/${serviceKey!}/${subModel.modelCode!}\";\n  import {mapGetters} from \"vuex\";\n\n  export default {\n    data() {\n#for(x in model.prototypes) {\n#if(x.isRequired==1&&isNotEmpty(x.validateRule)){\n      ${x.validateRule!}\n#}\n#}\n      return {\n        form: {},\n        query: {},\n        loading: true,\n        data: [],\n        selectionList: [],\n        page: {\n          pageSize: 10,\n          currentPage: 1,\n          total: 0\n        },\n        option: option,\n        subVisible: false,\n        direction: \'rtl\',\n        ${model.modelCode!}Id: 0,\n        ${model.modelCode!}Name: \"${model.modelName!}\",\n        formSub: {},\n        querySub: {},\n        loadingSub: true,\n        dataSub: [],\n        selectionListSub: [],\n        pageSub: {\n          pageSize: 10,\n          currentPage: 1,\n          total: 0\n        },\n        optionSub: optionSub\n      };\n    },\n    computed: {\n      ...mapGetters([\"permission\"]),\n      permissionList() {\n        return {\n          addBtn: this.vaildData(this.permission.${model.modelCode!}_add, false),\n          viewBtn: this.vaildData(this.permission.${model.modelCode!}_view, false),\n          delBtn: this.vaildData(this.permission.${model.modelCode!}_delete, false),\n          editBtn: this.vaildData(this.permission.${model.modelCode!}_edit, false)\n        };\n      },\n      ids() {\n        let ids = [];\n        this.selectionList.forEach(ele => {\n          ids.push(ele.id);\n        });\n        return ids.join(\",\");\n      },\n      subIds() {\n        let ids = [];\n        this.selectionListSub.forEach(ele => {\n          ids.push(ele.id);\n        });\n        return ids.join(\",\");\n      }\n    },\n    methods: {\n      // 主表模块\n      rowSave(row, done, loading) {\n        add(row).then(() => {\n          this.onLoad(this.page);\n          this.$message({\n            type: \"success\",\n            message: \"操作成功!\"\n          });\n          done();\n        }, error => {\n          window.console.log(error);\n          loading();\n        });\n      },\n      rowUpdate(row, index, done, loading) {\n        update(row).then(() => {\n          this.onLoad(this.page);\n          this.$message({\n            type: \"success\",\n            message: \"操作成功!\"\n          });\n          done();\n        }, error => {\n          window.console.log(error);\n          loading();\n        });\n      },\n      rowDel(row) {\n        this.$confirm(\"确定将选择数据删除?\", {\n          confirmButtonText: \"确定\",\n          cancelButtonText: \"取消\",\n          type: \"warning\"\n        })\n          .then(() => {\n            return remove(row.id);\n          })\n          .then(() => {\n            this.onLoad(this.page);\n            this.$message({\n              type: \"success\",\n              message: \"操作成功!\"\n            });\n          });\n      },\n      handleDelete() {\n        if (this.selectionList.length === 0) {\n          this.$message.warning(\"请选择至少一条数据\");\n          return;\n        }\n        this.$confirm(\"确定将选择数据删除?\", {\n          confirmButtonText: \"确定\",\n          cancelButtonText: \"取消\",\n          type: \"warning\"\n        })\n          .then(() => {\n            return remove(this.ids);\n          })\n          .then(() => {\n            this.onLoad(this.page);\n            this.$message({\n              type: \"success\",\n              message: \"操作成功!\"\n            });\n            this.$refs.crud.toggleSelection();\n          });\n      },\n      beforeOpen(done, type) {\n        if ([\"edit\", \"view\"].includes(type)) {\n          getDetail(this.form.id).then(res => {\n            this.form = res.data.data;\n          });\n        }\n        done();\n      },\n      searchReset() {\n        this.query = {};\n        this.onLoad(this.page);\n      },\n      searchChange(params, done) {\n        this.query = params;\n        this.page.currentPage = 1\n        this.onLoad(this.page, params);\n        done();\n      },\n      selectionChange(list) {\n        this.selectionList = list;\n      },\n      selectionClear() {\n        this.selectionList = [];\n        this.$refs.crud.toggleSelection();\n      },\n      currentChange(currentPage){\n        this.page.currentPage = currentPage;\n      },\n      sizeChange(pageSize){\n        this.page.pageSize = pageSize;\n      },\n      onLoad(page, params = {}) {\n        this.loading = true;\n        getList(page.currentPage, page.pageSize, Object.assign(params, this.query)).then(res => {\n          const data = res.data.data;\n          this.page.total = data.total;\n          this.data = data.records;\n          this.loading = false;\n          this.selectionClear();\n        });\n      },\n      // 子表模块\n      handleDataSub(row) {\n        this.subVisible = true;\n        this.${model.modelCode}Id = row.id;\n        this.onLoadSub(this.pageSub)\n      },\n      handleSubClose(hide) {\n        hide();\n      },\n      rowSaveSub(row, loading, done) {\n        row = {\n          ...row,\n          ${model.modelCode!}Id: this.${model.modelCode}Id,\n        };\n        addSub(row).then(() => {\n          loading();\n          this.onLoadSub(this.pageSub);\n          this.$message({\n            type: \"success\",\n            message: \"操作成功!\"\n          });\n        }, error => {\n          done();\n          window.console.log(error);\n        });\n      },\n      rowUpdateSub(row, index, loading, done) {\n        row = {\n          ...row,\n          ${model.modelCode!}Id: this.${model.modelCode}Id,\n        };\n        updateSub(row).then(() => {\n          loading();\n          this.onLoadSub(this.pageSub);\n          this.$message({\n            type: \"success\",\n            message: \"操作成功!\"\n          });\n        }, error => {\n          done();\n          window.console.log(error);\n        });\n      },\n      rowDelSub(row) {\n        this.$confirm(\"确定将选择数据删除?\", {\n          confirmButtonText: \"确定\",\n          cancelButtonText: \"取消\",\n          type: \"warning\"\n        })\n          .then(() => {\n            return removeSub(row.id);\n          })\n          .then(() => {\n            this.onLoadSub(this.pageSub);\n            this.$message({\n              type: \"success\",\n              message: \"操作成功!\"\n            });\n          });\n      },\n      handleDeleteSub() {\n        if (this.selectionListSub.length === 0) {\n          this.$message.warning(\"请选择至少一条数据\");\n          return;\n        }\n        this.$confirm(\"确定将选择数据删除?\", {\n          confirmButtonText: \"确定\",\n          cancelButtonText: \"取消\",\n          type: \"warning\"\n        })\n          .then(() => {\n            return removeSub(this.subIds);\n          })\n          .then(() => {\n            this.onLoadSub(this.pageSub);\n            this.$message({\n              type: \"success\",\n              message: \"操作成功!\"\n            });\n            this.$refs.crudSub.toggleSelection();\n          });\n      },\n      beforeOpenSub(done, type) {\n        if ([\"edit\", \"view\"].includes(type)) {\n          getDetailSub(this.formSub.id).then(res => {\n            this.formSub = res.data.data;\n          });\n        }\n        done();\n      },\n      searchResetSub() {\n        this.querySub = {};\n        this.onLoadSub(this.pageSub);\n      },\n      searchChangeSub(params) {\n        this.querySub = params;\n        this.onLoadSub(this.pageSub, params);\n      },\n      selectionChangeSub(list) {\n        this.selectionListSub = list;\n      },\n      currentChangeSub(currentPage) {\n        this.pageSub.currentPage = currentPage;\n      },\n      sizeChangeSub(pageSize) {\n        this.pageSub.pageSize = pageSize;\n      },\n      refreshChange() {\n        this.onLoad(this.page, this.query);\n      },\n      onLoadSub(page, params = {}) {\n        this.loadingSub = true;\n        const values = {\n          ...params,\n          ${model.modelCode!}Id: this.${model.modelCode}Id,\n        }\n        getListSub(page.currentPage, page.pageSize, Object.assign(values, this.querySub)).then(res => {\n          const data = res.data.data;\n          this.pageSub.total = data.total;\n          this.dataSub = data.records;\n          this.selectionListSub = [];\n          this.loadingSub = false;\n        });\n      },\n    }\n  };\n</script>\n\n<style>\n</style>\n', 1, '2019-10-17 16:14:12', 1, '2020-04-15 18:14:06', 1, 0), (24, 1, '${model.modelCode}.sql', 1, '012', 'main', '/mapper', '菜单sql生成', 'INSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)\nVALUES (\'${menuId}\', 0, \'${serviceKey}\', \'${model.modelCode}\', \'menu\', \'/${serviceKey}/${model.modelCode}\', NULL, 1, 1, 0, 1, NULL, 0);\nINSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)\nVALUES (\'${addMenuId}\', \'${menuId}\', \'${model.modelCode}_add\', \'新增\', \'add\', \'/${serviceKey}/${model.modelCode}/add\', \'plus\', 1, 2, 1, 1, NULL, 0);\nINSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)\nVALUES (\'${editMenuId}\', \'${menuId}\', \'${model.modelCode}_edit\', \'修改\', \'edit\', \'/${serviceKey}/${model.modelCode}/edit\', \'form\', 2, 2, 2, 1, NULL, 0);\nINSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)\nVALUES (\'${removeMenuId}\', \'${menuId}\', \'${model.modelCode}_delete\', \'删除\', \'delete\', \'/api/${serviceKey}/${model.modelCode}/remove\', \'delete\', 3, 2, 3, 1, NULL, 0);\nINSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)\nVALUES (\'${viewMenuId}\', \'${menuId}\', \'${model.modelCode}_view\', \'查看\', \'view\', \'/${serviceKey}/${model.modelCode}/view\', \'file-text\', 4, 2, 2, 1, NULL, 0);\n', 1, '2019-10-28 17:21:29', 1, '2019-10-28 17:21:40', 1, 0), (25, 2, '${model.modelCode}.sql', 1, '013', 'main', '/mapper', '菜单sql生成', 'INSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)\nVALUES (\'${menuId}\', 1123598815738675201, \'${serviceKey}\', \'${model.modelCode}\', \'menu\', \'/${serviceKey}/${model.modelCode}\', NULL, 1, 1, 0, 1, NULL, 0);\nINSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)\nVALUES (\'${addMenuId}\', \'${menuId}\', \'${model.modelCode}_add\', \'新增\', \'add\', \'/${serviceKey}/${model.modelCode}/add\', \'plus\', 1, 2, 1, 1, NULL, 0);\nINSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)\nVALUES (\'${editMenuId}\', \'${menuId}\', \'${model.modelCode}_edit\', \'修改\', \'edit\', \'/${serviceKey}/${model.modelCode}/edit\', \'form\', 2, 2, 2, 1, NULL, 0);\nINSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)\nVALUES (\'${removeMenuId}\', \'${menuId}\', \'${model.modelCode}_delete\', \'删除\', \'delete\', \'/api/${serviceKey}/${model.modelCode}/remove\', \'delete\', 3, 2, 3, 1, NULL, 0);\nINSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)\nVALUES (\'${viewMenuId}\', \'${menuId}\', \'${model.modelCode}_view\', \'查看\', \'view\', \'/${serviceKey}/${model.modelCode}/view\', \'file-text\', 4, 2, 2, 1, NULL, 0);\n', 1, '2019-10-28 17:22:31', 1, '2019-10-28 17:22:31', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for test_notice
-- ----------------------------
DROP TABLE IF EXISTS `test_notice`;
CREATE TABLE `test_notice`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `category` int(11) NULL DEFAULT NULL COMMENT '类型',
  `release_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_user` bigint(64) NULL DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表';

-- ----------------------------
-- Records of test_notice
-- ----------------------------
BEGIN;
INSERT INTO `test_notice` VALUES (1, '000000', '测试公告1', 3, '2018-12-31 20:03:31', '222', 1, NULL, '2018-12-05 20:03:31', 1, '2018-12-28 11:10:51', 1, 0), (2, '000000', '测试公告2', 1, '2018-12-05 20:03:31', '333', 1, NULL, '2018-12-28 10:32:26', 1, '2018-12-28 11:10:34', 1, 0), (3, '000000', '测试公告3', 6, '2018-12-29 00:00:00', '11111', 1, NULL, '2018-12-28 11:03:44', 1, '2018-12-28 11:10:28', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for test_notice_list
-- ----------------------------
DROP TABLE IF EXISTS `test_notice_list`;
CREATE TABLE `test_notice_list`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_id` bigint(64) NULL DEFAULT NULL COMMENT '公告id',
  `list_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事项名',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '截止日期',
  `create_user` bigint(64) NULL DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告清单表';

SET FOREIGN_KEY_CHECKS = 1;
