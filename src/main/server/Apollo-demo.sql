# Create Database
# ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS ApolloConfigDB DEFAULT CHARACTER SET = utf8mb4;

CREATE DATABASE IF NOT EXISTS ApolloPortalDB DEFAULT CHARACTER SET = utf8mb4;

CREATE DATABASE IF NOT EXISTS ApolloConfigDBPRO DEFAULT CHARACTER SET = utf8mb4;

SET FOREIGN_KEY_CHECKS = 0;

Use ApolloConfigDB;
-- ----------------------------
-- Table structure for App
-- ----------------------------
DROP TABLE IF EXISTS `App`;
CREATE TABLE `App` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';

-- ----------------------------
-- Records of App
-- ----------------------------
BEGIN;
INSERT INTO `App` VALUES (1, 'apollo-quickstart', 'apollo快速入门', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `App` VALUES (2, 'account-service', '统一账户服务', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `App` VALUES (3, 'common-template', '*****通用配置模板*****', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `App` VALUES (4, 'transaction-service', '交易中心', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `App` VALUES (5, 'uaa-service', '统一认证服务', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `App` VALUES (6, 'consumer-service', '用户服务', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
COMMIT;

-- ----------------------------
-- Table structure for AppNamespace
-- ----------------------------
DROP TABLE IF EXISTS `AppNamespace`;
CREATE TABLE `AppNamespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId` (`AppId`),
  KEY `Name_AppId` (`Name`,`AppId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='应用namespace定义';

-- ----------------------------
-- Records of AppNamespace
-- ----------------------------
BEGIN;
INSERT INTO `AppNamespace` VALUES (1, 'application', 'apollo-quickstart', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `AppNamespace` VALUES (2, 'application', 'account-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-17 11:33:42', 'apollo', '2019-09-17 11:33:42');
INSERT INTO `AppNamespace` VALUES (3, 'spring-rocketmq', 'account-service', 'properties', b'0', '', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `AppNamespace` VALUES (4, 'application', 'common-template', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `AppNamespace` VALUES (5, 'micro_service.spring-boot-http', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `AppNamespace` VALUES (6, 'application', 'transaction-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-17 17:18:14', 'apollo', '2019-09-17 17:18:14');
INSERT INTO `AppNamespace` VALUES (7, 'application', 'uaa-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `AppNamespace` VALUES (8, 'application', 'consumer-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `AppNamespace` VALUES (9, 'micro_service.spring-boot-druid', 'account-service', 'properties', b'1', '', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `AppNamespace` VALUES (10, 'micro_service.spring-eureka', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `AppNamespace` VALUES (11, 'micro_service.spring-cloud-feign', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `AppNamespace` VALUES (12, 'micro_service.spring-boot-redis', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
COMMIT;

-- ----------------------------
-- Table structure for Audit
-- ----------------------------
DROP TABLE IF EXISTS `Audit`;
CREATE TABLE `Audit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `EntityName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '表名',
  `EntityId` int(10) unsigned DEFAULT NULL COMMENT '记录ID',
  `OpName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '操作类型',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4 COMMENT='日志审计表';

-- ----------------------------
-- Records of Audit
-- ----------------------------
BEGIN;
INSERT INTO `Audit` VALUES (1, 'App', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 16:30:40', NULL, '2019-09-16 16:30:40');
INSERT INTO `Audit` VALUES (2, 'AppNamespace', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 16:30:40', NULL, '2019-09-16 16:30:40');
INSERT INTO `Audit` VALUES (3, 'Cluster', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 16:30:40', NULL, '2019-09-16 16:30:40');
INSERT INTO `Audit` VALUES (4, 'Namespace', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 16:30:40', NULL, '2019-09-16 16:30:40');
INSERT INTO `Audit` VALUES (5, 'Item', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 16:31:23', NULL, '2019-09-16 16:31:23');
INSERT INTO `Audit` VALUES (6, 'Release', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 16:31:25', NULL, '2019-09-16 16:31:25');
INSERT INTO `Audit` VALUES (7, 'ReleaseHistory', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 16:31:25', NULL, '2019-09-16 16:31:25');
INSERT INTO `Audit` VALUES (8, 'Item', 1, 'UPDATE', NULL, b'0', 'apollo', '2019-09-16 16:59:48', NULL, '2019-09-16 16:59:48');
INSERT INTO `Audit` VALUES (9, 'Release', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 16:59:51', NULL, '2019-09-16 16:59:51');
INSERT INTO `Audit` VALUES (10, 'ReleaseHistory', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 16:59:51', NULL, '2019-09-16 16:59:51');
INSERT INTO `Audit` VALUES (11, 'Item', 1, 'UPDATE', NULL, b'0', 'apollo', '2019-09-16 17:00:43', NULL, '2019-09-16 17:00:43');
INSERT INTO `Audit` VALUES (12, 'Release', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 17:00:46', NULL, '2019-09-16 17:00:46');
INSERT INTO `Audit` VALUES (13, 'ReleaseHistory', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 17:00:46', NULL, '2019-09-16 17:00:46');
INSERT INTO `Audit` VALUES (14, 'Item', 1, 'UPDATE', NULL, b'0', 'apollo', '2019-09-16 17:18:20', NULL, '2019-09-16 17:18:20');
INSERT INTO `Audit` VALUES (15, 'Release', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 17:18:24', NULL, '2019-09-16 17:18:24');
INSERT INTO `Audit` VALUES (16, 'ReleaseHistory', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 17:18:24', NULL, '2019-09-16 17:18:24');
INSERT INTO `Audit` VALUES (17, 'Item', 1, 'UPDATE', NULL, b'0', 'apollo', '2019-09-16 17:19:42', NULL, '2019-09-16 17:19:42');
INSERT INTO `Audit` VALUES (18, 'Release', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 17:19:44', NULL, '2019-09-16 17:19:44');
INSERT INTO `Audit` VALUES (19, 'ReleaseHistory', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 17:19:44', NULL, '2019-09-16 17:19:44');
INSERT INTO `Audit` VALUES (20, 'Item', 1, 'UPDATE', NULL, b'0', 'apollo', '2019-09-16 17:26:49', NULL, '2019-09-16 17:26:49');
INSERT INTO `Audit` VALUES (21, 'Release', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 17:26:52', NULL, '2019-09-16 17:26:52');
INSERT INTO `Audit` VALUES (22, 'ReleaseHistory', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-16 17:26:52', NULL, '2019-09-16 17:26:52');
INSERT INTO `Audit` VALUES (23, 'App', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:33:41', NULL, '2019-09-17 11:33:41');
INSERT INTO `Audit` VALUES (24, 'AppNamespace', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:33:42', NULL, '2019-09-17 11:33:42');
INSERT INTO `Audit` VALUES (25, 'Cluster', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:33:42', NULL, '2019-09-17 11:33:42');
INSERT INTO `Audit` VALUES (26, 'Namespace', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:33:42', NULL, '2019-09-17 11:33:42');
INSERT INTO `Audit` VALUES (27, 'Item', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:35:19', NULL, '2019-09-17 11:35:19');
INSERT INTO `Audit` VALUES (28, 'Item', 2, 'DELETE', NULL, b'0', 'apollo', '2019-09-17 11:36:12', NULL, '2019-09-17 11:36:12');
INSERT INTO `Audit` VALUES (29, 'Item', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:38:39', NULL, '2019-09-17 11:38:39');
INSERT INTO `Audit` VALUES (30, 'Release', 7, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:38:49', NULL, '2019-09-17 11:38:49');
INSERT INTO `Audit` VALUES (31, 'ReleaseHistory', 7, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:38:49', NULL, '2019-09-17 11:38:49');
INSERT INTO `Audit` VALUES (32, 'Item', 3, 'UPDATE', NULL, b'0', 'apollo', '2019-09-17 11:41:00', NULL, '2019-09-17 11:41:00');
INSERT INTO `Audit` VALUES (33, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-09-17 11:41:00', NULL, '2019-09-17 11:41:00');
INSERT INTO `Audit` VALUES (34, 'Release', 8, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:41:24', NULL, '2019-09-17 11:41:24');
INSERT INTO `Audit` VALUES (35, 'ReleaseHistory', 8, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:41:24', NULL, '2019-09-17 11:41:24');
INSERT INTO `Audit` VALUES (36, 'Namespace', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:42:23', NULL, '2019-09-17 11:42:23');
INSERT INTO `Audit` VALUES (37, 'AppNamespace', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:42:23', NULL, '2019-09-17 11:42:23');
INSERT INTO `Audit` VALUES (38, 'Item', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:42:54', NULL, '2019-09-17 11:42:54');
INSERT INTO `Audit` VALUES (39, 'Item', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:42:54', NULL, '2019-09-17 11:42:54');
INSERT INTO `Audit` VALUES (40, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:42:54', NULL, '2019-09-17 11:42:54');
INSERT INTO `Audit` VALUES (41, 'Release', 9, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:42:56', NULL, '2019-09-17 11:42:56');
INSERT INTO `Audit` VALUES (42, 'ReleaseHistory', 9, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 11:42:56', NULL, '2019-09-17 11:42:56');
INSERT INTO `Audit` VALUES (43, 'Item', 3, 'UPDATE', NULL, b'0', 'apollo', '2019-09-17 14:06:36', NULL, '2019-09-17 14:06:36');
INSERT INTO `Audit` VALUES (44, 'Item', 3, 'DELETE', NULL, b'0', 'apollo', '2019-09-17 14:08:18', NULL, '2019-09-17 14:08:18');
INSERT INTO `Audit` VALUES (45, 'ReleaseHistory', 10, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:08:41', NULL, '2019-09-17 14:08:41');
INSERT INTO `Audit` VALUES (46, 'Release', 10, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:09:25', NULL, '2019-09-17 14:09:25');
INSERT INTO `Audit` VALUES (47, 'ReleaseHistory', 11, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:09:25', NULL, '2019-09-17 14:09:25');
INSERT INTO `Audit` VALUES (48, 'App', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:14:07', NULL, '2019-09-17 14:14:07');
INSERT INTO `Audit` VALUES (49, 'AppNamespace', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:14:07', NULL, '2019-09-17 14:14:07');
INSERT INTO `Audit` VALUES (50, 'Cluster', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:14:07', NULL, '2019-09-17 14:14:07');
INSERT INTO `Audit` VALUES (51, 'Namespace', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:14:07', NULL, '2019-09-17 14:14:07');
INSERT INTO `Audit` VALUES (52, 'Namespace', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:16:13', NULL, '2019-09-17 14:16:13');
INSERT INTO `Audit` VALUES (53, 'AppNamespace', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:16:13', NULL, '2019-09-17 14:16:13');
INSERT INTO `Audit` VALUES (54, 'Item', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:18:46', NULL, '2019-09-17 14:18:46');
INSERT INTO `Audit` VALUES (55, 'Item', 7, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:18:46', NULL, '2019-09-17 14:18:46');
INSERT INTO `Audit` VALUES (56, 'Item', 8, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:18:46', NULL, '2019-09-17 14:18:46');
INSERT INTO `Audit` VALUES (57, 'Item', 9, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:18:46', NULL, '2019-09-17 14:18:46');
INSERT INTO `Audit` VALUES (58, 'Item', 10, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:18:46', NULL, '2019-09-17 14:18:46');
INSERT INTO `Audit` VALUES (59, 'Item', 11, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:18:46', NULL, '2019-09-17 14:18:46');
INSERT INTO `Audit` VALUES (60, 'Item', 12, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:18:46', NULL, '2019-09-17 14:18:46');
INSERT INTO `Audit` VALUES (61, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:18:46', NULL, '2019-09-17 14:18:46');
INSERT INTO `Audit` VALUES (62, 'Release', 11, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:18:50', NULL, '2019-09-17 14:18:50');
INSERT INTO `Audit` VALUES (63, 'ReleaseHistory', 12, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:18:50', NULL, '2019-09-17 14:18:50');
INSERT INTO `Audit` VALUES (64, 'Namespace', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:20:54', NULL, '2019-09-17 14:20:54');
INSERT INTO `Audit` VALUES (65, 'Item', 13, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:22:16', NULL, '2019-09-17 14:22:16');
INSERT INTO `Audit` VALUES (66, 'Release', 12, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:22:19', NULL, '2019-09-17 14:22:19');
INSERT INTO `Audit` VALUES (67, 'ReleaseHistory', 13, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:22:19', NULL, '2019-09-17 14:22:19');
INSERT INTO `Audit` VALUES (68, 'Cluster', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:40:44', NULL, '2019-09-17 14:40:44');
INSERT INTO `Audit` VALUES (69, 'Namespace', 7, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:40:44', NULL, '2019-09-17 14:40:44');
INSERT INTO `Audit` VALUES (70, 'Namespace', 8, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:40:44', NULL, '2019-09-17 14:40:44');
INSERT INTO `Audit` VALUES (71, 'Item', 14, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:41:29', NULL, '2019-09-17 14:41:29');
INSERT INTO `Audit` VALUES (72, 'Item', 15, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:41:29', NULL, '2019-09-17 14:41:29');
INSERT INTO `Audit` VALUES (73, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:41:29', NULL, '2019-09-17 14:41:29');
INSERT INTO `Audit` VALUES (74, 'Release', 13, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:42:25', NULL, '2019-09-17 14:42:25');
INSERT INTO `Audit` VALUES (75, 'ReleaseHistory', 14, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 14:42:25', NULL, '2019-09-17 14:42:25');
INSERT INTO `Audit` VALUES (76, 'App', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:18:14', NULL, '2019-09-17 17:18:14');
INSERT INTO `Audit` VALUES (77, 'AppNamespace', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:18:14', NULL, '2019-09-17 17:18:14');
INSERT INTO `Audit` VALUES (78, 'Cluster', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:18:14', NULL, '2019-09-17 17:18:14');
INSERT INTO `Audit` VALUES (79, 'Namespace', 9, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:18:14', NULL, '2019-09-17 17:18:14');
INSERT INTO `Audit` VALUES (80, 'Namespace', 10, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:19:21', NULL, '2019-09-17 17:19:21');
INSERT INTO `Audit` VALUES (81, 'Item', 16, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:20:44', NULL, '2019-09-17 17:20:44');
INSERT INTO `Audit` VALUES (82, 'Release', 14, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:20:47', NULL, '2019-09-17 17:20:47');
INSERT INTO `Audit` VALUES (83, 'ReleaseHistory', 15, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:20:47', NULL, '2019-09-17 17:20:47');
INSERT INTO `Audit` VALUES (84, 'Item', 17, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:51:56', NULL, '2019-09-17 17:51:56');
INSERT INTO `Audit` VALUES (85, 'Release', 15, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:51:59', NULL, '2019-09-17 17:51:59');
INSERT INTO `Audit` VALUES (86, 'ReleaseHistory', 16, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:51:59', NULL, '2019-09-17 17:51:59');
INSERT INTO `Audit` VALUES (87, 'Item', 18, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 18:52:13', NULL, '2019-09-17 18:52:13');
INSERT INTO `Audit` VALUES (88, 'Item', 19, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 18:52:13', NULL, '2019-09-17 18:52:13');
INSERT INTO `Audit` VALUES (89, 'Release', 16, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 18:52:16', NULL, '2019-09-17 18:52:16');
INSERT INTO `Audit` VALUES (90, 'ReleaseHistory', 17, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 18:52:16', NULL, '2019-09-17 18:52:16');
INSERT INTO `Audit` VALUES (91, 'Cluster', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 18:55:46', NULL, '2019-09-17 18:55:46');
INSERT INTO `Audit` VALUES (92, 'Namespace', 11, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 18:55:46', NULL, '2019-09-17 18:55:46');
INSERT INTO `Audit` VALUES (93, 'Item', 20, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 19:01:08', NULL, '2019-09-17 19:01:08');
INSERT INTO `Audit` VALUES (94, 'ReleaseHistory', 18, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 19:03:55', NULL, '2019-09-17 19:03:55');
INSERT INTO `Audit` VALUES (95, 'Release', 17, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:11:28', NULL, '2019-09-18 09:11:28');
INSERT INTO `Audit` VALUES (96, 'ReleaseHistory', 19, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:11:28', NULL, '2019-09-18 09:11:28');
INSERT INTO `Audit` VALUES (97, 'ReleaseHistory', 20, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:17:21', NULL, '2019-09-18 09:17:21');
INSERT INTO `Audit` VALUES (98, 'ReleaseHistory', 21, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:20:22', NULL, '2019-09-18 09:20:22');
INSERT INTO `Audit` VALUES (99, 'ReleaseHistory', 22, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:20:33', NULL, '2019-09-18 09:20:33');
INSERT INTO `Audit` VALUES (100, 'Release', 18, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:20:38', NULL, '2019-09-18 09:20:38');
INSERT INTO `Audit` VALUES (101, 'ReleaseHistory', 23, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:20:38', NULL, '2019-09-18 09:20:38');
INSERT INTO `Audit` VALUES (102, 'Release', 19, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:20:41', NULL, '2019-09-18 09:20:41');
INSERT INTO `Audit` VALUES (103, 'ReleaseHistory', 24, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:20:41', NULL, '2019-09-18 09:20:41');
INSERT INTO `Audit` VALUES (104, 'Release', 20, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:22:03', NULL, '2019-09-18 09:22:03');
INSERT INTO `Audit` VALUES (105, 'ReleaseHistory', 25, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:22:03', NULL, '2019-09-18 09:22:03');
INSERT INTO `Audit` VALUES (106, 'Item', 20, 'UPDATE', NULL, b'0', 'apollo', '2019-09-18 09:45:11', NULL, '2019-09-18 09:45:11');
INSERT INTO `Audit` VALUES (107, 'Release', 21, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:45:17', NULL, '2019-09-18 09:45:17');
INSERT INTO `Audit` VALUES (108, 'ReleaseHistory', 26, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:45:17', NULL, '2019-09-18 09:45:17');
INSERT INTO `Audit` VALUES (109, 'Item', 20, 'UPDATE', NULL, b'0', 'apollo', '2019-09-18 09:47:35', NULL, '2019-09-18 09:47:35');
INSERT INTO `Audit` VALUES (110, 'Release', 22, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:47:39', NULL, '2019-09-18 09:47:39');
INSERT INTO `Audit` VALUES (111, 'ReleaseHistory', 27, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 09:47:39', NULL, '2019-09-18 09:47:39');
INSERT INTO `Audit` VALUES (112, 'Cluster', 7, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:09:36', NULL, '2019-09-18 10:09:36');
INSERT INTO `Audit` VALUES (113, 'Namespace', 12, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:09:36', NULL, '2019-09-18 10:09:36');
INSERT INTO `Audit` VALUES (114, 'Item', 21, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:09:46', NULL, '2019-09-18 10:09:46');
INSERT INTO `Audit` VALUES (115, 'Release', 23, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:09:51', NULL, '2019-09-18 10:09:51');
INSERT INTO `Audit` VALUES (116, 'ReleaseHistory', 28, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:09:51', NULL, '2019-09-18 10:09:51');
INSERT INTO `Audit` VALUES (117, 'ReleaseHistory', 29, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:13:04', NULL, '2019-09-18 10:13:04');
INSERT INTO `Audit` VALUES (118, 'Release', 24, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:13:08', NULL, '2019-09-18 10:13:08');
INSERT INTO `Audit` VALUES (119, 'ReleaseHistory', 30, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:13:08', NULL, '2019-09-18 10:13:08');
INSERT INTO `Audit` VALUES (120, 'Item', 21, 'UPDATE', NULL, b'0', 'apollo', '2019-09-18 10:13:24', NULL, '2019-09-18 10:13:24');
INSERT INTO `Audit` VALUES (121, 'Release', 25, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:13:27', NULL, '2019-09-18 10:13:27');
INSERT INTO `Audit` VALUES (122, 'ReleaseHistory', 31, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:13:27', NULL, '2019-09-18 10:13:27');
INSERT INTO `Audit` VALUES (123, 'Namespace', 11, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 10:33:36', NULL, '2019-09-18 10:33:36');
INSERT INTO `Audit` VALUES (124, 'Cluster', 6, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 10:33:36', NULL, '2019-09-18 10:33:36');
INSERT INTO `Audit` VALUES (125, 'ReleaseHistory', 32, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:33:36', NULL, '2019-09-18 10:33:36');
INSERT INTO `Audit` VALUES (126, 'Branch', 6, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 10:33:36', NULL, '2019-09-18 10:33:36');
INSERT INTO `Audit` VALUES (127, 'Cluster', 8, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:36:09', NULL, '2019-09-18 10:36:09');
INSERT INTO `Audit` VALUES (128, 'Namespace', 13, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:36:09', NULL, '2019-09-18 10:36:09');
INSERT INTO `Audit` VALUES (129, 'Item', 22, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:36:21', NULL, '2019-09-18 10:36:21');
INSERT INTO `Audit` VALUES (130, 'ReleaseHistory', 33, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:36:30', NULL, '2019-09-18 10:36:30');
INSERT INTO `Audit` VALUES (131, 'Release', 26, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:36:36', NULL, '2019-09-18 10:36:36');
INSERT INTO `Audit` VALUES (132, 'ReleaseHistory', 34, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:36:36', NULL, '2019-09-18 10:36:36');
INSERT INTO `Audit` VALUES (133, 'Release', 27, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:42:05', NULL, '2019-09-18 10:42:05');
INSERT INTO `Audit` VALUES (134, 'ReleaseHistory', 35, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:42:05', NULL, '2019-09-18 10:42:05');
INSERT INTO `Audit` VALUES (135, 'Namespace', 13, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 10:43:49', NULL, '2019-09-18 10:43:49');
INSERT INTO `Audit` VALUES (136, 'Cluster', 8, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 10:43:49', NULL, '2019-09-18 10:43:49');
INSERT INTO `Audit` VALUES (137, 'ReleaseHistory', 36, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:43:49', NULL, '2019-09-18 10:43:49');
INSERT INTO `Audit` VALUES (138, 'Branch', 8, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 10:43:49', NULL, '2019-09-18 10:43:49');
INSERT INTO `Audit` VALUES (139, 'Cluster', 9, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:52:38', NULL, '2019-09-18 10:52:38');
INSERT INTO `Audit` VALUES (140, 'Namespace', 14, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:52:38', NULL, '2019-09-18 10:52:38');
INSERT INTO `Audit` VALUES (141, 'Item', 23, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:52:56', NULL, '2019-09-18 10:52:56');
INSERT INTO `Audit` VALUES (142, 'ReleaseHistory', 37, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:53:05', NULL, '2019-09-18 10:53:05');
INSERT INTO `Audit` VALUES (143, 'Release', 28, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:53:09', NULL, '2019-09-18 10:53:09');
INSERT INTO `Audit` VALUES (144, 'ReleaseHistory', 38, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:53:09', NULL, '2019-09-18 10:53:09');
INSERT INTO `Audit` VALUES (145, 'ReleaseHistory', 39, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:01:42', NULL, '2019-09-18 11:01:42');
INSERT INTO `Audit` VALUES (146, 'Release', 29, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:01:46', NULL, '2019-09-18 11:01:46');
INSERT INTO `Audit` VALUES (147, 'ReleaseHistory', 40, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:01:46', NULL, '2019-09-18 11:01:46');
INSERT INTO `Audit` VALUES (148, 'Namespace', 12, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 11:03:56', NULL, '2019-09-18 11:03:56');
INSERT INTO `Audit` VALUES (149, 'Cluster', 7, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 11:03:56', NULL, '2019-09-18 11:03:56');
INSERT INTO `Audit` VALUES (150, 'ReleaseHistory', 41, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:03:56', NULL, '2019-09-18 11:03:56');
INSERT INTO `Audit` VALUES (151, 'Branch', 7, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 11:03:56', NULL, '2019-09-18 11:03:56');
INSERT INTO `Audit` VALUES (152, 'Item', 24, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:10:19', NULL, '2019-09-18 11:10:19');
INSERT INTO `Audit` VALUES (153, 'Release', 30, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:10:23', NULL, '2019-09-18 11:10:23');
INSERT INTO `Audit` VALUES (154, 'ReleaseHistory', 42, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:10:23', NULL, '2019-09-18 11:10:23');
INSERT INTO `Audit` VALUES (155, 'Cluster', 10, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:10:31', NULL, '2019-09-18 11:10:31');
INSERT INTO `Audit` VALUES (156, 'Namespace', 15, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:10:31', NULL, '2019-09-18 11:10:31');
INSERT INTO `Audit` VALUES (157, 'Item', 25, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:10:43', NULL, '2019-09-18 11:10:43');
INSERT INTO `Audit` VALUES (158, 'ReleaseHistory', 43, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:10:50', NULL, '2019-09-18 11:10:50');
INSERT INTO `Audit` VALUES (159, 'Release', 31, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:10:54', NULL, '2019-09-18 11:10:54');
INSERT INTO `Audit` VALUES (160, 'ReleaseHistory', 44, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:10:54', NULL, '2019-09-18 11:10:54');
INSERT INTO `Audit` VALUES (161, 'Namespace', 15, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 11:12:14', NULL, '2019-09-18 11:12:14');
INSERT INTO `Audit` VALUES (162, 'Cluster', 10, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 11:12:14', NULL, '2019-09-18 11:12:14');
INSERT INTO `Audit` VALUES (163, 'ReleaseHistory', 45, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:12:14', NULL, '2019-09-18 11:12:14');
INSERT INTO `Audit` VALUES (164, 'Branch', 10, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 11:12:14', NULL, '2019-09-18 11:12:14');
INSERT INTO `Audit` VALUES (165, 'Cluster', 11, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:23:17', NULL, '2019-09-18 11:23:17');
INSERT INTO `Audit` VALUES (166, 'Namespace', 16, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:23:17', NULL, '2019-09-18 11:23:17');
INSERT INTO `Audit` VALUES (167, 'Item', 26, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:23:29', NULL, '2019-09-18 11:23:29');
INSERT INTO `Audit` VALUES (168, 'ReleaseHistory', 46, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:23:34', NULL, '2019-09-18 11:23:34');
INSERT INTO `Audit` VALUES (169, 'Release', 32, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:26:39', NULL, '2019-09-18 11:26:39');
INSERT INTO `Audit` VALUES (170, 'ReleaseHistory', 47, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:26:39', NULL, '2019-09-18 11:26:39');
INSERT INTO `Audit` VALUES (171, 'Item', 24, 'UPDATE', NULL, b'0', 'apollo', '2019-09-18 11:30:22', NULL, '2019-09-18 11:30:22');
INSERT INTO `Audit` VALUES (172, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-09-18 11:30:22', NULL, '2019-09-18 11:30:22');
INSERT INTO `Audit` VALUES (173, 'Release', 33, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:30:22', NULL, '2019-09-18 11:30:22');
INSERT INTO `Audit` VALUES (174, 'ReleaseHistory', 48, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:30:22', NULL, '2019-09-18 11:30:22');
INSERT INTO `Audit` VALUES (175, 'Namespace', 16, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 11:30:22', NULL, '2019-09-18 11:30:22');
INSERT INTO `Audit` VALUES (176, 'Cluster', 11, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 11:30:22', NULL, '2019-09-18 11:30:22');
INSERT INTO `Audit` VALUES (177, 'ReleaseHistory', 49, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:30:22', NULL, '2019-09-18 11:30:22');
INSERT INTO `Audit` VALUES (178, 'Branch', 11, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 11:30:22', NULL, '2019-09-18 11:30:22');
INSERT INTO `Audit` VALUES (179, 'Item', 27, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 14:47:28', NULL, '2019-09-19 14:47:28');
INSERT INTO `Audit` VALUES (180, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 14:47:28', NULL, '2019-09-19 14:47:28');
INSERT INTO `Audit` VALUES (181, 'Item', 1, 'DELETE', NULL, b'0', 'apollo', '2019-09-19 14:47:28', NULL, '2019-09-19 14:47:28');
INSERT INTO `Audit` VALUES (182, 'Item', 24, 'DELETE', NULL, b'0', 'apollo', '2019-09-19 14:47:28', NULL, '2019-09-19 14:47:28');
INSERT INTO `Audit` VALUES (183, 'ItemSet', NULL, 'DELETE', NULL, b'0', 'apollo', '2019-09-19 14:47:28', NULL, '2019-09-19 14:47:28');
INSERT INTO `Audit` VALUES (184, 'Release', 34, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 14:47:31', NULL, '2019-09-19 14:47:31');
INSERT INTO `Audit` VALUES (185, 'ReleaseHistory', 50, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 14:47:31', NULL, '2019-09-19 14:47:31');
INSERT INTO `Audit` VALUES (186, 'Item', 28, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 14:54:01', NULL, '2019-09-19 14:54:01');
INSERT INTO `Audit` VALUES (187, 'Item', 29, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 14:54:01', NULL, '2019-09-19 14:54:01');
INSERT INTO `Audit` VALUES (188, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 14:54:01', NULL, '2019-09-19 14:54:01');
INSERT INTO `Audit` VALUES (189, 'Item', 27, 'DELETE', NULL, b'0', 'apollo', '2019-09-19 14:54:01', NULL, '2019-09-19 14:54:01');
INSERT INTO `Audit` VALUES (190, 'ItemSet', NULL, 'DELETE', NULL, b'0', 'apollo', '2019-09-19 14:54:01', NULL, '2019-09-19 14:54:01');
INSERT INTO `Audit` VALUES (191, 'Release', 35, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 14:54:04', NULL, '2019-09-19 14:54:04');
INSERT INTO `Audit` VALUES (192, 'ReleaseHistory', 51, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 14:54:04', NULL, '2019-09-19 14:54:04');
INSERT INTO `Audit` VALUES (193, 'Item', 28, 'UPDATE', NULL, b'0', 'apollo', '2019-09-19 14:59:03', NULL, '2019-09-19 14:59:03');
INSERT INTO `Audit` VALUES (194, 'Release', 36, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 14:59:06', NULL, '2019-09-19 14:59:06');
INSERT INTO `Audit` VALUES (195, 'ReleaseHistory', 52, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 14:59:06', NULL, '2019-09-19 14:59:06');
INSERT INTO `Audit` VALUES (196, 'Item', 28, 'UPDATE', NULL, b'0', 'apollo', '2019-09-19 15:02:51', NULL, '2019-09-19 15:02:51');
INSERT INTO `Audit` VALUES (197, 'Release', 37, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 15:02:53', NULL, '2019-09-19 15:02:53');
INSERT INTO `Audit` VALUES (198, 'ReleaseHistory', 53, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 15:02:53', NULL, '2019-09-19 15:02:53');
INSERT INTO `Audit` VALUES (199, 'Item', 28, 'UPDATE', NULL, b'0', 'apollo', '2019-09-19 15:06:47', NULL, '2019-09-19 15:06:47');
INSERT INTO `Audit` VALUES (200, 'Release', 38, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 15:06:50', NULL, '2019-09-19 15:06:50');
INSERT INTO `Audit` VALUES (201, 'ReleaseHistory', 54, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 15:06:50', NULL, '2019-09-19 15:06:50');
INSERT INTO `Audit` VALUES (202, 'App', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:21:21', NULL, '2019-09-19 18:21:21');
INSERT INTO `Audit` VALUES (203, 'AppNamespace', 7, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:21:21', NULL, '2019-09-19 18:21:21');
INSERT INTO `Audit` VALUES (204, 'Cluster', 12, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:21:21', NULL, '2019-09-19 18:21:21');
INSERT INTO `Audit` VALUES (205, 'Namespace', 17, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:21:21', NULL, '2019-09-19 18:21:21');
INSERT INTO `Audit` VALUES (206, 'App', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:21:44', NULL, '2019-09-19 18:21:44');
INSERT INTO `Audit` VALUES (207, 'AppNamespace', 8, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:21:44', NULL, '2019-09-19 18:21:44');
INSERT INTO `Audit` VALUES (208, 'Cluster', 13, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:21:44', NULL, '2019-09-19 18:21:44');
INSERT INTO `Audit` VALUES (209, 'Namespace', 18, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:21:44', NULL, '2019-09-19 18:21:44');
INSERT INTO `Audit` VALUES (210, 'Namespace', 19, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:44:33', NULL, '2019-09-19 18:44:33');
INSERT INTO `Audit` VALUES (211, 'Namespace', 20, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:44:33', NULL, '2019-09-19 18:44:33');
INSERT INTO `Audit` VALUES (212, 'AppNamespace', 9, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:44:33', NULL, '2019-09-19 18:44:33');
INSERT INTO `Audit` VALUES (213, 'Item', 30, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (214, 'Item', 31, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (215, 'Item', 32, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (216, 'Item', 33, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (217, 'Item', 34, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (218, 'Item', 35, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (219, 'Item', 36, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (220, 'Item', 37, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (221, 'Item', 38, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (222, 'Item', 39, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (223, 'Item', 40, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (224, 'Item', 41, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (225, 'Item', 42, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (226, 'Item', 43, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (227, 'Item', 44, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (228, 'Item', 45, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (229, 'Item', 46, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (230, 'Item', 47, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (231, 'Item', 48, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (232, 'Item', 49, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (233, 'Item', 50, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (234, 'Item', 51, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (235, 'Item', 52, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (236, 'Item', 53, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (237, 'Item', 54, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (238, 'Item', 55, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (239, 'Item', 56, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (240, 'Item', 57, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (241, 'Item', 58, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (242, 'Item', 59, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (243, 'Item', 60, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (244, 'Item', 61, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (245, 'Item', 62, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (246, 'Item', 63, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (247, 'Item', 64, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (248, 'Item', 65, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (249, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:25', NULL, '2019-09-19 18:46:25');
INSERT INTO `Audit` VALUES (250, 'Release', 39, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:31', NULL, '2019-09-19 18:46:31');
INSERT INTO `Audit` VALUES (251, 'ReleaseHistory', 55, 'INSERT', NULL, b'0', 'apollo', '2019-09-19 18:46:31', NULL, '2019-09-19 18:46:31');
INSERT INTO `Audit` VALUES (252, 'Item', 41, 'UPDATE', NULL, b'0', 'apollo', '2019-09-20 09:59:09', NULL, '2019-09-20 09:59:09');
INSERT INTO `Audit` VALUES (253, 'Item', 41, 'UPDATE', NULL, b'0', 'apollo', '2019-09-20 10:05:56', NULL, '2019-09-20 10:05:56');
INSERT INTO `Audit` VALUES (254, 'Release', 40, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 10:05:59', NULL, '2019-09-20 10:05:59');
INSERT INTO `Audit` VALUES (255, 'ReleaseHistory', 56, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 10:05:59', NULL, '2019-09-20 10:05:59');
INSERT INTO `Audit` VALUES (256, 'Namespace', 21, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:20', NULL, '2019-09-20 11:02:20');
INSERT INTO `Audit` VALUES (257, 'AppNamespace', 10, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:20', NULL, '2019-09-20 11:02:20');
INSERT INTO `Audit` VALUES (258, 'Item', 66, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:37', NULL, '2019-09-20 11:02:37');
INSERT INTO `Audit` VALUES (259, 'Item', 67, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:37', NULL, '2019-09-20 11:02:37');
INSERT INTO `Audit` VALUES (260, 'Item', 68, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:37', NULL, '2019-09-20 11:02:37');
INSERT INTO `Audit` VALUES (261, 'Item', 69, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:37', NULL, '2019-09-20 11:02:37');
INSERT INTO `Audit` VALUES (262, 'Item', 70, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:37', NULL, '2019-09-20 11:02:37');
INSERT INTO `Audit` VALUES (263, 'Item', 71, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:37', NULL, '2019-09-20 11:02:37');
INSERT INTO `Audit` VALUES (264, 'Item', 72, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:37', NULL, '2019-09-20 11:02:37');
INSERT INTO `Audit` VALUES (265, 'Item', 73, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:37', NULL, '2019-09-20 11:02:37');
INSERT INTO `Audit` VALUES (266, 'Item', 74, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:37', NULL, '2019-09-20 11:02:37');
INSERT INTO `Audit` VALUES (267, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:37', NULL, '2019-09-20 11:02:37');
INSERT INTO `Audit` VALUES (268, 'Release', 41, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:40', NULL, '2019-09-20 11:02:40');
INSERT INTO `Audit` VALUES (269, 'ReleaseHistory', 57, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:02:40', NULL, '2019-09-20 11:02:40');
INSERT INTO `Audit` VALUES (270, 'Namespace', 22, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:08', NULL, '2019-09-20 11:03:08');
INSERT INTO `Audit` VALUES (271, 'AppNamespace', 11, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:08', NULL, '2019-09-20 11:03:08');
INSERT INTO `Audit` VALUES (272, 'Item', 75, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:23', NULL, '2019-09-20 11:03:23');
INSERT INTO `Audit` VALUES (273, 'Item', 76, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:23', NULL, '2019-09-20 11:03:23');
INSERT INTO `Audit` VALUES (274, 'Item', 77, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:23', NULL, '2019-09-20 11:03:23');
INSERT INTO `Audit` VALUES (275, 'Item', 78, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:23', NULL, '2019-09-20 11:03:23');
INSERT INTO `Audit` VALUES (276, 'Item', 79, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:23', NULL, '2019-09-20 11:03:23');
INSERT INTO `Audit` VALUES (277, 'Item', 80, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:23', NULL, '2019-09-20 11:03:23');
INSERT INTO `Audit` VALUES (278, 'Item', 81, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:23', NULL, '2019-09-20 11:03:23');
INSERT INTO `Audit` VALUES (279, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:23', NULL, '2019-09-20 11:03:23');
INSERT INTO `Audit` VALUES (280, 'Release', 42, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:26', NULL, '2019-09-20 11:03:26');
INSERT INTO `Audit` VALUES (281, 'ReleaseHistory', 58, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:03:26', NULL, '2019-09-20 11:03:26');
INSERT INTO `Audit` VALUES (282, 'Namespace', 23, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:34', NULL, '2019-09-20 11:04:34');
INSERT INTO `Audit` VALUES (283, 'AppNamespace', 12, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:34', NULL, '2019-09-20 11:04:34');
INSERT INTO `Audit` VALUES (284, 'Item', 82, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:53', NULL, '2019-09-20 11:04:53');
INSERT INTO `Audit` VALUES (285, 'Item', 83, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:53', NULL, '2019-09-20 11:04:53');
INSERT INTO `Audit` VALUES (286, 'Item', 84, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:53', NULL, '2019-09-20 11:04:53');
INSERT INTO `Audit` VALUES (287, 'Item', 85, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:53', NULL, '2019-09-20 11:04:53');
INSERT INTO `Audit` VALUES (288, 'Item', 86, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:53', NULL, '2019-09-20 11:04:53');
INSERT INTO `Audit` VALUES (289, 'Item', 87, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:53', NULL, '2019-09-20 11:04:53');
INSERT INTO `Audit` VALUES (290, 'Item', 88, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:53', NULL, '2019-09-20 11:04:53');
INSERT INTO `Audit` VALUES (291, 'Item', 89, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:53', NULL, '2019-09-20 11:04:53');
INSERT INTO `Audit` VALUES (292, 'Item', 90, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:53', NULL, '2019-09-20 11:04:53');
INSERT INTO `Audit` VALUES (293, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:53', NULL, '2019-09-20 11:04:53');
INSERT INTO `Audit` VALUES (294, 'Release', 43, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:55', NULL, '2019-09-20 11:04:55');
INSERT INTO `Audit` VALUES (295, 'ReleaseHistory', 59, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:04:55', NULL, '2019-09-20 11:04:55');
INSERT INTO `Audit` VALUES (296, 'Namespace', 24, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:05', NULL, '2019-09-20 11:09:05');
INSERT INTO `Audit` VALUES (297, 'Namespace', 25, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:05', NULL, '2019-09-20 11:09:05');
INSERT INTO `Audit` VALUES (298, 'Namespace', 26, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:11', NULL, '2019-09-20 11:09:11');
INSERT INTO `Audit` VALUES (299, 'Namespace', 27, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:11', NULL, '2019-09-20 11:09:11');
INSERT INTO `Audit` VALUES (300, 'Namespace', 28, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:18', NULL, '2019-09-20 11:09:18');
INSERT INTO `Audit` VALUES (301, 'Namespace', 29, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:18', NULL, '2019-09-20 11:09:18');
INSERT INTO `Audit` VALUES (302, 'Release', 44, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:34', NULL, '2019-09-20 11:09:34');
INSERT INTO `Audit` VALUES (303, 'ReleaseHistory', 60, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:34', NULL, '2019-09-20 11:09:34');
INSERT INTO `Audit` VALUES (304, 'Release', 45, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:46', NULL, '2019-09-20 11:09:46');
INSERT INTO `Audit` VALUES (305, 'ReleaseHistory', 61, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:46', NULL, '2019-09-20 11:09:46');
INSERT INTO `Audit` VALUES (306, 'Namespace', 30, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:04', NULL, '2019-09-20 11:11:04');
INSERT INTO `Audit` VALUES (307, 'Namespace', 31, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:10', NULL, '2019-09-20 11:11:10');
INSERT INTO `Audit` VALUES (308, 'Namespace', 32, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:17', NULL, '2019-09-20 11:11:17');
INSERT INTO `Audit` VALUES (309, 'Namespace', 33, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:22', NULL, '2019-09-20 11:11:22');
INSERT INTO `Audit` VALUES (310, 'Namespace', 34, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:05', NULL, '2019-09-20 11:12:05');
INSERT INTO `Audit` VALUES (311, 'Namespace', 35, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:10', NULL, '2019-09-20 11:12:10');
INSERT INTO `Audit` VALUES (312, 'Namespace', 36, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:16', NULL, '2019-09-20 11:12:16');
INSERT INTO `Audit` VALUES (313, 'Namespace', 37, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:21', NULL, '2019-09-20 11:12:21');
INSERT INTO `Audit` VALUES (314, 'Namespace', 38, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:25', NULL, '2019-09-20 11:12:25');
INSERT INTO `Audit` VALUES (315, 'Item', 91, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:41', NULL, '2019-09-20 11:12:41');
INSERT INTO `Audit` VALUES (316, 'Release', 46, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:44', NULL, '2019-09-20 11:12:44');
INSERT INTO `Audit` VALUES (317, 'ReleaseHistory', 62, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:44', NULL, '2019-09-20 11:12:44');
INSERT INTO `Audit` VALUES (318, 'Item', 92, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:13:00', NULL, '2019-09-20 11:13:00');
INSERT INTO `Audit` VALUES (319, 'Release', 47, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:13:03', NULL, '2019-09-20 11:13:03');
INSERT INTO `Audit` VALUES (320, 'ReleaseHistory', 63, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:13:03', NULL, '2019-09-20 11:13:03');
INSERT INTO `Audit` VALUES (321, 'Item', 93, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:13:39', NULL, '2019-09-20 11:13:39');
INSERT INTO `Audit` VALUES (322, 'Release', 48, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:13:42', NULL, '2019-09-20 11:13:42');
INSERT INTO `Audit` VALUES (323, 'ReleaseHistory', 64, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:13:42', NULL, '2019-09-20 11:13:42');
INSERT INTO `Audit` VALUES (324, 'Namespace', 39, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:17', NULL, '2019-09-20 11:14:17');
INSERT INTO `Audit` VALUES (325, 'Namespace', 40, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:22', NULL, '2019-09-20 11:14:22');
INSERT INTO `Audit` VALUES (326, 'Namespace', 41, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:27', NULL, '2019-09-20 11:14:27');
INSERT INTO `Audit` VALUES (327, 'Namespace', 42, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:32', NULL, '2019-09-20 11:14:32');
INSERT INTO `Audit` VALUES (328, 'Namespace', 43, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:37', NULL, '2019-09-20 11:14:37');
INSERT INTO `Audit` VALUES (329, 'Item', 94, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:53', NULL, '2019-09-20 11:14:53');
INSERT INTO `Audit` VALUES (330, 'Release', 49, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:56', NULL, '2019-09-20 11:14:56');
INSERT INTO `Audit` VALUES (331, 'ReleaseHistory', 65, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:56', NULL, '2019-09-20 11:14:56');
INSERT INTO `Audit` VALUES (332, 'Item', 95, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:15:15', NULL, '2019-09-20 11:15:15');
INSERT INTO `Audit` VALUES (333, 'Release', 50, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:15:19', NULL, '2019-09-20 11:15:19');
INSERT INTO `Audit` VALUES (334, 'ReleaseHistory', 66, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:15:19', NULL, '2019-09-20 11:15:19');
COMMIT;

-- ----------------------------
-- Table structure for Cluster
-- ----------------------------
DROP TABLE IF EXISTS `Cluster`;
CREATE TABLE `Cluster` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '集群名字',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'App id',
  `ParentClusterId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父cluster',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId_Name` (`AppId`,`Name`),
  KEY `IX_ParentClusterId` (`ParentClusterId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='集群';

-- ----------------------------
-- Records of Cluster
-- ----------------------------
BEGIN;
INSERT INTO `Cluster` VALUES (1, 'default', 'apollo-quickstart', 0, b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Cluster` VALUES (2, 'default', 'account-service', 0, b'0', 'apollo', '2019-09-17 11:33:42', 'apollo', '2019-09-17 11:33:42');
INSERT INTO `Cluster` VALUES (3, 'default', 'common-template', 0, b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Cluster` VALUES (4, 'SHAJQ', 'account-service', 0, b'0', 'apollo', '2019-09-17 14:40:44', 'apollo', '2019-09-17 14:40:44');
INSERT INTO `Cluster` VALUES (5, 'default', 'transaction-service', 0, b'0', 'apollo', '2019-09-17 17:18:14', 'apollo', '2019-09-17 17:18:14');
INSERT INTO `Cluster` VALUES (6, '20190917185545-b163dd3f726d60f7', 'account-service', 2, b'1', 'apollo', '2019-09-17 18:55:46', 'apollo', '2019-09-18 10:33:36');
INSERT INTO `Cluster` VALUES (7, '20190918100936-9d21dd3f72a3d3d0', 'apollo-quickstart', 1, b'1', 'apollo', '2019-09-18 10:09:36', 'apollo', '2019-09-18 11:03:56');
INSERT INTO `Cluster` VALUES (8, '20190918103608-b163dd3f72a3d3d4', 'account-service', 2, b'1', 'apollo', '2019-09-18 10:36:09', 'apollo', '2019-09-18 10:43:49');
INSERT INTO `Cluster` VALUES (9, '20190918105237-b163dd3f72a3d3d7', 'account-service', 2, b'0', 'apollo', '2019-09-18 10:52:38', 'apollo', '2019-09-18 10:52:38');
INSERT INTO `Cluster` VALUES (10, '20190918111030-9d21dd3f72a3d3db', 'apollo-quickstart', 1, b'1', 'apollo', '2019-09-18 11:10:31', 'apollo', '2019-09-18 11:12:14');
INSERT INTO `Cluster` VALUES (11, '20190918112317-9d21dd3f72a3d3dd', 'apollo-quickstart', 1, b'1', 'apollo', '2019-09-18 11:23:17', 'apollo', '2019-09-18 11:30:22');
INSERT INTO `Cluster` VALUES (12, 'default', 'uaa-service', 0, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Cluster` VALUES (13, 'default', 'consumer-service', 0, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
COMMIT;

-- ----------------------------
-- Table structure for Commit
-- ----------------------------
DROP TABLE IF EXISTS `Commit`;
CREATE TABLE `Commit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ChangeSets` longtext NOT NULL COMMENT '修改变更集',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `AppId` (`AppId`(191)),
  KEY `ClusterName` (`ClusterName`(191)),
  KEY `NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COMMENT='commit 历史表';

-- ----------------------------
-- Records of Commit
-- ----------------------------
BEGIN;
INSERT INTO `Commit` VALUES (1, '{\"createItems\":[{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"true\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:22\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-16 16:31:22\"}],\"updateItems\":[],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-16 16:31:23', 'apollo', '2019-09-16 16:31:23');
INSERT INTO `Commit` VALUES (2, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"true\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-16 16:31:23\"},\"newItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-16 16:59:48\"}}],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-16 16:59:49', 'apollo', '2019-09-16 16:59:49');
INSERT INTO `Commit` VALUES (3, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-16 16:59:48\"},\"newItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-16 17:00:43\"}}],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-16 17:00:43', 'apollo', '2019-09-16 17:00:43');
INSERT INTO `Commit` VALUES (4, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-16 17:00:43\"},\"newItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-16 17:18:20\"}}],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-16 17:18:20', 'apollo', '2019-09-16 17:18:20');
INSERT INTO `Commit` VALUES (5, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-16 17:18:20\"},\"newItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-16 17:19:41\"}}],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-16 17:19:42', 'apollo', '2019-09-16 17:19:42');
INSERT INTO `Commit` VALUES (6, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-16 17:19:42\"},\"newItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-16 17:26:49\"}}],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-16 17:26:49', 'apollo', '2019-09-16 17:26:49');
INSERT INTO `Commit` VALUES (7, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"spring-boot-http\",\"value\":\"/\",\"lineNum\":1,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 11:35:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 11:35:19\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'default', 'application', NULL, b'0', 'apollo', '2019-09-17 11:35:19', 'apollo', '2019-09-17 11:35:19');
INSERT INTO `Commit` VALUES (8, '{\"createItems\":[],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":2,\"key\":\"spring-boot-http\",\"value\":\"/\",\"lineNum\":1,\"id\":2,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 11:35:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 11:36:12\"}]}', 'account-service', 'default', 'application', NULL, b'0', 'apollo', '2019-09-17 11:36:12', 'apollo', '2019-09-17 11:36:12');
INSERT INTO `Commit` VALUES (9, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"sms.enable\",\"value\":\"true\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 11:38:38\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 11:38:38\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'default', 'application', NULL, b'0', 'apollo', '2019-09-17 11:38:39', 'apollo', '2019-09-17 11:38:39');
INSERT INTO `Commit` VALUES (10, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":2,\"key\":\"sms.enable\",\"value\":\"true\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 11:38:39\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 11:38:39\"},\"newItem\":{\"namespaceId\":2,\"key\":\"sms.enable\",\"value\":\"false\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 11:38:39\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 11:40:59\"}}],\"deleteItems\":[]}', 'account-service', 'default', 'application', NULL, b'0', 'apollo', '2019-09-17 11:41:00', 'apollo', '2019-09-17 11:41:00');
INSERT INTO `Commit` VALUES (11, '{\"createItems\":[{\"namespaceId\":3,\"key\":\"rocketmq.name-server\",\"value\":\"127.0.0.1:9876\",\"comment\":\"\",\"lineNum\":1,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 11:42:53\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 11:42:53\"},{\"namespaceId\":3,\"key\":\"rocketmq.producer.group\",\"value\":\"PID_ACCOUNT\",\"comment\":\"\",\"lineNum\":2,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 11:42:53\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 11:42:53\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'default', 'spring-rocketmq', NULL, b'0', 'apollo', '2019-09-17 11:42:54', 'apollo', '2019-09-17 11:42:54');
INSERT INTO `Commit` VALUES (12, '{\"createItems\":[],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":2,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":1,\"id\":3,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 11:38:39\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 14:08:18\"}]}', 'account-service', 'default', 'application', NULL, b'0', 'apollo', '2019-09-17 14:08:18', 'apollo', '2019-09-17 14:08:18');
INSERT INTO `Commit` VALUES (13, '{\"createItems\":[{\"namespaceId\":5,\"key\":\"spring.http.encoding.enabled\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":1,\"id\":6,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 14:18:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 14:18:46\"},{\"namespaceId\":5,\"key\":\"spring.http.encoding.charset\",\"value\":\"UTF-8\",\"comment\":\"\",\"lineNum\":2,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 14:18:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 14:18:46\"},{\"namespaceId\":5,\"key\":\"spring.http.encoding.force\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":3,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 14:18:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 14:18:46\"},{\"namespaceId\":5,\"key\":\"server.tomcat.remote_ip_header\",\"value\":\"x-forwarded-for\",\"comment\":\"\",\"lineNum\":4,\"id\":9,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 14:18:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 14:18:46\"},{\"namespaceId\":5,\"key\":\"server.tomcat.protocol_header\",\"value\":\"x-forwarded-proto\",\"comment\":\"\",\"lineNum\":5,\"id\":10,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 14:18:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 14:18:46\"},{\"namespaceId\":5,\"key\":\"server.use-forward-headers\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":6,\"id\":11,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 14:18:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 14:18:46\"},{\"namespaceId\":5,\"key\":\"server.servlet.context-path\",\"value\":\"/\",\"comment\":\"\",\"lineNum\":7,\"id\":12,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 14:18:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 14:18:46\"}],\"updateItems\":[],\"deleteItems\":[]}', 'common-template', 'default', 'micro_service.spring-boot-http', NULL, b'0', 'apollo', '2019-09-17 14:18:46', 'apollo', '2019-09-17 14:18:46');
INSERT INTO `Commit` VALUES (14, '{\"createItems\":[{\"namespaceId\":6,\"key\":\"server.servlet.context-path\",\"value\":\"/account-service\",\"comment\":\"\",\"lineNum\":1,\"id\":13,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 14:22:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 14:22:15\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'default', 'micro_service.spring-boot-http', NULL, b'0', 'apollo', '2019-09-17 14:22:16', 'apollo', '2019-09-17 14:22:16');
INSERT INTO `Commit` VALUES (15, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"rocketmq.name-server\",\"value\":\"127.0.0.1:9876\",\"comment\":\"\",\"lineNum\":1,\"id\":14,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 14:41:28\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 14:41:28\"},{\"namespaceId\":8,\"key\":\"rocketmq.producer.group\",\"value\":\"PID_ACCOUNT\",\"comment\":\"\",\"lineNum\":2,\"id\":15,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 14:41:28\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 14:41:28\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'SHAJQ', 'spring-rocketmq', NULL, b'0', 'apollo', '2019-09-17 14:41:29', 'apollo', '2019-09-17 14:41:29');
INSERT INTO `Commit` VALUES (16, '{\"createItems\":[{\"namespaceId\":10,\"key\":\"server.servlet.context-path\",\"value\":\"/transaction\",\"comment\":\"\",\"lineNum\":1,\"id\":16,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 17:20:43\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 17:20:43\"}],\"updateItems\":[],\"deleteItems\":[]}', 'transaction-service', 'default', 'micro_service.spring-boot-http', NULL, b'0', 'apollo', '2019-09-17 17:20:44', 'apollo', '2019-09-17 17:20:44');
INSERT INTO `Commit` VALUES (17, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"sms.enable\",\"value\":\"true\",\"lineNum\":1,\"id\":17,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 17:51:56\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 17:51:56\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'default', 'application', NULL, b'0', 'apollo', '2019-09-17 17:51:56', 'apollo', '2019-09-17 17:51:56');
INSERT INTO `Commit` VALUES (18, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"timeout\",\"value\":\"2000\",\"lineNum\":1,\"id\":19,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 18:52:12\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 18:52:12\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'SHAJQ', 'application', NULL, b'0', 'apollo', '2019-09-17 18:52:13', 'apollo', '2019-09-17 18:52:13');
INSERT INTO `Commit` VALUES (19, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"timeout\",\"value\":\"2000\",\"lineNum\":2,\"id\":18,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 18:52:12\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 18:52:12\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'default', 'application', NULL, b'0', 'apollo', '2019-09-17 18:52:13', 'apollo', '2019-09-17 18:52:13');
INSERT INTO `Commit` VALUES (20, '{\"createItems\":[{\"namespaceId\":11,\"key\":\"timeout\",\"value\":\"3000\",\"lineNum\":1,\"id\":20,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 19:01:07\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 19:01:07\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', '20190917185545-b163dd3f726d60f7', 'application', NULL, b'1', 'apollo', '2019-09-17 19:01:08', 'apollo', '2019-09-18 10:33:35');
INSERT INTO `Commit` VALUES (21, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":11,\"key\":\"timeout\",\"value\":\"3000\",\"comment\":\"test\",\"lineNum\":1,\"id\":20,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 19:01:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 09:45:11\"},\"newItem\":{\"namespaceId\":11,\"key\":\"timeout\",\"value\":\"4000\",\"comment\":\"test\",\"lineNum\":1,\"id\":20,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 19:01:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 09:47:34\"}}],\"deleteItems\":[]}', 'account-service', '20190917185545-b163dd3f726d60f7', 'application', NULL, b'1', 'apollo', '2019-09-18 09:47:35', 'apollo', '2019-09-18 10:33:35');
INSERT INTO `Commit` VALUES (22, '{\"createItems\":[{\"namespaceId\":12,\"key\":\"sms.enable\",\"value\":\"false\",\"lineNum\":1,\"id\":21,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 10:09:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 10:09:46\"}],\"updateItems\":[],\"deleteItems\":[]}', 'apollo-quickstart', '20190918100936-9d21dd3f72a3d3d0', 'application', NULL, b'1', 'apollo', '2019-09-18 10:09:46', 'apollo', '2019-09-18 11:03:56');
INSERT INTO `Commit` VALUES (23, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":12,\"key\":\"sms.enable\",\"value\":\"false\",\"lineNum\":1,\"id\":21,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 10:09:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 10:09:46\"},\"newItem\":{\"namespaceId\":12,\"key\":\"sms.enable\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":1,\"id\":21,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 10:09:46\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 10:13:23\"}}],\"deleteItems\":[]}', 'apollo-quickstart', '20190918100936-9d21dd3f72a3d3d0', 'application', NULL, b'1', 'apollo', '2019-09-18 10:13:24', 'apollo', '2019-09-18 11:03:56');
INSERT INTO `Commit` VALUES (24, '{\"createItems\":[{\"namespaceId\":13,\"key\":\"timeout\",\"value\":\"3000\",\"lineNum\":1,\"id\":22,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 10:36:20\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 10:36:20\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', '20190918103608-b163dd3f72a3d3d4', 'application', NULL, b'1', 'apollo', '2019-09-18 10:36:21', 'apollo', '2019-09-18 10:43:49');
INSERT INTO `Commit` VALUES (25, '{\"createItems\":[{\"namespaceId\":14,\"key\":\"timeout\",\"value\":\"3000\",\"lineNum\":1,\"id\":23,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 10:52:55\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 10:52:55\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', '20190918105237-b163dd3f72a3d3d7', 'application', NULL, b'0', 'apollo', '2019-09-18 10:52:56', 'apollo', '2019-09-18 10:52:56');
INSERT INTO `Commit` VALUES (26, '{\"createItems\":[{\"namespaceId\":1,\"key\":\"timeout\",\"value\":\"2000\",\"lineNum\":2,\"id\":24,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 11:10:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 11:10:19\"}],\"updateItems\":[],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-18 11:10:19', 'apollo', '2019-09-18 11:10:19');
INSERT INTO `Commit` VALUES (27, '{\"createItems\":[{\"namespaceId\":15,\"key\":\"timeout\",\"value\":\"3000\",\"lineNum\":1,\"id\":25,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 11:10:42\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 11:10:42\"}],\"updateItems\":[],\"deleteItems\":[]}', 'apollo-quickstart', '20190918111030-9d21dd3f72a3d3db', 'application', NULL, b'1', 'apollo', '2019-09-18 11:10:43', 'apollo', '2019-09-18 11:12:13');
INSERT INTO `Commit` VALUES (28, '{\"createItems\":[{\"namespaceId\":16,\"key\":\"timeout\",\"value\":\"3000\",\"lineNum\":1,\"id\":26,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 11:23:28\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 11:23:28\"}],\"updateItems\":[],\"deleteItems\":[]}', 'apollo-quickstart', '20190918112317-9d21dd3f72a3d3dd', 'application', NULL, b'1', 'apollo', '2019-09-18 11:23:29', 'apollo', '2019-09-18 11:30:22');
INSERT INTO `Commit` VALUES (29, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"timeout\",\"value\":\"2000\",\"lineNum\":2,\"id\":24,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 11:10:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 11:10:19\"},\"newItem\":{\"namespaceId\":1,\"key\":\"timeout\",\"value\":\"3000\",\"lineNum\":2,\"id\":24,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 11:10:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 11:30:22\"}}],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-18 11:30:22', 'apollo', '2019-09-18 11:30:22');
INSERT INTO `Commit` VALUES (30, '{\"createItems\":[],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-16 16:31:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 14:47:27\"},{\"namespaceId\":1,\"key\":\"timeout\",\"value\":\"3000\",\"lineNum\":2,\"id\":24,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 11:10:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 14:47:27\"}]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-19 14:47:28', 'apollo', '2019-09-19 14:47:28');
INSERT INTO `Commit` VALUES (31, '{\"createItems\":[{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":1,\"id\":28,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 14:54:01\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 14:54:01\"},{\"namespaceId\":1,\"key\":\"timeout\",\"value\":\"3000\",\"comment\":\"\",\"lineNum\":2,\"id\":29,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 14:54:01\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 14:54:01\"}],\"updateItems\":[],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-19 14:54:01', 'apollo', '2019-09-19 14:54:01');
INSERT INTO `Commit` VALUES (32, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":1,\"id\":28,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 14:54:01\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 14:54:01\"},\"newItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":1,\"id\":28,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 14:54:01\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 14:59:02\"}}],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-19 14:59:03', 'apollo', '2019-09-19 14:59:03');
INSERT INTO `Commit` VALUES (33, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":1,\"id\":28,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 14:54:01\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 14:59:03\"},\"newItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":1,\"id\":28,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 14:54:01\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 15:02:51\"}}],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-19 15:02:51', 'apollo', '2019-09-19 15:02:51');
INSERT INTO `Commit` VALUES (34, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":1,\"id\":28,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 14:54:01\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 15:02:51\"},\"newItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":1,\"id\":28,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 14:54:01\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 15:06:46\"}}],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-19 15:06:47', 'apollo', '2019-09-19 15:06:47');
INSERT INTO `Commit` VALUES (35, '{\"createItems\":[{\"namespaceId\":19,\"key\":\"spring.datasource.driver-class-name\",\"value\":\"com.mysql.cj.jdbc.Driver\",\"comment\":\"\",\"lineNum\":1,\"id\":30,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.stat-view-servlet.allow\",\"value\":\"127.0.0.1,192.168.163.1\",\"comment\":\"\",\"lineNum\":2,\"id\":31,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.web-stat-filter.session-stat-enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":3,\"id\":32,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.max-pool-prepared-statement-per-connection-size\",\"value\":\"20\",\"comment\":\"\",\"lineNum\":4,\"id\":33,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.max-active\",\"value\":\"20\",\"comment\":\"\",\"lineNum\":5,\"id\":34,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.stat-view-servlet.reset-enable\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":6,\"id\":35,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.validation-query\",\"value\":\"SELECT 1 FROM DUAL\",\"comment\":\"\",\"lineNum\":7,\"id\":36,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.stat-view-servlet.enabled\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":8,\"id\":37,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.web-stat-filter.enabled\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":9,\"id\":38,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.stat-view-servlet.url-pattern\",\"value\":\"/druid/*\",\"comment\":\"\",\"lineNum\":10,\"id\":39,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.stat-view-servlet.deny\",\"value\":\"192.168.1.73\",\"comment\":\"\",\"lineNum\":11,\"id\":40,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.url\",\"value\":\"jdbc\\\\:mysql\\\\://127.0.0.1\\\\:3306/p2p_account?useUnicode\\\\\\u003dtrue\",\"comment\":\"\",\"lineNum\":12,\"id\":41,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.filters\",\"value\":\"config,stat,wall,log4j2\",\"comment\":\"\",\"lineNum\":13,\"id\":42,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.test-on-return\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":14,\"id\":43,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.web-stat-filter.profile-enable\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":15,\"id\":44,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.initial-size\",\"value\":\"5\",\"comment\":\"\",\"lineNum\":16,\"id\":45,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.min-idle\",\"value\":\"5\",\"comment\":\"\",\"lineNum\":17,\"id\":46,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.max-wait\",\"value\":\"60000\",\"comment\":\"\",\"lineNum\":18,\"id\":47,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.web-stat-filter.session-stat-max-count\",\"value\":\"1000\",\"comment\":\"\",\"lineNum\":19,\"id\":48,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.pool-prepared-statements\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":20,\"id\":49,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.test-while-idle\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":21,\"id\":50,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.password\",\"value\":\"itcast0430\",\"comment\":\"\",\"lineNum\":22,\"id\":51,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.username\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":23,\"id\":52,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.stat-view-servlet.login-password\",\"value\":\"admin\",\"comment\":\"\",\"lineNum\":24,\"id\":53,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.stat-view-servlet.login-username\",\"value\":\"admin\",\"comment\":\"\",\"lineNum\":25,\"id\":54,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.web-stat-filter.url-pattern\",\"value\":\"/*\",\"comment\":\"\",\"lineNum\":26,\"id\":55,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.time-between-eviction-runs-millis\",\"value\":\"60000\",\"comment\":\"\",\"lineNum\":27,\"id\":56,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.min-evictable-idle-time-millis\",\"value\":\"300000\",\"comment\":\"\",\"lineNum\":28,\"id\":57,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.test-on-borrow\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":29,\"id\":58,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.web-stat-filter.principal-session-name\",\"value\":\"admin\",\"comment\":\"\",\"lineNum\":30,\"id\":59,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.filter.stat.log-slow-sql\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":31,\"id\":60,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.web-stat-filter.principal-cookie-name\",\"value\":\"admin\",\"comment\":\"\",\"lineNum\":32,\"id\":61,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.type\",\"value\":\"com.alibaba.druid.pool.DruidDataSource\",\"comment\":\"\",\"lineNum\":33,\"id\":62,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.aop-patterns\",\"value\":\"cn.itcast.wanxinp2p.*.service.*\",\"comment\":\"\",\"lineNum\":34,\"id\":63,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.filter.stat.slow-sql-millis\",\"value\":\"1\",\"comment\":\"\",\"lineNum\":35,\"id\":64,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},{\"namespaceId\":19,\"key\":\"spring.datasource.druid.web-stat-filter.exclusions\",\"value\":\"*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*\",\"comment\":\"\",\"lineNum\":36,\"id\":65,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'default', 'micro_service.spring-boot-druid', NULL, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Commit` VALUES (36, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":19,\"key\":\"spring.datasource.url\",\"value\":\"jdbc\\\\:mysql\\\\://127.0.0.1\\\\:3306/p2p_account?useUnicode\\\\\\u003dtrue\",\"comment\":\"\",\"lineNum\":12,\"id\":41,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-19 18:46:25\"},\"newItem\":{\"namespaceId\":19,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://127.0.0.1:3306/p2p_account?useUnicode\\u003dtrue\",\"comment\":\"\",\"lineNum\":12,\"id\":41,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-19 18:46:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 10:05:55\"}}],\"deleteItems\":[]}', 'account-service', 'default', 'micro_service.spring-boot-druid', NULL, b'0', 'apollo', '2019-09-20 10:05:56', 'apollo', '2019-09-20 10:05:56');
INSERT INTO `Commit` VALUES (37, '{\"createItems\":[{\"namespaceId\":21,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"http://localhost:53000/eureka/\",\"comment\":\"\",\"lineNum\":1,\"id\":66,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:02:37\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:02:37\"},{\"namespaceId\":21,\"key\":\"eureka.client.registry-fetch-interval-seconds\",\"value\":\"5\",\"comment\":\"\",\"lineNum\":2,\"id\":67,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:02:37\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:02:37\"},{\"namespaceId\":21,\"key\":\"eureka.instance.preferIpAddress\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":3,\"id\":68,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:02:37\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:02:37\"},{\"namespaceId\":21,\"key\":\"eureka.instance.instance-id\",\"value\":\"${spring.application.name}:${spring.cloud.client.ip-address}:${spring.application.instance_id:${server.port}}\",\"comment\":\"\",\"lineNum\":4,\"id\":69,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:02:37\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:02:37\"},{\"namespaceId\":21,\"key\":\"eureka.instance.lease-renewal-interval-in-seconds\",\"value\":\"5\",\"comment\":\"\",\"lineNum\":5,\"id\":70,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:02:37\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:02:37\"},{\"namespaceId\":21,\"key\":\"eureka.instance.lease-expiration-duration-in-seconds\",\"value\":\"10\",\"comment\":\"\",\"lineNum\":6,\"id\":71,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:02:37\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:02:37\"},{\"namespaceId\":21,\"key\":\"management.security.enabled\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":7,\"id\":72,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:02:37\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:02:37\"},{\"namespaceId\":21,\"key\":\"management.endpoints.web.exposure.include\",\"value\":\"refresh,health,info,env\",\"comment\":\"\",\"lineNum\":8,\"id\":73,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:02:37\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:02:37\"},{\"namespaceId\":21,\"key\":\"endpoints.health.sensitive\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":9,\"id\":74,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:02:37\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:02:37\"}],\"updateItems\":[],\"deleteItems\":[]}', 'common-template', 'default', 'micro_service.spring-eureka', NULL, b'0', 'apollo', '2019-09-20 11:02:37', 'apollo', '2019-09-20 11:02:37');
INSERT INTO `Commit` VALUES (38, '{\"createItems\":[{\"namespaceId\":22,\"key\":\"feign.hystrix.enabled\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":1,\"id\":75,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:03:22\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:03:22\"},{\"namespaceId\":22,\"key\":\"feign.compression.request.enabled\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":2,\"id\":76,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:03:22\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:03:22\"},{\"namespaceId\":22,\"key\":\"feign.compression.request.mime-types[0]\",\"value\":\"text/xml\",\"comment\":\"\",\"lineNum\":3,\"id\":77,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:03:22\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:03:22\"},{\"namespaceId\":22,\"key\":\"feign.compression.request.mime-types[1]\",\"value\":\"application/xml\",\"comment\":\"\",\"lineNum\":4,\"id\":78,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:03:22\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:03:22\"},{\"namespaceId\":22,\"key\":\"feign.compression.request.mime-types[2]\",\"value\":\"application/json\",\"comment\":\"\",\"lineNum\":5,\"id\":79,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:03:22\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:03:22\"},{\"namespaceId\":22,\"key\":\"feign.compression.request.min-request-size\",\"value\":\"2048\",\"comment\":\"\",\"lineNum\":6,\"id\":80,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:03:22\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:03:22\"},{\"namespaceId\":22,\"key\":\"feign.compression.response.enabled\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":7,\"id\":81,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:03:22\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:03:22\"}],\"updateItems\":[],\"deleteItems\":[]}', 'common-template', 'default', 'micro_service.spring-cloud-feign', NULL, b'0', 'apollo', '2019-09-20 11:03:23', 'apollo', '2019-09-20 11:03:23');
INSERT INTO `Commit` VALUES (39, '{\"createItems\":[{\"namespaceId\":23,\"key\":\"spring.redis.host\",\"value\":\"localhost\",\"comment\":\"\",\"lineNum\":1,\"id\":82,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:04:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:04:52\"},{\"namespaceId\":23,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"comment\":\"\",\"lineNum\":2,\"id\":83,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:04:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:04:52\"},{\"namespaceId\":23,\"key\":\"spring.redis.password\",\"value\":\"foobared123\",\"comment\":\"\",\"lineNum\":3,\"id\":84,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:04:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:04:52\"},{\"namespaceId\":23,\"key\":\"spring.redis.timeout\",\"value\":\"10000\",\"comment\":\"\",\"lineNum\":4,\"id\":85,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:04:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:04:52\"},{\"namespaceId\":23,\"key\":\"spring.redis.lettuce.pool.max-active\",\"value\":\"8\",\"comment\":\"\",\"lineNum\":5,\"id\":86,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:04:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:04:52\"},{\"namespaceId\":23,\"key\":\"spring.redis.lettuce.pool.max-wait\",\"value\":\"10000\",\"comment\":\"\",\"lineNum\":6,\"id\":87,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:04:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:04:52\"},{\"namespaceId\":23,\"key\":\"spring.redis.lettuce.pool.max-idle\",\"value\":\"8\",\"comment\":\"\",\"lineNum\":7,\"id\":88,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:04:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:04:52\"},{\"namespaceId\":23,\"key\":\"spring.redis.lettuce.pool.min-idle\",\"value\":\"0\",\"comment\":\"\",\"lineNum\":8,\"id\":89,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:04:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:04:52\"},{\"namespaceId\":23,\"key\":\"spring.redis.shutdown-timeout\",\"value\":\"100\",\"comment\":\"\",\"lineNum\":9,\"id\":90,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:04:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:04:52\"}],\"updateItems\":[],\"deleteItems\":[]}', 'common-template', 'default', 'micro_service.spring-boot-redis', NULL, b'0', 'apollo', '2019-09-20 11:04:53', 'apollo', '2019-09-20 11:04:53');
INSERT INTO `Commit` VALUES (40, '{\"createItems\":[{\"namespaceId\":34,\"key\":\"server.servlet.context-path\",\"value\":\"/uaa\",\"comment\":\"\",\"lineNum\":1,\"id\":91,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:12:41\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:12:41\"}],\"updateItems\":[],\"deleteItems\":[]}', 'uaa-service', 'default', 'micro_service.spring-boot-http', NULL, b'0', 'apollo', '2019-09-20 11:12:41', 'apollo', '2019-09-20 11:12:41');
INSERT INTO `Commit` VALUES (41, '{\"createItems\":[{\"namespaceId\":35,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://127.0.0.1:3306/p2p_uaa?useUnicode\\u003dtrue\",\"comment\":\"\",\"lineNum\":1,\"id\":92,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:12:59\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:12:59\"}],\"updateItems\":[],\"deleteItems\":[]}', 'uaa-service', 'default', 'micro_service.spring-boot-druid', NULL, b'0', 'apollo', '2019-09-20 11:13:00', 'apollo', '2019-09-20 11:13:00');
INSERT INTO `Commit` VALUES (42, '{\"createItems\":[{\"namespaceId\":31,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://127.0.0.1:3306/p2p_transaction?useUnicode\\u003dtrue\",\"comment\":\"\",\"lineNum\":1,\"id\":93,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:13:38\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:13:38\"}],\"updateItems\":[],\"deleteItems\":[]}', 'transaction-service', 'default', 'micro_service.spring-boot-druid', NULL, b'0', 'apollo', '2019-09-20 11:13:39', 'apollo', '2019-09-20 11:13:39');
INSERT INTO `Commit` VALUES (43, '{\"createItems\":[{\"namespaceId\":39,\"key\":\"server.servlet.context-path\",\"value\":\"/consumer\",\"comment\":\"\",\"lineNum\":1,\"id\":94,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:14:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:14:52\"}],\"updateItems\":[],\"deleteItems\":[]}', 'consumer-service', 'default', 'micro_service.spring-boot-http', NULL, b'0', 'apollo', '2019-09-20 11:14:53', 'apollo', '2019-09-20 11:14:53');
INSERT INTO `Commit` VALUES (44, '{\"createItems\":[{\"namespaceId\":40,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://127.0.0.1:3306/p2p_consumer?useUnicode\\u003dtrue\",\"comment\":\"\",\"lineNum\":1,\"id\":95,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:15:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:15:14\"}],\"updateItems\":[],\"deleteItems\":[]}', 'consumer-service', 'default', 'micro_service.spring-boot-druid', NULL, b'0', 'apollo', '2019-09-20 11:15:15', 'apollo', '2019-09-20 11:15:15');
COMMIT;

-- ----------------------------
-- Table structure for GrayReleaseRule
-- ----------------------------
DROP TABLE IF EXISTS `GrayReleaseRule`;
CREATE TABLE `GrayReleaseRule` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'branch name',
  `Rules` varchar(16000) DEFAULT '[]' COMMENT '灰度规则',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '灰度对应的release',
  `BranchStatus` tinyint(2) DEFAULT '1' COMMENT '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='灰度规则表';

-- ----------------------------
-- Records of GrayReleaseRule
-- ----------------------------
BEGIN;
INSERT INTO `GrayReleaseRule` VALUES (1, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 0, 1, b'1', 'apollo', '2019-09-17 19:03:55', 'apollo', '2019-09-18 09:11:27');
INSERT INTO `GrayReleaseRule` VALUES (2, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 17, 1, b'1', 'apollo', '2019-09-18 09:11:28', 'apollo', '2019-09-18 09:17:21');
INSERT INTO `GrayReleaseRule` VALUES (3, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 17, 1, b'1', 'apollo', '2019-09-18 09:17:21', 'apollo', '2019-09-18 09:20:21');
INSERT INTO `GrayReleaseRule` VALUES (4, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', '[]', 17, 1, b'1', 'apollo', '2019-09-18 09:20:22', 'apollo', '2019-09-18 09:20:32');
INSERT INTO `GrayReleaseRule` VALUES (5, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 17, 1, b'1', 'apollo', '2019-09-18 09:20:33', 'apollo', '2019-09-18 09:20:38');
INSERT INTO `GrayReleaseRule` VALUES (6, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 18, 1, b'1', 'apollo', '2019-09-18 09:20:38', 'apollo', '2019-09-18 09:20:41');
INSERT INTO `GrayReleaseRule` VALUES (7, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 19, 1, b'1', 'apollo', '2019-09-18 09:20:41', 'apollo', '2019-09-18 09:22:02');
INSERT INTO `GrayReleaseRule` VALUES (8, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 20, 1, b'1', 'apollo', '2019-09-18 09:22:03', 'apollo', '2019-09-18 09:45:17');
INSERT INTO `GrayReleaseRule` VALUES (9, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 21, 1, b'1', 'apollo', '2019-09-18 09:45:17', 'apollo', '2019-09-18 09:47:38');
INSERT INTO `GrayReleaseRule` VALUES (10, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 22, 1, b'1', 'apollo', '2019-09-18 09:47:39', 'apollo', '2019-09-18 10:33:35');
INSERT INTO `GrayReleaseRule` VALUES (11, 'apollo-quickstart', 'default', 'application', '20190918100936-9d21dd3f72a3d3d0', '[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}]', 23, 1, b'1', 'apollo', '2019-09-18 10:13:04', 'apollo', '2019-09-18 10:13:07');
INSERT INTO `GrayReleaseRule` VALUES (12, 'apollo-quickstart', 'default', 'application', '20190918100936-9d21dd3f72a3d3d0', '[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}]', 24, 1, b'1', 'apollo', '2019-09-18 10:13:08', 'apollo', '2019-09-18 10:13:27');
INSERT INTO `GrayReleaseRule` VALUES (13, 'apollo-quickstart', 'default', 'application', '20190918100936-9d21dd3f72a3d3d0', '[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}]', 25, 1, b'1', 'apollo', '2019-09-18 10:13:27', 'apollo', '2019-09-18 11:03:56');
INSERT INTO `GrayReleaseRule` VALUES (14, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', '[]', 22, 0, b'0', 'apollo', '2019-09-18 10:33:35', 'apollo', '2019-09-18 10:33:35');
INSERT INTO `GrayReleaseRule` VALUES (15, 'account-service', 'default', 'application', '20190918103608-b163dd3f72a3d3d4', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 0, 1, b'1', 'apollo', '2019-09-18 10:36:30', 'apollo', '2019-09-18 10:36:36');
INSERT INTO `GrayReleaseRule` VALUES (16, 'account-service', 'default', 'application', '20190918103608-b163dd3f72a3d3d4', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 26, 1, b'1', 'apollo', '2019-09-18 10:36:36', 'apollo', '2019-09-18 10:43:49');
INSERT INTO `GrayReleaseRule` VALUES (17, 'account-service', 'default', 'application', '20190918103608-b163dd3f72a3d3d4', '[]', 26, 0, b'0', 'apollo', '2019-09-18 10:43:49', 'apollo', '2019-09-18 10:43:49');
INSERT INTO `GrayReleaseRule` VALUES (18, 'account-service', 'default', 'application', '20190918105237-b163dd3f72a3d3d7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 0, 1, b'1', 'apollo', '2019-09-18 10:53:05', 'apollo', '2019-09-18 10:53:08');
INSERT INTO `GrayReleaseRule` VALUES (19, 'account-service', 'default', 'application', '20190918105237-b163dd3f72a3d3d7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 28, 1, b'1', 'apollo', '2019-09-18 10:53:09', 'apollo', '2019-09-18 11:01:41');
INSERT INTO `GrayReleaseRule` VALUES (20, 'account-service', 'default', 'application', '20190918105237-b163dd3f72a3d3d7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.170\"]}]', 28, 1, b'1', 'apollo', '2019-09-18 11:01:42', 'apollo', '2019-09-18 11:01:45');
INSERT INTO `GrayReleaseRule` VALUES (21, 'account-service', 'default', 'application', '20190918105237-b163dd3f72a3d3d7', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.170\"]}]', 29, 1, b'0', 'apollo', '2019-09-18 11:01:46', 'apollo', '2019-09-18 11:01:46');
INSERT INTO `GrayReleaseRule` VALUES (22, 'apollo-quickstart', 'default', 'application', '20190918100936-9d21dd3f72a3d3d0', '[]', 25, 0, b'0', 'apollo', '2019-09-18 11:03:56', 'apollo', '2019-09-18 11:03:56');
INSERT INTO `GrayReleaseRule` VALUES (23, 'apollo-quickstart', 'default', 'application', '20190918111030-9d21dd3f72a3d3db', '[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}]', 0, 1, b'1', 'apollo', '2019-09-18 11:10:50', 'apollo', '2019-09-18 11:10:54');
INSERT INTO `GrayReleaseRule` VALUES (24, 'apollo-quickstart', 'default', 'application', '20190918111030-9d21dd3f72a3d3db', '[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}]', 31, 1, b'1', 'apollo', '2019-09-18 11:10:54', 'apollo', '2019-09-18 11:12:13');
INSERT INTO `GrayReleaseRule` VALUES (25, 'apollo-quickstart', 'default', 'application', '20190918111030-9d21dd3f72a3d3db', '[]', 31, 0, b'0', 'apollo', '2019-09-18 11:12:14', 'apollo', '2019-09-18 11:12:14');
INSERT INTO `GrayReleaseRule` VALUES (26, 'apollo-quickstart', 'default', 'application', '20190918112317-9d21dd3f72a3d3dd', '[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}]', 0, 1, b'1', 'apollo', '2019-09-18 11:23:34', 'apollo', '2019-09-18 11:26:38');
INSERT INTO `GrayReleaseRule` VALUES (27, 'apollo-quickstart', 'default', 'application', '20190918112317-9d21dd3f72a3d3dd', '[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}]', 32, 1, b'1', 'apollo', '2019-09-18 11:26:39', 'apollo', '2019-09-18 11:30:22');
INSERT INTO `GrayReleaseRule` VALUES (28, 'apollo-quickstart', 'default', 'application', '20190918112317-9d21dd3f72a3d3dd', '[]', 32, 2, b'0', 'apollo', '2019-09-18 11:30:22', 'apollo', '2019-09-18 11:30:22');
COMMIT;

-- ----------------------------
-- Table structure for Instance
-- ----------------------------
DROP TABLE IF EXISTS `Instance`;
CREATE TABLE `Instance` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `DataCenter` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
  `Ip` varchar(32) NOT NULL DEFAULT '' COMMENT 'instance ip',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`AppId`,`ClusterName`,`Ip`,`DataCenter`),
  KEY `IX_IP` (`Ip`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='使用配置的应用实例';

-- ----------------------------
-- Records of Instance
-- ----------------------------
BEGIN;
INSERT INTO `Instance` VALUES (1, 'apollo-quickstart', 'default', '', '172.16.0.160', '2019-09-16 16:53:11', '2019-09-16 16:53:11');
INSERT INTO `Instance` VALUES (2, 'account-service', 'DEFAULT', '', '172.16.0.160', '2019-09-17 17:51:06', '2019-09-17 17:51:06');
INSERT INTO `Instance` VALUES (3, 'account-service', 'DEFAULT', '', '172.16.0.170', '2019-09-17 18:34:17', '2019-09-17 18:34:17');
INSERT INTO `Instance` VALUES (4, 'apollo-quickstart', 'default', '', '172.16.0.170', '2019-09-18 11:17:40', '2019-09-18 11:17:40');
INSERT INTO `Instance` VALUES (5, 'account-service', 'DEFAULT', '', '10.37.129.2', '2019-09-19 17:57:07', '2019-09-19 17:57:07');
COMMIT;

-- ----------------------------
-- Table structure for InstanceConfig
-- ----------------------------
DROP TABLE IF EXISTS `InstanceConfig`;
CREATE TABLE `InstanceConfig` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `InstanceId` int(11) unsigned DEFAULT NULL COMMENT 'Instance Id',
  `ConfigAppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
  `ConfigClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
  `ConfigNamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `ReleaseDeliveryTime` timestamp NULL DEFAULT NULL COMMENT '配置获取时间',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`InstanceId`,`ConfigAppId`,`ConfigNamespaceName`),
  KEY `IX_ReleaseKey` (`ReleaseKey`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Valid_Namespace` (`ConfigAppId`,`ConfigClusterName`,`ConfigNamespaceName`,`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='应用实例的配置信息';

-- ----------------------------
-- Records of InstanceConfig
-- ----------------------------
BEGIN;
INSERT INTO `InstanceConfig` VALUES (2, 2, 'account-service', 'default', 'application', '20190918104205-b163dd3f72a3d3d6', '2019-09-18 10:44:33', '2019-09-17 17:51:05', '2019-09-20 10:01:48');
INSERT INTO `InstanceConfig` VALUES (3, 2, 'account-service', 'default', 'micro_service.spring-boot-http', '20190917142218-920add3f72ed5089', '2019-09-17 17:51:05', '2019-09-17 17:51:05', '2019-09-20 10:01:49');
INSERT INTO `InstanceConfig` VALUES (4, 2, 'common-template', 'default', 'micro_service.spring-boot-http', '20190917141849-5351dd3f72ed5088', '2019-09-17 17:51:05', '2019-09-17 17:51:05', '2019-09-20 10:01:49');
INSERT INTO `InstanceConfig` VALUES (5, 2, 'account-service', 'default', 'spring-rocketmq', '20190917114256-1b4bdd3f72ed5086', '2019-09-17 17:51:05', '2019-09-17 17:51:05', '2019-09-20 10:01:49');
INSERT INTO `InstanceConfig` VALUES (6, 3, 'account-service', 'default', 'application', '20190918104205-b163dd3f72a3d3d6', '2019-09-18 10:51:35', '2019-09-17 18:34:17', '2019-09-18 10:51:35');
INSERT INTO `InstanceConfig` VALUES (7, 3, 'account-service', 'default', 'micro_service.spring-boot-http', '20190917142218-920add3f72ed5089', '2019-09-17 18:34:17', '2019-09-17 18:34:17', '2019-09-18 10:51:35');
INSERT INTO `InstanceConfig` VALUES (8, 3, 'common-template', 'default', 'micro_service.spring-boot-http', '20190917141849-5351dd3f72ed5088', '2019-09-17 18:34:17', '2019-09-17 18:34:17', '2019-09-18 10:51:35');
INSERT INTO `InstanceConfig` VALUES (9, 3, 'account-service', 'default', 'spring-rocketmq', '20190917114256-1b4bdd3f72ed5086', '2019-09-17 18:34:17', '2019-09-17 18:34:17', '2019-09-18 10:51:35');
INSERT INTO `InstanceConfig` VALUES (11, 4, 'apollo-quickstart', 'default', 'application', '20190918111022-9d21dd3f72a3d3da', '2019-09-18 11:17:39', '2019-09-18 11:17:39', '2019-09-18 11:17:39');
INSERT INTO `InstanceConfig` VALUES (13, 1, 'apollo-quickstart', 'default', 'application', '20190919150650-9d21dd3f727284c8', '2019-09-19 15:06:50', '2019-09-19 14:53:31', '2019-09-19 15:06:51');
INSERT INTO `InstanceConfig` VALUES (14, 5, 'account-service', 'default', 'application', '20190918104205-b163dd3f72a3d3d6', '2019-09-19 17:57:07', '2019-09-19 17:57:07', '2019-09-19 17:57:07');
INSERT INTO `InstanceConfig` VALUES (15, 5, 'account-service', 'default', 'micro_service.spring-boot-http', '20190917142218-920add3f72ed5089', '2019-09-19 17:57:07', '2019-09-19 17:57:07', '2019-09-19 17:57:07');
INSERT INTO `InstanceConfig` VALUES (16, 5, 'common-template', 'default', 'micro_service.spring-boot-http', '20190917141849-5351dd3f72ed5088', '2019-09-19 17:57:07', '2019-09-19 17:57:07', '2019-09-19 17:57:07');
INSERT INTO `InstanceConfig` VALUES (17, 5, 'account-service', 'default', 'spring-rocketmq', '20190917114256-1b4bdd3f72ed5086', '2019-09-19 17:57:07', '2019-09-19 17:57:07', '2019-09-19 17:57:07');
INSERT INTO `InstanceConfig` VALUES (18, 2, 'account-service', 'default', 'micro_service.spring-boot-druid', '20190920100558-4186dd3f726c2acb', '2019-09-20 10:05:59', '2019-09-20 10:04:46', '2019-09-20 10:05:59');
COMMIT;

-- ----------------------------
-- Table structure for Item
-- ----------------------------
DROP TABLE IF EXISTS `Item`;
CREATE TABLE `Item` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `Key` varchar(128) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` longtext NOT NULL COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `LineNum` int(10) unsigned DEFAULT '0' COMMENT '行号',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_GroupId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COMMENT='配置项目';

-- ----------------------------
-- Records of Item
-- ----------------------------
BEGIN;
INSERT INTO `Item` VALUES (1, 1, 'sms.enable', 'false', '', 1, b'1', 'apollo', '2019-09-16 16:31:23', 'apollo', '2019-09-19 14:47:28');
INSERT INTO `Item` VALUES (2, 2, 'spring-boot-http', '/', NULL, 1, b'1', 'apollo', '2019-09-17 11:35:19', 'apollo', '2019-09-17 11:36:12');
INSERT INTO `Item` VALUES (3, 2, 'sms.enable', 'false', '', 1, b'1', 'apollo', '2019-09-17 11:38:39', 'apollo', '2019-09-17 14:08:18');
INSERT INTO `Item` VALUES (4, 3, 'rocketmq.name-server', '127.0.0.1:9876', '', 1, b'0', 'apollo', '2019-09-17 11:42:54', 'apollo', '2019-09-17 11:42:54');
INSERT INTO `Item` VALUES (5, 3, 'rocketmq.producer.group', 'PID_ACCOUNT', '', 2, b'0', 'apollo', '2019-09-17 11:42:54', 'apollo', '2019-09-17 11:42:54');
INSERT INTO `Item` VALUES (6, 5, 'spring.http.encoding.enabled', 'true', '', 1, b'0', 'apollo', '2019-09-17 14:18:46', 'apollo', '2019-09-17 14:18:46');
INSERT INTO `Item` VALUES (7, 5, 'spring.http.encoding.charset', 'UTF-8', '', 2, b'0', 'apollo', '2019-09-17 14:18:46', 'apollo', '2019-09-17 14:18:46');
INSERT INTO `Item` VALUES (8, 5, 'spring.http.encoding.force', 'true', '', 3, b'0', 'apollo', '2019-09-17 14:18:46', 'apollo', '2019-09-17 14:18:46');
INSERT INTO `Item` VALUES (9, 5, 'server.tomcat.remote_ip_header', 'x-forwarded-for', '', 4, b'0', 'apollo', '2019-09-17 14:18:46', 'apollo', '2019-09-17 14:18:46');
INSERT INTO `Item` VALUES (10, 5, 'server.tomcat.protocol_header', 'x-forwarded-proto', '', 5, b'0', 'apollo', '2019-09-17 14:18:46', 'apollo', '2019-09-17 14:18:46');
INSERT INTO `Item` VALUES (11, 5, 'server.use-forward-headers', 'true', '', 6, b'0', 'apollo', '2019-09-17 14:18:46', 'apollo', '2019-09-17 14:18:46');
INSERT INTO `Item` VALUES (12, 5, 'server.servlet.context-path', '/', '', 7, b'0', 'apollo', '2019-09-17 14:18:46', 'apollo', '2019-09-17 14:18:46');
INSERT INTO `Item` VALUES (13, 6, 'server.servlet.context-path', '/account-service', '', 1, b'0', 'apollo', '2019-09-17 14:22:16', 'apollo', '2019-09-17 14:22:16');
INSERT INTO `Item` VALUES (14, 8, 'rocketmq.name-server', '127.0.0.1:9876', '', 1, b'0', 'apollo', '2019-09-17 14:41:29', 'apollo', '2019-09-17 14:41:29');
INSERT INTO `Item` VALUES (15, 8, 'rocketmq.producer.group', 'PID_ACCOUNT', '', 2, b'0', 'apollo', '2019-09-17 14:41:29', 'apollo', '2019-09-17 14:41:29');
INSERT INTO `Item` VALUES (16, 10, 'server.servlet.context-path', '/transaction', '', 1, b'0', 'apollo', '2019-09-17 17:20:44', 'apollo', '2019-09-17 17:20:44');
INSERT INTO `Item` VALUES (17, 2, 'sms.enable', 'true', NULL, 1, b'0', 'apollo', '2019-09-17 17:51:56', 'apollo', '2019-09-17 17:51:56');
INSERT INTO `Item` VALUES (18, 2, 'timeout', '2000', NULL, 2, b'0', 'apollo', '2019-09-17 18:52:13', 'apollo', '2019-09-17 18:52:13');
INSERT INTO `Item` VALUES (19, 7, 'timeout', '2000', NULL, 1, b'0', 'apollo', '2019-09-17 18:52:13', 'apollo', '2019-09-17 18:52:13');
INSERT INTO `Item` VALUES (20, 11, 'timeout', '4000', 'test', 1, b'1', 'apollo', '2019-09-17 19:01:08', 'apollo', '2019-09-18 10:33:35');
INSERT INTO `Item` VALUES (21, 12, 'sms.enable', 'true', '', 1, b'1', 'apollo', '2019-09-18 10:09:46', 'apollo', '2019-09-18 11:03:56');
INSERT INTO `Item` VALUES (22, 13, 'timeout', '3000', NULL, 1, b'1', 'apollo', '2019-09-18 10:36:21', 'apollo', '2019-09-18 10:43:49');
INSERT INTO `Item` VALUES (23, 14, 'timeout', '3000', NULL, 1, b'0', 'apollo', '2019-09-18 10:52:56', 'apollo', '2019-09-18 10:52:56');
INSERT INTO `Item` VALUES (24, 1, 'timeout', '3000', NULL, 2, b'1', 'apollo', '2019-09-18 11:10:19', 'apollo', '2019-09-19 14:47:28');
INSERT INTO `Item` VALUES (25, 15, 'timeout', '3000', NULL, 1, b'1', 'apollo', '2019-09-18 11:10:43', 'apollo', '2019-09-18 11:12:13');
INSERT INTO `Item` VALUES (26, 16, 'timeout', '3000', NULL, 1, b'1', 'apollo', '2019-09-18 11:23:29', 'apollo', '2019-09-18 11:30:22');
INSERT INTO `Item` VALUES (27, 1, '', '', '', 1, b'1', 'apollo', '2019-09-19 14:47:28', 'apollo', '2019-09-19 14:54:01');
INSERT INTO `Item` VALUES (28, 1, 'sms.enable', 'true', '', 1, b'0', 'apollo', '2019-09-19 14:54:01', 'apollo', '2019-09-19 15:06:47');
INSERT INTO `Item` VALUES (29, 1, 'timeout', '3000', '', 2, b'0', 'apollo', '2019-09-19 14:54:01', 'apollo', '2019-09-19 14:54:01');
INSERT INTO `Item` VALUES (30, 19, 'spring.datasource.driver-class-name', 'com.mysql.cj.jdbc.Driver', '', 1, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (31, 19, 'spring.datasource.druid.stat-view-servlet.allow', '127.0.0.1,192.168.163.1', '', 2, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (32, 19, 'spring.datasource.druid.web-stat-filter.session-stat-enable', 'false', '', 3, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (33, 19, 'spring.datasource.druid.max-pool-prepared-statement-per-connection-size', '20', '', 4, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (34, 19, 'spring.datasource.druid.max-active', '20', '', 5, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (35, 19, 'spring.datasource.druid.stat-view-servlet.reset-enable', 'false', '', 6, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (36, 19, 'spring.datasource.druid.validation-query', 'SELECT 1 FROM DUAL', '', 7, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (37, 19, 'spring.datasource.druid.stat-view-servlet.enabled', 'true', '', 8, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (38, 19, 'spring.datasource.druid.web-stat-filter.enabled', 'true', '', 9, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (39, 19, 'spring.datasource.druid.stat-view-servlet.url-pattern', '/druid/*', '', 10, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (40, 19, 'spring.datasource.druid.stat-view-servlet.deny', '192.168.1.73', '', 11, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (41, 19, 'spring.datasource.url', 'jdbc:mysql://127.0.0.1:3306/p2p_account?useUnicode=true', '', 12, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-20 10:05:56');
INSERT INTO `Item` VALUES (42, 19, 'spring.datasource.druid.filters', 'config,stat,wall,log4j2', '', 13, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (43, 19, 'spring.datasource.druid.test-on-return', 'false', '', 14, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (44, 19, 'spring.datasource.druid.web-stat-filter.profile-enable', 'true', '', 15, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (45, 19, 'spring.datasource.druid.initial-size', '5', '', 16, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (46, 19, 'spring.datasource.druid.min-idle', '5', '', 17, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (47, 19, 'spring.datasource.druid.max-wait', '60000', '', 18, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (48, 19, 'spring.datasource.druid.web-stat-filter.session-stat-max-count', '1000', '', 19, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (49, 19, 'spring.datasource.druid.pool-prepared-statements', 'true', '', 20, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (50, 19, 'spring.datasource.druid.test-while-idle', 'true', '', 21, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (51, 19, 'spring.datasource.password', 'itcast0430', '', 22, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (52, 19, 'spring.datasource.username', 'root', '', 23, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (53, 19, 'spring.datasource.druid.stat-view-servlet.login-password', 'admin', '', 24, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (54, 19, 'spring.datasource.druid.stat-view-servlet.login-username', 'admin', '', 25, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (55, 19, 'spring.datasource.druid.web-stat-filter.url-pattern', '/*', '', 26, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (56, 19, 'spring.datasource.druid.time-between-eviction-runs-millis', '60000', '', 27, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (57, 19, 'spring.datasource.druid.min-evictable-idle-time-millis', '300000', '', 28, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (58, 19, 'spring.datasource.druid.test-on-borrow', 'false', '', 29, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (59, 19, 'spring.datasource.druid.web-stat-filter.principal-session-name', 'admin', '', 30, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (60, 19, 'spring.datasource.druid.filter.stat.log-slow-sql', 'true', '', 31, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (61, 19, 'spring.datasource.druid.web-stat-filter.principal-cookie-name', 'admin', '', 32, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (62, 19, 'spring.datasource.type', 'com.alibaba.druid.pool.DruidDataSource', '', 33, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (63, 19, 'spring.datasource.druid.aop-patterns', 'cn.itcast.wanxinp2p.*.service.*', '', 34, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (64, 19, 'spring.datasource.druid.filter.stat.slow-sql-millis', '1', '', 35, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (65, 19, 'spring.datasource.druid.web-stat-filter.exclusions', '*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*', '', 36, b'0', 'apollo', '2019-09-19 18:46:25', 'apollo', '2019-09-19 18:46:25');
INSERT INTO `Item` VALUES (66, 21, 'eureka.client.serviceUrl.defaultZone', 'http://localhost:53000/eureka/', '', 1, b'0', 'apollo', '2019-09-20 11:02:37', 'apollo', '2019-09-20 11:02:37');
INSERT INTO `Item` VALUES (67, 21, 'eureka.client.registry-fetch-interval-seconds', '5', '', 2, b'0', 'apollo', '2019-09-20 11:02:37', 'apollo', '2019-09-20 11:02:37');
INSERT INTO `Item` VALUES (68, 21, 'eureka.instance.preferIpAddress', 'true', '', 3, b'0', 'apollo', '2019-09-20 11:02:37', 'apollo', '2019-09-20 11:02:37');
INSERT INTO `Item` VALUES (69, 21, 'eureka.instance.instance-id', '${spring.application.name}:${spring.cloud.client.ip-address}:${spring.application.instance_id:${server.port}}', '', 4, b'0', 'apollo', '2019-09-20 11:02:37', 'apollo', '2019-09-20 11:02:37');
INSERT INTO `Item` VALUES (70, 21, 'eureka.instance.lease-renewal-interval-in-seconds', '5', '', 5, b'0', 'apollo', '2019-09-20 11:02:37', 'apollo', '2019-09-20 11:02:37');
INSERT INTO `Item` VALUES (71, 21, 'eureka.instance.lease-expiration-duration-in-seconds', '10', '', 6, b'0', 'apollo', '2019-09-20 11:02:37', 'apollo', '2019-09-20 11:02:37');
INSERT INTO `Item` VALUES (72, 21, 'management.security.enabled', 'false', '', 7, b'0', 'apollo', '2019-09-20 11:02:37', 'apollo', '2019-09-20 11:02:37');
INSERT INTO `Item` VALUES (73, 21, 'management.endpoints.web.exposure.include', 'refresh,health,info,env', '', 8, b'0', 'apollo', '2019-09-20 11:02:37', 'apollo', '2019-09-20 11:02:37');
INSERT INTO `Item` VALUES (74, 21, 'endpoints.health.sensitive', 'false', '', 9, b'0', 'apollo', '2019-09-20 11:02:37', 'apollo', '2019-09-20 11:02:37');
INSERT INTO `Item` VALUES (75, 22, 'feign.hystrix.enabled', 'true', '', 1, b'0', 'apollo', '2019-09-20 11:03:23', 'apollo', '2019-09-20 11:03:23');
INSERT INTO `Item` VALUES (76, 22, 'feign.compression.request.enabled', 'true', '', 2, b'0', 'apollo', '2019-09-20 11:03:23', 'apollo', '2019-09-20 11:03:23');
INSERT INTO `Item` VALUES (77, 22, 'feign.compression.request.mime-types[0]', 'text/xml', '', 3, b'0', 'apollo', '2019-09-20 11:03:23', 'apollo', '2019-09-20 11:03:23');
INSERT INTO `Item` VALUES (78, 22, 'feign.compression.request.mime-types[1]', 'application/xml', '', 4, b'0', 'apollo', '2019-09-20 11:03:23', 'apollo', '2019-09-20 11:03:23');
INSERT INTO `Item` VALUES (79, 22, 'feign.compression.request.mime-types[2]', 'application/json', '', 5, b'0', 'apollo', '2019-09-20 11:03:23', 'apollo', '2019-09-20 11:03:23');
INSERT INTO `Item` VALUES (80, 22, 'feign.compression.request.min-request-size', '2048', '', 6, b'0', 'apollo', '2019-09-20 11:03:23', 'apollo', '2019-09-20 11:03:23');
INSERT INTO `Item` VALUES (81, 22, 'feign.compression.response.enabled', 'true', '', 7, b'0', 'apollo', '2019-09-20 11:03:23', 'apollo', '2019-09-20 11:03:23');
INSERT INTO `Item` VALUES (82, 23, 'spring.redis.host', 'localhost', '', 1, b'0', 'apollo', '2019-09-20 11:04:53', 'apollo', '2019-09-20 11:04:53');
INSERT INTO `Item` VALUES (83, 23, 'spring.redis.port', '6379', '', 2, b'0', 'apollo', '2019-09-20 11:04:53', 'apollo', '2019-09-20 11:04:53');
INSERT INTO `Item` VALUES (84, 23, 'spring.redis.password', 'foobared123', '', 3, b'0', 'apollo', '2019-09-20 11:04:53', 'apollo', '2019-09-20 11:04:53');
INSERT INTO `Item` VALUES (85, 23, 'spring.redis.timeout', '10000', '', 4, b'0', 'apollo', '2019-09-20 11:04:53', 'apollo', '2019-09-20 11:04:53');
INSERT INTO `Item` VALUES (86, 23, 'spring.redis.lettuce.pool.max-active', '8', '', 5, b'0', 'apollo', '2019-09-20 11:04:53', 'apollo', '2019-09-20 11:04:53');
INSERT INTO `Item` VALUES (87, 23, 'spring.redis.lettuce.pool.max-wait', '10000', '', 6, b'0', 'apollo', '2019-09-20 11:04:53', 'apollo', '2019-09-20 11:04:53');
INSERT INTO `Item` VALUES (88, 23, 'spring.redis.lettuce.pool.max-idle', '8', '', 7, b'0', 'apollo', '2019-09-20 11:04:53', 'apollo', '2019-09-20 11:04:53');
INSERT INTO `Item` VALUES (89, 23, 'spring.redis.lettuce.pool.min-idle', '0', '', 8, b'0', 'apollo', '2019-09-20 11:04:53', 'apollo', '2019-09-20 11:04:53');
INSERT INTO `Item` VALUES (90, 23, 'spring.redis.shutdown-timeout', '100', '', 9, b'0', 'apollo', '2019-09-20 11:04:53', 'apollo', '2019-09-20 11:04:53');
INSERT INTO `Item` VALUES (91, 34, 'server.servlet.context-path', '/uaa', '', 1, b'0', 'apollo', '2019-09-20 11:12:41', 'apollo', '2019-09-20 11:12:41');
INSERT INTO `Item` VALUES (92, 35, 'spring.datasource.url', 'jdbc:mysql://127.0.0.1:3306/p2p_uaa?useUnicode=true', '', 1, b'0', 'apollo', '2019-09-20 11:13:00', 'apollo', '2019-09-20 11:13:00');
INSERT INTO `Item` VALUES (93, 31, 'spring.datasource.url', 'jdbc:mysql://127.0.0.1:3306/p2p_transaction?useUnicode=true', '', 1, b'0', 'apollo', '2019-09-20 11:13:39', 'apollo', '2019-09-20 11:13:39');
INSERT INTO `Item` VALUES (94, 39, 'server.servlet.context-path', '/consumer', '', 1, b'0', 'apollo', '2019-09-20 11:14:53', 'apollo', '2019-09-20 11:14:53');
INSERT INTO `Item` VALUES (95, 40, 'spring.datasource.url', 'jdbc:mysql://127.0.0.1:3306/p2p_consumer?useUnicode=true', '', 1, b'0', 'apollo', '2019-09-20 11:15:15', 'apollo', '2019-09-20 11:15:15');
COMMIT;

-- ----------------------------
-- Table structure for Namespace
-- ----------------------------
DROP TABLE IF EXISTS `Namespace`;
CREATE TABLE `Namespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_NamespaceName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COMMENT='命名空间';

-- ----------------------------
-- Records of Namespace
-- ----------------------------
BEGIN;
INSERT INTO `Namespace` VALUES (1, 'apollo-quickstart', 'default', 'application', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Namespace` VALUES (2, 'account-service', 'default', 'application', b'0', 'apollo', '2019-09-17 11:33:42', 'apollo', '2019-09-17 11:33:42');
INSERT INTO `Namespace` VALUES (3, 'account-service', 'default', 'spring-rocketmq', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `Namespace` VALUES (4, 'common-template', 'default', 'application', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Namespace` VALUES (5, 'common-template', 'default', 'micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `Namespace` VALUES (6, 'account-service', 'default', 'micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `Namespace` VALUES (7, 'account-service', 'SHAJQ', 'application', b'0', 'apollo', '2019-09-17 14:40:44', 'apollo', '2019-09-17 14:40:44');
INSERT INTO `Namespace` VALUES (8, 'account-service', 'SHAJQ', 'spring-rocketmq', b'0', 'apollo', '2019-09-17 14:40:44', 'apollo', '2019-09-17 14:40:44');
INSERT INTO `Namespace` VALUES (9, 'transaction-service', 'default', 'application', b'0', 'apollo', '2019-09-17 17:18:14', 'apollo', '2019-09-17 17:18:14');
INSERT INTO `Namespace` VALUES (10, 'transaction-service', 'default', 'micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Namespace` VALUES (11, 'account-service', '20190917185545-b163dd3f726d60f7', 'application', b'1', 'apollo', '2019-09-17 18:55:46', 'apollo', '2019-09-18 10:33:36');
INSERT INTO `Namespace` VALUES (12, 'apollo-quickstart', '20190918100936-9d21dd3f72a3d3d0', 'application', b'1', 'apollo', '2019-09-18 10:09:36', 'apollo', '2019-09-18 11:03:56');
INSERT INTO `Namespace` VALUES (13, 'account-service', '20190918103608-b163dd3f72a3d3d4', 'application', b'1', 'apollo', '2019-09-18 10:36:09', 'apollo', '2019-09-18 10:43:49');
INSERT INTO `Namespace` VALUES (14, 'account-service', '20190918105237-b163dd3f72a3d3d7', 'application', b'0', 'apollo', '2019-09-18 10:52:38', 'apollo', '2019-09-18 10:52:38');
INSERT INTO `Namespace` VALUES (15, 'apollo-quickstart', '20190918111030-9d21dd3f72a3d3db', 'application', b'1', 'apollo', '2019-09-18 11:10:31', 'apollo', '2019-09-18 11:12:14');
INSERT INTO `Namespace` VALUES (16, 'apollo-quickstart', '20190918112317-9d21dd3f72a3d3dd', 'application', b'1', 'apollo', '2019-09-18 11:23:17', 'apollo', '2019-09-18 11:30:22');
INSERT INTO `Namespace` VALUES (17, 'uaa-service', 'default', 'application', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Namespace` VALUES (18, 'consumer-service', 'default', 'application', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Namespace` VALUES (19, 'account-service', 'default', 'micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Namespace` VALUES (20, 'account-service', 'SHAJQ', 'micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Namespace` VALUES (21, 'common-template', 'default', 'micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Namespace` VALUES (22, 'common-template', 'default', 'micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Namespace` VALUES (23, 'common-template', 'default', 'micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Namespace` VALUES (24, 'account-service', 'default', 'micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:09:05', 'apollo', '2019-09-20 11:09:05');
INSERT INTO `Namespace` VALUES (25, 'account-service', 'SHAJQ', 'micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:09:05', 'apollo', '2019-09-20 11:09:05');
INSERT INTO `Namespace` VALUES (26, 'account-service', 'default', 'micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Namespace` VALUES (27, 'account-service', 'SHAJQ', 'micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Namespace` VALUES (28, 'account-service', 'default', 'micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Namespace` VALUES (29, 'account-service', 'SHAJQ', 'micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Namespace` VALUES (30, 'transaction-service', 'default', 'micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Namespace` VALUES (31, 'transaction-service', 'default', 'micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Namespace` VALUES (32, 'transaction-service', 'default', 'micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Namespace` VALUES (33, 'transaction-service', 'default', 'micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Namespace` VALUES (34, 'uaa-service', 'default', 'micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Namespace` VALUES (35, 'uaa-service', 'default', 'micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Namespace` VALUES (36, 'uaa-service', 'default', 'micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Namespace` VALUES (37, 'uaa-service', 'default', 'micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Namespace` VALUES (38, 'uaa-service', 'default', 'micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Namespace` VALUES (39, 'consumer-service', 'default', 'micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Namespace` VALUES (40, 'consumer-service', 'default', 'micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Namespace` VALUES (41, 'consumer-service', 'default', 'micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Namespace` VALUES (42, 'consumer-service', 'default', 'micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Namespace` VALUES (43, 'consumer-service', 'default', 'micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
COMMIT;

-- ----------------------------
-- Table structure for NamespaceLock
-- ----------------------------
DROP TABLE IF EXISTS `NamespaceLock`;
CREATE TABLE `NamespaceLock` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT 'default' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `IsDeleted` bit(1) DEFAULT b'0' COMMENT '软删除',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_NamespaceId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='namespace的编辑锁';

-- ----------------------------
-- Table structure for Release
-- ----------------------------
DROP TABLE IF EXISTS `Release`;
CREATE TABLE `Release` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `Name` varchar(64) NOT NULL DEFAULT 'default' COMMENT '发布名字',
  `Comment` varchar(256) DEFAULT NULL COMMENT '发布说明',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Configurations` longtext NOT NULL COMMENT '发布配置',
  `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否废弃',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_GroupName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ReleaseKey` (`ReleaseKey`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COMMENT='发布';

-- ----------------------------
-- Records of Release
-- ----------------------------
BEGIN;
INSERT INTO `Release` VALUES (1, '20190916163125-9d213f730d801cff', '20190916163124-release', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"true\"}', b'0', b'0', 'apollo', '2019-09-16 16:31:25', 'apollo', '2019-09-16 16:31:25');
INSERT INTO `Release` VALUES (2, '20190916165951-9d213f730d801d00', '20190916165950-release', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"false\"}', b'0', b'0', 'apollo', '2019-09-16 16:59:51', 'apollo', '2019-09-16 16:59:51');
INSERT INTO `Release` VALUES (3, '20190916170046-9d213f730d801d01', '20190916170044-release', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"true\"}', b'0', b'0', 'apollo', '2019-09-16 17:00:46', 'apollo', '2019-09-16 17:00:46');
INSERT INTO `Release` VALUES (4, '20190916171824-9d213f730d801d02', '20190916171822-release', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"false\"}', b'0', b'0', 'apollo', '2019-09-16 17:18:24', 'apollo', '2019-09-16 17:18:24');
INSERT INTO `Release` VALUES (5, '20190916171944-9d213f730d801d03', '20190916171942-release', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"true\"}', b'0', b'0', 'apollo', '2019-09-16 17:19:44', 'apollo', '2019-09-16 17:19:44');
INSERT INTO `Release` VALUES (6, '20190916172651-9d213f730d801d04', '20190916172650-release', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"false\"}', b'0', b'0', 'apollo', '2019-09-16 17:26:52', 'apollo', '2019-09-16 17:26:52');
INSERT INTO `Release` VALUES (7, '20190917113848-b163dd3f72ed5084', '20190917113847-release', '', 'account-service', 'default', 'application', '{\"sms.enable\":\"true\"}', b'0', b'0', 'apollo', '2019-09-17 11:38:49', 'apollo', '2019-09-17 11:38:49');
INSERT INTO `Release` VALUES (8, '20190917114123-b163dd3f72ed5085', '20190917114122-release', '', 'account-service', 'default', 'application', '{\"sms.enable\":\"false\"}', b'1', b'0', 'apollo', '2019-09-17 11:41:24', 'apollo', '2019-09-17 14:08:41');
INSERT INTO `Release` VALUES (9, '20190917114256-1b4bdd3f72ed5086', '20190917114254-release', '', 'account-service', 'default', 'spring-rocketmq', '{\"rocketmq.name-server\":\"127.0.0.1:9876\",\"rocketmq.producer.group\":\"PID_ACCOUNT\"}', b'0', b'0', 'apollo', '2019-09-17 11:42:56', 'apollo', '2019-09-17 11:42:56');
INSERT INTO `Release` VALUES (10, '20190917140924-b163dd3f72ed5087', '20190917140923-release', '', 'account-service', 'default', 'application', '{}', b'0', b'0', 'apollo', '2019-09-17 14:09:25', 'apollo', '2019-09-17 14:09:25');
INSERT INTO `Release` VALUES (11, '20190917141849-5351dd3f72ed5088', '20190917141847-release', '', 'common-template', 'default', 'micro_service.spring-boot-http', '{\"spring.http.encoding.charset\":\"UTF-8\",\"spring.http.encoding.enabled\":\"true\",\"server.use-forward-headers\":\"true\",\"server.servlet.context-path\":\"/\",\"spring.http.encoding.force\":\"true\",\"server.tomcat.protocol_header\":\"x-forwarded-proto\",\"server.tomcat.remote_ip_header\":\"x-forwarded-for\"}', b'0', b'0', 'apollo', '2019-09-17 14:18:50', 'apollo', '2019-09-17 14:18:50');
INSERT INTO `Release` VALUES (12, '20190917142218-920add3f72ed5089', '20190917142217-release', '', 'account-service', 'default', 'micro_service.spring-boot-http', '{\"server.servlet.context-path\":\"/account-service\"}', b'0', b'0', 'apollo', '2019-09-17 14:22:19', 'apollo', '2019-09-17 14:22:19');
INSERT INTO `Release` VALUES (13, '20190917144224-acf9dd3f72ed508a', '20190917144222-release', '', 'account-service', 'SHAJQ', 'spring-rocketmq', '{\"rocketmq.name-server\":\"127.0.0.1:9876\",\"rocketmq.producer.group\":\"PID_ACCOUNT\"}', b'0', b'0', 'apollo', '2019-09-17 14:42:25', 'apollo', '2019-09-17 14:42:25');
INSERT INTO `Release` VALUES (14, '20190917172046-717bdd3f726d60f4', '20190917172045-release', '', 'transaction-service', 'default', 'micro_service.spring-boot-http', '{\"server.servlet.context-path\":\"/transaction\"}', b'0', b'0', 'apollo', '2019-09-17 17:20:47', 'apollo', '2019-09-17 17:20:47');
INSERT INTO `Release` VALUES (15, '20190917175158-b163dd3f726d60f5', '20190917175157-release', '', 'account-service', 'default', 'application', '{\"sms.enable\":\"true\"}', b'0', b'0', 'apollo', '2019-09-17 17:51:59', 'apollo', '2019-09-17 17:51:59');
INSERT INTO `Release` VALUES (16, '20190917185216-b163dd3f726d60f6', '20190917185214-release', '', 'account-service', 'default', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"2000\"}', b'0', b'0', 'apollo', '2019-09-17 18:52:16', 'apollo', '2019-09-17 18:52:16');
INSERT INTO `Release` VALUES (17, '20190918091127-cf81dd3f72a3d3ca', '20190918091110-gray', '', 'account-service', '20190917185545-b163dd3f726d60f7', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 09:11:28', 'apollo', '2019-09-18 09:11:28');
INSERT INTO `Release` VALUES (18, '20190918092038-cf81dd3f72a3d3cb', '20190918092036-gray', '', 'account-service', '20190917185545-b163dd3f726d60f7', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 09:20:38', 'apollo', '2019-09-18 09:20:38');
INSERT INTO `Release` VALUES (19, '20190918092041-cf81dd3f72a3d3cc', '20190918092040-gray', '', 'account-service', '20190917185545-b163dd3f726d60f7', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 09:20:41', 'apollo', '2019-09-18 09:20:41');
INSERT INTO `Release` VALUES (20, '20190918092202-cf81dd3f72a3d3cd', '20190918092200-gray', '', 'account-service', '20190917185545-b163dd3f726d60f7', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 09:22:03', 'apollo', '2019-09-18 09:22:03');
INSERT INTO `Release` VALUES (21, '20190918094517-cf81dd3f72a3d3ce', '20190918094516-gray', '', 'account-service', '20190917185545-b163dd3f726d60f7', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 09:45:17', 'apollo', '2019-09-18 09:45:17');
INSERT INTO `Release` VALUES (22, '20190918094738-cf81dd3f72a3d3cf', '20190918094737-gray', '', 'account-service', '20190917185545-b163dd3f726d60f7', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"4000\"}', b'0', b'0', 'apollo', '2019-09-18 09:47:39', 'apollo', '2019-09-18 09:47:39');
INSERT INTO `Release` VALUES (23, '20190918100950-6ef1dd3f72a3d3d1', '20190918100948-gray', '', 'apollo-quickstart', '20190918100936-9d21dd3f72a3d3d0', 'application', '{\"sms.enable\":\"false\"}', b'0', b'0', 'apollo', '2019-09-18 10:09:51', 'apollo', '2019-09-18 10:09:51');
INSERT INTO `Release` VALUES (24, '20190918101307-6ef1dd3f72a3d3d2', '20190918101306-gray', '', 'apollo-quickstart', '20190918100936-9d21dd3f72a3d3d0', 'application', '{\"sms.enable\":\"false\"}', b'0', b'0', 'apollo', '2019-09-18 10:13:08', 'apollo', '2019-09-18 10:13:08');
INSERT INTO `Release` VALUES (25, '20190918101327-6ef1dd3f72a3d3d3', '20190918101326-gray', '', 'apollo-quickstart', '20190918100936-9d21dd3f72a3d3d0', 'application', '{\"sms.enable\":\"true\"}', b'0', b'0', 'apollo', '2019-09-18 10:13:27', 'apollo', '2019-09-18 10:13:27');
INSERT INTO `Release` VALUES (26, '20190918103636-aa6cdd3f72a3d3d5', '20190918103634-gray', '', 'account-service', '20190918103608-b163dd3f72a3d3d4', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 10:36:36', 'apollo', '2019-09-18 10:36:36');
INSERT INTO `Release` VALUES (27, '20190918104205-b163dd3f72a3d3d6', '20190918104203-release', '', 'account-service', 'default', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"2000\"}', b'0', b'0', 'apollo', '2019-09-18 10:42:05', 'apollo', '2019-09-18 10:42:05');
INSERT INTO `Release` VALUES (28, '20190918105308-6b5fdd3f72a3d3d8', '20190918105307-gray', '', 'account-service', '20190918105237-b163dd3f72a3d3d7', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 10:53:09', 'apollo', '2019-09-18 10:53:09');
INSERT INTO `Release` VALUES (29, '20190918110145-6b5fdd3f72a3d3d9', '20190918110144-gray', '', 'account-service', '20190918105237-b163dd3f72a3d3d7', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 11:01:46', 'apollo', '2019-09-18 11:01:46');
INSERT INTO `Release` VALUES (30, '20190918111022-9d21dd3f72a3d3da', '20190918111021-release', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"false\",\"timeout\":\"2000\"}', b'0', b'0', 'apollo', '2019-09-18 11:10:23', 'apollo', '2019-09-18 11:10:23');
INSERT INTO `Release` VALUES (31, '20190918111054-dcd0dd3f72a3d3dc', '20190918111052-gray', '', 'apollo-quickstart', '20190918111030-9d21dd3f72a3d3db', 'application', '{\"sms.enable\":\"false\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 11:10:54', 'apollo', '2019-09-18 11:10:54');
INSERT INTO `Release` VALUES (32, '20190918112638-77b9dd3f72a3d3de', '20190918112637-gray', '', 'apollo-quickstart', '20190918112317-9d21dd3f72a3d3dd', 'application', '{\"sms.enable\":\"false\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 11:26:39', 'apollo', '2019-09-18 11:26:39');
INSERT INTO `Release` VALUES (33, '20190918113022-9d21dd3f72a3d3df', '20190918113011-gray-release-merge-to-master', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"false\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 11:30:22', 'apollo', '2019-09-18 11:30:22');
INSERT INTO `Release` VALUES (34, '20190919144730-9d21dd3f727284c4', '20190919144729-release', '', 'apollo-quickstart', 'default', 'application', '{}', b'0', b'0', 'apollo', '2019-09-19 14:47:31', 'apollo', '2019-09-19 14:47:31');
INSERT INTO `Release` VALUES (35, '20190919145403-9d21dd3f727284c5', '20190919145402-release', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"false\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-19 14:54:04', 'apollo', '2019-09-19 14:54:04');
INSERT INTO `Release` VALUES (36, '20190919145906-9d21dd3f727284c6', '20190919145904-release', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-19 14:59:06', 'apollo', '2019-09-19 14:59:06');
INSERT INTO `Release` VALUES (37, '20190919150253-9d21dd3f727284c7', '20190919150252-release', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"false\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-19 15:02:53', 'apollo', '2019-09-19 15:02:53');
INSERT INTO `Release` VALUES (38, '20190919150650-9d21dd3f727284c8', '20190919150648-release', '', 'apollo-quickstart', 'default', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-19 15:06:50', 'apollo', '2019-09-19 15:06:50');
INSERT INTO `Release` VALUES (39, '20190919184630-4186dd3f727284c9', '20190919184627-release', '', 'account-service', 'default', 'micro_service.spring-boot-druid', '{\"spring.datasource.druid.max-active\":\"20\",\"spring.datasource.druid.min-idle\":\"5\",\"spring.datasource.druid.web-stat-filter.principal-cookie-name\":\"admin\",\"spring.datasource.druid.min-evictable-idle-time-millis\":\"300000\",\"spring.datasource.driver-class-name\":\"com.mysql.cj.jdbc.Driver\",\"spring.datasource.druid.test-on-return\":\"false\",\"spring.datasource.druid.time-between-eviction-runs-millis\":\"60000\",\"spring.datasource.druid.web-stat-filter.exclusions\":\"*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*\",\"spring.datasource.druid.filters\":\"config,stat,wall,log4j2\",\"spring.datasource.druid.filter.stat.slow-sql-millis\":\"1\",\"spring.datasource.druid.test-on-borrow\":\"false\",\"spring.datasource.druid.stat-view-servlet.login-password\":\"admin\",\"spring.datasource.druid.validation-query\":\"SELECT 1 FROM DUAL\",\"spring.datasource.druid.stat-view-servlet.url-pattern\":\"/druid/*\",\"spring.datasource.druid.web-stat-filter.session-stat-enable\":\"false\",\"spring.datasource.druid.test-while-idle\":\"true\",\"spring.datasource.druid.max-pool-prepared-statement-per-connection-size\":\"20\",\"spring.datasource.druid.web-stat-filter.enabled\":\"true\",\"spring.datasource.druid.web-stat-filter.session-stat-max-count\":\"1000\",\"spring.datasource.druid.stat-view-servlet.reset-enable\":\"false\",\"spring.datasource.druid.filter.stat.log-slow-sql\":\"true\",\"spring.datasource.druid.web-stat-filter.url-pattern\":\"/*\",\"spring.datasource.druid.stat-view-servlet.allow\":\"127.0.0.1,192.168.163.1\",\"spring.datasource.druid.web-stat-filter.principal-session-name\":\"admin\",\"spring.datasource.druid.web-stat-filter.profile-enable\":\"true\",\"spring.datasource.password\":\"itcast0430\",\"spring.datasource.username\":\"root\",\"spring.datasource.druid.stat-view-servlet.deny\":\"192.168.1.73\",\"spring.datasource.druid.stat-view-servlet.login-username\":\"admin\",\"spring.datasource.druid.stat-view-servlet.enabled\":\"true\",\"spring.datasource.url\":\"jdbc\\\\:mysql\\\\://127.0.0.1\\\\:3306/p2p_account?useUnicode\\\\\\u003dtrue\",\"spring.datasource.druid.initial-size\":\"5\",\"spring.datasource.druid.pool-prepared-statements\":\"true\",\"spring.datasource.druid.aop-patterns\":\"cn.itcast.wanxinp2p.*.service.*\",\"spring.datasource.type\":\"com.alibaba.druid.pool.DruidDataSource\",\"spring.datasource.druid.max-wait\":\"60000\"}', b'0', b'0', 'apollo', '2019-09-19 18:46:31', 'apollo', '2019-09-19 18:46:31');
INSERT INTO `Release` VALUES (40, '20190920100558-4186dd3f726c2acb', '20190920100557-release', '', 'account-service', 'default', 'micro_service.spring-boot-druid', '{\"spring.datasource.druid.max-active\":\"20\",\"spring.datasource.druid.min-idle\":\"5\",\"spring.datasource.druid.web-stat-filter.principal-cookie-name\":\"admin\",\"spring.datasource.druid.min-evictable-idle-time-millis\":\"300000\",\"spring.datasource.driver-class-name\":\"com.mysql.cj.jdbc.Driver\",\"spring.datasource.druid.test-on-return\":\"false\",\"spring.datasource.druid.time-between-eviction-runs-millis\":\"60000\",\"spring.datasource.druid.web-stat-filter.exclusions\":\"*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*\",\"spring.datasource.druid.filters\":\"config,stat,wall,log4j2\",\"spring.datasource.druid.filter.stat.slow-sql-millis\":\"1\",\"spring.datasource.druid.test-on-borrow\":\"false\",\"spring.datasource.druid.stat-view-servlet.login-password\":\"admin\",\"spring.datasource.druid.validation-query\":\"SELECT 1 FROM DUAL\",\"spring.datasource.druid.stat-view-servlet.url-pattern\":\"/druid/*\",\"spring.datasource.druid.web-stat-filter.session-stat-enable\":\"false\",\"spring.datasource.druid.test-while-idle\":\"true\",\"spring.datasource.druid.max-pool-prepared-statement-per-connection-size\":\"20\",\"spring.datasource.druid.web-stat-filter.enabled\":\"true\",\"spring.datasource.druid.web-stat-filter.session-stat-max-count\":\"1000\",\"spring.datasource.druid.stat-view-servlet.reset-enable\":\"false\",\"spring.datasource.druid.filter.stat.log-slow-sql\":\"true\",\"spring.datasource.druid.web-stat-filter.url-pattern\":\"/*\",\"spring.datasource.druid.stat-view-servlet.allow\":\"127.0.0.1,192.168.163.1\",\"spring.datasource.druid.web-stat-filter.principal-session-name\":\"admin\",\"spring.datasource.druid.web-stat-filter.profile-enable\":\"true\",\"spring.datasource.password\":\"itcast0430\",\"spring.datasource.username\":\"root\",\"spring.datasource.druid.stat-view-servlet.deny\":\"192.168.1.73\",\"spring.datasource.druid.stat-view-servlet.login-username\":\"admin\",\"spring.datasource.druid.stat-view-servlet.enabled\":\"true\",\"spring.datasource.url\":\"jdbc:mysql://127.0.0.1:3306/p2p_account?useUnicode\\u003dtrue\",\"spring.datasource.druid.initial-size\":\"5\",\"spring.datasource.druid.pool-prepared-statements\":\"true\",\"spring.datasource.druid.aop-patterns\":\"cn.itcast.wanxinp2p.*.service.*\",\"spring.datasource.type\":\"com.alibaba.druid.pool.DruidDataSource\",\"spring.datasource.druid.max-wait\":\"60000\"}', b'0', b'0', 'apollo', '2019-09-20 10:05:59', 'apollo', '2019-09-20 10:05:59');
INSERT INTO `Release` VALUES (41, '20190920110240-61dfdd3f726c2acc', '20190920110238-release', '', 'common-template', 'default', 'micro_service.spring-eureka', '{\"management.endpoints.web.exposure.include\":\"refresh,health,info,env\",\"eureka.instance.instance-id\":\"${spring.application.name}:${spring.cloud.client.ip-address}:${spring.application.instance_id:${server.port}}\",\"eureka.instance.preferIpAddress\":\"true\",\"eureka.client.registry-fetch-interval-seconds\":\"5\",\"eureka.instance.lease-renewal-interval-in-seconds\":\"5\",\"management.security.enabled\":\"false\",\"endpoints.health.sensitive\":\"false\",\"eureka.client.serviceUrl.defaultZone\":\"http://localhost:53000/eureka/\",\"eureka.instance.lease-expiration-duration-in-seconds\":\"10\"}', b'0', b'0', 'apollo', '2019-09-20 11:02:40', 'apollo', '2019-09-20 11:02:40');
INSERT INTO `Release` VALUES (42, '20190920110325-e427dd3f726c2acd', '20190920110324-release', '', 'common-template', 'default', 'micro_service.spring-cloud-feign', '{\"feign.hystrix.enabled\":\"true\",\"feign.compression.request.mime-types[1]\":\"application/xml\",\"feign.compression.request.mime-types[2]\":\"application/json\",\"feign.compression.request.enabled\":\"true\",\"feign.compression.request.min-request-size\":\"2048\",\"feign.compression.request.mime-types[0]\":\"text/xml\",\"feign.compression.response.enabled\":\"true\"}', b'0', b'0', 'apollo', '2019-09-20 11:03:26', 'apollo', '2019-09-20 11:03:26');
INSERT INTO `Release` VALUES (43, '20190920110454-e427dd3f726c2ace', '20190920110453-release', '', 'common-template', 'default', 'micro_service.spring-cloud-feign', '{\"feign.hystrix.enabled\":\"true\",\"feign.compression.request.mime-types[1]\":\"application/xml\",\"feign.compression.request.mime-types[2]\":\"application/json\",\"feign.compression.request.enabled\":\"true\",\"feign.compression.request.min-request-size\":\"2048\",\"feign.compression.request.mime-types[0]\":\"text/xml\",\"feign.compression.response.enabled\":\"true\"}', b'0', b'0', 'apollo', '2019-09-20 11:04:55', 'apollo', '2019-09-20 11:04:55');
INSERT INTO `Release` VALUES (44, '20190920110933-61ffdd3f726c2acf', '20190920110932-release', '', 'account-service', 'default', 'micro_service.spring-boot-redis', '{}', b'0', b'0', 'apollo', '2019-09-20 11:09:34', 'apollo', '2019-09-20 11:09:34');
INSERT INTO `Release` VALUES (45, '20190920110946-2346dd3f726c2ad0', '20190920110944-release', '', 'common-template', 'default', 'micro_service.spring-boot-redis', '{\"spring.redis.password\":\"foobared123\",\"spring.redis.lettuce.pool.max-active\":\"8\",\"spring.redis.lettuce.pool.max-idle\":\"8\",\"spring.redis.lettuce.pool.min-idle\":\"0\",\"spring.redis.host\":\"localhost\",\"spring.redis.port\":\"6379\",\"spring.redis.timeout\":\"10000\",\"spring.redis.lettuce.pool.max-wait\":\"10000\",\"spring.redis.shutdown-timeout\":\"100\"}', b'0', b'0', 'apollo', '2019-09-20 11:09:46', 'apollo', '2019-09-20 11:09:46');
INSERT INTO `Release` VALUES (46, '20190920111243-7932dd3f726c2ad1', '20190920111242-release', '', 'uaa-service', 'default', 'micro_service.spring-boot-http', '{\"server.servlet.context-path\":\"/uaa\"}', b'0', b'0', 'apollo', '2019-09-20 11:12:44', 'apollo', '2019-09-20 11:12:44');
INSERT INTO `Release` VALUES (47, '20190920111302-28aedd3f726c2ad2', '20190920111301-release', '', 'uaa-service', 'default', 'micro_service.spring-boot-druid', '{\"spring.datasource.url\":\"jdbc:mysql://127.0.0.1:3306/p2p_uaa?useUnicode\\u003dtrue\"}', b'0', b'0', 'apollo', '2019-09-20 11:13:03', 'apollo', '2019-09-20 11:13:03');
INSERT INTO `Release` VALUES (48, '20190920111341-20f7dd3f726c2ad3', '20190920111340-release', '', 'transaction-service', 'default', 'micro_service.spring-boot-druid', '{\"spring.datasource.url\":\"jdbc:mysql://127.0.0.1:3306/p2p_transaction?useUnicode\\u003dtrue\"}', b'0', b'0', 'apollo', '2019-09-20 11:13:42', 'apollo', '2019-09-20 11:13:42');
INSERT INTO `Release` VALUES (49, '20190920111455-a493dd3f726c2ad4', '20190920111454-release', '', 'consumer-service', 'default', 'micro_service.spring-boot-http', '{\"server.servlet.context-path\":\"/consumer\"}', b'0', b'0', 'apollo', '2019-09-20 11:14:56', 'apollo', '2019-09-20 11:14:56');
INSERT INTO `Release` VALUES (50, '20190920111518-540fdd3f726c2ad5', '20190920111517-release', '', 'consumer-service', 'default', 'micro_service.spring-boot-druid', '{\"spring.datasource.url\":\"jdbc:mysql://127.0.0.1:3306/p2p_consumer?useUnicode\\u003dtrue\"}', b'0', b'0', 'apollo', '2019-09-20 11:15:19', 'apollo', '2019-09-20 11:15:19');
COMMIT;

-- ----------------------------
-- Table structure for ReleaseHistory
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseHistory`;
CREATE TABLE `ReleaseHistory` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT '发布分支名',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联的Release Id',
  `PreviousReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '前一次发布的ReleaseId',
  `Operation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度',
  `OperationContext` longtext NOT NULL COMMENT '发布上下文信息',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`,`BranchName`),
  KEY `IX_ReleaseId` (`ReleaseId`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COMMENT='发布历史';

-- ----------------------------
-- Records of ReleaseHistory
-- ----------------------------
BEGIN;
INSERT INTO `ReleaseHistory` VALUES (1, 'apollo-quickstart', 'default', 'application', 'default', 1, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-16 16:31:25', 'apollo', '2019-09-16 16:31:25');
INSERT INTO `ReleaseHistory` VALUES (2, 'apollo-quickstart', 'default', 'application', 'default', 2, 1, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-16 16:59:51', 'apollo', '2019-09-16 16:59:51');
INSERT INTO `ReleaseHistory` VALUES (3, 'apollo-quickstart', 'default', 'application', 'default', 3, 2, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-16 17:00:46', 'apollo', '2019-09-16 17:00:46');
INSERT INTO `ReleaseHistory` VALUES (4, 'apollo-quickstart', 'default', 'application', 'default', 4, 3, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-16 17:18:24', 'apollo', '2019-09-16 17:18:24');
INSERT INTO `ReleaseHistory` VALUES (5, 'apollo-quickstart', 'default', 'application', 'default', 5, 4, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-16 17:19:44', 'apollo', '2019-09-16 17:19:44');
INSERT INTO `ReleaseHistory` VALUES (6, 'apollo-quickstart', 'default', 'application', 'default', 6, 5, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-16 17:26:52', 'apollo', '2019-09-16 17:26:52');
INSERT INTO `ReleaseHistory` VALUES (7, 'account-service', 'default', 'application', 'default', 7, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-17 11:38:49', 'apollo', '2019-09-17 11:38:49');
INSERT INTO `ReleaseHistory` VALUES (8, 'account-service', 'default', 'application', 'default', 8, 7, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-17 11:41:24', 'apollo', '2019-09-17 11:41:24');
INSERT INTO `ReleaseHistory` VALUES (9, 'account-service', 'default', 'spring-rocketmq', 'default', 9, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-17 11:42:56', 'apollo', '2019-09-17 11:42:56');
INSERT INTO `ReleaseHistory` VALUES (10, 'account-service', 'default', 'application', 'default', 7, 8, 1, '{}', b'0', 'apollo', '2019-09-17 14:08:41', 'apollo', '2019-09-17 14:08:41');
INSERT INTO `ReleaseHistory` VALUES (11, 'account-service', 'default', 'application', 'default', 10, 7, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-17 14:09:25', 'apollo', '2019-09-17 14:09:25');
INSERT INTO `ReleaseHistory` VALUES (12, 'common-template', 'default', 'micro_service.spring-boot-http', 'default', 11, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-17 14:18:50', 'apollo', '2019-09-17 14:18:50');
INSERT INTO `ReleaseHistory` VALUES (13, 'account-service', 'default', 'micro_service.spring-boot-http', 'default', 12, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-17 14:22:19', 'apollo', '2019-09-17 14:22:19');
INSERT INTO `ReleaseHistory` VALUES (14, 'account-service', 'SHAJQ', 'spring-rocketmq', 'SHAJQ', 13, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-17 14:42:25', 'apollo', '2019-09-17 14:42:25');
INSERT INTO `ReleaseHistory` VALUES (15, 'transaction-service', 'default', 'micro_service.spring-boot-http', 'default', 14, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-17 17:20:47', 'apollo', '2019-09-17 17:20:47');
INSERT INTO `ReleaseHistory` VALUES (16, 'account-service', 'default', 'application', 'default', 15, 10, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-17 17:51:59', 'apollo', '2019-09-17 17:51:59');
INSERT INTO `ReleaseHistory` VALUES (17, 'account-service', 'default', 'application', 'default', 16, 15, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-17 18:52:16', 'apollo', '2019-09-17 18:52:16');
INSERT INTO `ReleaseHistory` VALUES (18, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', 0, 0, 3, '{\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]}', b'0', 'apollo', '2019-09-17 19:03:55', 'apollo', '2019-09-17 19:03:55');
INSERT INTO `ReleaseHistory` VALUES (19, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', 17, 0, 2, '{\"baseReleaseId\":16,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 09:11:28', 'apollo', '2019-09-18 09:11:28');
INSERT INTO `ReleaseHistory` VALUES (20, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', 17, 17, 3, '{\"oldRules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]}', b'0', 'apollo', '2019-09-18 09:17:21', 'apollo', '2019-09-18 09:17:21');
INSERT INTO `ReleaseHistory` VALUES (21, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', 17, 17, 3, '{\"oldRules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"rules\":[]}', b'0', 'apollo', '2019-09-18 09:20:22', 'apollo', '2019-09-18 09:20:22');
INSERT INTO `ReleaseHistory` VALUES (22, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', 17, 17, 3, '{\"oldRules\":[],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]}', b'0', 'apollo', '2019-09-18 09:20:33', 'apollo', '2019-09-18 09:20:33');
INSERT INTO `ReleaseHistory` VALUES (23, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', 18, 17, 2, '{\"baseReleaseId\":16,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 09:20:38', 'apollo', '2019-09-18 09:20:38');
INSERT INTO `ReleaseHistory` VALUES (24, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', 19, 18, 2, '{\"baseReleaseId\":16,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 09:20:41', 'apollo', '2019-09-18 09:20:41');
INSERT INTO `ReleaseHistory` VALUES (25, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', 20, 19, 2, '{\"baseReleaseId\":16,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 09:22:03', 'apollo', '2019-09-18 09:22:03');
INSERT INTO `ReleaseHistory` VALUES (26, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', 21, 20, 2, '{\"baseReleaseId\":16,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 09:45:17', 'apollo', '2019-09-18 09:45:17');
INSERT INTO `ReleaseHistory` VALUES (27, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', 22, 21, 2, '{\"baseReleaseId\":16,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 09:47:39', 'apollo', '2019-09-18 09:47:39');
INSERT INTO `ReleaseHistory` VALUES (28, 'apollo-quickstart', 'default', 'application', '20190918100936-9d21dd3f72a3d3d0', 23, 0, 2, '{\"baseReleaseId\":6,\"branchReleaseKeys\":[\"sms.enable\"],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 10:09:51', 'apollo', '2019-09-18 10:09:51');
INSERT INTO `ReleaseHistory` VALUES (29, 'apollo-quickstart', 'default', 'application', '20190918100936-9d21dd3f72a3d3d0', 23, 23, 3, '{\"rules\":[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}]}', b'0', 'apollo', '2019-09-18 10:13:04', 'apollo', '2019-09-18 10:13:04');
INSERT INTO `ReleaseHistory` VALUES (30, 'apollo-quickstart', 'default', 'application', '20190918100936-9d21dd3f72a3d3d0', 24, 23, 2, '{\"baseReleaseId\":6,\"branchReleaseKeys\":[\"sms.enable\"],\"rules\":[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 10:13:08', 'apollo', '2019-09-18 10:13:08');
INSERT INTO `ReleaseHistory` VALUES (31, 'apollo-quickstart', 'default', 'application', '20190918100936-9d21dd3f72a3d3d0', 25, 24, 2, '{\"baseReleaseId\":6,\"branchReleaseKeys\":[\"sms.enable\"],\"rules\":[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 10:13:27', 'apollo', '2019-09-18 10:13:27');
INSERT INTO `ReleaseHistory` VALUES (32, 'account-service', 'default', 'application', '20190917185545-b163dd3f726d60f7', 22, 22, 7, '{}', b'0', 'apollo', '2019-09-18 10:33:36', 'apollo', '2019-09-18 10:33:36');
INSERT INTO `ReleaseHistory` VALUES (33, 'account-service', 'default', 'application', '20190918103608-b163dd3f72a3d3d4', 0, 0, 3, '{\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]}', b'0', 'apollo', '2019-09-18 10:36:30', 'apollo', '2019-09-18 10:36:30');
INSERT INTO `ReleaseHistory` VALUES (34, 'account-service', 'default', 'application', '20190918103608-b163dd3f72a3d3d4', 26, 0, 2, '{\"baseReleaseId\":16,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 10:36:36', 'apollo', '2019-09-18 10:36:36');
INSERT INTO `ReleaseHistory` VALUES (35, 'account-service', 'default', 'application', 'default', 27, 16, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 10:42:05', 'apollo', '2019-09-18 10:42:05');
INSERT INTO `ReleaseHistory` VALUES (36, 'account-service', 'default', 'application', '20190918103608-b163dd3f72a3d3d4', 26, 26, 7, '{}', b'0', 'apollo', '2019-09-18 10:43:49', 'apollo', '2019-09-18 10:43:49');
INSERT INTO `ReleaseHistory` VALUES (37, 'account-service', 'default', 'application', '20190918105237-b163dd3f72a3d3d7', 0, 0, 3, '{\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]}', b'0', 'apollo', '2019-09-18 10:53:05', 'apollo', '2019-09-18 10:53:05');
INSERT INTO `ReleaseHistory` VALUES (38, 'account-service', 'default', 'application', '20190918105237-b163dd3f72a3d3d7', 28, 0, 2, '{\"baseReleaseId\":27,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 10:53:09', 'apollo', '2019-09-18 10:53:09');
INSERT INTO `ReleaseHistory` VALUES (39, 'account-service', 'default', 'application', '20190918105237-b163dd3f72a3d3d7', 28, 28, 3, '{\"oldRules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.170\"]}]}', b'0', 'apollo', '2019-09-18 11:01:42', 'apollo', '2019-09-18 11:01:42');
INSERT INTO `ReleaseHistory` VALUES (40, 'account-service', 'default', 'application', '20190918105237-b163dd3f72a3d3d7', 29, 28, 2, '{\"baseReleaseId\":27,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.170\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 11:01:46', 'apollo', '2019-09-18 11:01:46');
INSERT INTO `ReleaseHistory` VALUES (41, 'apollo-quickstart', 'default', 'application', '20190918100936-9d21dd3f72a3d3d0', 25, 25, 7, '{}', b'0', 'apollo', '2019-09-18 11:03:56', 'apollo', '2019-09-18 11:03:56');
INSERT INTO `ReleaseHistory` VALUES (42, 'apollo-quickstart', 'default', 'application', 'default', 30, 6, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 11:10:23', 'apollo', '2019-09-18 11:10:23');
INSERT INTO `ReleaseHistory` VALUES (43, 'apollo-quickstart', 'default', 'application', '20190918111030-9d21dd3f72a3d3db', 0, 0, 3, '{\"rules\":[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}]}', b'0', 'apollo', '2019-09-18 11:10:50', 'apollo', '2019-09-18 11:10:50');
INSERT INTO `ReleaseHistory` VALUES (44, 'apollo-quickstart', 'default', 'application', '20190918111030-9d21dd3f72a3d3db', 31, 0, 2, '{\"baseReleaseId\":30,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 11:10:54', 'apollo', '2019-09-18 11:10:54');
INSERT INTO `ReleaseHistory` VALUES (45, 'apollo-quickstart', 'default', 'application', '20190918111030-9d21dd3f72a3d3db', 31, 31, 7, '{}', b'0', 'apollo', '2019-09-18 11:12:14', 'apollo', '2019-09-18 11:12:14');
INSERT INTO `ReleaseHistory` VALUES (46, 'apollo-quickstart', 'default', 'application', '20190918112317-9d21dd3f72a3d3dd', 0, 0, 3, '{\"rules\":[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}]}', b'0', 'apollo', '2019-09-18 11:23:34', 'apollo', '2019-09-18 11:23:34');
INSERT INTO `ReleaseHistory` VALUES (47, 'apollo-quickstart', 'default', 'application', '20190918112317-9d21dd3f72a3d3dd', 32, 0, 2, '{\"baseReleaseId\":30,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"apollo-quickstart\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 11:26:39', 'apollo', '2019-09-18 11:26:39');
INSERT INTO `ReleaseHistory` VALUES (48, 'apollo-quickstart', 'default', 'application', 'default', 33, 30, 4, '{\"sourceBranch\":\"20190918112317-9d21dd3f72a3d3dd\",\"baseReleaseId\":32,\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 11:30:22', 'apollo', '2019-09-18 11:30:22');
INSERT INTO `ReleaseHistory` VALUES (49, 'apollo-quickstart', 'default', 'application', '20190918112317-9d21dd3f72a3d3dd', 32, 32, 8, '{}', b'0', 'apollo', '2019-09-18 11:30:22', 'apollo', '2019-09-18 11:30:22');
INSERT INTO `ReleaseHistory` VALUES (50, 'apollo-quickstart', 'default', 'application', 'default', 34, 33, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-19 14:47:31', 'apollo', '2019-09-19 14:47:31');
INSERT INTO `ReleaseHistory` VALUES (51, 'apollo-quickstart', 'default', 'application', 'default', 35, 34, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-19 14:54:04', 'apollo', '2019-09-19 14:54:04');
INSERT INTO `ReleaseHistory` VALUES (52, 'apollo-quickstart', 'default', 'application', 'default', 36, 35, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-19 14:59:06', 'apollo', '2019-09-19 14:59:06');
INSERT INTO `ReleaseHistory` VALUES (53, 'apollo-quickstart', 'default', 'application', 'default', 37, 36, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-19 15:02:53', 'apollo', '2019-09-19 15:02:53');
INSERT INTO `ReleaseHistory` VALUES (54, 'apollo-quickstart', 'default', 'application', 'default', 38, 37, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-19 15:06:50', 'apollo', '2019-09-19 15:06:50');
INSERT INTO `ReleaseHistory` VALUES (55, 'account-service', 'default', 'micro_service.spring-boot-druid', 'default', 39, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-19 18:46:31', 'apollo', '2019-09-19 18:46:31');
INSERT INTO `ReleaseHistory` VALUES (56, 'account-service', 'default', 'micro_service.spring-boot-druid', 'default', 40, 39, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-20 10:05:59', 'apollo', '2019-09-20 10:05:59');
INSERT INTO `ReleaseHistory` VALUES (57, 'common-template', 'default', 'micro_service.spring-eureka', 'default', 41, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-20 11:02:40', 'apollo', '2019-09-20 11:02:40');
INSERT INTO `ReleaseHistory` VALUES (58, 'common-template', 'default', 'micro_service.spring-cloud-feign', 'default', 42, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-20 11:03:26', 'apollo', '2019-09-20 11:03:26');
INSERT INTO `ReleaseHistory` VALUES (59, 'common-template', 'default', 'micro_service.spring-cloud-feign', 'default', 43, 42, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-20 11:04:55', 'apollo', '2019-09-20 11:04:55');
INSERT INTO `ReleaseHistory` VALUES (60, 'account-service', 'default', 'micro_service.spring-boot-redis', 'default', 44, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-20 11:09:34', 'apollo', '2019-09-20 11:09:34');
INSERT INTO `ReleaseHistory` VALUES (61, 'common-template', 'default', 'micro_service.spring-boot-redis', 'default', 45, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-20 11:09:46', 'apollo', '2019-09-20 11:09:46');
INSERT INTO `ReleaseHistory` VALUES (62, 'uaa-service', 'default', 'micro_service.spring-boot-http', 'default', 46, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-20 11:12:44', 'apollo', '2019-09-20 11:12:44');
INSERT INTO `ReleaseHistory` VALUES (63, 'uaa-service', 'default', 'micro_service.spring-boot-druid', 'default', 47, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-20 11:13:03', 'apollo', '2019-09-20 11:13:03');
INSERT INTO `ReleaseHistory` VALUES (64, 'transaction-service', 'default', 'micro_service.spring-boot-druid', 'default', 48, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-20 11:13:42', 'apollo', '2019-09-20 11:13:42');
INSERT INTO `ReleaseHistory` VALUES (65, 'consumer-service', 'default', 'micro_service.spring-boot-http', 'default', 49, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-20 11:14:56', 'apollo', '2019-09-20 11:14:56');
INSERT INTO `ReleaseHistory` VALUES (66, 'consumer-service', 'default', 'micro_service.spring-boot-druid', 'default', 50, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-20 11:15:19', 'apollo', '2019-09-20 11:15:19');
COMMIT;

-- ----------------------------
-- Table structure for ReleaseMessage
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseMessage`;
CREATE TABLE `ReleaseMessage` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Message` (`Message`(191))
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COMMENT='发布消息';

-- ----------------------------
-- Records of ReleaseMessage
-- ----------------------------
BEGIN;
INSERT INTO `ReleaseMessage` VALUES (9, 'account-service+default+spring-rocketmq', '2019-09-17 11:42:56');
INSERT INTO `ReleaseMessage` VALUES (12, 'common-template+default+micro_service.spring-boot-http', '2019-09-17 14:18:50');
INSERT INTO `ReleaseMessage` VALUES (13, 'account-service+default+micro_service.spring-boot-http', '2019-09-17 14:22:19');
INSERT INTO `ReleaseMessage` VALUES (14, 'account-service+SHAJQ+spring-rocketmq', '2019-09-17 14:42:25');
INSERT INTO `ReleaseMessage` VALUES (15, 'transaction-service+default+micro_service.spring-boot-http', '2019-09-17 17:20:47');
INSERT INTO `ReleaseMessage` VALUES (32, 'account-service+20190917185545-b163dd3f726d60f7+application', '2019-09-18 10:33:36');
INSERT INTO `ReleaseMessage` VALUES (37, 'account-service+20190918103608-b163dd3f72a3d3d4+application', '2019-09-18 10:43:49');
INSERT INTO `ReleaseMessage` VALUES (42, 'account-service+default+application', '2019-09-18 11:01:46');
INSERT INTO `ReleaseMessage` VALUES (43, 'apollo-quickstart+20190918100936-9d21dd3f72a3d3d0+application', '2019-09-18 11:03:56');
INSERT INTO `ReleaseMessage` VALUES (48, 'apollo-quickstart+20190918111030-9d21dd3f72a3d3db+application', '2019-09-18 11:12:14');
INSERT INTO `ReleaseMessage` VALUES (52, 'apollo-quickstart+20190918112317-9d21dd3f72a3d3dd+application', '2019-09-18 11:30:22');
INSERT INTO `ReleaseMessage` VALUES (58, 'apollo-quickstart+default+application', '2019-09-19 15:06:50');
INSERT INTO `ReleaseMessage` VALUES (60, 'account-service+default+micro_service.spring-boot-druid', '2019-09-20 10:05:59');
INSERT INTO `ReleaseMessage` VALUES (61, 'common-template+default+micro_service.spring-eureka', '2019-09-20 11:02:40');
INSERT INTO `ReleaseMessage` VALUES (63, 'common-template+default+micro_service.spring-cloud-feign', '2019-09-20 11:04:55');
INSERT INTO `ReleaseMessage` VALUES (64, 'account-service+default+micro_service.spring-boot-redis', '2019-09-20 11:09:34');
INSERT INTO `ReleaseMessage` VALUES (65, 'common-template+default+micro_service.spring-boot-redis', '2019-09-20 11:09:46');
INSERT INTO `ReleaseMessage` VALUES (66, 'uaa-service+default+micro_service.spring-boot-http', '2019-09-20 11:12:44');
INSERT INTO `ReleaseMessage` VALUES (67, 'uaa-service+default+micro_service.spring-boot-druid', '2019-09-20 11:13:03');
INSERT INTO `ReleaseMessage` VALUES (68, 'transaction-service+default+micro_service.spring-boot-druid', '2019-09-20 11:13:42');
INSERT INTO `ReleaseMessage` VALUES (69, 'consumer-service+default+micro_service.spring-boot-http', '2019-09-20 11:14:56');
INSERT INTO `ReleaseMessage` VALUES (70, 'consumer-service+default+micro_service.spring-boot-druid', '2019-09-20 11:15:19');
COMMIT;

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Cluster` varchar(32) NOT NULL DEFAULT 'default' COMMENT '配置对应的集群，default为不针对特定的集群',
  `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Key` (`Key`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
BEGIN;
INSERT INTO `ServerConfig` VALUES (1, 'eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', b'0', 'default', '2019-09-16 16:11:36', '', '2019-09-16 16:11:36');
INSERT INTO `ServerConfig` VALUES (2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', b'0', 'default', '2019-09-16 16:11:36', '', '2019-09-16 16:11:36');
INSERT INTO `ServerConfig` VALUES (3, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', b'0', 'default', '2019-09-16 16:11:36', '', '2019-09-16 16:11:36');
INSERT INTO `ServerConfig` VALUES (4, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', b'0', 'default', '2019-09-16 16:11:36', '', '2019-09-16 16:11:36');
INSERT INTO `ServerConfig` VALUES (5, 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', b'0', 'default', '2019-09-16 16:11:36', '', '2019-09-16 16:11:36');
COMMIT;


Use ApolloConfigDBPRO;


-- ----------------------------
-- Table structure for App
-- ----------------------------
DROP TABLE IF EXISTS `App`;
CREATE TABLE `App` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';

-- ----------------------------
-- Records of App
-- ----------------------------
BEGIN;
INSERT INTO `App` VALUES (1, 'apollo-quickstart', 'apollo快速入门', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `App` VALUES (2, 'transaction-service', '交易中心', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `App` VALUES (3, 'account-service', '统一账户服务', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `App` VALUES (4, 'common-template', '*****通用配置模板*****', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `App` VALUES (5, 'uaa-service', '统一认证服务', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `App` VALUES (6, 'consumer-service', '用户服务', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
COMMIT;

-- ----------------------------
-- Table structure for AppNamespace
-- ----------------------------
DROP TABLE IF EXISTS `AppNamespace`;
CREATE TABLE `AppNamespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId` (`AppId`),
  KEY `Name_AppId` (`Name`,`AppId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='应用namespace定义';

-- ----------------------------
-- Records of AppNamespace
-- ----------------------------
BEGIN;
INSERT INTO `AppNamespace` VALUES (1, 'application', 'apollo-quickstart', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-17 17:00:55', 'apollo', '2019-09-17 17:00:55');
INSERT INTO `AppNamespace` VALUES (2, 'application', 'transaction-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-17 17:18:14', 'apollo', '2019-09-17 17:18:14');
INSERT INTO `AppNamespace` VALUES (3, 'application', 'account-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-17 17:37:13', 'apollo', '2019-09-17 17:37:13');
INSERT INTO `AppNamespace` VALUES (4, 'spring-rocketmq', 'account-service', 'properties', b'0', '', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `AppNamespace` VALUES (5, 'micro_service.spring-boot-druid', 'account-service', 'properties', b'1', '', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `AppNamespace` VALUES (6, 'application', 'common-template', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-20 11:10:24', 'apollo', '2019-09-20 11:10:24');
INSERT INTO `AppNamespace` VALUES (7, 'micro_service.spring-cloud-feign', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `AppNamespace` VALUES (8, 'micro_service.spring-boot-redis', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `AppNamespace` VALUES (9, 'micro_service.spring-eureka', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `AppNamespace` VALUES (10, 'micro_service.spring-boot-http', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `AppNamespace` VALUES (11, 'application', 'uaa-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-20 11:11:43', 'apollo', '2019-09-20 11:11:43');
INSERT INTO `AppNamespace` VALUES (12, 'application', 'consumer-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-20 11:13:48', 'apollo', '2019-09-20 11:13:48');
COMMIT;

-- ----------------------------
-- Table structure for Audit
-- ----------------------------
DROP TABLE IF EXISTS `Audit`;
CREATE TABLE `Audit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `EntityName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '表名',
  `EntityId` int(10) unsigned DEFAULT NULL COMMENT '记录ID',
  `OpName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '操作类型',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COMMENT='日志审计表';

-- ----------------------------
-- Records of Audit
-- ----------------------------
BEGIN;
INSERT INTO `Audit` VALUES (1, 'App', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:00:55', NULL, '2019-09-17 17:00:55');
INSERT INTO `Audit` VALUES (2, 'AppNamespace', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:00:55', NULL, '2019-09-17 17:00:55');
INSERT INTO `Audit` VALUES (3, 'Cluster', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:00:55', NULL, '2019-09-17 17:00:55');
INSERT INTO `Audit` VALUES (4, 'Namespace', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:00:55', NULL, '2019-09-17 17:00:55');
INSERT INTO `Audit` VALUES (5, 'App', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:18:14', NULL, '2019-09-17 17:18:14');
INSERT INTO `Audit` VALUES (6, 'AppNamespace', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:18:14', NULL, '2019-09-17 17:18:14');
INSERT INTO `Audit` VALUES (7, 'Cluster', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:18:14', NULL, '2019-09-17 17:18:14');
INSERT INTO `Audit` VALUES (8, 'Namespace', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:18:14', NULL, '2019-09-17 17:18:14');
INSERT INTO `Audit` VALUES (9, 'App', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:37:13', NULL, '2019-09-17 17:37:13');
INSERT INTO `Audit` VALUES (10, 'AppNamespace', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:37:13', NULL, '2019-09-17 17:37:13');
INSERT INTO `Audit` VALUES (11, 'Cluster', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:37:13', NULL, '2019-09-17 17:37:13');
INSERT INTO `Audit` VALUES (12, 'Namespace', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:37:13', NULL, '2019-09-17 17:37:13');
INSERT INTO `Audit` VALUES (13, 'Namespace', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:39:46', NULL, '2019-09-17 17:39:46');
INSERT INTO `Audit` VALUES (14, 'AppNamespace', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:39:46', NULL, '2019-09-17 17:39:46');
INSERT INTO `Audit` VALUES (15, 'Item', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:42:45', NULL, '2019-09-17 17:42:45');
INSERT INTO `Audit` VALUES (16, 'Item', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:42:45', NULL, '2019-09-17 17:42:45');
INSERT INTO `Audit` VALUES (17, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:42:45', NULL, '2019-09-17 17:42:45');
INSERT INTO `Audit` VALUES (18, 'Item', 1, 'UPDATE', NULL, b'0', 'apollo', '2019-09-17 17:44:27', NULL, '2019-09-17 17:44:27');
INSERT INTO `Audit` VALUES (19, 'Release', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:44:38', NULL, '2019-09-17 17:44:38');
INSERT INTO `Audit` VALUES (20, 'ReleaseHistory', 1, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:44:38', NULL, '2019-09-17 17:44:38');
INSERT INTO `Audit` VALUES (21, 'Item', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 17:51:56', NULL, '2019-09-17 17:51:56');
INSERT INTO `Audit` VALUES (22, 'Item', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-17 18:52:13', NULL, '2019-09-17 18:52:13');
INSERT INTO `Audit` VALUES (23, 'Release', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:36:53', NULL, '2019-09-18 10:36:53');
INSERT INTO `Audit` VALUES (24, 'ReleaseHistory', 2, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:36:53', NULL, '2019-09-18 10:36:53');
INSERT INTO `Audit` VALUES (25, 'Item', 4, 'UPDATE', NULL, b'0', 'apollo', '2019-09-18 10:37:11', NULL, '2019-09-18 10:37:11');
INSERT INTO `Audit` VALUES (26, 'Release', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:37:14', NULL, '2019-09-18 10:37:14');
INSERT INTO `Audit` VALUES (27, 'ReleaseHistory', 3, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:37:14', NULL, '2019-09-18 10:37:14');
INSERT INTO `Audit` VALUES (28, 'Cluster', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:38:00', NULL, '2019-09-18 10:38:00');
INSERT INTO `Audit` VALUES (29, 'Namespace', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:38:00', NULL, '2019-09-18 10:38:00');
INSERT INTO `Audit` VALUES (30, 'Item', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:38:15', NULL, '2019-09-18 10:38:15');
INSERT INTO `Audit` VALUES (31, 'ReleaseHistory', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:38:24', NULL, '2019-09-18 10:38:24');
INSERT INTO `Audit` VALUES (32, 'Release', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:38:27', NULL, '2019-09-18 10:38:27');
INSERT INTO `Audit` VALUES (33, 'ReleaseHistory', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:38:28', NULL, '2019-09-18 10:38:28');
INSERT INTO `Audit` VALUES (34, 'Item', 4, 'UPDATE', NULL, b'0', 'apollo', '2019-09-18 10:39:19', NULL, '2019-09-18 10:39:19');
INSERT INTO `Audit` VALUES (35, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-09-18 10:39:19', NULL, '2019-09-18 10:39:19');
INSERT INTO `Audit` VALUES (36, 'Release', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:39:19', NULL, '2019-09-18 10:39:19');
INSERT INTO `Audit` VALUES (37, 'ReleaseHistory', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:39:19', NULL, '2019-09-18 10:39:19');
INSERT INTO `Audit` VALUES (38, 'Item', 5, 'UPDATE', NULL, b'0', 'apollo', '2019-09-18 10:39:45', NULL, '2019-09-18 10:39:45');
INSERT INTO `Audit` VALUES (39, 'Release', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:39:51', NULL, '2019-09-18 10:39:51');
INSERT INTO `Audit` VALUES (40, 'ReleaseHistory', 7, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:39:51', NULL, '2019-09-18 10:39:51');
INSERT INTO `Audit` VALUES (41, 'Namespace', 5, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 10:44:02', NULL, '2019-09-18 10:44:02');
INSERT INTO `Audit` VALUES (42, 'Cluster', 4, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 10:44:02', NULL, '2019-09-18 10:44:02');
INSERT INTO `Audit` VALUES (43, 'ReleaseHistory', 8, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 10:44:02', NULL, '2019-09-18 10:44:02');
INSERT INTO `Audit` VALUES (44, 'Branch', 4, 'DELETE', NULL, b'0', 'apollo', '2019-09-18 10:44:02', NULL, '2019-09-18 10:44:02');
INSERT INTO `Audit` VALUES (45, 'Item', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-18 11:10:19', NULL, '2019-09-18 11:10:19');
INSERT INTO `Audit` VALUES (46, 'Namespace', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:05', NULL, '2019-09-20 11:09:05');
INSERT INTO `Audit` VALUES (47, 'Namespace', 7, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:11', NULL, '2019-09-20 11:09:11');
INSERT INTO `Audit` VALUES (48, 'Namespace', 8, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:09:18', NULL, '2019-09-20 11:09:18');
INSERT INTO `Audit` VALUES (49, 'Namespace', 9, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:09', NULL, '2019-09-20 11:10:09');
INSERT INTO `Audit` VALUES (50, 'AppNamespace', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:09', NULL, '2019-09-20 11:10:09');
INSERT INTO `Audit` VALUES (51, 'App', 4, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:24', NULL, '2019-09-20 11:10:24');
INSERT INTO `Audit` VALUES (52, 'AppNamespace', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:24', NULL, '2019-09-20 11:10:24');
INSERT INTO `Audit` VALUES (53, 'Cluster', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:24', NULL, '2019-09-20 11:10:24');
INSERT INTO `Audit` VALUES (54, 'Namespace', 10, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:24', NULL, '2019-09-20 11:10:24');
INSERT INTO `Audit` VALUES (55, 'Namespace', 11, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:31', NULL, '2019-09-20 11:10:31');
INSERT INTO `Audit` VALUES (56, 'AppNamespace', 7, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:31', NULL, '2019-09-20 11:10:31');
INSERT INTO `Audit` VALUES (57, 'Namespace', 12, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:31', NULL, '2019-09-20 11:10:31');
INSERT INTO `Audit` VALUES (58, 'AppNamespace', 8, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:31', NULL, '2019-09-20 11:10:31');
INSERT INTO `Audit` VALUES (59, 'Namespace', 13, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:31', NULL, '2019-09-20 11:10:31');
INSERT INTO `Audit` VALUES (60, 'AppNamespace', 9, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:31', NULL, '2019-09-20 11:10:31');
INSERT INTO `Audit` VALUES (61, 'Namespace', 14, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:31', NULL, '2019-09-20 11:10:31');
INSERT INTO `Audit` VALUES (62, 'AppNamespace', 10, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:10:31', NULL, '2019-09-20 11:10:31');
INSERT INTO `Audit` VALUES (63, 'Namespace', 15, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:04', NULL, '2019-09-20 11:11:04');
INSERT INTO `Audit` VALUES (64, 'Namespace', 16, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:10', NULL, '2019-09-20 11:11:10');
INSERT INTO `Audit` VALUES (65, 'Namespace', 17, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:17', NULL, '2019-09-20 11:11:17');
INSERT INTO `Audit` VALUES (66, 'Namespace', 18, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:22', NULL, '2019-09-20 11:11:22');
INSERT INTO `Audit` VALUES (67, 'App', 5, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:43', NULL, '2019-09-20 11:11:43');
INSERT INTO `Audit` VALUES (68, 'AppNamespace', 11, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:43', NULL, '2019-09-20 11:11:43');
INSERT INTO `Audit` VALUES (69, 'Cluster', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:43', NULL, '2019-09-20 11:11:43');
INSERT INTO `Audit` VALUES (70, 'Namespace', 19, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:11:43', NULL, '2019-09-20 11:11:43');
INSERT INTO `Audit` VALUES (71, 'Namespace', 20, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:05', NULL, '2019-09-20 11:12:05');
INSERT INTO `Audit` VALUES (72, 'Namespace', 21, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:10', NULL, '2019-09-20 11:12:10');
INSERT INTO `Audit` VALUES (73, 'Namespace', 22, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:16', NULL, '2019-09-20 11:12:16');
INSERT INTO `Audit` VALUES (74, 'Namespace', 23, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:21', NULL, '2019-09-20 11:12:21');
INSERT INTO `Audit` VALUES (75, 'Namespace', 24, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:25', NULL, '2019-09-20 11:12:25');
INSERT INTO `Audit` VALUES (76, 'Item', 7, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:12:41', NULL, '2019-09-20 11:12:41');
INSERT INTO `Audit` VALUES (77, 'Item', 8, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:13:00', NULL, '2019-09-20 11:13:00');
INSERT INTO `Audit` VALUES (78, 'App', 6, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:13:48', NULL, '2019-09-20 11:13:48');
INSERT INTO `Audit` VALUES (79, 'AppNamespace', 12, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:13:48', NULL, '2019-09-20 11:13:48');
INSERT INTO `Audit` VALUES (80, 'Cluster', 7, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:13:48', NULL, '2019-09-20 11:13:48');
INSERT INTO `Audit` VALUES (81, 'Namespace', 25, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:13:48', NULL, '2019-09-20 11:13:48');
INSERT INTO `Audit` VALUES (82, 'Namespace', 26, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:17', NULL, '2019-09-20 11:14:17');
INSERT INTO `Audit` VALUES (83, 'Namespace', 27, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:22', NULL, '2019-09-20 11:14:22');
INSERT INTO `Audit` VALUES (84, 'Namespace', 28, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:27', NULL, '2019-09-20 11:14:27');
INSERT INTO `Audit` VALUES (85, 'Namespace', 29, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:32', NULL, '2019-09-20 11:14:32');
INSERT INTO `Audit` VALUES (86, 'Namespace', 30, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:37', NULL, '2019-09-20 11:14:37');
INSERT INTO `Audit` VALUES (87, 'Item', 9, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:14:53', NULL, '2019-09-20 11:14:53');
INSERT INTO `Audit` VALUES (88, 'Item', 10, 'INSERT', NULL, b'0', 'apollo', '2019-09-20 11:15:15', NULL, '2019-09-20 11:15:15');
COMMIT;

-- ----------------------------
-- Table structure for Cluster
-- ----------------------------
DROP TABLE IF EXISTS `Cluster`;
CREATE TABLE `Cluster` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '集群名字',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'App id',
  `ParentClusterId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父cluster',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId_Name` (`AppId`,`Name`),
  KEY `IX_ParentClusterId` (`ParentClusterId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='集群';

-- ----------------------------
-- Records of Cluster
-- ----------------------------
BEGIN;
INSERT INTO `Cluster` VALUES (1, 'default', 'apollo-quickstart', 0, b'0', 'apollo', '2019-09-17 17:00:55', 'apollo', '2019-09-17 17:00:55');
INSERT INTO `Cluster` VALUES (2, 'default', 'transaction-service', 0, b'0', 'apollo', '2019-09-17 17:18:14', 'apollo', '2019-09-17 17:18:14');
INSERT INTO `Cluster` VALUES (3, 'default', 'account-service', 0, b'0', 'apollo', '2019-09-17 17:37:13', 'apollo', '2019-09-17 17:37:13');
INSERT INTO `Cluster` VALUES (4, '20190918103759-b163dd3f72f46158', 'account-service', 3, b'1', 'apollo', '2019-09-18 10:38:00', 'apollo', '2019-09-18 10:44:02');
INSERT INTO `Cluster` VALUES (5, 'default', 'common-template', 0, b'0', 'apollo', '2019-09-20 11:10:24', 'apollo', '2019-09-20 11:10:24');
INSERT INTO `Cluster` VALUES (6, 'default', 'uaa-service', 0, b'0', 'apollo', '2019-09-20 11:11:43', 'apollo', '2019-09-20 11:11:43');
INSERT INTO `Cluster` VALUES (7, 'default', 'consumer-service', 0, b'0', 'apollo', '2019-09-20 11:13:48', 'apollo', '2019-09-20 11:13:48');
COMMIT;

-- ----------------------------
-- Table structure for Commit
-- ----------------------------
DROP TABLE IF EXISTS `Commit`;
CREATE TABLE `Commit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ChangeSets` longtext NOT NULL COMMENT '修改变更集',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `AppId` (`AppId`(191)),
  KEY `ClusterName` (`ClusterName`(191)),
  KEY `NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='commit 历史表';

-- ----------------------------
-- Records of Commit
-- ----------------------------
BEGIN;
INSERT INTO `Commit` VALUES (1, '{\"createItems\":[{\"namespaceId\":4,\"key\":\"rocketmq.name-server\",\"value\":\"127.0.0.1:9876\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 17:42:44\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 17:42:44\"},{\"namespaceId\":4,\"key\":\"rocketmq.producer.group\",\"value\":\"PID_ACCOUNT\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 17:42:44\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 17:42:44\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'default', 'spring-rocketmq', NULL, b'0', 'apollo', '2019-09-17 17:42:45', 'apollo', '2019-09-17 17:42:45');
INSERT INTO `Commit` VALUES (2, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":4,\"key\":\"rocketmq.name-server\",\"value\":\"127.0.0.1:9876\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 17:42:44\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 17:42:44\"},\"newItem\":{\"namespaceId\":4,\"key\":\"rocketmq.name-server\",\"value\":\"172.0.0.10:9876\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 17:42:44\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 17:44:27\"}}],\"deleteItems\":[]}', 'account-service', 'default', 'spring-rocketmq', NULL, b'0', 'apollo', '2019-09-17 17:44:27', 'apollo', '2019-09-17 17:44:27');
INSERT INTO `Commit` VALUES (3, '{\"createItems\":[{\"namespaceId\":3,\"key\":\"sms.enable\",\"value\":\"true\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 17:51:56\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 17:51:56\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'default', 'application', NULL, b'0', 'apollo', '2019-09-17 17:51:56', 'apollo', '2019-09-17 17:51:56');
INSERT INTO `Commit` VALUES (4, '{\"createItems\":[{\"namespaceId\":3,\"key\":\"timeout\",\"value\":\"2000\",\"lineNum\":2,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 18:52:12\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 18:52:12\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', 'default', 'application', NULL, b'0', 'apollo', '2019-09-17 18:52:13', 'apollo', '2019-09-17 18:52:13');
INSERT INTO `Commit` VALUES (5, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":3,\"key\":\"timeout\",\"value\":\"2000\",\"lineNum\":2,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 18:52:13\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-17 18:52:13\"},\"newItem\":{\"namespaceId\":3,\"key\":\"timeout\",\"value\":\"5000\",\"comment\":\"\",\"lineNum\":2,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 18:52:13\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 10:37:11\"}}],\"deleteItems\":[]}', 'account-service', 'default', 'application', NULL, b'0', 'apollo', '2019-09-18 10:37:11', 'apollo', '2019-09-18 10:37:11');
INSERT INTO `Commit` VALUES (6, '{\"createItems\":[{\"namespaceId\":5,\"key\":\"timeout\",\"value\":\"3000\",\"comment\":\"\",\"lineNum\":1,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 10:38:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 10:38:14\"}],\"updateItems\":[],\"deleteItems\":[]}', 'account-service', '20190918103759-b163dd3f72f46158', 'application', NULL, b'1', 'apollo', '2019-09-18 10:38:15', 'apollo', '2019-09-18 10:44:01');
INSERT INTO `Commit` VALUES (7, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":3,\"key\":\"timeout\",\"value\":\"5000\",\"comment\":\"\",\"lineNum\":2,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 18:52:13\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 10:37:11\"},\"newItem\":{\"namespaceId\":3,\"key\":\"timeout\",\"value\":\"3000\",\"comment\":\"\",\"lineNum\":2,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-17 18:52:13\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 10:39:18\"}}],\"deleteItems\":[]}', 'account-service', 'default', 'application', NULL, b'0', 'apollo', '2019-09-18 10:39:19', 'apollo', '2019-09-18 10:39:19');
INSERT INTO `Commit` VALUES (8, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":5,\"key\":\"timeout\",\"value\":\"3000\",\"comment\":\"\",\"lineNum\":1,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 10:38:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 10:38:15\"},\"newItem\":{\"namespaceId\":5,\"key\":\"timeout\",\"value\":\"2000\",\"comment\":\"\",\"lineNum\":1,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 10:38:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 10:39:44\"}}],\"deleteItems\":[]}', 'account-service', '20190918103759-b163dd3f72f46158', 'application', NULL, b'1', 'apollo', '2019-09-18 10:39:45', 'apollo', '2019-09-18 10:44:01');
INSERT INTO `Commit` VALUES (9, '{\"createItems\":[{\"namespaceId\":1,\"key\":\"timeout\",\"value\":\"2000\",\"lineNum\":1,\"id\":6,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-18 11:10:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-18 11:10:19\"}],\"updateItems\":[],\"deleteItems\":[]}', 'apollo-quickstart', 'default', 'application', NULL, b'0', 'apollo', '2019-09-18 11:10:19', 'apollo', '2019-09-18 11:10:19');
INSERT INTO `Commit` VALUES (10, '{\"createItems\":[{\"namespaceId\":20,\"key\":\"server.servlet.context-path\",\"value\":\"/uaa\",\"comment\":\"\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:12:41\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:12:41\"}],\"updateItems\":[],\"deleteItems\":[]}', 'uaa-service', 'default', 'micro_service.spring-boot-http', NULL, b'0', 'apollo', '2019-09-20 11:12:41', 'apollo', '2019-09-20 11:12:41');
INSERT INTO `Commit` VALUES (11, '{\"createItems\":[{\"namespaceId\":21,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://127.0.0.1:3306/p2p_uaa?useUnicode\\u003dtrue\",\"comment\":\"\",\"lineNum\":1,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:12:59\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:12:59\"}],\"updateItems\":[],\"deleteItems\":[]}', 'uaa-service', 'default', 'micro_service.spring-boot-druid', NULL, b'0', 'apollo', '2019-09-20 11:13:00', 'apollo', '2019-09-20 11:13:00');
INSERT INTO `Commit` VALUES (12, '{\"createItems\":[{\"namespaceId\":26,\"key\":\"server.servlet.context-path\",\"value\":\"/consumer\",\"comment\":\"\",\"lineNum\":1,\"id\":9,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:14:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:14:52\"}],\"updateItems\":[],\"deleteItems\":[]}', 'consumer-service', 'default', 'micro_service.spring-boot-http', NULL, b'0', 'apollo', '2019-09-20 11:14:53', 'apollo', '2019-09-20 11:14:53');
INSERT INTO `Commit` VALUES (13, '{\"createItems\":[{\"namespaceId\":27,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://127.0.0.1:3306/p2p_consumer?useUnicode\\u003dtrue\",\"comment\":\"\",\"lineNum\":1,\"id\":10,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-09-20 11:15:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-09-20 11:15:14\"}],\"updateItems\":[],\"deleteItems\":[]}', 'consumer-service', 'default', 'micro_service.spring-boot-druid', NULL, b'0', 'apollo', '2019-09-20 11:15:15', 'apollo', '2019-09-20 11:15:15');
COMMIT;

-- ----------------------------
-- Table structure for GrayReleaseRule
-- ----------------------------
DROP TABLE IF EXISTS `GrayReleaseRule`;
CREATE TABLE `GrayReleaseRule` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'branch name',
  `Rules` varchar(16000) DEFAULT '[]' COMMENT '灰度规则',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '灰度对应的release',
  `BranchStatus` tinyint(2) DEFAULT '1' COMMENT '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='灰度规则表';

-- ----------------------------
-- Records of GrayReleaseRule
-- ----------------------------
BEGIN;
INSERT INTO `GrayReleaseRule` VALUES (1, 'account-service', 'default', 'application', '20190918103759-b163dd3f72f46158', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 0, 1, b'1', 'apollo', '2019-09-18 10:38:24', 'apollo', '2019-09-18 10:38:27');
INSERT INTO `GrayReleaseRule` VALUES (2, 'account-service', 'default', 'application', '20190918103759-b163dd3f72f46158', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 4, 1, b'1', 'apollo', '2019-09-18 10:38:28', 'apollo', '2019-09-18 10:39:51');
INSERT INTO `GrayReleaseRule` VALUES (3, 'account-service', 'default', 'application', '20190918103759-b163dd3f72f46158', '[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]', 6, 1, b'1', 'apollo', '2019-09-18 10:39:51', 'apollo', '2019-09-18 10:44:01');
INSERT INTO `GrayReleaseRule` VALUES (4, 'account-service', 'default', 'application', '20190918103759-b163dd3f72f46158', '[]', 6, 0, b'0', 'apollo', '2019-09-18 10:44:02', 'apollo', '2019-09-18 10:44:02');
COMMIT;

-- ----------------------------
-- Table structure for Instance
-- ----------------------------
DROP TABLE IF EXISTS `Instance`;
CREATE TABLE `Instance` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `DataCenter` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
  `Ip` varchar(32) NOT NULL DEFAULT '' COMMENT 'instance ip',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`AppId`,`ClusterName`,`Ip`,`DataCenter`),
  KEY `IX_IP` (`Ip`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='使用配置的应用实例';

-- ----------------------------
-- Records of Instance
-- ----------------------------
BEGIN;
INSERT INTO `Instance` VALUES (1, 'account-service', 'DEFAULT', '', '172.16.0.160', '2019-09-17 17:55:37', '2019-09-17 17:55:37');
COMMIT;

-- ----------------------------
-- Table structure for InstanceConfig
-- ----------------------------
DROP TABLE IF EXISTS `InstanceConfig`;
CREATE TABLE `InstanceConfig` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `InstanceId` int(11) unsigned DEFAULT NULL COMMENT 'Instance Id',
  `ConfigAppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
  `ConfigClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
  `ConfigNamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `ReleaseDeliveryTime` timestamp NULL DEFAULT NULL COMMENT '配置获取时间',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`InstanceId`,`ConfigAppId`,`ConfigNamespaceName`),
  KEY `IX_ReleaseKey` (`ReleaseKey`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Valid_Namespace` (`ConfigAppId`,`ConfigClusterName`,`ConfigNamespaceName`,`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='应用实例的配置信息';

-- ----------------------------
-- Records of InstanceConfig
-- ----------------------------
BEGIN;
INSERT INTO `InstanceConfig` VALUES (1, 1, 'account-service', 'default', 'spring-rocketmq', '20190917174438-1b4bdd3f721cafd3', '2019-09-17 17:55:36', '2019-09-17 17:55:36', '2019-09-18 09:50:48');
INSERT INTO `InstanceConfig` VALUES (2, 1, 'account-service', 'default', 'application', '20190918103918-b163dd3f72f4615a', '2019-09-18 10:39:19', '2019-09-18 10:36:54', '2019-09-18 10:39:20');
COMMIT;

-- ----------------------------
-- Table structure for Item
-- ----------------------------
DROP TABLE IF EXISTS `Item`;
CREATE TABLE `Item` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `Key` varchar(128) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` longtext NOT NULL COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `LineNum` int(10) unsigned DEFAULT '0' COMMENT '行号',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_GroupId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='配置项目';

-- ----------------------------
-- Records of Item
-- ----------------------------
BEGIN;
INSERT INTO `Item` VALUES (1, 4, 'rocketmq.name-server', '172.0.0.10:9876', '', 1, b'0', 'apollo', '2019-09-17 17:42:44', 'apollo', '2019-09-17 17:44:27');
INSERT INTO `Item` VALUES (2, 4, 'rocketmq.producer.group', 'PID_ACCOUNT', '', 2, b'0', 'apollo', '2019-09-17 17:42:45', 'apollo', '2019-09-17 17:42:45');
INSERT INTO `Item` VALUES (3, 3, 'sms.enable', 'true', NULL, 1, b'0', 'apollo', '2019-09-17 17:51:56', 'apollo', '2019-09-17 17:51:56');
INSERT INTO `Item` VALUES (4, 3, 'timeout', '3000', '', 2, b'0', 'apollo', '2019-09-17 18:52:13', 'apollo', '2019-09-18 10:39:19');
INSERT INTO `Item` VALUES (5, 5, 'timeout', '2000', '', 1, b'1', 'apollo', '2019-09-18 10:38:15', 'apollo', '2019-09-18 10:44:01');
INSERT INTO `Item` VALUES (6, 1, 'timeout', '2000', NULL, 1, b'0', 'apollo', '2019-09-18 11:10:19', 'apollo', '2019-09-18 11:10:19');
INSERT INTO `Item` VALUES (7, 20, 'server.servlet.context-path', '/uaa', '', 1, b'0', 'apollo', '2019-09-20 11:12:41', 'apollo', '2019-09-20 11:12:41');
INSERT INTO `Item` VALUES (8, 21, 'spring.datasource.url', 'jdbc:mysql://127.0.0.1:3306/p2p_uaa?useUnicode=true', '', 1, b'0', 'apollo', '2019-09-20 11:13:00', 'apollo', '2019-09-20 11:13:00');
INSERT INTO `Item` VALUES (9, 26, 'server.servlet.context-path', '/consumer', '', 1, b'0', 'apollo', '2019-09-20 11:14:53', 'apollo', '2019-09-20 11:14:53');
INSERT INTO `Item` VALUES (10, 27, 'spring.datasource.url', 'jdbc:mysql://127.0.0.1:3306/p2p_consumer?useUnicode=true', '', 1, b'0', 'apollo', '2019-09-20 11:15:15', 'apollo', '2019-09-20 11:15:15');
COMMIT;

-- ----------------------------
-- Table structure for Namespace
-- ----------------------------
DROP TABLE IF EXISTS `Namespace`;
CREATE TABLE `Namespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_NamespaceName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='命名空间';

-- ----------------------------
-- Records of Namespace
-- ----------------------------
BEGIN;
INSERT INTO `Namespace` VALUES (1, 'apollo-quickstart', 'default', 'application', b'0', 'apollo', '2019-09-17 17:00:55', 'apollo', '2019-09-17 17:00:55');
INSERT INTO `Namespace` VALUES (2, 'transaction-service', 'default', 'application', b'0', 'apollo', '2019-09-17 17:18:14', 'apollo', '2019-09-17 17:18:14');
INSERT INTO `Namespace` VALUES (3, 'account-service', 'default', 'application', b'0', 'apollo', '2019-09-17 17:37:13', 'apollo', '2019-09-17 17:37:13');
INSERT INTO `Namespace` VALUES (4, 'account-service', 'default', 'spring-rocketmq', b'0', 'apollo', '2019-09-17 17:39:46', 'apollo', '2019-09-17 17:39:46');
INSERT INTO `Namespace` VALUES (5, 'account-service', '20190918103759-b163dd3f72f46158', 'application', b'1', 'apollo', '2019-09-18 10:38:00', 'apollo', '2019-09-18 10:44:02');
INSERT INTO `Namespace` VALUES (6, 'account-service', 'default', 'micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:09:05', 'apollo', '2019-09-20 11:09:05');
INSERT INTO `Namespace` VALUES (7, 'account-service', 'default', 'micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Namespace` VALUES (8, 'account-service', 'default', 'micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Namespace` VALUES (9, 'account-service', 'default', 'micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:10:09', 'apollo', '2019-09-20 11:10:09');
INSERT INTO `Namespace` VALUES (10, 'common-template', 'default', 'application', b'0', 'apollo', '2019-09-20 11:10:24', 'apollo', '2019-09-20 11:10:24');
INSERT INTO `Namespace` VALUES (11, 'common-template', 'default', 'micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:10:31', 'apollo', '2019-09-20 11:10:31');
INSERT INTO `Namespace` VALUES (12, 'common-template', 'default', 'micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:10:31', 'apollo', '2019-09-20 11:10:31');
INSERT INTO `Namespace` VALUES (13, 'common-template', 'default', 'micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:10:31', 'apollo', '2019-09-20 11:10:31');
INSERT INTO `Namespace` VALUES (14, 'common-template', 'default', 'micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:10:31', 'apollo', '2019-09-20 11:10:31');
INSERT INTO `Namespace` VALUES (15, 'transaction-service', 'default', 'micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Namespace` VALUES (16, 'transaction-service', 'default', 'micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Namespace` VALUES (17, 'transaction-service', 'default', 'micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Namespace` VALUES (18, 'transaction-service', 'default', 'micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Namespace` VALUES (19, 'uaa-service', 'default', 'application', b'0', 'apollo', '2019-09-20 11:11:43', 'apollo', '2019-09-20 11:11:43');
INSERT INTO `Namespace` VALUES (20, 'uaa-service', 'default', 'micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Namespace` VALUES (21, 'uaa-service', 'default', 'micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Namespace` VALUES (22, 'uaa-service', 'default', 'micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Namespace` VALUES (23, 'uaa-service', 'default', 'micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Namespace` VALUES (24, 'uaa-service', 'default', 'micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Namespace` VALUES (25, 'consumer-service', 'default', 'application', b'0', 'apollo', '2019-09-20 11:13:48', 'apollo', '2019-09-20 11:13:48');
INSERT INTO `Namespace` VALUES (26, 'consumer-service', 'default', 'micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Namespace` VALUES (27, 'consumer-service', 'default', 'micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Namespace` VALUES (28, 'consumer-service', 'default', 'micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Namespace` VALUES (29, 'consumer-service', 'default', 'micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Namespace` VALUES (30, 'consumer-service', 'default', 'micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
COMMIT;

-- ----------------------------
-- Table structure for NamespaceLock
-- ----------------------------
DROP TABLE IF EXISTS `NamespaceLock`;
CREATE TABLE `NamespaceLock` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT 'default' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `IsDeleted` bit(1) DEFAULT b'0' COMMENT '软删除',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_NamespaceId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='namespace的编辑锁';

-- ----------------------------
-- Table structure for Release
-- ----------------------------
DROP TABLE IF EXISTS `Release`;
CREATE TABLE `Release` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `Name` varchar(64) NOT NULL DEFAULT 'default' COMMENT '发布名字',
  `Comment` varchar(256) DEFAULT NULL COMMENT '发布说明',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Configurations` longtext NOT NULL COMMENT '发布配置',
  `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否废弃',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_GroupName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ReleaseKey` (`ReleaseKey`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='发布';

-- ----------------------------
-- Records of Release
-- ----------------------------
BEGIN;
INSERT INTO `Release` VALUES (1, '20190917174438-1b4bdd3f721cafd3', '20190917174436-release', '', 'account-service', 'default', 'spring-rocketmq', '{\"rocketmq.name-server\":\"172.0.0.10:9876\",\"rocketmq.producer.group\":\"PID_ACCOUNT\"}', b'0', b'0', 'apollo', '2019-09-17 17:44:38', 'apollo', '2019-09-17 17:44:38');
INSERT INTO `Release` VALUES (2, '20190918103652-b163dd3f72f46156', '20190918103649-release', '', 'account-service', 'default', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"2000\"}', b'0', b'0', 'apollo', '2019-09-18 10:36:53', 'apollo', '2019-09-18 10:36:53');
INSERT INTO `Release` VALUES (3, '20190918103714-b163dd3f72f46157', '20190918103712-release', '', 'account-service', 'default', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"5000\"}', b'0', b'0', 'apollo', '2019-09-18 10:37:14', 'apollo', '2019-09-18 10:37:14');
INSERT INTO `Release` VALUES (4, '20190918103827-608edd3f72f46159', '20190918103826-gray', '', 'account-service', '20190918103759-b163dd3f72f46158', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 10:38:27', 'apollo', '2019-09-18 10:38:27');
INSERT INTO `Release` VALUES (5, '20190918103918-b163dd3f72f4615a', '20190918103916-gray-release-merge-to-master', '', 'account-service', 'default', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"3000\"}', b'0', b'0', 'apollo', '2019-09-18 10:39:19', 'apollo', '2019-09-18 10:39:19');
INSERT INTO `Release` VALUES (6, '20190918103951-608edd3f72f4615b', '20190918103949-gray', '', 'account-service', '20190918103759-b163dd3f72f46158', 'application', '{\"sms.enable\":\"true\",\"timeout\":\"2000\"}', b'0', b'0', 'apollo', '2019-09-18 10:39:51', 'apollo', '2019-09-18 10:39:51');
COMMIT;

-- ----------------------------
-- Table structure for ReleaseHistory
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseHistory`;
CREATE TABLE `ReleaseHistory` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT '发布分支名',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联的Release Id',
  `PreviousReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '前一次发布的ReleaseId',
  `Operation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度',
  `OperationContext` longtext NOT NULL COMMENT '发布上下文信息',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`,`BranchName`),
  KEY `IX_ReleaseId` (`ReleaseId`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='发布历史';

-- ----------------------------
-- Records of ReleaseHistory
-- ----------------------------
BEGIN;
INSERT INTO `ReleaseHistory` VALUES (1, 'account-service', 'default', 'spring-rocketmq', 'default', 1, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-17 17:44:38', 'apollo', '2019-09-17 17:44:38');
INSERT INTO `ReleaseHistory` VALUES (2, 'account-service', 'default', 'application', 'default', 2, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 10:36:53', 'apollo', '2019-09-18 10:36:53');
INSERT INTO `ReleaseHistory` VALUES (3, 'account-service', 'default', 'application', 'default', 3, 2, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 10:37:14', 'apollo', '2019-09-18 10:37:14');
INSERT INTO `ReleaseHistory` VALUES (4, 'account-service', 'default', 'application', '20190918103759-b163dd3f72f46158', 0, 0, 3, '{\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}]}', b'0', 'apollo', '2019-09-18 10:38:24', 'apollo', '2019-09-18 10:38:24');
INSERT INTO `ReleaseHistory` VALUES (5, 'account-service', 'default', 'application', '20190918103759-b163dd3f72f46158', 4, 0, 2, '{\"baseReleaseId\":3,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 10:38:28', 'apollo', '2019-09-18 10:38:28');
INSERT INTO `ReleaseHistory` VALUES (6, 'account-service', 'default', 'application', 'default', 5, 3, 4, '{\"sourceBranch\":\"20190918103759-b163dd3f72f46158\",\"baseReleaseId\":4,\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 10:39:19', 'apollo', '2019-09-18 10:39:19');
INSERT INTO `ReleaseHistory` VALUES (7, 'account-service', 'default', 'application', '20190918103759-b163dd3f72f46158', 6, 4, 2, '{\"baseReleaseId\":5,\"branchReleaseKeys\":[\"timeout\"],\"rules\":[{\"clientAppId\":\"account-service\",\"clientIpList\":[\"172.16.0.160\"]}],\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-09-18 10:39:51', 'apollo', '2019-09-18 10:39:51');
INSERT INTO `ReleaseHistory` VALUES (8, 'account-service', 'default', 'application', '20190918103759-b163dd3f72f46158', 6, 6, 7, '{}', b'0', 'apollo', '2019-09-18 10:44:02', 'apollo', '2019-09-18 10:44:02');
COMMIT;

-- ----------------------------
-- Table structure for ReleaseMessage
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseMessage`;
CREATE TABLE `ReleaseMessage` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Message` (`Message`(191))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='发布消息';

-- ----------------------------
-- Records of ReleaseMessage
-- ----------------------------
BEGIN;
INSERT INTO `ReleaseMessage` VALUES (1, 'account-service+default+spring-rocketmq', '2019-09-17 17:44:38');
INSERT INTO `ReleaseMessage` VALUES (8, 'account-service+20190918103759-b163dd3f72f46158+application', '2019-09-18 10:44:02');
INSERT INTO `ReleaseMessage` VALUES (9, 'account-service+default+application', '2019-09-18 10:44:02');
COMMIT;

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Cluster` varchar(32) NOT NULL DEFAULT 'default' COMMENT '配置对应的集群，default为不针对特定的集群',
  `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Key` (`Key`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
BEGIN;
INSERT INTO `ServerConfig` VALUES (1, 'eureka.service.url', 'default', 'http://localhost:8081/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', b'0', 'default', '2019-09-17 16:55:33', '', '2019-09-17 16:55:44');
INSERT INTO `ServerConfig` VALUES (2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', b'0', 'default', '2019-09-17 16:55:33', '', '2019-09-17 16:55:33');
INSERT INTO `ServerConfig` VALUES (3, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', b'0', 'default', '2019-09-17 16:55:33', '', '2019-09-17 16:55:33');
INSERT INTO `ServerConfig` VALUES (4, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', b'0', 'default', '2019-09-17 16:55:33', '', '2019-09-17 16:55:33');
INSERT INTO `ServerConfig` VALUES (5, 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', b'0', 'default', '2019-09-17 16:55:33', '', '2019-09-17 16:55:33');
COMMIT;


Use ApolloPortalDB;



-- ----------------------------
-- Table structure for App
-- ----------------------------
DROP TABLE IF EXISTS `App`;
CREATE TABLE `App` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';

-- ----------------------------
-- Records of App
-- ----------------------------
BEGIN;
INSERT INTO `App` VALUES (1, 'apollo-quickstart', 'apollo快速入门', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `App` VALUES (2, 'account-service', '统一账户服务', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `App` VALUES (3, 'common-template', '*****通用配置模板*****', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `App` VALUES (4, 'transaction-service', '交易中心', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `App` VALUES (5, 'uaa-service', '统一认证服务', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `App` VALUES (6, 'consumer-service', '用户服务', 'micro_service', '微服务部门', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
COMMIT;

-- ----------------------------
-- Table structure for AppNamespace
-- ----------------------------
DROP TABLE IF EXISTS `AppNamespace`;
CREATE TABLE `AppNamespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId` (`AppId`),
  KEY `Name_AppId` (`Name`,`AppId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='应用namespace定义';

-- ----------------------------
-- Records of AppNamespace
-- ----------------------------
BEGIN;
INSERT INTO `AppNamespace` VALUES (1, 'application', 'apollo-quickstart', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `AppNamespace` VALUES (2, 'application', 'account-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `AppNamespace` VALUES (3, 'spring-rocketmq', 'account-service', 'properties', b'0', '', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `AppNamespace` VALUES (4, 'application', 'common-template', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `AppNamespace` VALUES (5, 'micro_service.spring-boot-http', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `AppNamespace` VALUES (6, 'application', 'transaction-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `AppNamespace` VALUES (7, 'application', 'uaa-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `AppNamespace` VALUES (8, 'application', 'consumer-service', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `AppNamespace` VALUES (9, 'micro_service.spring-boot-druid', 'account-service', 'properties', b'1', '', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `AppNamespace` VALUES (10, 'micro_service.spring-eureka', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `AppNamespace` VALUES (11, 'micro_service.spring-cloud-feign', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `AppNamespace` VALUES (12, 'micro_service.spring-boot-redis', 'common-template', 'properties', b'1', '', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
COMMIT;

-- ----------------------------
-- Table structure for Authorities
-- ----------------------------
DROP TABLE IF EXISTS `Authorities`;
CREATE TABLE `Authorities` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL,
  `Authority` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of Authorities
-- ----------------------------
BEGIN;
INSERT INTO `Authorities` VALUES (1, 'apollo', 'ROLE_user');
COMMIT;

-- ----------------------------
-- Table structure for Consumer
-- ----------------------------
DROP TABLE IF EXISTS `Consumer`;
CREATE TABLE `Consumer` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开放API消费者';

-- ----------------------------
-- Table structure for ConsumerAudit
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerAudit`;
CREATE TABLE `ConsumerAudit` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ConsumerId` (`ConsumerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer审计表';

-- ----------------------------
-- Table structure for ConsumerRole
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerRole`;
CREATE TABLE `ConsumerRole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_ConsumerId_RoleId` (`ConsumerId`,`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer和role的绑定表';

-- ----------------------------
-- Table structure for ConsumerToken
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerToken`;
CREATE TABLE `ConsumerToken` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Token` (`Token`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer token表';

-- ----------------------------
-- Table structure for Favorite
-- ----------------------------
DROP TABLE IF EXISTS `Favorite`;
CREATE TABLE `Favorite` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT '10000' COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `IX_UserId` (`UserId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='应用收藏表';

-- ----------------------------
-- Table structure for Permission
-- ----------------------------
DROP TABLE IF EXISTS `Permission`;
CREATE TABLE `Permission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_TargetId_PermissionType` (`TargetId`(191),`PermissionType`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COMMENT='permission表';

-- ----------------------------
-- Records of Permission
-- ----------------------------
BEGIN;
INSERT INTO `Permission` VALUES (1, 'AssignRole', 'apollo-quickstart', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Permission` VALUES (2, 'CreateCluster', 'apollo-quickstart', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Permission` VALUES (3, 'CreateNamespace', 'apollo-quickstart', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Permission` VALUES (4, 'ModifyNamespace', 'apollo-quickstart+application', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Permission` VALUES (5, 'ReleaseNamespace', 'apollo-quickstart+application', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Permission` VALUES (6, 'ModifyNamespace', 'apollo-quickstart+application+DEV', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Permission` VALUES (7, 'ReleaseNamespace', 'apollo-quickstart+application+DEV', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Permission` VALUES (8, 'CreateNamespace', 'account-service', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Permission` VALUES (9, 'CreateCluster', 'account-service', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Permission` VALUES (10, 'AssignRole', 'account-service', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Permission` VALUES (11, 'ModifyNamespace', 'account-service+application', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Permission` VALUES (12, 'ReleaseNamespace', 'account-service+application', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Permission` VALUES (13, 'ModifyNamespace', 'account-service+application+DEV', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Permission` VALUES (14, 'ReleaseNamespace', 'account-service+application+DEV', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Permission` VALUES (15, 'ModifyNamespace', 'account-service+spring-rocketmq', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `Permission` VALUES (16, 'ReleaseNamespace', 'account-service+spring-rocketmq', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `Permission` VALUES (17, 'ModifyNamespace', 'account-service+spring-rocketmq+DEV', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `Permission` VALUES (18, 'ReleaseNamespace', 'account-service+spring-rocketmq+DEV', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `Permission` VALUES (19, 'AssignRole', 'common-template', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Permission` VALUES (20, 'CreateNamespace', 'common-template', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Permission` VALUES (21, 'CreateCluster', 'common-template', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Permission` VALUES (22, 'ModifyNamespace', 'common-template+application', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Permission` VALUES (23, 'ReleaseNamespace', 'common-template+application', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Permission` VALUES (24, 'ModifyNamespace', 'common-template+application+DEV', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Permission` VALUES (25, 'ReleaseNamespace', 'common-template+application+DEV', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Permission` VALUES (26, 'ModifyNamespace', 'common-template+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `Permission` VALUES (27, 'ReleaseNamespace', 'common-template+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `Permission` VALUES (28, 'ModifyNamespace', 'common-template+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `Permission` VALUES (29, 'ReleaseNamespace', 'common-template+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `Permission` VALUES (30, 'ModifyNamespace', 'account-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `Permission` VALUES (31, 'ReleaseNamespace', 'account-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `Permission` VALUES (32, 'ModifyNamespace', 'account-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `Permission` VALUES (33, 'ReleaseNamespace', 'account-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `Permission` VALUES (34, 'ModifyNamespace', 'apollo-quickstart+application+PRO', b'0', 'apollo', '2019-09-17 16:36:26', 'apollo', '2019-09-17 16:36:26');
INSERT INTO `Permission` VALUES (35, 'ReleaseNamespace', 'apollo-quickstart+application+PRO', b'0', 'apollo', '2019-09-17 16:36:26', 'apollo', '2019-09-17 16:36:26');
INSERT INTO `Permission` VALUES (36, 'ModifyNamespace', 'common-template+application+PRO', b'0', 'apollo', '2019-09-17 16:36:51', 'apollo', '2019-09-17 16:36:51');
INSERT INTO `Permission` VALUES (37, 'ReleaseNamespace', 'common-template+application+PRO', b'0', 'apollo', '2019-09-17 16:36:51', 'apollo', '2019-09-17 16:36:51');
INSERT INTO `Permission` VALUES (38, 'ModifyNamespace', 'account-service+application+PRO', b'0', 'apollo', '2019-09-17 16:53:45', 'apollo', '2019-09-17 16:53:45');
INSERT INTO `Permission` VALUES (39, 'ReleaseNamespace', 'account-service+application+PRO', b'0', 'apollo', '2019-09-17 16:53:45', 'apollo', '2019-09-17 16:53:45');
INSERT INTO `Permission` VALUES (40, 'AssignRole', 'transaction-service', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Permission` VALUES (41, 'CreateCluster', 'transaction-service', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Permission` VALUES (42, 'CreateNamespace', 'transaction-service', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Permission` VALUES (43, 'ModifyNamespace', 'transaction-service+application', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Permission` VALUES (44, 'ReleaseNamespace', 'transaction-service+application', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Permission` VALUES (45, 'ModifyNamespace', 'transaction-service+application+DEV', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Permission` VALUES (46, 'ReleaseNamespace', 'transaction-service+application+DEV', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Permission` VALUES (47, 'ModifyNamespace', 'transaction-service+application+PRO', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Permission` VALUES (48, 'ReleaseNamespace', 'transaction-service+application+PRO', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Permission` VALUES (49, 'ModifyNamespace', 'transaction-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Permission` VALUES (50, 'ReleaseNamespace', 'transaction-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Permission` VALUES (51, 'ModifyNamespace', 'transaction-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Permission` VALUES (52, 'ReleaseNamespace', 'transaction-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Permission` VALUES (53, 'ModifyNamespace', 'transaction-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Permission` VALUES (54, 'ReleaseNamespace', 'transaction-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Permission` VALUES (55, 'CreateCluster', 'uaa-service', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Permission` VALUES (56, 'CreateNamespace', 'uaa-service', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Permission` VALUES (57, 'AssignRole', 'uaa-service', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Permission` VALUES (58, 'ModifyNamespace', 'uaa-service+application', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Permission` VALUES (59, 'ReleaseNamespace', 'uaa-service+application', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Permission` VALUES (60, 'ModifyNamespace', 'uaa-service+application+DEV', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Permission` VALUES (61, 'ReleaseNamespace', 'uaa-service+application+DEV', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Permission` VALUES (62, 'ModifyNamespace', 'uaa-service+application+PRO', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Permission` VALUES (63, 'ReleaseNamespace', 'uaa-service+application+PRO', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Permission` VALUES (64, 'CreateNamespace', 'consumer-service', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Permission` VALUES (65, 'CreateCluster', 'consumer-service', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Permission` VALUES (66, 'AssignRole', 'consumer-service', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Permission` VALUES (67, 'ModifyNamespace', 'consumer-service+application', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Permission` VALUES (68, 'ReleaseNamespace', 'consumer-service+application', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Permission` VALUES (69, 'ModifyNamespace', 'consumer-service+application+DEV', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Permission` VALUES (70, 'ReleaseNamespace', 'consumer-service+application+DEV', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Permission` VALUES (71, 'ModifyNamespace', 'consumer-service+application+PRO', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Permission` VALUES (72, 'ReleaseNamespace', 'consumer-service+application+PRO', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Permission` VALUES (73, 'ModifyNamespace', 'account-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Permission` VALUES (74, 'ReleaseNamespace', 'account-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Permission` VALUES (75, 'ModifyNamespace', 'account-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Permission` VALUES (76, 'ReleaseNamespace', 'account-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Permission` VALUES (77, 'ModifyNamespace', 'account-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Permission` VALUES (78, 'ReleaseNamespace', 'account-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Permission` VALUES (79, 'ModifyNamespace', 'common-template+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Permission` VALUES (80, 'ReleaseNamespace', 'common-template+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Permission` VALUES (81, 'ModifyNamespace', 'common-template+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Permission` VALUES (82, 'ReleaseNamespace', 'common-template+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Permission` VALUES (83, 'ModifyNamespace', 'common-template+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Permission` VALUES (84, 'ReleaseNamespace', 'common-template+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Permission` VALUES (85, 'ModifyNamespace', 'common-template+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Permission` VALUES (86, 'ReleaseNamespace', 'common-template+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Permission` VALUES (87, 'ModifyNamespace', 'common-template+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Permission` VALUES (88, 'ReleaseNamespace', 'common-template+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Permission` VALUES (89, 'ModifyNamespace', 'common-template+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Permission` VALUES (90, 'ReleaseNamespace', 'common-template+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Permission` VALUES (91, 'ModifyNamespace', 'common-template+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Permission` VALUES (92, 'ReleaseNamespace', 'common-template+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Permission` VALUES (93, 'ModifyNamespace', 'common-template+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Permission` VALUES (94, 'ReleaseNamespace', 'common-template+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Permission` VALUES (95, 'ModifyNamespace', 'common-template+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Permission` VALUES (96, 'ReleaseNamespace', 'common-template+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Permission` VALUES (97, 'ModifyNamespace', 'account-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Permission` VALUES (98, 'ReleaseNamespace', 'account-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Permission` VALUES (99, 'ModifyNamespace', 'account-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Permission` VALUES (100, 'ReleaseNamespace', 'account-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Permission` VALUES (101, 'ModifyNamespace', 'account-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Permission` VALUES (102, 'ReleaseNamespace', 'account-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Permission` VALUES (103, 'ModifyNamespace', 'account-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Permission` VALUES (104, 'ReleaseNamespace', 'account-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Permission` VALUES (105, 'ModifyNamespace', 'account-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Permission` VALUES (106, 'ReleaseNamespace', 'account-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Permission` VALUES (107, 'ModifyNamespace', 'account-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Permission` VALUES (108, 'ReleaseNamespace', 'account-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Permission` VALUES (109, 'ModifyNamespace', 'account-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Permission` VALUES (110, 'ReleaseNamespace', 'account-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Permission` VALUES (111, 'ModifyNamespace', 'account-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Permission` VALUES (112, 'ReleaseNamespace', 'account-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Permission` VALUES (113, 'ModifyNamespace', 'account-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Permission` VALUES (114, 'ReleaseNamespace', 'account-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Permission` VALUES (115, 'ModifyNamespace', 'transaction-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Permission` VALUES (116, 'ReleaseNamespace', 'transaction-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Permission` VALUES (117, 'ModifyNamespace', 'transaction-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Permission` VALUES (118, 'ReleaseNamespace', 'transaction-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Permission` VALUES (119, 'ModifyNamespace', 'transaction-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Permission` VALUES (120, 'ReleaseNamespace', 'transaction-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Permission` VALUES (121, 'ModifyNamespace', 'transaction-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Permission` VALUES (122, 'ReleaseNamespace', 'transaction-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Permission` VALUES (123, 'ModifyNamespace', 'transaction-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Permission` VALUES (124, 'ReleaseNamespace', 'transaction-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Permission` VALUES (125, 'ModifyNamespace', 'transaction-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Permission` VALUES (126, 'ReleaseNamespace', 'transaction-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Permission` VALUES (127, 'ModifyNamespace', 'transaction-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Permission` VALUES (128, 'ReleaseNamespace', 'transaction-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Permission` VALUES (129, 'ModifyNamespace', 'transaction-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Permission` VALUES (130, 'ReleaseNamespace', 'transaction-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Permission` VALUES (131, 'ModifyNamespace', 'transaction-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Permission` VALUES (132, 'ReleaseNamespace', 'transaction-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Permission` VALUES (133, 'ModifyNamespace', 'transaction-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Permission` VALUES (134, 'ReleaseNamespace', 'transaction-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Permission` VALUES (135, 'ModifyNamespace', 'transaction-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Permission` VALUES (136, 'ReleaseNamespace', 'transaction-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Permission` VALUES (137, 'ModifyNamespace', 'transaction-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Permission` VALUES (138, 'ReleaseNamespace', 'transaction-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Permission` VALUES (139, 'ModifyNamespace', 'uaa-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Permission` VALUES (140, 'ReleaseNamespace', 'uaa-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Permission` VALUES (141, 'ModifyNamespace', 'uaa-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Permission` VALUES (142, 'ReleaseNamespace', 'uaa-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Permission` VALUES (143, 'ModifyNamespace', 'uaa-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Permission` VALUES (144, 'ReleaseNamespace', 'uaa-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Permission` VALUES (145, 'ModifyNamespace', 'uaa-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Permission` VALUES (146, 'ReleaseNamespace', 'uaa-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Permission` VALUES (147, 'ModifyNamespace', 'uaa-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Permission` VALUES (148, 'ReleaseNamespace', 'uaa-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Permission` VALUES (149, 'ModifyNamespace', 'uaa-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Permission` VALUES (150, 'ReleaseNamespace', 'uaa-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Permission` VALUES (151, 'ModifyNamespace', 'uaa-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Permission` VALUES (152, 'ReleaseNamespace', 'uaa-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Permission` VALUES (153, 'ModifyNamespace', 'uaa-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Permission` VALUES (154, 'ReleaseNamespace', 'uaa-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Permission` VALUES (155, 'ModifyNamespace', 'uaa-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Permission` VALUES (156, 'ReleaseNamespace', 'uaa-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Permission` VALUES (157, 'ModifyNamespace', 'uaa-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Permission` VALUES (158, 'ReleaseNamespace', 'uaa-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Permission` VALUES (159, 'ModifyNamespace', 'uaa-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Permission` VALUES (160, 'ReleaseNamespace', 'uaa-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Permission` VALUES (161, 'ModifyNamespace', 'uaa-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Permission` VALUES (162, 'ReleaseNamespace', 'uaa-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Permission` VALUES (163, 'ModifyNamespace', 'uaa-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Permission` VALUES (164, 'ReleaseNamespace', 'uaa-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Permission` VALUES (165, 'ModifyNamespace', 'uaa-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Permission` VALUES (166, 'ReleaseNamespace', 'uaa-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Permission` VALUES (167, 'ModifyNamespace', 'uaa-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Permission` VALUES (168, 'ReleaseNamespace', 'uaa-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Permission` VALUES (169, 'ModifyNamespace', 'consumer-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Permission` VALUES (170, 'ReleaseNamespace', 'consumer-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Permission` VALUES (171, 'ModifyNamespace', 'consumer-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Permission` VALUES (172, 'ReleaseNamespace', 'consumer-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Permission` VALUES (173, 'ModifyNamespace', 'consumer-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Permission` VALUES (174, 'ReleaseNamespace', 'consumer-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Permission` VALUES (175, 'ModifyNamespace', 'consumer-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Permission` VALUES (176, 'ReleaseNamespace', 'consumer-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Permission` VALUES (177, 'ModifyNamespace', 'consumer-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Permission` VALUES (178, 'ReleaseNamespace', 'consumer-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Permission` VALUES (179, 'ModifyNamespace', 'consumer-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Permission` VALUES (180, 'ReleaseNamespace', 'consumer-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Permission` VALUES (181, 'ModifyNamespace', 'consumer-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Permission` VALUES (182, 'ReleaseNamespace', 'consumer-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Permission` VALUES (183, 'ModifyNamespace', 'consumer-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Permission` VALUES (184, 'ReleaseNamespace', 'consumer-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Permission` VALUES (185, 'ModifyNamespace', 'consumer-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Permission` VALUES (186, 'ReleaseNamespace', 'consumer-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Permission` VALUES (187, 'ModifyNamespace', 'consumer-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Permission` VALUES (188, 'ReleaseNamespace', 'consumer-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Permission` VALUES (189, 'ModifyNamespace', 'consumer-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Permission` VALUES (190, 'ReleaseNamespace', 'consumer-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Permission` VALUES (191, 'ModifyNamespace', 'consumer-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Permission` VALUES (192, 'ReleaseNamespace', 'consumer-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Permission` VALUES (193, 'ModifyNamespace', 'consumer-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `Permission` VALUES (194, 'ReleaseNamespace', 'consumer-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `Permission` VALUES (195, 'ModifyNamespace', 'consumer-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `Permission` VALUES (196, 'ReleaseNamespace', 'consumer-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `Permission` VALUES (197, 'ModifyNamespace', 'consumer-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `Permission` VALUES (198, 'ReleaseNamespace', 'consumer-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
COMMIT;

-- ----------------------------
-- Table structure for Role
-- ----------------------------
DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_RoleName` (`RoleName`(191)),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of Role
-- ----------------------------
BEGIN;
INSERT INTO `Role` VALUES (1, 'Master+apollo-quickstart', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Role` VALUES (2, 'ModifyNamespace+apollo-quickstart+application', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Role` VALUES (3, 'ReleaseNamespace+apollo-quickstart+application', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Role` VALUES (4, 'ModifyNamespace+apollo-quickstart+application+DEV', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Role` VALUES (5, 'ReleaseNamespace+apollo-quickstart+application+DEV', b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `Role` VALUES (6, 'Master+account-service', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Role` VALUES (7, 'ModifyNamespace+account-service+application', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Role` VALUES (8, 'ReleaseNamespace+account-service+application', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Role` VALUES (9, 'ModifyNamespace+account-service+application+DEV', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Role` VALUES (10, 'ReleaseNamespace+account-service+application+DEV', b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `Role` VALUES (11, 'ModifyNamespace+account-service+spring-rocketmq', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `Role` VALUES (12, 'ReleaseNamespace+account-service+spring-rocketmq', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `Role` VALUES (13, 'ModifyNamespace+account-service+spring-rocketmq+DEV', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `Role` VALUES (14, 'ReleaseNamespace+account-service+spring-rocketmq+DEV', b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `Role` VALUES (15, 'Master+common-template', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Role` VALUES (16, 'ModifyNamespace+common-template+application', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Role` VALUES (17, 'ReleaseNamespace+common-template+application', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Role` VALUES (18, 'ModifyNamespace+common-template+application+DEV', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Role` VALUES (19, 'ReleaseNamespace+common-template+application+DEV', b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `Role` VALUES (20, 'ModifyNamespace+common-template+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `Role` VALUES (21, 'ReleaseNamespace+common-template+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `Role` VALUES (22, 'ModifyNamespace+common-template+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `Role` VALUES (23, 'ReleaseNamespace+common-template+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `Role` VALUES (24, 'ModifyNamespace+account-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `Role` VALUES (25, 'ReleaseNamespace+account-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `Role` VALUES (26, 'ModifyNamespace+account-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `Role` VALUES (27, 'ReleaseNamespace+account-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `Role` VALUES (28, 'ModifyNamespace+apollo-quickstart+application+PRO', b'0', 'apollo', '2019-09-17 16:36:26', 'apollo', '2019-09-17 16:36:26');
INSERT INTO `Role` VALUES (29, 'ReleaseNamespace+apollo-quickstart+application+PRO', b'0', 'apollo', '2019-09-17 16:36:26', 'apollo', '2019-09-17 16:36:26');
INSERT INTO `Role` VALUES (30, 'ModifyNamespace+common-template+application+PRO', b'0', 'apollo', '2019-09-17 16:36:51', 'apollo', '2019-09-17 16:36:51');
INSERT INTO `Role` VALUES (31, 'ReleaseNamespace+common-template+application+PRO', b'0', 'apollo', '2019-09-17 16:36:51', 'apollo', '2019-09-17 16:36:51');
INSERT INTO `Role` VALUES (32, 'ModifyNamespace+account-service+application+PRO', b'0', 'apollo', '2019-09-17 16:53:45', 'apollo', '2019-09-17 16:53:45');
INSERT INTO `Role` VALUES (33, 'ReleaseNamespace+account-service+application+PRO', b'0', 'apollo', '2019-09-17 16:53:45', 'apollo', '2019-09-17 16:53:45');
INSERT INTO `Role` VALUES (34, 'Master+transaction-service', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Role` VALUES (35, 'ModifyNamespace+transaction-service+application', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Role` VALUES (36, 'ReleaseNamespace+transaction-service+application', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Role` VALUES (37, 'ModifyNamespace+transaction-service+application+DEV', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Role` VALUES (38, 'ReleaseNamespace+transaction-service+application+DEV', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Role` VALUES (39, 'ModifyNamespace+transaction-service+application+PRO', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Role` VALUES (40, 'ReleaseNamespace+transaction-service+application+PRO', b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `Role` VALUES (41, 'ModifyNamespace+transaction-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Role` VALUES (42, 'ReleaseNamespace+transaction-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Role` VALUES (43, 'ModifyNamespace+transaction-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Role` VALUES (44, 'ReleaseNamespace+transaction-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Role` VALUES (45, 'ModifyNamespace+transaction-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Role` VALUES (46, 'ReleaseNamespace+transaction-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `Role` VALUES (47, 'Master+uaa-service', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Role` VALUES (48, 'ModifyNamespace+uaa-service+application', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Role` VALUES (49, 'ReleaseNamespace+uaa-service+application', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Role` VALUES (50, 'ModifyNamespace+uaa-service+application+DEV', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Role` VALUES (51, 'ReleaseNamespace+uaa-service+application+DEV', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Role` VALUES (52, 'ModifyNamespace+uaa-service+application+PRO', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Role` VALUES (53, 'ReleaseNamespace+uaa-service+application+PRO', b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `Role` VALUES (54, 'Master+consumer-service', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Role` VALUES (55, 'ModifyNamespace+consumer-service+application', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Role` VALUES (56, 'ReleaseNamespace+consumer-service+application', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Role` VALUES (57, 'ModifyNamespace+consumer-service+application+DEV', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Role` VALUES (58, 'ReleaseNamespace+consumer-service+application+DEV', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Role` VALUES (59, 'ModifyNamespace+consumer-service+application+PRO', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Role` VALUES (60, 'ReleaseNamespace+consumer-service+application+PRO', b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `Role` VALUES (61, 'ModifyNamespace+account-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Role` VALUES (62, 'ReleaseNamespace+account-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Role` VALUES (63, 'ModifyNamespace+account-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Role` VALUES (64, 'ReleaseNamespace+account-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Role` VALUES (65, 'ModifyNamespace+account-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Role` VALUES (66, 'ReleaseNamespace+account-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `Role` VALUES (67, 'ModifyNamespace+common-template+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Role` VALUES (68, 'ReleaseNamespace+common-template+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Role` VALUES (69, 'ModifyNamespace+common-template+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Role` VALUES (70, 'ReleaseNamespace+common-template+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Role` VALUES (71, 'ModifyNamespace+common-template+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Role` VALUES (72, 'ReleaseNamespace+common-template+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `Role` VALUES (73, 'ModifyNamespace+common-template+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Role` VALUES (74, 'ReleaseNamespace+common-template+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Role` VALUES (75, 'ModifyNamespace+common-template+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Role` VALUES (76, 'ReleaseNamespace+common-template+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Role` VALUES (77, 'ModifyNamespace+common-template+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Role` VALUES (78, 'ReleaseNamespace+common-template+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `Role` VALUES (79, 'ModifyNamespace+common-template+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Role` VALUES (80, 'ReleaseNamespace+common-template+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Role` VALUES (81, 'ModifyNamespace+common-template+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Role` VALUES (82, 'ReleaseNamespace+common-template+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Role` VALUES (83, 'ModifyNamespace+common-template+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Role` VALUES (84, 'ReleaseNamespace+common-template+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `Role` VALUES (85, 'ModifyNamespace+account-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Role` VALUES (86, 'ReleaseNamespace+account-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Role` VALUES (87, 'ModifyNamespace+account-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Role` VALUES (88, 'ReleaseNamespace+account-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Role` VALUES (89, 'ModifyNamespace+account-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Role` VALUES (90, 'ReleaseNamespace+account-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `Role` VALUES (91, 'ModifyNamespace+account-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Role` VALUES (92, 'ReleaseNamespace+account-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Role` VALUES (93, 'ModifyNamespace+account-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Role` VALUES (94, 'ReleaseNamespace+account-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Role` VALUES (95, 'ModifyNamespace+account-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Role` VALUES (96, 'ReleaseNamespace+account-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `Role` VALUES (97, 'ModifyNamespace+account-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Role` VALUES (98, 'ReleaseNamespace+account-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Role` VALUES (99, 'ModifyNamespace+account-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Role` VALUES (100, 'ReleaseNamespace+account-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Role` VALUES (101, 'ModifyNamespace+account-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Role` VALUES (102, 'ReleaseNamespace+account-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `Role` VALUES (103, 'ModifyNamespace+transaction-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Role` VALUES (104, 'ReleaseNamespace+transaction-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Role` VALUES (105, 'ModifyNamespace+transaction-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Role` VALUES (106, 'ReleaseNamespace+transaction-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Role` VALUES (107, 'ModifyNamespace+transaction-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Role` VALUES (108, 'ReleaseNamespace+transaction-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `Role` VALUES (109, 'ModifyNamespace+transaction-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Role` VALUES (110, 'ReleaseNamespace+transaction-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Role` VALUES (111, 'ModifyNamespace+transaction-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Role` VALUES (112, 'ReleaseNamespace+transaction-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Role` VALUES (113, 'ModifyNamespace+transaction-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Role` VALUES (114, 'ReleaseNamespace+transaction-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `Role` VALUES (115, 'ModifyNamespace+transaction-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Role` VALUES (116, 'ReleaseNamespace+transaction-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Role` VALUES (117, 'ModifyNamespace+transaction-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Role` VALUES (118, 'ReleaseNamespace+transaction-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Role` VALUES (119, 'ModifyNamespace+transaction-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Role` VALUES (120, 'ReleaseNamespace+transaction-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `Role` VALUES (121, 'ModifyNamespace+transaction-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Role` VALUES (122, 'ReleaseNamespace+transaction-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Role` VALUES (123, 'ModifyNamespace+transaction-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Role` VALUES (124, 'ReleaseNamespace+transaction-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Role` VALUES (125, 'ModifyNamespace+transaction-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Role` VALUES (126, 'ReleaseNamespace+transaction-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `Role` VALUES (127, 'ModifyNamespace+uaa-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Role` VALUES (128, 'ReleaseNamespace+uaa-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Role` VALUES (129, 'ModifyNamespace+uaa-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Role` VALUES (130, 'ReleaseNamespace+uaa-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Role` VALUES (131, 'ModifyNamespace+uaa-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Role` VALUES (132, 'ReleaseNamespace+uaa-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `Role` VALUES (133, 'ModifyNamespace+uaa-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Role` VALUES (134, 'ReleaseNamespace+uaa-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Role` VALUES (135, 'ModifyNamespace+uaa-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Role` VALUES (136, 'ReleaseNamespace+uaa-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Role` VALUES (137, 'ModifyNamespace+uaa-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Role` VALUES (138, 'ReleaseNamespace+uaa-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `Role` VALUES (139, 'ModifyNamespace+uaa-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Role` VALUES (140, 'ReleaseNamespace+uaa-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Role` VALUES (141, 'ModifyNamespace+uaa-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Role` VALUES (142, 'ReleaseNamespace+uaa-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Role` VALUES (143, 'ModifyNamespace+uaa-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Role` VALUES (144, 'ReleaseNamespace+uaa-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `Role` VALUES (145, 'ModifyNamespace+uaa-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Role` VALUES (146, 'ReleaseNamespace+uaa-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Role` VALUES (147, 'ModifyNamespace+uaa-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Role` VALUES (148, 'ReleaseNamespace+uaa-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Role` VALUES (149, 'ModifyNamespace+uaa-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Role` VALUES (150, 'ReleaseNamespace+uaa-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `Role` VALUES (151, 'ModifyNamespace+uaa-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Role` VALUES (152, 'ReleaseNamespace+uaa-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Role` VALUES (153, 'ModifyNamespace+uaa-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Role` VALUES (154, 'ReleaseNamespace+uaa-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Role` VALUES (155, 'ModifyNamespace+uaa-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Role` VALUES (156, 'ReleaseNamespace+uaa-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `Role` VALUES (157, 'ModifyNamespace+consumer-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Role` VALUES (158, 'ReleaseNamespace+consumer-service+micro_service.spring-boot-http', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Role` VALUES (159, 'ModifyNamespace+consumer-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Role` VALUES (160, 'ReleaseNamespace+consumer-service+micro_service.spring-boot-http+DEV', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Role` VALUES (161, 'ModifyNamespace+consumer-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Role` VALUES (162, 'ReleaseNamespace+consumer-service+micro_service.spring-boot-http+PRO', b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `Role` VALUES (163, 'ModifyNamespace+consumer-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Role` VALUES (164, 'ReleaseNamespace+consumer-service+micro_service.spring-boot-druid', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Role` VALUES (165, 'ModifyNamespace+consumer-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Role` VALUES (166, 'ReleaseNamespace+consumer-service+micro_service.spring-boot-druid+DEV', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Role` VALUES (167, 'ModifyNamespace+consumer-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Role` VALUES (168, 'ReleaseNamespace+consumer-service+micro_service.spring-boot-druid+PRO', b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `Role` VALUES (169, 'ModifyNamespace+consumer-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Role` VALUES (170, 'ReleaseNamespace+consumer-service+micro_service.spring-eureka', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Role` VALUES (171, 'ModifyNamespace+consumer-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Role` VALUES (172, 'ReleaseNamespace+consumer-service+micro_service.spring-eureka+DEV', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Role` VALUES (173, 'ModifyNamespace+consumer-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Role` VALUES (174, 'ReleaseNamespace+consumer-service+micro_service.spring-eureka+PRO', b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `Role` VALUES (175, 'ModifyNamespace+consumer-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Role` VALUES (176, 'ReleaseNamespace+consumer-service+micro_service.spring-cloud-feign', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Role` VALUES (177, 'ModifyNamespace+consumer-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Role` VALUES (178, 'ReleaseNamespace+consumer-service+micro_service.spring-cloud-feign+DEV', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Role` VALUES (179, 'ModifyNamespace+consumer-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Role` VALUES (180, 'ReleaseNamespace+consumer-service+micro_service.spring-cloud-feign+PRO', b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `Role` VALUES (181, 'ModifyNamespace+consumer-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `Role` VALUES (182, 'ReleaseNamespace+consumer-service+micro_service.spring-boot-redis', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `Role` VALUES (183, 'ModifyNamespace+consumer-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `Role` VALUES (184, 'ReleaseNamespace+consumer-service+micro_service.spring-boot-redis+DEV', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `Role` VALUES (185, 'ModifyNamespace+consumer-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `Role` VALUES (186, 'ReleaseNamespace+consumer-service+micro_service.spring-boot-redis+PRO', b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
COMMIT;

-- ----------------------------
-- Table structure for RolePermission
-- ----------------------------
DROP TABLE IF EXISTS `RolePermission`;
CREATE TABLE `RolePermission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) unsigned DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_PermissionId` (`PermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COMMENT='角色和权限的绑定表';

-- ----------------------------
-- Records of RolePermission
-- ----------------------------
BEGIN;
INSERT INTO `RolePermission` VALUES (1, 1, 1, b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `RolePermission` VALUES (2, 1, 2, b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `RolePermission` VALUES (3, 1, 3, b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `RolePermission` VALUES (4, 2, 4, b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `RolePermission` VALUES (5, 3, 5, b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `RolePermission` VALUES (6, 4, 6, b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `RolePermission` VALUES (7, 5, 7, b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `RolePermission` VALUES (8, 6, 8, b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `RolePermission` VALUES (9, 6, 9, b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `RolePermission` VALUES (10, 6, 10, b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `RolePermission` VALUES (11, 7, 11, b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `RolePermission` VALUES (12, 8, 12, b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `RolePermission` VALUES (13, 9, 13, b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `RolePermission` VALUES (14, 10, 14, b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `RolePermission` VALUES (15, 11, 15, b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `RolePermission` VALUES (16, 12, 16, b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `RolePermission` VALUES (17, 13, 17, b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `RolePermission` VALUES (18, 14, 18, b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `RolePermission` VALUES (19, 15, 19, b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `RolePermission` VALUES (20, 15, 20, b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `RolePermission` VALUES (21, 15, 21, b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `RolePermission` VALUES (22, 16, 22, b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `RolePermission` VALUES (23, 17, 23, b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `RolePermission` VALUES (24, 18, 24, b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `RolePermission` VALUES (25, 19, 25, b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `RolePermission` VALUES (26, 20, 26, b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `RolePermission` VALUES (27, 21, 27, b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `RolePermission` VALUES (28, 22, 28, b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `RolePermission` VALUES (29, 23, 29, b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `RolePermission` VALUES (30, 24, 30, b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `RolePermission` VALUES (31, 25, 31, b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `RolePermission` VALUES (32, 26, 32, b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `RolePermission` VALUES (33, 27, 33, b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `RolePermission` VALUES (34, 28, 34, b'0', 'apollo', '2019-09-17 16:36:26', 'apollo', '2019-09-17 16:36:26');
INSERT INTO `RolePermission` VALUES (35, 29, 35, b'0', 'apollo', '2019-09-17 16:36:26', 'apollo', '2019-09-17 16:36:26');
INSERT INTO `RolePermission` VALUES (36, 30, 36, b'0', 'apollo', '2019-09-17 16:36:51', 'apollo', '2019-09-17 16:36:51');
INSERT INTO `RolePermission` VALUES (37, 31, 37, b'0', 'apollo', '2019-09-17 16:36:51', 'apollo', '2019-09-17 16:36:51');
INSERT INTO `RolePermission` VALUES (38, 32, 38, b'0', 'apollo', '2019-09-17 16:53:45', 'apollo', '2019-09-17 16:53:45');
INSERT INTO `RolePermission` VALUES (39, 33, 39, b'0', 'apollo', '2019-09-17 16:53:45', 'apollo', '2019-09-17 16:53:45');
INSERT INTO `RolePermission` VALUES (40, 34, 40, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `RolePermission` VALUES (41, 34, 41, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `RolePermission` VALUES (42, 34, 42, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `RolePermission` VALUES (43, 35, 43, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `RolePermission` VALUES (44, 36, 44, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `RolePermission` VALUES (45, 37, 45, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `RolePermission` VALUES (46, 38, 46, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `RolePermission` VALUES (47, 39, 47, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `RolePermission` VALUES (48, 40, 48, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `RolePermission` VALUES (49, 41, 49, b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `RolePermission` VALUES (50, 42, 50, b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `RolePermission` VALUES (51, 43, 51, b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `RolePermission` VALUES (52, 44, 52, b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `RolePermission` VALUES (53, 45, 53, b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `RolePermission` VALUES (54, 46, 54, b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `RolePermission` VALUES (55, 47, 55, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `RolePermission` VALUES (56, 47, 56, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `RolePermission` VALUES (57, 47, 57, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `RolePermission` VALUES (58, 48, 58, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `RolePermission` VALUES (59, 49, 59, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `RolePermission` VALUES (60, 50, 60, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `RolePermission` VALUES (61, 51, 61, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `RolePermission` VALUES (62, 52, 62, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `RolePermission` VALUES (63, 53, 63, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `RolePermission` VALUES (64, 54, 64, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `RolePermission` VALUES (65, 54, 65, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `RolePermission` VALUES (66, 54, 66, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `RolePermission` VALUES (67, 55, 67, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `RolePermission` VALUES (68, 56, 68, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `RolePermission` VALUES (69, 57, 69, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `RolePermission` VALUES (70, 58, 70, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `RolePermission` VALUES (71, 59, 71, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `RolePermission` VALUES (72, 60, 72, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `RolePermission` VALUES (73, 61, 73, b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `RolePermission` VALUES (74, 62, 74, b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `RolePermission` VALUES (75, 63, 75, b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `RolePermission` VALUES (76, 64, 76, b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `RolePermission` VALUES (77, 65, 77, b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `RolePermission` VALUES (78, 66, 78, b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `RolePermission` VALUES (79, 67, 79, b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `RolePermission` VALUES (80, 68, 80, b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `RolePermission` VALUES (81, 69, 81, b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `RolePermission` VALUES (82, 70, 82, b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `RolePermission` VALUES (83, 71, 83, b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `RolePermission` VALUES (84, 72, 84, b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `RolePermission` VALUES (85, 73, 85, b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `RolePermission` VALUES (86, 74, 86, b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `RolePermission` VALUES (87, 75, 87, b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `RolePermission` VALUES (88, 76, 88, b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `RolePermission` VALUES (89, 77, 89, b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `RolePermission` VALUES (90, 78, 90, b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `RolePermission` VALUES (91, 79, 91, b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `RolePermission` VALUES (92, 80, 92, b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `RolePermission` VALUES (93, 81, 93, b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `RolePermission` VALUES (94, 82, 94, b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `RolePermission` VALUES (95, 83, 95, b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `RolePermission` VALUES (96, 84, 96, b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `RolePermission` VALUES (97, 85, 97, b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `RolePermission` VALUES (98, 86, 98, b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `RolePermission` VALUES (99, 87, 99, b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `RolePermission` VALUES (100, 88, 100, b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `RolePermission` VALUES (101, 89, 101, b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `RolePermission` VALUES (102, 90, 102, b'0', 'apollo', '2019-09-20 11:09:04', 'apollo', '2019-09-20 11:09:04');
INSERT INTO `RolePermission` VALUES (103, 91, 103, b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `RolePermission` VALUES (104, 92, 104, b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `RolePermission` VALUES (105, 93, 105, b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `RolePermission` VALUES (106, 94, 106, b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `RolePermission` VALUES (107, 95, 107, b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `RolePermission` VALUES (108, 96, 108, b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `RolePermission` VALUES (109, 97, 109, b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `RolePermission` VALUES (110, 98, 110, b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `RolePermission` VALUES (111, 99, 111, b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `RolePermission` VALUES (112, 100, 112, b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `RolePermission` VALUES (113, 101, 113, b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `RolePermission` VALUES (114, 102, 114, b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `RolePermission` VALUES (115, 103, 115, b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `RolePermission` VALUES (116, 104, 116, b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `RolePermission` VALUES (117, 105, 117, b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `RolePermission` VALUES (118, 106, 118, b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `RolePermission` VALUES (119, 107, 119, b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `RolePermission` VALUES (120, 108, 120, b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `RolePermission` VALUES (121, 109, 121, b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `RolePermission` VALUES (122, 110, 122, b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `RolePermission` VALUES (123, 111, 123, b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `RolePermission` VALUES (124, 112, 124, b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `RolePermission` VALUES (125, 113, 125, b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `RolePermission` VALUES (126, 114, 126, b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `RolePermission` VALUES (127, 115, 127, b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `RolePermission` VALUES (128, 116, 128, b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `RolePermission` VALUES (129, 117, 129, b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `RolePermission` VALUES (130, 118, 130, b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `RolePermission` VALUES (131, 119, 131, b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `RolePermission` VALUES (132, 120, 132, b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `RolePermission` VALUES (133, 121, 133, b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `RolePermission` VALUES (134, 122, 134, b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `RolePermission` VALUES (135, 123, 135, b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `RolePermission` VALUES (136, 124, 136, b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `RolePermission` VALUES (137, 125, 137, b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `RolePermission` VALUES (138, 126, 138, b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `RolePermission` VALUES (139, 127, 139, b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `RolePermission` VALUES (140, 128, 140, b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `RolePermission` VALUES (141, 129, 141, b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `RolePermission` VALUES (142, 130, 142, b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `RolePermission` VALUES (143, 131, 143, b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `RolePermission` VALUES (144, 132, 144, b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `RolePermission` VALUES (145, 133, 145, b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `RolePermission` VALUES (146, 134, 146, b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `RolePermission` VALUES (147, 135, 147, b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `RolePermission` VALUES (148, 136, 148, b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `RolePermission` VALUES (149, 137, 149, b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `RolePermission` VALUES (150, 138, 150, b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `RolePermission` VALUES (151, 139, 151, b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `RolePermission` VALUES (152, 140, 152, b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `RolePermission` VALUES (153, 141, 153, b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `RolePermission` VALUES (154, 142, 154, b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `RolePermission` VALUES (155, 143, 155, b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `RolePermission` VALUES (156, 144, 156, b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `RolePermission` VALUES (157, 145, 157, b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `RolePermission` VALUES (158, 146, 158, b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `RolePermission` VALUES (159, 147, 159, b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `RolePermission` VALUES (160, 148, 160, b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `RolePermission` VALUES (161, 149, 161, b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `RolePermission` VALUES (162, 150, 162, b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `RolePermission` VALUES (163, 151, 163, b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `RolePermission` VALUES (164, 152, 164, b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `RolePermission` VALUES (165, 153, 165, b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `RolePermission` VALUES (166, 154, 166, b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `RolePermission` VALUES (167, 155, 167, b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `RolePermission` VALUES (168, 156, 168, b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `RolePermission` VALUES (169, 157, 169, b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `RolePermission` VALUES (170, 158, 170, b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `RolePermission` VALUES (171, 159, 171, b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `RolePermission` VALUES (172, 160, 172, b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `RolePermission` VALUES (173, 161, 173, b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `RolePermission` VALUES (174, 162, 174, b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `RolePermission` VALUES (175, 163, 175, b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `RolePermission` VALUES (176, 164, 176, b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `RolePermission` VALUES (177, 165, 177, b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `RolePermission` VALUES (178, 166, 178, b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `RolePermission` VALUES (179, 167, 179, b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `RolePermission` VALUES (180, 168, 180, b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `RolePermission` VALUES (181, 169, 181, b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `RolePermission` VALUES (182, 170, 182, b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `RolePermission` VALUES (183, 171, 183, b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `RolePermission` VALUES (184, 172, 184, b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `RolePermission` VALUES (185, 173, 185, b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `RolePermission` VALUES (186, 174, 186, b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `RolePermission` VALUES (187, 175, 187, b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `RolePermission` VALUES (188, 176, 188, b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `RolePermission` VALUES (189, 177, 189, b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `RolePermission` VALUES (190, 178, 190, b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `RolePermission` VALUES (191, 179, 191, b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `RolePermission` VALUES (192, 180, 192, b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `RolePermission` VALUES (193, 181, 193, b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `RolePermission` VALUES (194, 182, 194, b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `RolePermission` VALUES (195, 183, 195, b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `RolePermission` VALUES (196, 184, 196, b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `RolePermission` VALUES (197, 185, 197, b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `RolePermission` VALUES (198, 186, 198, b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
COMMIT;

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Key` (`Key`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
BEGIN;
INSERT INTO `ServerConfig` VALUES (1, 'apollo.portal.envs', 'dev,pro', '可支持的环境列表', b'0', 'default', '2019-09-16 16:12:01', 'apollo', '2019-09-17 15:53:45');
INSERT INTO `ServerConfig` VALUES (2, 'organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"},{\"orgId\":\"micro_service\",\"orgName\":\"微服务部门\"}]', '部门列表', b'0', 'default', '2019-09-16 16:12:01', 'apollo', '2019-09-17 11:32:03');
INSERT INTO `ServerConfig` VALUES (3, 'superAdmin', 'apollo', 'Portal超级管理员', b'0', 'default', '2019-09-16 16:12:01', '', '2019-09-16 16:12:01');
INSERT INTO `ServerConfig` VALUES (4, 'api.readTimeout', '10000', 'http接口read timeout', b'0', 'default', '2019-09-16 16:12:01', '', '2019-09-16 16:12:01');
INSERT INTO `ServerConfig` VALUES (5, 'consumer.token.salt', 'someSalt', 'consumer token salt', b'0', 'default', '2019-09-16 16:12:01', '', '2019-09-16 16:12:01');
INSERT INTO `ServerConfig` VALUES (6, 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', b'0', 'default', '2019-09-16 16:12:01', '', '2019-09-16 16:12:01');
INSERT INTO `ServerConfig` VALUES (7, 'configView.memberOnly.envs', 'pro', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', b'0', 'default', '2019-09-16 16:12:01', '', '2019-09-16 16:12:01');
COMMIT;

-- ----------------------------
-- Table structure for UserRole
-- ----------------------------
DROP TABLE IF EXISTS `UserRole`;
CREATE TABLE `UserRole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_UserId_RoleId` (`UserId`,`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COMMENT='用户和role的绑定表';

-- ----------------------------
-- Records of UserRole
-- ----------------------------
BEGIN;
INSERT INTO `UserRole` VALUES (1, 'apollo', 1, b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `UserRole` VALUES (2, 'apollo', 2, b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `UserRole` VALUES (3, 'apollo', 3, b'0', 'apollo', '2019-09-16 16:30:40', 'apollo', '2019-09-16 16:30:40');
INSERT INTO `UserRole` VALUES (4, 'apollo', 6, b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `UserRole` VALUES (5, 'apollo', 7, b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `UserRole` VALUES (6, 'apollo', 8, b'0', 'apollo', '2019-09-17 11:33:41', 'apollo', '2019-09-17 11:33:41');
INSERT INTO `UserRole` VALUES (7, 'apollo', 11, b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `UserRole` VALUES (8, 'apollo', 12, b'0', 'apollo', '2019-09-17 11:42:23', 'apollo', '2019-09-17 11:42:23');
INSERT INTO `UserRole` VALUES (9, 'apollo', 15, b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `UserRole` VALUES (10, 'apollo', 16, b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `UserRole` VALUES (11, 'apollo', 17, b'0', 'apollo', '2019-09-17 14:14:07', 'apollo', '2019-09-17 14:14:07');
INSERT INTO `UserRole` VALUES (12, 'apollo', 20, b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `UserRole` VALUES (13, 'apollo', 21, b'0', 'apollo', '2019-09-17 14:16:13', 'apollo', '2019-09-17 14:16:13');
INSERT INTO `UserRole` VALUES (14, 'apollo', 24, b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `UserRole` VALUES (15, 'apollo', 25, b'0', 'apollo', '2019-09-17 14:20:54', 'apollo', '2019-09-17 14:20:54');
INSERT INTO `UserRole` VALUES (16, 'apollo', 34, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `UserRole` VALUES (17, 'apollo', 35, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `UserRole` VALUES (18, 'apollo', 36, b'0', 'apollo', '2019-09-17 17:18:13', 'apollo', '2019-09-17 17:18:13');
INSERT INTO `UserRole` VALUES (19, 'apollo', 41, b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `UserRole` VALUES (20, 'apollo', 42, b'0', 'apollo', '2019-09-17 17:19:21', 'apollo', '2019-09-17 17:19:21');
INSERT INTO `UserRole` VALUES (21, 'apollo', 47, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `UserRole` VALUES (22, 'apollo', 48, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `UserRole` VALUES (23, 'apollo', 49, b'0', 'apollo', '2019-09-19 18:21:21', 'apollo', '2019-09-19 18:21:21');
INSERT INTO `UserRole` VALUES (24, 'apollo', 54, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `UserRole` VALUES (25, 'apollo', 55, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `UserRole` VALUES (26, 'apollo', 56, b'0', 'apollo', '2019-09-19 18:21:44', 'apollo', '2019-09-19 18:21:44');
INSERT INTO `UserRole` VALUES (27, 'apollo', 61, b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `UserRole` VALUES (28, 'apollo', 62, b'0', 'apollo', '2019-09-19 18:44:33', 'apollo', '2019-09-19 18:44:33');
INSERT INTO `UserRole` VALUES (29, 'apollo', 67, b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `UserRole` VALUES (30, 'apollo', 68, b'0', 'apollo', '2019-09-20 11:02:20', 'apollo', '2019-09-20 11:02:20');
INSERT INTO `UserRole` VALUES (31, 'apollo', 73, b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `UserRole` VALUES (32, 'apollo', 74, b'0', 'apollo', '2019-09-20 11:03:08', 'apollo', '2019-09-20 11:03:08');
INSERT INTO `UserRole` VALUES (33, 'apollo', 79, b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `UserRole` VALUES (34, 'apollo', 80, b'0', 'apollo', '2019-09-20 11:04:34', 'apollo', '2019-09-20 11:04:34');
INSERT INTO `UserRole` VALUES (35, 'apollo', 85, b'0', 'apollo', '2019-09-20 11:09:05', 'apollo', '2019-09-20 11:09:05');
INSERT INTO `UserRole` VALUES (36, 'apollo', 86, b'0', 'apollo', '2019-09-20 11:09:05', 'apollo', '2019-09-20 11:09:05');
INSERT INTO `UserRole` VALUES (37, 'apollo', 91, b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `UserRole` VALUES (38, 'apollo', 92, b'0', 'apollo', '2019-09-20 11:09:11', 'apollo', '2019-09-20 11:09:11');
INSERT INTO `UserRole` VALUES (39, 'apollo', 97, b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `UserRole` VALUES (40, 'apollo', 98, b'0', 'apollo', '2019-09-20 11:09:18', 'apollo', '2019-09-20 11:09:18');
INSERT INTO `UserRole` VALUES (41, 'apollo', 103, b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `UserRole` VALUES (42, 'apollo', 104, b'0', 'apollo', '2019-09-20 11:11:04', 'apollo', '2019-09-20 11:11:04');
INSERT INTO `UserRole` VALUES (43, 'apollo', 109, b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `UserRole` VALUES (44, 'apollo', 110, b'0', 'apollo', '2019-09-20 11:11:10', 'apollo', '2019-09-20 11:11:10');
INSERT INTO `UserRole` VALUES (45, 'apollo', 115, b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `UserRole` VALUES (46, 'apollo', 116, b'0', 'apollo', '2019-09-20 11:11:17', 'apollo', '2019-09-20 11:11:17');
INSERT INTO `UserRole` VALUES (47, 'apollo', 121, b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `UserRole` VALUES (48, 'apollo', 122, b'0', 'apollo', '2019-09-20 11:11:22', 'apollo', '2019-09-20 11:11:22');
INSERT INTO `UserRole` VALUES (49, 'apollo', 127, b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `UserRole` VALUES (50, 'apollo', 128, b'0', 'apollo', '2019-09-20 11:12:05', 'apollo', '2019-09-20 11:12:05');
INSERT INTO `UserRole` VALUES (51, 'apollo', 133, b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `UserRole` VALUES (52, 'apollo', 134, b'0', 'apollo', '2019-09-20 11:12:10', 'apollo', '2019-09-20 11:12:10');
INSERT INTO `UserRole` VALUES (53, 'apollo', 139, b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `UserRole` VALUES (54, 'apollo', 140, b'0', 'apollo', '2019-09-20 11:12:16', 'apollo', '2019-09-20 11:12:16');
INSERT INTO `UserRole` VALUES (55, 'apollo', 145, b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `UserRole` VALUES (56, 'apollo', 146, b'0', 'apollo', '2019-09-20 11:12:21', 'apollo', '2019-09-20 11:12:21');
INSERT INTO `UserRole` VALUES (57, 'apollo', 151, b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `UserRole` VALUES (58, 'apollo', 152, b'0', 'apollo', '2019-09-20 11:12:25', 'apollo', '2019-09-20 11:12:25');
INSERT INTO `UserRole` VALUES (59, 'apollo', 157, b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `UserRole` VALUES (60, 'apollo', 158, b'0', 'apollo', '2019-09-20 11:14:17', 'apollo', '2019-09-20 11:14:17');
INSERT INTO `UserRole` VALUES (61, 'apollo', 163, b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `UserRole` VALUES (62, 'apollo', 164, b'0', 'apollo', '2019-09-20 11:14:22', 'apollo', '2019-09-20 11:14:22');
INSERT INTO `UserRole` VALUES (63, 'apollo', 169, b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `UserRole` VALUES (64, 'apollo', 170, b'0', 'apollo', '2019-09-20 11:14:27', 'apollo', '2019-09-20 11:14:27');
INSERT INTO `UserRole` VALUES (65, 'apollo', 175, b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `UserRole` VALUES (66, 'apollo', 176, b'0', 'apollo', '2019-09-20 11:14:32', 'apollo', '2019-09-20 11:14:32');
INSERT INTO `UserRole` VALUES (67, 'apollo', 181, b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
INSERT INTO `UserRole` VALUES (68, 'apollo', 182, b'0', 'apollo', '2019-09-20 11:14:37', 'apollo', '2019-09-20 11:14:37');
COMMIT;

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of Users
-- ----------------------------
BEGIN;
INSERT INTO `Users` VALUES (1, 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
