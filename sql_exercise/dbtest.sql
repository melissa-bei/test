/*
 Navicat Premium Data Transfer

 Source Server         : mysqltest
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : dbtest

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 26/10/2020 13:51:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hvac 区
-- ----------------------------
DROP TABLE IF EXISTS `hvac 区`;
CREATE TABLE `hvac 区`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `空间新风选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `盘管旁路` double NULL DEFAULT NULL,
  `计算的面积冷负荷` double NULL DEFAULT NULL,
  `计算的面积热负荷` double NULL DEFAULT NULL,
  `使用每小时换气次数` int NULL DEFAULT NULL,
  `使用每区域的新风量` int NULL DEFAULT NULL,
  `使用每人的新风量` int NULL DEFAULT NULL,
  `使用除湿设定点` int NULL DEFAULT NULL,
  `使用湿度设定点` int NULL DEFAULT NULL,
  `总体面积` double NULL DEFAULT NULL,
  `总体积` double NULL DEFAULT NULL,
  `阶段 ID` int NULL DEFAULT NULL,
  `计算的单位面积送风量` double NULL DEFAULT NULL,
  `计算的单位面积冷负荷` double NULL DEFAULT NULL,
  `计算的单位面积热负荷` double NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `换气速率每小时换气次数` double NULL DEFAULT NULL,
  `每单位面积的新风量` double NULL DEFAULT NULL,
  `每人的新风量` double NULL DEFAULT NULL,
  `除湿设定点` double NULL DEFAULT NULL,
  `湿度设定点` double NULL DEFAULT NULL,
  `制冷空气温度` double NULL DEFAULT NULL,
  `加热空气温度` double NULL DEFAULT NULL,
  `制冷设定点` double NULL DEFAULT NULL,
  `加热设定点` double NULL DEFAULT NULL,
  `计算的送风量` double NULL DEFAULT NULL,
  `计算的冷负荷` double NULL DEFAULT NULL,
  `计算的热负荷` double NULL DEFAULT NULL,
  `设备类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `已占用体积` double NULL DEFAULT NULL,
  `周长` double NULL DEFAULT NULL,
  `已占用面积` double NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKHVAC 区1`(`设计选项`) USING BTREE,
  CONSTRAINT `FKHVAC 区1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hvac 区
-- ----------------------------
INSERT INTO `hvac 区` VALUES (293242, NULL, '从空间类型', 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0.7, 0, 285.37222222222226, 305.37222222222226, 296.4833333333334, 294.2611111111112, NULL, NULL, NULL, '<建筑>', 0, NULL, 0, '默认', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for hvac 负荷明细表
-- ----------------------------
DROP TABLE IF EXISTS `hvac 负荷明细表`;
CREATE TABLE `hvac 负荷明细表`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKHVAC 负荷明细表1`(`设计选项`) USING BTREE,
  CONSTRAINT `FKHVAC 负荷明细表1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hvac 负荷明细表
-- ----------------------------
INSERT INTO `hvac 负荷明细表` VALUES (388143, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388144, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388145, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388146, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388147, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388148, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388149, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388150, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388151, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388152, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388153, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388154, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388155, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388156, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388157, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388158, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388159, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388160, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388161, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388162, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388163, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388164, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388165, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388166, NULL);
INSERT INTO `hvac 负荷明细表` VALUES (388167, NULL);

-- ----------------------------
-- Table structure for mep 预制保护层
-- ----------------------------
DROP TABLE IF EXISTS `mep 预制保护层`;
CREATE TABLE `mep 预制保护层`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `可用大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `预制服务缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `零件材质厚度` double NULL DEFAULT NULL,
  `预制注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `项目编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层面积` double NULL DEFAULT NULL,
  `预制服务名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `剪切类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `收购` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `别名` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次深度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次宽度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次直径选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管主直径选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管主深度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管主宽度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `角度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层规格` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `产品条目` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次深度` double NULL DEFAULT NULL,
  `干管次宽度` double NULL DEFAULT NULL,
  `干管次直径` double NULL DEFAULT NULL,
  `干管主深度` double NULL DEFAULT NULL,
  `干管主宽度` double NULL DEFAULT NULL,
  `端点中间高程` double NULL DEFAULT NULL,
  `起点中间高程` double NULL DEFAULT NULL,
  `坡度` double NULL DEFAULT NULL,
  `供应商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `底部` double NULL DEFAULT NULL,
  `顶部` double NULL DEFAULT NULL,
  `中间高程` double NULL DEFAULT NULL,
  `参照标高` int NULL DEFAULT NULL,
  `规格` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `供应商代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `重量` double NULL DEFAULT NULL,
  `干管主直径` double NULL DEFAULT NULL,
  `角度` double NULL DEFAULT NULL,
  `安装类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `零件材质` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OEM` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品简短说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品大小说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品材质说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品完成说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `详细说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品范围` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品完成说明1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `预制服务` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKMEP 预制保护层1`(`类型 ID`) USING BTREE,
  INDEX `FKMEP 预制保护层2`(`创建的阶段`) USING BTREE,
  INDEX `FKMEP 预制保护层3`(`拆除的阶段`) USING BTREE,
  INDEX `FKMEP 预制保护层4`(`设计选项`) USING BTREE,
  CONSTRAINT `FKMEP 预制保护层1` FOREIGN KEY (`类型 ID`) REFERENCES `mep 预制保护层类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制保护层2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制保护层3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制保护层4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mep 预制保护层
-- ----------------------------

-- ----------------------------
-- Table structure for mep 预制保护层类型
-- ----------------------------
DROP TABLE IF EXISTS `mep 预制保护层类型`;
CREATE TABLE `mep 预制保护层类型`  (
  `ID` int NOT NULL,
  `预制管件说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKMEP 预制保护层类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FKMEP 预制保护层类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mep 预制保护层类型
-- ----------------------------

-- ----------------------------
-- Table structure for mep 预制支架
-- ----------------------------
DROP TABLE IF EXISTS `mep 预制支架`;
CREATE TABLE `mep 预制支架`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `预制注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `项目编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `预制服务名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `别名` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品条目` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `中间高程` double NULL DEFAULT NULL,
  `参照标高` int NULL DEFAULT NULL,
  `预制服务` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKMEP 预制支架1`(`类型 ID`) USING BTREE,
  INDEX `FKMEP 预制支架2`(`创建的阶段`) USING BTREE,
  INDEX `FKMEP 预制支架3`(`拆除的阶段`) USING BTREE,
  INDEX `FKMEP 预制支架4`(`设计选项`) USING BTREE,
  CONSTRAINT `FKMEP 预制支架1` FOREIGN KEY (`类型 ID`) REFERENCES `mep 预制支架类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制支架2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制支架3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制支架4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mep 预制支架
-- ----------------------------

-- ----------------------------
-- Table structure for mep 预制支架类型
-- ----------------------------
DROP TABLE IF EXISTS `mep 预制支架类型`;
CREATE TABLE `mep 预制支架类型`  (
  `ID` int NOT NULL,
  `预制管件说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKMEP 预制支架类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FKMEP 预制支架类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mep 预制支架类型
-- ----------------------------

-- ----------------------------
-- Table structure for mep 预制管网
-- ----------------------------
DROP TABLE IF EXISTS `mep 预制管网`;
CREATE TABLE `mep 预制管网`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `可用大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `内衬厚度` double NULL DEFAULT NULL,
  `内衬类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `双壁材质面积` double NULL DEFAULT NULL,
  `零件金属板面积` double NULL DEFAULT NULL,
  `预制服务缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `零件材质厚度` double NULL DEFAULT NULL,
  `预制注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `内衬面积` double NULL DEFAULT NULL,
  `项目编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层面积` double NULL DEFAULT NULL,
  `预制服务名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `双壁材质厚度` double NULL DEFAULT NULL,
  `双壁材质` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `剪切类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `收购` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `别名` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次深度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次宽度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次直径选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管主直径选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管主深度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管主宽度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `角度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层规格` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `产品条目` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次深度` double NULL DEFAULT NULL,
  `干管次宽度` double NULL DEFAULT NULL,
  `干管次直径` double NULL DEFAULT NULL,
  `干管主深度` double NULL DEFAULT NULL,
  `干管主宽度` double NULL DEFAULT NULL,
  `端点中间高程` double NULL DEFAULT NULL,
  `起点中间高程` double NULL DEFAULT NULL,
  `坡度` double NULL DEFAULT NULL,
  `供应商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `底部` double NULL DEFAULT NULL,
  `顶部` double NULL DEFAULT NULL,
  `中间高程` double NULL DEFAULT NULL,
  `参照标高` int NULL DEFAULT NULL,
  `规格` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `供应商代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `重量` double NULL DEFAULT NULL,
  `干管主直径` double NULL DEFAULT NULL,
  `角度` double NULL DEFAULT NULL,
  `安装类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `零件材质` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OEM` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品简短说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品大小说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品材质说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品完成说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `详细说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品范围` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品完成说明1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `预制服务` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKMEP 预制管网1`(`类型 ID`) USING BTREE,
  INDEX `FKMEP 预制管网2`(`创建的阶段`) USING BTREE,
  INDEX `FKMEP 预制管网3`(`拆除的阶段`) USING BTREE,
  INDEX `FKMEP 预制管网4`(`设计选项`) USING BTREE,
  CONSTRAINT `FKMEP 预制管网1` FOREIGN KEY (`类型 ID`) REFERENCES `mep 预制管网类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制管网2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制管网3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制管网4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mep 预制管网
-- ----------------------------

-- ----------------------------
-- Table structure for mep 预制管网类型
-- ----------------------------
DROP TABLE IF EXISTS `mep 预制管网类型`;
CREATE TABLE `mep 预制管网类型`  (
  `ID` int NOT NULL,
  `预制管件说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKMEP 预制管网类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FKMEP 预制管网类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mep 预制管网类型
-- ----------------------------

-- ----------------------------
-- Table structure for mep 预制管道
-- ----------------------------
DROP TABLE IF EXISTS `mep 预制管道`;
CREATE TABLE `mep 预制管道`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `可用大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `预制服务缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `零件材质厚度` double NULL DEFAULT NULL,
  `预制注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `项目编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层面积` double NULL DEFAULT NULL,
  `预制服务名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `剪切类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `收购` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `别名` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次深度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次宽度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次直径选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管主直径选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管主深度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管主宽度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `角度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度选项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层规格` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `产品条目` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干管次深度` double NULL DEFAULT NULL,
  `干管次宽度` double NULL DEFAULT NULL,
  `干管次直径` double NULL DEFAULT NULL,
  `干管主深度` double NULL DEFAULT NULL,
  `干管主宽度` double NULL DEFAULT NULL,
  `端点中间高程` double NULL DEFAULT NULL,
  `起点中间高程` double NULL DEFAULT NULL,
  `坡度` double NULL DEFAULT NULL,
  `供应商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `底部` double NULL DEFAULT NULL,
  `顶部` double NULL DEFAULT NULL,
  `中间高程` double NULL DEFAULT NULL,
  `参照标高` int NULL DEFAULT NULL,
  `规格` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `供应商代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `重量` double NULL DEFAULT NULL,
  `干管主直径` double NULL DEFAULT NULL,
  `角度` double NULL DEFAULT NULL,
  `安装类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `零件材质` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OEM` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品简短说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品大小说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品材质说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品完成说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `详细说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品范围` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `产品完成说明1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `预制服务` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKMEP 预制管道1`(`类型 ID`) USING BTREE,
  INDEX `FKMEP 预制管道2`(`创建的阶段`) USING BTREE,
  INDEX `FKMEP 预制管道3`(`拆除的阶段`) USING BTREE,
  INDEX `FKMEP 预制管道4`(`设计选项`) USING BTREE,
  CONSTRAINT `FKMEP 预制管道1` FOREIGN KEY (`类型 ID`) REFERENCES `mep 预制管道类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制管道2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制管道3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKMEP 预制管道4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mep 预制管道
-- ----------------------------

-- ----------------------------
-- Table structure for mep 预制管道类型
-- ----------------------------
DROP TABLE IF EXISTS `mep 预制管道类型`;
CREATE TABLE `mep 预制管道类型`  (
  `ID` int NOT NULL,
  `预制管件说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKMEP 预制管道类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FKMEP 预制管道类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mep 预制管道类型
-- ----------------------------

-- ----------------------------
-- Table structure for omniclass 编号
-- ----------------------------
DROP TABLE IF EXISTS `omniclass 编号`;
CREATE TABLE `omniclass 编号`  (
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `OmniClass 标题` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`OmniClass 编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of omniclass 编号
-- ----------------------------
INSERT INTO `omniclass 编号` VALUES ('23.10.00.00', 'Site Products');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.00', 'Ground Anchorages');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.10', 'Retaining/Stabilizing Ground Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.10.11', 'Components');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.10.11.11', 'Anchor Heads');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.10.11.12', 'Tendons');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.10.14', 'Grouted Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.10.17', 'Plate Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.10.21', 'Rock Bolts, Rock Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.10.24', 'Anchor Tiebacks');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.20', 'Earth Reinforcement Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.20.11', 'Soil Nails');
INSERT INTO `omniclass 编号` VALUES ('23.10.05.99', 'Other Ground Anchorages');
INSERT INTO `omniclass 编号` VALUES ('23.10.10.00', 'Ground Improvement Products');
INSERT INTO `omniclass 编号` VALUES ('23.10.10.12', 'Land/Field Drainage');
INSERT INTO `omniclass 编号` VALUES ('23.10.10.12.10', 'Piped Drainage');
INSERT INTO `omniclass 编号` VALUES ('23.10.10.12.10.11', 'Land Drainage Pipes');
INSERT INTO `omniclass 编号` VALUES ('23.10.10.12.20', 'Drainage Blocks');
INSERT INTO `omniclass 编号` VALUES ('23.10.20.00', 'Retention Structures');
INSERT INTO `omniclass 编号` VALUES ('23.10.20.11', 'Sheet Piles');
INSERT INTO `omniclass 编号` VALUES ('23.10.20.14', 'Retaining Walls');
INSERT INTO `omniclass 编号` VALUES ('23.10.20.14.10', 'Diaphragm Walls');
INSERT INTO `omniclass 编号` VALUES ('23.10.20.14.10.11', 'Slurry Wall Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.10.20.14.20', 'Continuous Retaining Walls');
INSERT INTO `omniclass 编号` VALUES ('23.10.20.14.30', 'Crib Walls');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.00', 'Pavements');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11', 'Roadways and Runways');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.11', 'Complete Roadway and Runways');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.11.11', 'Portable Roadways');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.11.14', 'Helicopter Landing Pads');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.14', 'Roadway and Runway Surfacing');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.14.11', 'Antiskid Texturing');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.14.14', 'Paving Blocks, Slabs');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.14.14.11', 'Unit Pavers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.14.14.11.11', 'Asphalt Block Pavers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.14.14.11.14', 'Brick Pavers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.14.14.11.17', 'Interlocking Precast Concrete Pavers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.14.14.11.21', 'Precast Concrete Pavers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.14.14.11.24', 'Pressed Pavers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.14.14.11.27', 'Stone Pavers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.14.17', 'Continuous Surface Paving\'s');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17', 'Roadway and Runway Drainage');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17.11', 'Culverts');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17.11.11', 'Pipe Culverts');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17.11.11.11', 'Metal Pipe ? Arch Culverts');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17.11.14', 'Concrete Culverts');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17.11.14.11', 'Concrete Arch Buried Bridge');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17.11.14.14', 'Concrete Arch Culverts');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17.11.14.17', 'Concrete Box Culverts');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17.11.14.21', 'Concrete Rigid Frame Culverts');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17.14', 'Catch Basins');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17.17', 'Channels');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.17.21', 'Cleanouts');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21', 'Traffic Safety Barriers and Protections');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21.11', 'Safety Barriers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21.11.11', 'Crash Barriers ( including Impact Attenuating Devices)');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21.11.14', 'Median Barriers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21.11.17', 'Guardrails');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21.14', 'Noise Barriers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21.17', 'Traffic Barriers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21.17.11', 'Delineators');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21.21', 'Traffic Control');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21.21.11', 'Speed Bumps');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21.24', 'Curbs and Gutters');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.11.21.27', 'Cattle Guards');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14', 'Roadway Monitoring and Control');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.11', 'Roadway Signage,');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.14', 'Roadway Markers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.14.11', 'Roadway Surface Markings');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.14.14', 'Roadway Reflectors');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.14.17', 'Traffic Cones');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.17', 'Traffic Signals');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.21', 'Traffic Monitoring');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.21.11', 'Roadway Mirrors');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.21.14', 'Cameras');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.21.17', 'Detectors and Sensors');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.24', 'Parking Controls');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.24.11', 'Parking Meters');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.24.14', 'Ticket Dispensers');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.24.17', 'Coin Machine Units');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.24.21', 'Key and Card Control Units');
INSERT INTO `omniclass 编号` VALUES ('23.15.10.14.24.24', 'Parking Gates');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.21', 'Solid Waste Disposal Plant Products');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.21.11', 'Bins');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.21.14', 'Chutes and Collectors');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.21.17', 'Pneumatic Waste Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.21.24', 'Crusher Plant');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.21.24.11', 'Waste Compactors and Destructors');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.24', 'Pollution Monitoring and Control');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.24.11', 'Air Pollution Monitoring Systems');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.24.14', 'Water Pollution Monitoring Systems');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.27', 'Storage Constructions');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.27.11', 'Tanks, Reservoirs');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.27.11.11', 'Elevated Storage Tanks');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.27.11.14', 'Ground Storage Tanks');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.27.11.17', 'Underground Storage Tanks');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.27.11.21', 'Portable Storage Tanks');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.27.11.24', 'Tank Lining');
INSERT INTO `omniclass 编号` VALUES ('23.15.30.27.21', 'Gas Tanks and Gasholders');
INSERT INTO `omniclass 编号` VALUES ('23.15.99.00', 'Other Utility and Transportation Construction Products');
INSERT INTO `omniclass 编号` VALUES ('23.20.00.00', 'General Purpose Construction Accessories and Surfacing Products');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24', 'Joint Fillers, Sealants, and Mastics');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.11', 'Joint Fillers');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.11.11', 'Backer Rods');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.14', 'Putties');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.17', 'Construction Sealants');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.17.11', 'Elastomeric Construction Sealants');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.17.14', 'Rigid Construction Sealants');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.17.17', 'Sanitary Construction Sealants');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.17.21', 'Chemical-Resistant Construction Sealants');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.17.24', 'Water-Immersed Construction Sealants');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.21', 'Preformed Joint Seals');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.21.11', 'Compression Seals');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.24.21.14', 'Joint Gaskets');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.27', 'Ropes, Wires, and Cables');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.27.11', 'Ropes');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.27.14', 'Wires');
INSERT INTO `omniclass 编号` VALUES ('23.20.14.27.17', 'Cables');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.00', 'Mixtures');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.11', 'Concrete');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.11.11', 'Cementitious Concrete');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.11.14', 'Resinous Concrete');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.11.17', 'Hydrocarbon Concrete');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.11.21', 'Low Density Concrete');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.14', 'Mortars');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.14.11', 'Portland Cement-Lime Mortars');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.14.14', 'Masonry Cement Mortars');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.14.17', 'Mortar Cements');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.14.21', 'Gypsum Based Mortars');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.14.24', 'Resinous Mortar');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.14.27', 'Chemical-Resistant Mortar');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.14.31', 'Refractory Mortar');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.14.34', 'Premixed Mortar');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.14.37', 'Surface Bonding Mortar');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.14.41', 'Mortar Pigments');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.17', 'Grouts');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.17.11', 'Concrete Grout');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.17.11.11', 'Shrink-Resistant Concrete Grout');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.17.11.14', 'Catalyzed Metallic Concrete Grout');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.17.11.17', 'Epoxy Concrete Grout');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.17.11.21', 'Nonmetallic Concrete Grout');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.17.14', 'Masonry Grout');
INSERT INTO `omniclass 编号` VALUES ('23.20.15.17.14.11', 'Chemical-Resistant Masonry Grout');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.00', 'Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.11', 'Rigid Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.11.11', 'Ferrous Metal Rigid Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.11.14', 'Non-Ferrous Metal Rigid Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.11.17', 'Wood Rigid Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.11.17.11', 'Lumber Rigid Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.11.17.11.11', 'Hardwood Rigid Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.11.17.11.14', 'Softwood Rigid Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.11.17.11.17', 'Laminated Rigid Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.11.17.14', 'Heavy Timber Rigid Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.11.21', 'Plastic Rigid Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.11.24', 'Composite Rigid Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.14', 'Flexible Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.14.11', 'Plastic Flexible Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.14.14', 'Rubber Flexible Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.14.14.11', 'Natural Rubber Flexible Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.14.14.14', 'Butyl Flexible Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.14.14.17', 'Neoprene Flexible Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.14.14.21', 'Silicone Flexible Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.14.14.24', 'Polysulfide Flexible Profiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.17', 'Lath');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.17.11', 'Gypsum Lath');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.17.14', 'Lead-Lined Lath');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.17.17', 'Metal Lath');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.17.21', 'Veneer Plaster Base Lath');
INSERT INTO `omniclass 编号` VALUES ('23.20.20.17.24', 'Wood Lath');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.00', 'Sheets, Boards, and Slabs');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.11', 'Thin Flexible Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.11.11', 'Thin Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.11.11.11', 'Thin Metal Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.11.11.14', 'Thin Wood Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.11.11.17', 'Building Papers');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.11.11.21', 'Thin Plastic Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.11.11.24', 'Thin Rubber Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.11.14', 'Textiles');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.11.17', 'Mesh for General Use');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14', 'Rigid Sheets, Slabs, Plates');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.11', 'Solid Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.11.11', 'Solid Stone Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.11.14', 'Solid Cementitious Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.11.17', 'Solid Mineral Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.11.21', 'Solid Glass Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.11.24', 'Solid Metal Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.11.27', 'Solid Wood-Based Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.11.31', 'Solid Plastic Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.14', 'Hollow Core Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.14.11', 'Wood-Based Hollow Core Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.14.14', 'Mineral Hollow Core Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.14.17', 'Metal Hollow Core Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.14.14.21', 'Plastic Hollow Core Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.17', 'Gratings');
INSERT INTO `omniclass 编号` VALUES ('23.20.25.21', 'Blankets, Quilts');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.00', 'Blocks and Bricks');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11', 'Blocks');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.11', 'Concrete Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.11.11', 'Concrete Block');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.11.14', 'Exposed Aggregate Concrete Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.11.17', 'Fluted Concrete Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.11.21', 'Interlocking Concrete Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.11.24', 'Molded-Face Concrete Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.11.27', 'Prefaced Concrete Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.11.31', 'Preinsulated Concrete Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.11.34', 'Sound-Absorbing Concrete Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.11.37', 'Split-Face Concrete Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.14', 'Calcium Silicate Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.17', 'Glass Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.21', 'Adobe Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.24', 'Clay Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.24.11', 'Common Brick');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.24.14', 'Face Brick');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.24.17', 'Fire Brick');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.24.21', 'Glazed Brick');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.24.24', 'Ceramic Glazed Clay Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.24.27', 'Clay Tile');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.24.31', 'Structural Clay Tile');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.24.34', 'Clay Flue Lining');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.11.24.37', 'Terra Cotta');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.14', 'Masonry Anchorage and Reinforcement');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.14.11', 'Masonry Reinforcing');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.14.11.11', 'Continuous Joint Reinforcing');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.14.11.14', 'Reinforcing Bars');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.14.14', 'Masonry Ties');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.14.14.11', 'Flexible Masonry Ties');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.14.14.14', 'Masonry Veneer Ties');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.14.14.17', 'Rigid Masonry Ties');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.14.17', 'Masonry Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.14.17.11', 'Masonry Veneer Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.14.17.14', 'Stone Masonry Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.17', 'Special Profiles for Masonry');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.17.11', 'Special Masonry Shapes');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.17.14', 'Masonry Sills and Thresholds');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.17.17', 'Masonry Moldings');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.17.21', 'Masonry Copings');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.17.24', 'Masonry Quoins');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.17.27', 'Masonry Cornices');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.21', 'Structural Support for Masonry');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.21.11', 'Lintels');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.21.11.11', 'Lintel Former Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.21.14', 'Wall Connectors and Starters');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.21.17', 'Supports for Masonry');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.21.17.11', 'Masonry Angles');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.21.17.11.11', 'Masonry Shelf Angles');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.21.17.14', 'Gussets');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.24', 'Ancillary Products for Masonry');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.24.11', 'Embedded Flashing');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.24.14', 'Cavity Closers');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.24.17', 'Cavity Weep and Ventilation Units');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.24.17.11', 'Weeps');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.24.17.14', 'Cavity Vents');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.24.17.17', 'Drainage Material');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.24.21', 'Joint Materials');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.24.21.11', 'Control Joints');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.24.21.14', 'Expansion Joints');
INSERT INTO `omniclass 编号` VALUES ('23.20.30.24.24', 'Airbricks');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.00', 'Mechanical Fasteners, Adhesives, and Sealants');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11', 'Mechanical Fasteners');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.11', 'Cast-In Anchorages');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.11.11', 'Rail Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.11.14', 'Screw Cases');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.11.17', 'Anchor Blocks');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.11.21', 'Inserts');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.11.21.11', 'Adjustable Wedge');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.11.21.14', 'Adjustable Box');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.11.21.17', 'Threaded');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.11.24', 'Dovetail Slots');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.14', 'Multi-Purpose Mechanical Fasteners');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.14.11', 'Plugs');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.14.14', 'Staples');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.14.17', 'Nails');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.14.21', 'Rivets');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.14.24', 'Screws');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.14.27', 'Bolts and Nuts');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.14.31', 'Threaded Rods and Nuts');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.14.34', 'Bandings');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.17', 'Structural Mechanical Fasteners in Hardened Concrete and Masonry');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.17.11', 'Expansion Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.17.14', 'Undercut Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.17.17', 'Bonded Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.21', 'Mechanical Fasteners for Metal Structures');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.24', 'Mechanical Fasteners for Wood Structures');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.24.11', 'Nail Plates');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.24.14', 'Wood Connectors');
INSERT INTO `omniclass 编号` VALUES ('23.20.40.11.24.17', 'Framing Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.00', 'Thermal and Moisture Protective Products');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11', 'Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.11', 'Board Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.11.11', 'Calcium Silicate Board Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.11.14', 'Slag FiberBoard Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.14', 'Blanket Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.14.11', 'Smoke Containment Barriers');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.17', 'Fireproofing Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.17.11', 'Cement Aggregate Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.17.14', 'Cementitious Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.17.17', 'Foamed Magnesium Oxychloride Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.17.21', 'Intumescent Mastic Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.17.24', 'Magnesium Cement Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.17.27', 'Mineral Fiber Cementitious Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.11.17.31', 'Miner Fiber Fireproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14', 'Firestopping');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.11', 'Penetrations Firestopping');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.11.11', 'Annular Space Protection');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.11.14', 'Fire Resistant Joint Sealants');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.11.17', 'Firestopping Foams');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.11.17.11', 'Intumescent Firestopping Foams');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.11.17.14', 'Silicone Firestopping Foams');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.11.21', 'Firestopping Mortars');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.11.24', 'Firestopping Pillows');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.11.27', 'Thermal Barriers for Plastics');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.14', 'Fire-Safing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.14.11', 'Fibrous Blankets');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.14.14', 'Fire-Safing Sealants');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.14.14.17', 'Fire-Safing Clip Anchors');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.17', 'Dampproofings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.17.11', 'Dampproofing Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.17.14', 'Dampproofing Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.17.14.11', 'Bituminous Dampproofing Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.17.14.14', 'Cementitious Dampproofing Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21', 'Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.11', 'Built-Up Bituminous Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.14', 'Sheet Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.14.11', 'Bituminous Sheet Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.14.14', 'Elastomeric Sheet Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.14.17', 'Modified Bituminous Sheet Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.14.21', 'Thermoplastic Sheet Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.17', 'Fluid-Applied Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.17.11', 'Hot-Applied Rubberized Asphalt');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.21', 'Sheet Metal Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.24', 'Cementitious and Reactive Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.24.11', 'Acrylic Modified Cement Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.24.14', 'Crystalline Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.24.17', 'Metal Oxide Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.27', 'Bentonite Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.27.11', 'Bentonite Panel Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.27.14', 'Bentonite Sheet Waterproofing');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.31', 'Waterproof Traffic Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.31.11', 'Pedestrian Waterproof Traffic Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.21.31.14', 'Vehicular Waterproof Traffic Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24', 'Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.11', 'Slab and Board Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.11.11', 'Polystyrene Slab and Board Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.11.11.11', 'Expanded Polystyrene Slab and Board Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.11.11.14', 'Extruded Polystyrene Slab and Board Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.11.14', 'Urethane Slab and Board Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.11.17', 'Perlite Slab and Board Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.11.21', 'Fiberglass Slab and Board Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.14', 'Blanket Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.14.11', 'Fiberglass Blanket Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.14.14', 'Rock Wool Blanket Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.17', 'Thermal Insulation Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.17.11', 'Sprayed Thermal Insulation Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.17.11.11', 'Sprayed Cellulose Thermal Insulation Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.21', 'Loose Fill Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.24.21.11', 'Granular Fill Thermal Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.27', 'Sound Isolation Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.27.11', 'Slab and Board Sound Isolation Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.27.14', 'Fiberglass Slab and Board Sound Isolation Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.27.17', 'Blanket Sound Isolation Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.27.17.11', 'Fiberglass Blanket Sound Isolation Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.27.17.14', 'Rock Wool Blanket Sound Isolation Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.27.21', 'Sound Isolation Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.27.24', 'Sound Isolation Loose Fills');
INSERT INTO `omniclass 编号` VALUES ('23.20.50.27.24.11', 'Granular Sound Isolation Loose Fills');
INSERT INTO `omniclass 编号` VALUES ('23.25.00.00', 'Structural and Space Division Products');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.00', 'Foundations');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11', 'Foundation Piles');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.11', 'Foundation Pile Components');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.11.11', 'Pile Casings (Linings)');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.11.14', 'Cores and Mandrels');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.11.17', 'Pile Extension Pieces');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.11.21', 'Pile Shoes');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.11.24', 'Pile Splices');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.11.27', 'Pile Caps');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.14', 'Driven Piles');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.14.11', 'Composite Driven Piles');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.14.14', 'Concrete-Filled Steel Driven Piles');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.14.17', 'Precast Concrete Driven Piles');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.14.21', 'Rolled Steel Section Driven Piles');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.14.24', 'Unfilled Tubular Steel Driven Piles');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.14.27', 'Wood Driven Piles');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.14.31', 'Sheet Driven Piles');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.11.17', 'Screw Piles');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.14', 'Caissons, Foundation Casings');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.14.11', 'Well Foundation Casings');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.14.14', 'Caissons');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.17', 'Shallow Foundations');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.17.11', 'Column Bases');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.17.14', 'Grade Beams');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.17.17', 'Strip Foundation Blocks');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.21', 'Special Foundations');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.21.11', 'Controlled Modulus Columns');
INSERT INTO `omniclass 编号` VALUES ('23.25.05.21.14', 'Other Special Foundations');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.00', 'Structural Concrete Products');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.11', 'Structural Concrete');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.14', 'Ready Mixed Concrete');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.17', 'Permanent Formwork');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.17.11', 'Structural Permanent Formwork');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.17.11.11', 'Permanent Steel Forms');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.17.11.14', 'Prefabricated Stair Forms');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.21', 'Non-Structural Permanent Formwork');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.24', 'Concrete Forms');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27', 'Reinforcement and Prestressing Components');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.11', 'Reinforcement Components');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.11.11', 'Reinforcing Steel');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.11.14', 'Reinforcement Steel Mesh');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.11.14.11', 'Welded Wire Fabric');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.11.17', 'Fibrous Reinforcing');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.11.17.11', 'Steel Fibrous Reinforcing');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.11.17.14', 'Synthetic Fibrous Reinforcing');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.11.21', 'Reinforcement Couplers');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.11.24', 'Reinforcement Spacers');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.11.27', 'Reinforcement Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14', 'Prestressing Components');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.11', 'Stressing Tendons');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.11.11', 'Steel Stressing Tendons');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.11.11.11', 'Steel Strand Stressing Tendons');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.11.11.14', 'Steel Wire Stressing Tendons');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.11.11.17', 'Steel Bar Stressing Tendons');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.11.14', 'Glass Fiber');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.14', 'Steel Bars');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.17', 'Glass Fiber Tendons');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.21', 'Prestressing Couplers');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.24', 'Tendon Sheathing');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.24.11', 'Tendon Sheathing Ducts');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.14.27', 'Prestressing Anchorages');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.17', 'Post-Tensioning Products');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.21', 'Complete Reinforcement Cages');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.24', 'Cast-In Jointing');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.24.11', 'Expansion and Contraction Joints');
INSERT INTO `omniclass 编号` VALUES ('23.25.10.27.24.14', 'Waterstops');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.00', 'Envelope Enclosure Products');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.11', 'Infill Fa?ades');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.11.11', 'Exterior Wall Assemblies');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14', 'Glazed Fa?ade and Roof Structures');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.11', 'Curtain Walls');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.11.11', 'Curtain Wall Components');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.11.11.11', 'Curtain Wall Frames');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.11.11.14', 'Curtain Wall Sections');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.11.11.17', 'Infill Panels');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.11.14', 'Metal-Framed Curtain Wall');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.11.17', 'Translucent Wall Assemblies');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.14', 'Structural Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.14.11', 'Structural Glass Curtain Walls');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.17', 'Suspended Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.21', 'Patent Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.24', 'Screen and Storm Doors');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.24.11', 'Metal Screen and Storm Doors');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.24.14', 'Wood and Plastic Screen and Storm Doors');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.27', 'Glazed Roof Structures');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.27.11', 'Sections for Glazed Roofs');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.27.14', 'Sloped Glazing Assemblies');
INSERT INTO `omniclass 编号` VALUES ('23.25.20.14.27.17', 'Translucent Roof Assemblies');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.00', 'Structural Framing Products');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11', 'Structural Frames');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.11', 'Beam-Column Frames');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.14', 'Column-Slab Frames');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.14.11', 'Columns');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.14.14', 'Beams');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.17', 'Portal Frames');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.21', 'Structural Racking');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.24', 'Structural Bearings');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.24.11', 'Roller Bearings');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.24.14', 'Slide Bearings');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.24.17', 'Rocker Bearings');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.24.21', 'Fixed Bearings');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.11.27', 'Vibration and Earthquake Controls');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.14', 'Space Frames');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.14.11', 'Booms, Braces');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.14.14', 'Couplers');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.14.17', 'Complete Space Frames');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.17', 'Geodesic Structures');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.21', 'Rafters, Beams, and Joists');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.21.11', 'Rafters, Trussed');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.21.14', 'Trussed Beams and Joists');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.21.14.11', 'Metal Joists');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.21.14.14', 'Composite Joist Assemblies');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.21.14.17', 'Metal-Web Wood Joists');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.21.14.21', 'Wood Trusses');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.21.14.24', 'Metal Trusses');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.21.17', 'Web Beams and Joists');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.21.17.11', 'Wood I Joists');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.24', 'Structural Walls');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.24.11', 'Concrete Structural Walls');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.24.14', 'Masonry Structural Walls');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.24.17', 'Wood Framed Structural Walls');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.24.21', 'Metal Framed Structural Walls');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.24.24', 'Structural Panels');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.24.24.11', 'Cementitious Reinforced Structural Panels');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.24.24.14', 'Stressed Skin Structural Panels');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.24.24.17', 'Structural Insulated Panels');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.24.99', 'Other Structural Walls');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27', 'Structural Floors and Flat Roofs');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.11', 'Structural Floor Decks');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.11.11', 'Concrete Structural Floor Decks');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.11.14', 'Metal Structural Floor Decks');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.11.14.11', 'Raceway Deck Systems');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.11.14.14', 'Acoustical Metal Floor Deck');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.11.17', 'Wood Floor Decking');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.14', 'Structural Roof Decks');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.14.11', 'Concrete Structural Roof Decks');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.14.14', 'Metal Structural Roof Decks');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.14.14.11', 'Acoustical Metal Roof Deck');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.14.17', 'Wood Roof Decking');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.17', 'Structural Grating Floors');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.21', 'Balconies and Overhang Units');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.21.11', 'Balcony Components');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.21.11.11', 'Balcony Holders and Mechanical Fasteners');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.21.14', 'Concrete Balconies and Overhang Units');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.21.17', 'Metal Balconies and Overhang Units');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.27.21.21', 'Wood Balconies and Overhang Units');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.31', 'Structural Profiled Roofs');
INSERT INTO `omniclass 编号` VALUES ('23.25.30.31.11', 'Prefabricated Shell Roofs');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.00', 'Space Division Products');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.11', 'Fixed Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.11.11', 'Gypsum Board Fixed Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.11.11.11', 'Metal-Framed Gypsum Board Fixed Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.11.11.14', 'Wood-Framed Gypsum Board Fixed Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.11.14', 'Plaster Fixed Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.11.14.11', 'Gypsum Plaster Fixed Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.11.14.14', 'Portland Cement Plaster Fixed Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.11.14.17', 'Metal-Framed Plaster Fixed Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.11.14.21', 'Wood-Framed Plaster Fixed Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.11.17', 'Masonry Fixed Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14', 'Demountable Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.11', 'General Demountable Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.11.11', 'Demountable Partitions Component');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.11.11.11', 'Partition Frames');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.11.11.14', 'Partition Infill Panels');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.11.11.17', 'Mechanical Fasteners for Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.11.14', 'Gypsum Board Demountable Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.11.17', 'Metal Demountable Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.11.21', 'Wood Demountable Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14', 'Sanitary Partitions and Cubicles');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.11', 'Toilet Compartments and Urinal Screens');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.11.11', 'Metal Toilet Compartments and Urinal Screens');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.11.14', 'Plastic Laminate Toilet Compartments and Urinal Screens');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.11.17', 'Plastic Toilet Compartments and Urinal Screens');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.11.21', 'Particleboard Toilet Compartments and Urinal Screens');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.11.24', 'Stone Toilet Compartments and Urinal Screens');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.14', 'Shower and Dressing Compartments');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.14.11', 'Metal Shower and Dressing Compartments');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.14.14', 'Plastic Laminate Shower and Dressing Compartments');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.14.17', 'Plastic Shower and Dressing Compartments');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.14.21', 'Particleboard Shower and Dressing Compartments');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.14.24', 'Stone Shower and Dressing Compartments');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.17', 'Cubicles');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.17.11', 'Cubicle Curtains');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.14.17.14', 'Cubicle Track and Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.17', 'Storage Wall Partitions and Compartments');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.14.17.11', 'Wire Mesh Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.17', 'Operable Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.17.11', 'Horizontally Sliding Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.17.14', 'Folding Panel Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.17.17', 'Accordion Folding Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.17.21', 'Coiling Partitions');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.17.24', 'Vertically Sliding Room Dividers');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21', 'Fences');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.11', 'Fence Components');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.11.11', 'Fence Posts');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.11.14', 'Fencing Fabric');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.11.17', 'Fence Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.14', 'Fences by Material');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.14.11', 'Wood Fences');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.14.14', 'Metal Fences');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.14.17', 'Plastic Fences');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.14.21', 'Composite Fences');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.17', 'Fences by Type');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.17.11', 'Chain Link Fences');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.17.14', 'Wire Fences');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.17.17', 'Ornamental Fences');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.17.21', 'Post and Rail Fences');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.17.24', 'Panel Fences');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.21', 'Gates');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.21.11', 'Swinging Gates');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.21.14', 'Sliding Gates');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.24', 'Turnstiles');
INSERT INTO `omniclass 编号` VALUES ('23.25.40.21.27', 'Portable Post and Railing Barriers');
INSERT INTO `omniclass 编号` VALUES ('23.30.00.00', 'Openings, Passages, Protection');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.00', 'Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11', 'Door Components');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.11', 'Door Frames');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.14', 'Door');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.17', 'Preassembled Door and Frame Units');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.21', 'Fanlights');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.24', 'Door Sections');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.24.11', 'Structural Door Sections');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.24.14', 'Door Cladding Sections');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.27', 'Door Linings and Boards');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.31', 'Door Renovation Sets');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.34', 'Door Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.34.11', 'Peep Holes');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.34.14', 'Buffers and Stops');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.34.17', 'Mail Openings and Slots');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.11.34.21', 'Door Louvers and Lights');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.14', 'Passage Doors by Material');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.14.11', 'Metal Passage Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.14.14', 'Wood Passage Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.14.17', 'Plastic Passage Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.14.21', 'Composite Passage Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.14.24', 'Glazed Passage Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.14.27', 'All-Glass Passage Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17', 'Doors and Grills by Method of Operation');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.11', 'Sliding Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.14', 'Sliding Grills');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.17', 'Folding Doors and Grilles');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.17.11', 'Accordion Folding Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.17.14', 'Accordion Folding Grilles');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.17.17', 'Folding Fire Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.17.21', 'Panel Folding Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.17.24', 'Bifold Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.21', 'Revolving Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.24', 'Balanced Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.27', 'Coiling Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.27.11', 'Overhead Coiling');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.27.14', 'Side Coiling');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.31', 'Vertical Lift Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.31.11', 'Multi-Leaf Vertical Lift Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.31.14', 'Telescoping Vertical Lift Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.34', 'Telescopic Stacking Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.37', 'Overhead Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.37.11', 'Single-Panel Overhead Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.17.37.14', 'Sectional Overhead Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21', 'Special Function Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.11', 'Fire Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.11.11', 'Rolling Fire Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.11.14', 'Fire Shutters');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.11.17', 'Swinging Fire Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.11.21', 'Temperature Rate of Rise Fire Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.14', 'Security Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.17', 'Controlled Environment Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.17.11', 'Cold Storage Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.17.14', 'Sound Control Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.17.17', 'Radiation Protection Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.17.17.11', 'Electromagnetic Shielding Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.17.17.14', 'RF Shielding Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.17.17.17', 'BO Shielding Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.17.17.21', 'Radio Frequency Protection Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.17.17.24', 'X-Ray Protection Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.17.17.27', 'Nuclear Radiation Protection Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.17.17.31', 'High Energy Magnetic Pulse Protection Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.21', 'Detention Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.24', 'Hanger Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.27', 'Lightproof Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.27.11', 'Revolving Darkroom Door');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.31', 'Traffic Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.31.11', 'Flexible Traffic Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.31.14', 'Flexible Strip Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.31.17', 'Rigid Panel Traffic Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.31.21', 'Rapid Opening Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.34', 'Industrial Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.37', 'Pressure-Resistant Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.37.11', 'Airtight Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.37.14', 'Blast-Resistant Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.21.37.17', 'Watertight Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.24', 'Other Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.24.11', 'Storm Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.24.14', 'Screen Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.24.17', 'Other Special Purpose Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.27', 'Access Doors and Panels');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.27.11', 'Trap Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.27.14', 'Access Panels');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.27.17', 'Access Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.27.21', 'Floor Hatches');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.27.24', 'Roof Hatches');
INSERT INTO `omniclass 编号` VALUES ('23.30.10.27.27', 'Security Hatches');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.00', 'Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.11', 'Window Components');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.11.11', 'Window Sections');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.11.14', 'Window Linings and Boards');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.11.17', 'Window Vents');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.14', 'Windows by Material');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.14.11', 'Metal Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.14.14', 'Wood Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.14.17', 'Plastic Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.14.21', 'Composite Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17', 'Windows by Method of Opening');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.11', 'Fixed Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.14', 'Sliding Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.14.11', 'Vertical Sliding Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.14.14', 'Horizontal Sliding Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.17', 'Hung Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.17.11', 'Single-Hung Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.17.14', 'Double-Hung Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.17.17', 'Triple-Hung Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.21', 'Swinging Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.21.11', 'Awning Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.21.14', 'Casement Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.21.17', 'Projected Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.21.21', 'Vertical Pivoted Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.21.24', 'Jalousie Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.17.21.27', 'Jal-Awning Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.21', 'Other Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.21.11', 'Projecting Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.21.11.11', 'Bay Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.21.11.11.11', 'Angled Bay Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.21.11.11.14', 'Box Bay Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.21.11.14', 'Bow Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.21.11.17', 'Garden Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.21.14', 'Roof Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.21.17', 'Pavement Lights');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.21.17.11', 'Glass Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24', 'Special Purpose Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.11', 'Detention Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.14', 'Pass Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.17', 'Controlled Environment Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.17.11', 'Sound Control Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.17.14', 'Radiation Protection Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.17.14.11', 'Electromagnetic Shielding Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.17.14.14', 'RF Shielding Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.17.14.17', 'BO Shielding Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.17.14.21', 'Radio Frequency Protection Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.17.14.24', 'X-Ray Protection Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.17.14.27', 'Nuclear Radiation Protection Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.17.14.31', 'High Energy Magnetic Pulse Protection Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.20.24.21', 'Security Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.00', 'Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.11', 'Skylight Components');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.11.11', 'Skylight Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.14', 'Unit Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.14.11', 'Domed Unit Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.14.14', 'Pyramidal Unit Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.14.17', 'Vaulted Unit Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.17', 'Metal-Framed Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.17.11', 'Domed Metal-Framed Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.17.14', 'Motorized Metal-Framed Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.17.17', 'Pyramidal Metal-Framed Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.17.21', 'Ridge Metal-Framed Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.17.24', 'Vaulted Metal-Framed Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.21', 'Lantern Lights');
INSERT INTO `omniclass 编号` VALUES ('23.30.30.24', 'Tubular Skylights');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.00', 'Hardware for Openings');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11', 'Hardware for Doors');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.11', 'Rotation, Pivoting Door Gear');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.14', 'Sliding Door Gear');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.17', 'Combined Movement Door Gear');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.21', 'Door Guiding Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.24', 'Door Holding Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.24.11', 'Door Hold Open Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.27', 'Door Closing Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.27.11', 'Door Closers');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.27.11.11', 'Floor Door Closers');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.27.11.14', 'Surface Door Closers');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.27.11.17', 'Concealed Overhead Door Closers');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.31', 'Door Locking Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.34', 'Automatic Door Controls and Operators');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.34.11', 'Card Key Door Locking Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.34.14', 'Electrical Door Locking Control');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.11.34.17', 'Electromagnetic Door Holders');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14', 'Hardware for Windows');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14.11', 'Sliding Window Gear');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14.11.11', 'Horizontal Sliding Window Gear');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14.11.14', 'Vertical Sliding Window Gear');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14.11.17', 'Sliding Projecting Window Gear');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14.14', 'Horizontal Pivoting Window Gear');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14.17', 'Window Tilt and Turn Gear');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14.21', 'Louver Gear');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14.24', 'Automatic Window Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14.27', 'Window Locks');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14.31', 'Window Lifts');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.14.34', 'Window Operators');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.17', 'Specialties for Openings');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.17.11', 'Door Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.17.14', 'Window Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.21', 'Mechanical Fasteners for Openings');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.24', 'Hinges and Pivots');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.24.11', 'Hinges');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.24.14', 'Pivots');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.27', 'Locks and Latches');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.27.11', 'Mortise');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.27.14', 'Cylindrical Latch');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.27.17', 'Lock Cylinders');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.27.21', 'Deadbolts');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.31', 'Handles, Knobs, Levers, and Security Bars');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.31.11', 'Security Devices');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.34', 'Weatherstripping and Seals');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.34.11', 'Door Weatherstripping and Seals');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.34.14', 'Thresholds');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.34.17', 'Window Weatherstripping and Seals');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.99', 'Other Openings Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.30.40.99.11', 'Door Stops');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.00', 'Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11', 'Glass Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.11', 'Bent Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.14', 'Chemically-Strengthened Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.17', 'Coated Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.21', 'Composite Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.24', 'Decorative Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.27', 'Fire-Rated Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.31', 'Float Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.34', 'Heat-Strengthened Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.37', 'Impact Resistant Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.41', 'Insulating Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.44', 'Laminated Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.47', 'Low-Emissivity Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.51', 'Mirrored Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.54', 'Rolled Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.57', 'Spandrel Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.61', 'Tempered Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.11.64', 'Wired Glass');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.14', 'Plastic Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.14.11', 'Ballistics-Resistant Plastic Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.14.14', 'Decorative Plastic Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.14.17', 'Insulating Plastic Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.14.21', 'Translucent Plastic Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.14.24', 'Transparent Plastic Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.14.27', 'Mirrored Plastic Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.17', 'Glazing by Special Function');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.17.11', 'Security Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.17.14', 'Ballistics-Resistant Glass Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.17.17', 'Pressure-Resistant Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.17.21', 'Hurricane-Resistant Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.17.24', 'Radiation-Resistant Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.17.27', 'Transparent Mirrored Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.17.31', 'Cable Suspended Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.21', 'Glazing Components');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.21.11', 'Glazing Frames');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.21.14', 'Glazing Sections');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.21.17', 'Mechanical Glazing Fasteners');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.24', 'Glazing Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.24.11', 'Glazing Beads');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.24.14', 'Condensation Channels');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.24.17', 'Glazing Sealants and Tapes');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.24.21', 'Glazing Gaskets');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.24.24', 'Glazing Leading Material');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.27', 'Protective Films by Performance');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.27.11', 'Solar Control Films');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.27.14', 'Safety Films');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.27.17', 'Security Films');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.31', 'Glazing Sections, Blocks');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.31.11', 'U Sections');
INSERT INTO `omniclass 编号` VALUES ('23.30.50.31.14', 'Glass Masonry Units');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.00', 'Protection of Openings');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11', 'Exterior Protection of Openings');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.11', 'Projecting Screens');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.11.11', 'Canopies');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.11.11.11', 'Solid Canopies');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.11.11.14', 'Louvered Canopies');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.11.14', 'Vertical Fins');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.11.14.11', 'Solid Vertical Fins');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.11.14.14', 'Louvered Vertical Fins');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.11.17', 'Awnings');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.11.17.11', 'Manual Awnings');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.11.17.14', 'Powered Awnings');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.14', 'Exterior Shutters');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.14.11', 'Shutter Components');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.14.11.11', 'Roller Shutter Gear');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.14.11.14', 'Roller Shutter Sections');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.14.11.17', 'Roller Shutter Casings');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.14.14', 'Sliding Exterior Shutters');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.14.17', 'Swinging Exterior Shutters');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.14.21', 'Coiling Exterior Shutters');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.17', 'Exterior Louvers and Grilles');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.17.11', 'Fixed Exterior Louvers and Grilles');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.17.14', 'Roller Exterior Louvers and Grilles');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.17.17', 'Sliding Exterior Louvers and Grilles');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.21', 'Storm Panels');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.21.11', 'Demountable Storm Panels');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.11.21.14', 'Movable Storm Panels');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.14', 'Interior Window Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.14.11', 'Blinds');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.14.11.11', 'Horizontal Blinds');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.14.11.14', 'Vertical Blinds');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.14.11.17', 'Blinds Components');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.14.11.17.11', 'Slats');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.14.11.17.14', 'Vanes');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.14.11.17.17', 'Blinds Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.14.14', 'Curtains and Drapes');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.14.17', 'Interior Shutters');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.14.21', 'Shades');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.17', 'Fire and Smoke Shutters and Curtains');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.17.11', 'Fire Shutters');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.17.11.11', 'Vertical Fire Shutters');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.17.11.14', 'Horizontal Fire Shutters');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.17.14', 'Smoke Curtains and Shutters');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.17.17', 'Water Spray Smoke Curtains');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.21', 'Insect Screens');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.21.11', 'Complete Insect Screens');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.21.14', 'Components');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.21.14.11', 'Frames for Insect Screens');
INSERT INTO `omniclass 编号` VALUES ('23.30.60.21.14.14', 'Mesh for Insect Screens');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.00', 'Circulation and Escape');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.11', 'Ramps');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.14', 'Walkways');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.17', 'Ladders');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.17.11', 'Ladder Components');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.17.11.11', 'Ladder Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.17.11.14', 'Rungs');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.17.14', 'Vertical Ladders');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.17.17', 'Ship?s Ladders');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21', 'Stairs');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21.11', 'Stair Components');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21.11.11', 'Stair Treads');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21.11.11.11', 'Stair Nosings');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21.11.11.14', 'Tread Coverings');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21.11.14', 'Stair Railings');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21.11.17', 'Stair Handrails');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21.11.21', 'Stair Barrier Gates');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21.14', 'Spiral Stairs');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21.14.11', 'Metal Spiral Stairs');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21.14.14', 'Wood Spiral Stairs');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.21.17', 'Retractable Stairs');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.24', 'Fire Escapes');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.24.11', 'Escape Ladders, Stairs');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.24.11.11', 'Fire Escapes');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.24.14', 'Escape Slides');
INSERT INTO `omniclass 编号` VALUES ('23.30.70.24.17', 'Slings');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.00', 'Circulation Guiding and Protection');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.11', 'Guardrails');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.11.11', 'Guardrail Components');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.11.11.11', 'Infill Panels');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.11.11.14', 'Posts, Newel Posts, Pickets');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.11.11.17', 'Railing');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.14', 'Handrails');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.17', 'Impact Protection');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.17.11', 'Impact Guard Rails');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.17.11.11', 'Bumper Guards');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.17.14', 'Corner Guards');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.17.17', 'Column Protectors');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.17.21', 'Door and Wall Protectors');
INSERT INTO `omniclass 编号` VALUES ('23.30.80.17.21.11', 'Impact-Resistant Wall Protection');
INSERT INTO `omniclass 编号` VALUES ('23.30.82.11', 'Rope Handrails');
INSERT INTO `omniclass 编号` VALUES ('23.30.82.12', 'Cappings');
INSERT INTO `omniclass 编号` VALUES ('23.30.82.13', 'Chain Handrails');
INSERT INTO `omniclass 编号` VALUES ('23.35.00.00', 'Covering, Cladding, and Finishes');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.00', 'Multi-Function Coverings, Claddings, Linings');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.11', 'Multi-Function Claddings');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.14', 'Preformed Casings');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17', 'Ancillary Products for Coverings and Claddings');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17.11', 'Supports for Coverings and Claddings');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17.14', 'Mechanical Fasteners for Coverings and Claddings');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17.17', 'Movement and Dividing Joints for Coverings and Claddings');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17.21', 'Joint Coverings, Flashings, Tapes');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17.24', 'Reinforcements for Coverings and Claddings');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17.27', 'Trims, Edgings, Cappings');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17.31', 'Spacers');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17.34', 'Profile Fillers');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17.37', 'Underlays, Linings, Separations');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17.41', 'Beddings, Adhesives for Coverings and Claddings');
INSERT INTO `omniclass 编号` VALUES ('23.35.05.17.44', 'Sealants for Coverings and Claddings');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.10', 'Roof and Wall Cladding');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.11', 'Siding');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.11.10', 'Metal Siding');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.11.20', 'Composition Siding');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.11.30', 'Mineral Fiber Cement Siding');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.11.40', 'Plastic Siding');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.11.50', 'Wood Siding');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.20', 'Multi-Function Linings');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21', 'Roof and Wall Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21.10', 'Metal Roof and Wall Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21.20', 'Plastic Roof and Wall Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21.30', 'Wood Roof and Wall Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21.40', 'Composite Roof and Wall Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21.50', 'Faced Roof and Wall Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21.51', 'Aggregate Coated Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21.52', 'Porcelain Enameled Faced Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21.53', 'Tile Faced Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21.60', 'Fiber-Reinforced Cementitious Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21.61', 'Glass-Fiber-Reinforced Cementitious Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.21.62', 'Miner-Fiber-Reinforced Cementitious Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.22', 'Ceiling and Wall Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.22.10', 'Flexible Wood Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.22.20', 'Acoustical Wall Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.35.06.23', 'Plasters');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.00', 'Wall Coverings, Claddings, Linings');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.11', 'Wall Cladding Sections');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.11.11', 'Metal Wall Cladding Sections');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.11.14', 'Wood Wall Cladding Sections');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.11.17', 'Plastics Wall Cladding Sections');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.11.99', 'Other Wall Cladding Sections');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.14', 'Wall Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.14.11', 'Stone, Natural and Reconstituted Wall Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.14.14', 'Cementitious Wall Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.14.17', 'Clay-Based Wall Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.14.21', 'Metal Wall Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.14.24', 'Vegetable-Based Wall Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.14.27', 'Plastics Wall Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.14.31', 'Other Wall Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.17', 'Wall Cladding Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.17.11', 'Stone Facing');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.17.14', 'Cementitious Wall Cladding Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.17.14.11', 'Precast Concrete Wall Cladding Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.17.17', 'Metal Wall Cladding Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.17.21', 'Wood-Based Wall Cladding Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.17.24', 'Plastic Wall Cladding Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.17.24.11', 'Plastic Blocks');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.17.99', 'Other Wall Cladding Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.21', 'Wall Cladding Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.21.11', 'Fiber-Based Wall Cladding Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.21.14', 'Metal Wall Cladding Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.21.17', 'Plastic Wall Cladding Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.24', 'Wall Coverings');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.24.11', 'Wallpaper');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.24.14', 'Wall Fabrics');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.24.17', 'Plastic Wall Coverings');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.24.21', 'Cork Wall Covering');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.24.24', 'Vinyl-Coated Fabric Wall Covering');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.24.27', 'Vinyl Wall Covering');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.24.31', 'Wall Carpet');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.24.34', 'Wall Veneers');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.27', 'Wall Linings');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.31', 'Wall Finish Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.34', 'Wall Specialties and Trim');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.34.11', 'Pilasters');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.34.14', 'Niches');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.34.17', 'Moldings');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.34.21', 'Renovating Wall Coverings, Claddings');
INSERT INTO `omniclass 编号` VALUES ('23.35.10.37', 'Wall Finish Restoration Products');
INSERT INTO `omniclass 编号` VALUES ('23.35.17.10', 'Renders');
INSERT INTO `omniclass 编号` VALUES ('23.35.17.20', 'Acoustical Wall Finishes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.00', 'Roof Coverings, Claddings, Linings');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11', 'Roof Shingles and Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.11', 'Roof Shingle and Tile Components');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.11.11', 'Shingles, Shakes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.11.14', 'Slate, Tile Vents');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.11.17', 'Tile and Slate Mechanical Fasteners');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.11.21', 'Ridges, Rake Edges (Verges  ), Edges');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.11.24', 'Underlayment');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.14', 'Roof Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.14.11', 'Clay');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.14.14', 'Concrete');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.14.17', 'Metal');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.14.21', 'Mineral Fiber Cement');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.14.24', 'Plastic');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.17', 'Slates');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.21', 'Natural Stone Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.24', 'Roof Shingles');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.24.11', 'Asphalt Roof Shingles');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.24.14', 'Fiberglass Reinforced Roof Shingles');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.24.17', 'Metal Roof Shingles');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.24.21', 'Mineral Fiber Cement Roof Shingles');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.24.24', 'Plastic Roof Shingles');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.24.27', 'Porcelain Enamel Roof Shingles');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.24.31', 'Wood Shingles');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.27', 'Shakes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.11.27.11', 'Wood Shakes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.14', 'Roof Cladding');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.14.11', 'Roof Cladding Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.14.11.11', 'Metal Roof Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.14.11.14', 'Sheet Metal Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.14.14', 'Roof Battens');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.17', 'Roof Coverings');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.17.11', 'Thatched Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.17.14', 'Sod Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.17.17', 'Vegetated Covering');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21', 'Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11', 'Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11.11', 'Elastomeric Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11.11.11', 'Chlorinated Polyethylene (CPE) Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11.11.14', 'Chlorosulfonated Polyethylene (CSPE) Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11.11.17', 'Copolymer Alloy (CPA) Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11.11.21', 'Ethylene Propylene Diene Monomer (EPDM) Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11.11.24', 'Nitrile Butadiene Polymer (NBP) Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11.11.27', 'Polyisobutylene (PIB) Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11.14', 'Thermoplastic Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11.14.11', 'Ethylene Interpolymer (EIP) Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11.14.14', 'Polyvinyl chloride (PVC) Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.11.14.17', 'Thermoplastic Alloy (TPA) Single-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.14', 'Multi-Layer Roof Membranes');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.14.11', 'Built-Up Bituminous Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.14.11.11', 'Asphalt Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.14.11.14', 'Coal-Tar Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.14.14', 'Cold-Applied Bituminous Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.14.14.11', 'Cold-Applied Mastic Roof Membrane');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.14.14.14', 'Glass-Fiber-Reinforced Asphalt Emulsion Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.14.17', 'Modified Bituminous Roof Membranes (APP, SBS, etc?)');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.17', 'Fluid Applied Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.21', 'Coated Foam Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.21.24', 'Roll Roofing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.24', 'Roof Decking');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.24.11', 'Cementitious Roof Deck');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.24.14', 'Lightweight Concrete Roof Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.24.14.11', 'Composite Concrete and Insulation Roof Deck');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.24.14.14', 'Lightweight Cellular Concrete Roof Deck');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.24.14.17', 'Lightweight Insulating Concrete Roof Deck');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.24.17', 'Concrete Roof Topping');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.27', 'Roof Finishing Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31', 'Roof Specialties and Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.11', 'Roof Edgings and Trims');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.11.11', 'Copings');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.11.14', 'Counterflashing Systems');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.11.21', 'Gravel Stops and Facias');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.11.24', 'Roof Penetration Flashing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.11.27', 'Reglets');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.11.31', 'Scuppers');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.14', 'Flexible Flashing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.14.11', 'Laminated Sheet Flexible Flashing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.14.14', 'Modified Bituminous Sheet Flexible Flashing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.14.17', 'Plastic Sheet Flexible Flashing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.14.21', 'Rubber Sheet Flexible Flashing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.14.24', 'Self-Adhering Sheet Flexible Flashing');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.17', 'Roof Expansion Joints');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.21', 'Roof Vents');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.21.11', 'Relief Vents');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.21.14', 'Ridge Vents');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.21.17', 'Smoke Vents');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.24', 'Roof Walkways');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.24.11', 'Roof Pavers');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.24.11.11', 'Precast Concrete Roof Pavers');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.24.11.14', 'Pedestals Roof Pavers');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.24.14', 'Roof Treads');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.24.14.11', 'Rubber Roof Treads');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.27', 'Roof Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.27.11', 'Manufactured Roof Curbs');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.27.14', 'Snow Guards');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.27.17', 'Piping Portals');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.27.21', 'Roof Domes, Turrets, Lanterns');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.31', 'Vegetated Roof Planting Modules');
INSERT INTO `omniclass 编号` VALUES ('23.35.20.31.34', 'Renovation Products for Roof Coverings and Claddings');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.00', 'Floor Coverings');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11', 'Flooring Specialties and Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.11', 'Floor Toppings');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.11.11', 'Concrete Floor Topping');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.14', 'Floor Underlayments');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.14.11', 'Cementitious Floor Underlayment');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.14.11.11', 'Gypsum Floor Underlayment');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.14.11.14', 'Portland Cement Floor Underlayment');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.14.14', 'Other Floor Underlayments');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.21', 'Floor Base and Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.21.11', 'Base and Accessories for Floor Coverings');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.21.14', 'Acoustic Floor Mountings');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.21.17', 'Underlays, Linings, Separations');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.24', 'Floor Mats and Grilles');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.24.11', 'Floor Mats');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.24.14', 'Floor Grilles');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.11.24.17', 'Floor Gratings');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14', 'Floor Covering Strips, Tiles, Blocks, and Slabs');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.11', 'Wood Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.11.11', 'Cushioned Wood Flooring Assemblies');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.11.14', 'Mastic Set Wood Flooring Assemblies');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.11.17', 'Resilient Wood Flooring Assemblies');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.11.21', 'Wood Athletic Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.11.24', 'Wood Block Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.11.27', 'Wood Composition Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.11.31', 'Wood Parquet Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.11.34', 'Wood Strip Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.14', 'Tile Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.14.11', 'Ceramic Tile Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.14.11.11', 'Ceramic Mosaic Tile Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.14.11.14', 'Conductive Tile Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.14.14', 'Quarry Tile Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.14.17', 'Porcelain Tile Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.14.21', 'Glass Mosaic Tile Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.14.24', 'Plastic Tile Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.14.27', 'Metal Tile Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.14.31', 'Natural Cut Stone Tile Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.14.34', 'Tile Flooring Restoration Products');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.17', 'Terrazzo Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.17.11', 'Portland Cement Terrazzo Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.17.14', 'Precast Terrazzo Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.17.17', 'Conductive Terrazzo Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.17.21', 'Plastic matrix Terrazzo Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.17.24', 'Terrazzo Flooring Restoration Products');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.21', 'Masonry Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.21.11', 'Brick Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.21.11.11', 'Chemical-Resistant Brick Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.21.14', 'Stone Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.24', 'Precast Tile and Slab Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.14.27', 'Metal Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.17', 'Resilient Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.17.11', 'Cork Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.17.14', 'Plastic Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.17.17', 'Rubber Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.17.21', 'Linoleum Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.17.24', 'Mechanical Fasteners for Resilient Floor Coverings');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.17.24.11', 'Floor Clips');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.17.24.14', 'Carpet Grippers');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.17.24.17', 'Stair Rods');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.17.27', 'Other Resilient Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.21', 'Carpet Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.21.11', 'Carpet Cushion');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.21.14', 'Carpet Tile');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.21.17', 'Indoor and Outdoor Carpet');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.21.21', 'Sheet Carpet');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.24', 'Preformed Flooring Systems');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.24.11', 'Floating Floors');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.24.14', 'Portable Floors');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.24.17', 'Convertible Floors');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.24.21', 'Gymnasium or Dance Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.27', 'Access Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.27.11', 'Access Flooring Components');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.27.11.11', 'Access Floors, Frames');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.27.11.14', 'Access Floors, Infill Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.27.14', 'Rigid Grid Access Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.27.17', 'Snap-On Stringer Access Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.50.27.21', 'Stringerless Access Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.52.22.10', 'Chemical-Resistant Quarry Tile Flooring');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.00', 'Ceiling Coverings, Claddings, and Linings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.11', 'Ceiling Tiles, Panels, Strips, and Sections');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.11.11', 'Ceiling Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.11.11.11', 'Acoustical Ceiling Tile');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.11.14', 'Ceiling Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.11.14.11', 'Acoustical Ceiling Panels');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.11.14.14', 'Mirror Ceiling Panel');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.11.17', 'Ceiling Covering Strips');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.11.17.11', 'Linear Metal Ceiling Covering Strips');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.11.17.14', 'Linear Wood Ceiling Covering Strips');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.11.21', 'Ceiling Covering Sections');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.11.21.11', 'Suspended Decorative Ceiling Grids');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.14', 'Ceiling Finishing Coatings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.14.11', 'Textured Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.14.11.11', 'Gypsum Panel Textured Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.14.11.14', 'Metal Panel Textured Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.17', 'Ceiling Specialties and Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.17.11', 'Roses, Ceiling Centerpieces');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.17.14', 'Ceiling Coving');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.17.17', 'Cornices, Friezes');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.21', 'Ceiling Assembly Restoration Products');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24', 'Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11', 'Suspended Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.11', 'Suspended Ceiling Components');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.11.11', 'Suspended Ceilings, Suspension Assembly');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.11.14', 'Suspended Ceilings, Panels and Tiles');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.11.17', 'Suspended Ceilings, Grids');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.11.21', 'Mechanical Fasteners for Suspended Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.14', 'Acoustical Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.14.11', 'Metal Pan Acoustical Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.14.14', 'Acoustical Panel Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.14.17', 'Acoustical Tile Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.17', 'Specialty Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.17.11', 'Integrated Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.17.14', 'Linear Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.17.14.11', 'Metal Linear Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.17.14.14', 'Wood Linear Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.17.17', 'Luminous Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.17.21', 'Mirror Panel Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.17.24', 'Textured Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.11.17.27', 'Suspended Decorative Grids');
INSERT INTO `omniclass 编号` VALUES ('23.35.70.24.14', 'Stretched Fabric Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.40.00.00', 'Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.00', 'Plants and Planting Products');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.11', 'Planting Products');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.11.14', 'Plant Maintenance Products');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.11.14.17', 'Mowing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.11.14.21', 'Pruning Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.11.14.24', 'Watering Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.11.14.27', 'Irrigation System');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.17', 'Exterior Plants');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.17.11', 'Ground Covers');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.17.14', 'Plants and Bulbs');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.17.17', 'Shrubs');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.17.21', 'Coniferous Trees');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.17.24', 'Deciduous Trees');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.21', 'Planting Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.21.11', 'Landscaping Edging');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.21.14', 'Landscape Timbers');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.21.17', 'Planters');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.21.21', 'Tree Grates');
INSERT INTO `omniclass 编号` VALUES ('23.40.05.21.24', 'Tree Grids');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.00', 'Exterior Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.11', 'Site Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.11.11', 'Bicycle Racks');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.11.14', 'Exterior Seating');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.11.17', 'Exterior Tables');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.11.21', 'Trash Receptors');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.11.24', 'Storage Specialties for Services and Maintenance');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14', 'Exterior Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.11', 'Flagpoles');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.11.11', 'Automatic Flagpoles');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.11.14', 'Ground-Set Flagpoles');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.11.17', 'Nautical Flagpoles');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.11.21', 'Wall-Mounted Flagpoles');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.14', 'Manufactured Exterior Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.14.11', 'Weathervanes');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.14.14', 'Clocks');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.14.17', 'Cupolas');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.14.21', 'Spires');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.14.24', 'Steeples');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.14.99', 'Other Manufactured Exterior Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.17', 'Memorials and Statuary');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.21', 'Markers and Monuments');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.24', 'Exterior Signs');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.24.11', 'Signs, Finger Posts');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.24.14', 'Street Nameplates');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.24.17', 'Illuminated Signs');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.27', 'Bollards');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.14.31', 'Public Lighting Columns');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.17', 'Garden and Park Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.17.11', 'Garden/Patio Seating and Tables');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.17.14', 'Garden Umbrellas');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.17.17', 'Exterior Ornamental Fountains');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.17.21', 'Bird Houses and Feeders');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.17.24', 'Bird Baths');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.17.27', 'Tubs for Plants');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.17.31', 'Sundials');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.17.34', 'Garden Ornaments');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21', 'Playfield Equipment, Structures, and Surfacing');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.11', 'Playground Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.14', 'Play Structures');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.17', 'Athletic or Recreation Screening');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.17.11', 'Tennis Court Windbreakers');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.21', 'External Pools and Ponds');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.24', 'Athletic and Recreational Surfaces');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.24.11', 'Sports Field Surfacings');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.24.11.11', 'Baseball Field Surfacing');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.24.11.14', 'Multi-Purpose Court Surfacing');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.24.11.17', 'Resilient Matting');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.24.11.21', 'Synthetic Grass Surfacing');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.24.11.24', 'Synthetic Running Track Surfacing');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.24.11.27', 'Tennis Court Surfacing');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.24.14', 'Artificial Ski Slopes');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.24.17', 'Artificial Ice Rinks');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.27', 'Exterior Athletic Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.27.11', 'Goalposts');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.27.11.11', 'Soccer Goalposts');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.27.11.14', 'Football Goalposts');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.27.14', 'Tennis Court Nets');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.27.17', 'Volley Ball Nets');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.21.27.21', 'Basketball Net and Backstop');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.24', 'Screening Devices');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.24.11', 'Jet Blast Barriers');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.24.14', 'Screens and Louvers');
INSERT INTO `omniclass 编号` VALUES ('23.40.10.24.21', 'Sound Barriers');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.00', 'General Furniture and Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11', 'Wardrobe and Closet Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.11', 'Wardrobes');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.14', 'Chests of Drawers');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.17', 'Lockers');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.21', 'Racks and Hangers');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.21.11', 'Coat Racks');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.21.14', 'Hat Racks');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.21.17', 'Shoe Trees');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.21.21', 'Coat Hooks');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.21.24', 'Coat Hangers and Rails');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.24', 'Cloakroom Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.27', 'Umbrella Stands');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.31', 'Checkroom Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.31.11', 'Manual Checkroom Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.11.31.14', 'Automated Checkroom Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14', 'Residential Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.14', 'Residential Seating');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.14.11', 'Chairs');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.14.14', 'Settees, Sofas');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.14.17', 'Stools');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.14.21', 'Benches');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.14.24', 'Chaises Lounges');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.14.27', 'Sofa Beds, Chair Beds');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.17', 'Residential Tables and Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.17.11', 'Dining Room Tables');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.17.14', 'China Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.17.17', 'Sideboards');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.17.21', 'End Tables');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.14.17.24', 'Coffee Tables');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.17', 'Bedroom Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.17.14', 'Bedroom Furniture, Single Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.17.14.11', 'Beds');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.17.14.14', 'Headboards, Footboards');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.17.14.17', 'Cots, Cradles');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.17.14.21', 'Bedside Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.17.14.24', 'Dressing Tables');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.17.14.27', 'Nursery/Children\'s Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.17.14.31', 'Mattresses');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21', 'Toilet and Bath Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.11', 'Bathroom Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.14', 'Hand and Hair Dryers');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.17', 'Paper Towel Dispensers, Disposal Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.21', 'Toilet Paper Dispensers');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.24', 'Sanitary Napkin and Tampon Dispensers, Disposal Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.27', 'Towel Bars');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.31', 'Robe Hooks');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.34', 'Soap Holders, Dispensers');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.37', 'Diaper Changing Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.41', 'Bathroom Deodorizers');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.44', 'Shower Rods, Curtains');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.21.47', 'Bath Grab Bars');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.24', 'Non-Clothes Storage Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.24.11', 'Cupboards');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.24.14', 'Chests');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.24.17', 'Sideboards');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.24.21', 'Dressers');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.24.24', 'Filing Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.24.27', 'Plan/Map Chests');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.24.31', 'Desk');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.24.34', 'Bookcases');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.24.41', 'Key Hangers');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.27', 'Storage Shelving');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.27.11', 'Shelves');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.27.14', 'Supports');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.27.17', 'Racking');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.27.21', 'Mobile Storage Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.31', 'Refuse Disposal Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.31.11', 'Bins');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.31.14', 'Ash Trays');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.31.17', 'Refuse Holders');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34', 'Fireplaces and Stoves');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.11', 'Fireplace and Stove Components');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.11.11', 'Fire Surrounds');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.11.14', 'Firebacks');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.11.17', 'Fireplace and Stove Fenders');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.11.21', 'Fireplace and Stove Hoods');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.14', 'Fireplaces');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.14.11', 'Fireplace Inserts');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.14.14', 'Fireplace Screens and Doors');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.14.17', 'Fireplace Water Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.17', 'Stoves');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.17.11', 'Stove Pipe');
INSERT INTO `omniclass 编号` VALUES ('23.40.20.34.21', 'Hearths');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.00', 'Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.11', 'Casework Components');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.11.11', 'Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.11.14', 'Hardware');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.11.17', 'Work Surfaces');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.14', 'Casework by Type');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.14.11', 'Modular Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.14.14', 'Custom-Fabricated Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17', 'Casework by Purpose');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.11', 'Bank Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.14', 'Hospitality Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.17', 'Display Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.21', 'Religious Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.24', 'Library Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.24.11', 'Study Carrels');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.24.14', 'Book Stacks');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.24.17', 'Periodical Racks');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.27', 'Educational Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.31', 'Laboratory Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.34', 'Medical Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.34.11', 'Dental Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.34.14', 'Pharmacy Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.37', 'Mortuary Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.41', 'Commercial Kitchen Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.44', 'Darkroom Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.44.11', 'Photo Transfer Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.47', 'Residential Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.47.11', 'Kitchen Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.47.11.11', 'Complete Kitchen Casework Suites');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.47.11.14', 'Single Kitchen Casework Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.35.17.47.14', 'Bathroom Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.00', 'Food Service Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11', 'Specialized Food Storage and Display Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.11', 'Refrigerators and Freezers');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.11.11', 'Refrigerators');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.11.14', 'Freezers');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.11.17', 'Refrigerator-Freezer');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.14', 'Food Storage Coolers');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.14.11', 'Walk-In Coolers');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.14.14', 'Display Coolers');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.17', 'Refrigerated Cases');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.21', 'Hot Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.24', 'Cold Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.27', 'Bottle Racks');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.31', 'Steam Tables');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.11.34', 'Snack Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14', 'Food Service Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.11', 'Food Delivery Carts and Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.11.11', 'Food Delivery Carts');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.11.14', 'Food Delivery Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.14', 'Food Preparation Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.14.11', 'Food Mixers');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.14.14', 'Drink Making Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.17', 'Food Cooking Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.17.11', 'Cookers, Ovens, Stoves');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.17.14', 'Hot Plates');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.17.17', 'Ranges');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.17.21', 'Grills');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.17.24', 'Fryers');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.17.27', 'Barbecues');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.17.31', 'Small Specialized Cooking Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.21', 'Hood and Ventilation Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.21.11', 'Food Service Hoods');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.21.14', 'Ventilation Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.21.17', 'Fire Suppression Systems');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.21.21', 'Catering Ventilation');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.24', 'Food Dispensing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.24.11', 'Bar Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.24.14', 'Service Line Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.24.17', 'Soda Fountain Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.27', 'Ice Machines');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.14.31', 'Cleaning and Disposal Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.17', 'Restaurant Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.17.11', 'Bars and Serving Counters');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.17.14', 'Restaurant Chairs');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.17.17', 'Restaurant Tables');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.17.21', 'Restaurant Booths');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.17.24', 'Restaurant Seating Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.40.17.27', 'Bar Stools');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.00', 'Educational, Cultural Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11', 'Educational, Entertainment Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.11', 'Auditorium Seating');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.11.11', 'Fixed Audience Seating');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.11.14', 'Portable Audience Seating');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.11.14.11', 'Folding Audience Chairs');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.11.14.14', 'Interlocking Audience Chairs');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.11.14.17', 'Stacking Audience Chairs');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.14', 'Classroom Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.14.11', 'Seat and Table Assemblies');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.14.14', 'Modular Desks');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.17', 'Multiple-Use Fixed Seating');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.21', 'Platforms');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.21.11', 'Folding and Portable Stages');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.24', 'Educational Play Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.11.27', 'Language Laboratory Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.14', 'Theater and Stage Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.14.11', 'Acoustical Shells');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.14.14', 'Rigging Systems and Controls');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.14.17', 'Scenery Docks');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.14.21', 'Suspension Systems');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.14.24', 'Stage Curtains');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.17', 'Planetarium Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.17.11', 'Planetarium Projectors');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.17.14', 'Planetarium Seating');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.21', 'Observatory Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.21.11', 'Telescopes');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24', 'Ecclesiastical Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.11', 'Religious Seating, Pews, and Benches');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.14', 'Chancel Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.14.11', 'Lecterns');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.14.14', 'Pulpits');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.14.17', 'Choir Screens');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.14.21', 'Altars');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.17', 'Baptisteries');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.21', 'Baptismal Fonts');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.24', 'Instrumental Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.24.11', 'Organs, Organ Cases and Screens');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.24.14', 'Bells');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.24.17', 'Carillons');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.27', 'Synagogue Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.31', 'Mosque Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.24.34', 'Temple Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.27', 'Library and Archive Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.27.11', 'Library Stack Systems');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.27.11.11', 'Library Shelving');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.27.14', 'Book Depositories');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.27.17', 'Book Theft Protection Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.27.21', 'Library Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.27.21.11', 'Library Filing Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.27.21.14', 'Library Display Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.27.21.17', 'Study Carrels');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.31', 'Exhibition Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.31.11', 'Display Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.31.11.11', 'Display Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.31.11.14', 'Display Racks');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.31.11.17', 'Display Carousels');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.31.14', 'Gallery Hanging Systems');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.31.17', 'Stands, Pedestals');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.31.21', 'Retail Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.31.24', 'Exhibition Stands, Shell Schemes');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.31.27', 'Exhibit Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34', 'Athletic, Recreational, and Therapeutic Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.11', 'Arcade Machines');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.14', 'Gymnasium Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.14.11', 'Backstops');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.14.14', 'Scoreboards and Time Clocks');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.14.17', 'Net Posts');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.14.21', 'Floor Sockets');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.14.24', 'Climbing Walls');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.14.27', 'Climbing Ropes');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.17', 'Gymnasium Dividers');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.21', 'Fitness and Exercise Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.24', 'Nets');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.27', 'Bowling Alley Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.31', 'Shooting Range Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.34', 'Equipment Storage Racks');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.37', 'Sauna and Steam Room Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.41', 'Solarium Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.44', 'Therapeutic Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.47', 'Spectator Stands, Seating');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.47.11', 'Fixed Stadium and Arena Seating');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.47.14', 'Telescoping Stands');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.47.14.11', 'Telescoping Bleachers');
INSERT INTO `omniclass 编号` VALUES ('23.40.50.34.47.14.14', 'Telescoping Chair Platforms');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.00', 'Work Environment Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11', 'Scientific and Medical Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.11', 'Laboratory Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.11.11', 'Laboratory Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.11.11.11', 'Laboratory Service Fixtures');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.11.11.14', 'Laboratory Fume Hoods');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.11.11.17', 'Laboratory Incubators');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.11.11.21', 'Laboratory Sterilizers');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.11.11.24', 'Laboratory Refrigerators');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.11.11.27', 'Laboratory Emergency Safety Appliances');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.11.11.31', 'Laboratory Service Columns');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.11.11.34', 'Laboratory Flammables Storage Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.11.14', 'Laboratory Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14', 'Health Care Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.11', 'Medical Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.11.11', 'Medical Sterilizing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.11.14', 'Examination and Treatment Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.11.17', 'Patient Care Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.11.17.11', 'Patient Hoists');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.11.17.14', 'Hospital Head Boards');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.11.17.17', 'Patient Beds');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.11.21', 'Post-Mortem and Dissection Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.11.24', 'Operating Room Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.11.27', 'Radiology Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.14', 'Dental Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.17', 'Optical Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.14.21', 'Health Care Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.17', 'Mortuary Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.17.11', 'Mortuary Refrigerators');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.17.14', 'Crematorium Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.11.17.17', 'Mortuary Lifts');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14', 'Retail and Commercial Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.11', 'Hospitality Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.14', 'Registration Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.17', 'Checkroom Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.21', 'Hospitality Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.24', 'Hospitality Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.24.11', 'Hospitality Bath Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.24.11.11', 'Hospitality Bath Linens and Towels');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.24.11.14', 'Hospitality Bath Mats');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.24.11.17', 'Hospitality Shower Curtains');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.24.14', 'Hospitality Bedroom Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.27', 'Mercantile Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.31', 'Barber Shop Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.34', 'Beauty Shop Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.37', 'Cash Registers and Checkout Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.41', 'Display Cases');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.41.11', 'Refrigerated Display Cases');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.44', 'Food Processing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.47', 'Food Weighing and Wrapping Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.51', 'Display Casework');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.54', 'Wall Display Systems');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.57', 'Office Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.57.11', 'Computers');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.57.14', 'Printers');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.57.17', 'Drafting Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.57.21', 'Plotters');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.57.24', 'Drawing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.61', 'Mailroom Case Goods');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64', 'Retail and Commercial Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64.11', 'Office Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64.14', 'Retail and Commercial Seating Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64.17', 'Office Storage and Filing Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64.17.11', 'Lateral Filing Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64.17.14', 'Vertical Filing Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64.21', 'Systems Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64.21.11', 'Panel-Hung Component');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64.21.14', 'Free-Standing Component');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64.21.17', 'Beam System');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64.21.21', 'Desk System');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.14.64.24', 'Office Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.17', 'Industrial and Manufacturing Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.17.11', 'Manufacturing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.17.14', 'Manufacturing Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.17.14.11', 'Flat Work Surface Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.17.14.14', 'Work Stations');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.17.17', 'Shop Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.17.21', 'Shop Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.17.21.11', 'Counters and Work Surfaces');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.17.21.14', 'Shop Display Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.17.21.17', 'Shop Storage Fittings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.21', 'Other Work-Related Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.21.11', 'Darkroom Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.21.14', 'Darkroom Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.21.14.11', 'Darkroom Processing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.21.17', 'Darkroom Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.21.21', 'Vending Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.21.24', 'Vending Machines');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.21.27', 'Ticket Machines');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.21.31', 'Change Machines');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.24', 'Vehicle Service Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.24.11', 'Compressed Air Vehicle Service Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.24.14', 'Fuel Dispensing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.24.17', 'Vehicle Lubrication Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.24.21', 'Tire Changing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.24.24', 'Vehicle Washing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.24.27', 'Vehicle Hoists');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27', 'Security and Vault Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.11', 'Safes');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.14', 'Safe Deposit Boxes');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.17', 'Vault Doors and Day Gates');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.21', 'Anti-Bandit Screens');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.21.11', 'Gun Ports');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.24', 'Teller and Service Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.24.11', 'Automated Banking Systems');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.24.14', 'Money Cart Pass-Through');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.24.17', 'Package Transfer Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.24.21', 'Service and Teller Window Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.24.24', 'Teller Equipment Systems');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.27', 'Secure Point of Sale Units/Tills');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.27.11', 'Deal Drawers');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.31', 'Key Security Cabinets');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.27.34', 'Money Counting and Handling Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.31', 'Detention Equipment and Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.31.11', 'Detention Enclosures');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.31.14', 'Detention Furnishings and Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.31.17', 'Detention Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.34', 'Agricultural Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.34.11', 'Milkers');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.34.14', 'Stock Feeders');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.34.17', 'Stock Waterers');
INSERT INTO `omniclass 编号` VALUES ('23.40.70.34.21', 'Waste Clean-Up Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.72.14.21', 'Hospitality Bed Linens');
INSERT INTO `omniclass 编号` VALUES ('23.40.72.14.22', 'Hospitality Pillows');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.00', 'Information and Communication Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.11', 'Information Display Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.11.11', 'Information Signs');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.11.14', 'Lettering and Numerals');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.11.17', 'Pin Boards');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.11.21', 'Writing Boards');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.11.24', 'Plaques');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.11.27', 'Poster Display Units');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.11.31', 'Notice Boards');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.11.34', 'Display Screens');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.11.37', 'Pictograms');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.14', 'Communication Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.14.11', 'Mail Boxes');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.14.14', 'Mail Racks');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.14.17', 'Pigeonholes');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.14.21', 'Mail Trolleys');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.14.24', 'Mail Handling Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.14.27', 'Telephone Booths');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.14.31', 'Acoustic Hoods');
INSERT INTO `omniclass 编号` VALUES ('23.40.90.14.34', 'Directory Boards');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.00', 'Furnishings, Ornaments, and Decoration');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.11', 'Soft Furnishings');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.11.31', 'Movable or Retractable Screens');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.14', 'Plant Display Furniture');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.14.11', 'Decorative Planters');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.14.14', 'Decorative Vases');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.17', 'Ornaments and Decoration');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.17.11', 'Interior Ornamental Fountains');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.17.14', 'Ornaments');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.17.17', 'Mirrors');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.17.21', 'Ornamental Screens');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.17.24', 'Artwork');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.17.27', 'Clocks');
INSERT INTO `omniclass 编号` VALUES ('23.40.95.17.31', 'Wall Hangings');
INSERT INTO `omniclass 编号` VALUES ('23.45.00.00', 'Sanitary, Laundry, and Cleaning Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.00', 'Sanitary Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14', 'Plumbing Fixtures - Sanitary Washing Units');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.11', 'Sanitary Washing Unit Components');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.11.11', 'Splashbacks');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.11.14', 'Bath Panels');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.11.17', 'Shower/Bath Seats');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.11.21', 'Shower Receptors');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.11.24', 'Shower/Bath Screens, Curtains');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.14', 'Sinks/Lavatories');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.14.11', 'Sacristy');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.14.14', 'Clinic Sinks');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.14.17', 'Plaster Sinks');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.14.21', 'Surgeon?s Scrub-Up Sinks');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.14.24', 'Surgeon?s Instrument Sinks');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.14.27', 'Service Sinks');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.14.31', 'Darkroom Sinks');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.14.34', 'Hairdressing Sinks');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.17', 'Showers');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.17.11', 'Shower Compartments');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.17.14', 'Shower Receptors');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.17.17', 'Group Showers');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.21', 'Bathtubs');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.21.11', 'Bath/Shower Units');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.21.14', 'Sitz Baths');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.21.17', 'Therapeutic Whirlpool Baths');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.24', 'Eye Wash Fountains');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.27', 'Bidets');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.31', 'Combination Toilets');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.31.11', 'Patient?s Combination Toilets');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.31.14', 'Detention Combination Toilets');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.34', 'Security Plumbing Fixtures');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.37', 'Bedpan Washers/Sanitizers');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.14.99', 'Other Sanitary Washing Plumbing Fixtures');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.17', 'Sanitary Leisure Units');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.17.11', 'Sauna Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.17.14', 'Steam Room Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.17.17', 'Leisure Whirlpools');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.17.21', 'Hot Tubs');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.21', 'Plumbing Fixtures - Sanitary Disposal Units');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.21.11', 'Water Closets');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.21.11.11', 'Water Operated Water Closets');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.21.11.14', 'Chemical/Biological Sanitary Disposal Units');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.21.11.21', 'Urinals');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.21.11.24', 'Sanitary Macerators');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.21.14', 'Sanitary Disposal Components');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.21.14.11', 'Water Closet Seats');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.21.14.14', 'Water Closet Tanks');
INSERT INTO `omniclass 编号` VALUES ('23.45.05.21.14.17', 'Sanitary Disposal Connectors');
INSERT INTO `omniclass 编号` VALUES ('23.45.30.00', 'Washing and Waste Disposal Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.30.11', 'Residential Washing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.30.11.11', 'Residential Dishwashers');
INSERT INTO `omniclass 编号` VALUES ('23.45.30.11.14', 'Residential Waste Disposal Units');
INSERT INTO `omniclass 编号` VALUES ('23.45.30.14', 'Commercial Washing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.30.14.11', 'Commercial Dishwashers');
INSERT INTO `omniclass 编号` VALUES ('23.45.30.14.14', 'Commercial Waste Disposal Units');
INSERT INTO `omniclass 编号` VALUES ('23.45.30.14.21', 'High Pressure Washing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.30.17', 'Drain Boards');
INSERT INTO `omniclass 编号` VALUES ('23.45.55.00', 'Sanitary Faucets, Wastes');
INSERT INTO `omniclass 编号` VALUES ('23.45.55.11', 'Sanitary Components');
INSERT INTO `omniclass 编号` VALUES ('23.45.55.11.11', 'Plugs');
INSERT INTO `omniclass 编号` VALUES ('23.45.55.11.14', 'Chains');
INSERT INTO `omniclass 编号` VALUES ('23.45.55.11.17', 'Overflow Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.45.55.14', 'Single Faucets');
INSERT INTO `omniclass 编号` VALUES ('23.45.55.17', 'Mixing Faucets');
INSERT INTO `omniclass 编号` VALUES ('23.45.55.21', 'Drains (Wastes)');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.00', 'Laundry and Cleaning Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11', 'Laundry Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.11', 'Residential Laundry Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.11.11', 'Washing Machines');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.11.14', 'Clothes Dryers');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.14', 'Commercial Laundry Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.14.11', 'Washing Machines');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.14.14', 'Extractors');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.14.17', 'Clothes Dryers');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.14.21', 'Clothes Airers');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.14.24', 'Ironing and Pressing Machines');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.14.27', 'Laundry Folding Machines');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.14.31', 'Commercial Clothes Lines');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.11.14.34', 'Dry Cleaning Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.14', 'Room Cleaning Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.14.11', 'Vacuum Cleaning Systems');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.14.14', 'Floor and Wall Cleaning');
INSERT INTO `omniclass 编号` VALUES ('23.45.70.14.17', 'Housekeeping Carts');
INSERT INTO `omniclass 编号` VALUES ('23.50.00.00', 'Conveying Systems & Material Handling');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.00', 'Vertical Transportation');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11', 'Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.11', 'Electric Traction Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.11.11', 'Freight Electric Traction Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.11.14', 'Passenger Electric Traction Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.11.17', 'Residential Electric Traction Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.11.21', 'Service Electric Traction Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.14', 'Hydraulic Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.14.11', 'Freight Hydraulic Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.14.14', 'Passenger Hydraulic Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.14.17', 'Residential Hydraulic Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.14.21', 'Service Hydraulic Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.17', 'Rack and Pinion Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.21', 'Elevator Cabs');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.24', 'Elevator Equipment and Controls');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.24.11', 'Elevator Doors');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.24.14', 'Elevator Controls');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.11.27', 'Elevator Restoration Products');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.14', 'Lifts');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.14.11', 'Scissors Lifts');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.14.14', 'Stair Elevators');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.14.14.11', 'Inclined Platform Lifts');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.14.17', 'Elevating Platforms');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.14.17.11', 'Platform Lifts');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.14.17.14', 'Sidewalk Lifts');
INSERT INTO `omniclass 编号` VALUES ('23.50.05.17', 'Escalators');
INSERT INTO `omniclass 编号` VALUES ('23.50.20.00', 'Horizontal Transportation');
INSERT INTO `omniclass 编号` VALUES ('23.50.20.11', 'Moving Walks');
INSERT INTO `omniclass 编号` VALUES ('23.50.20.14', 'People Movers');
INSERT INTO `omniclass 编号` VALUES ('23.50.20.17', 'Aircraft Passenger Loading');
INSERT INTO `omniclass 编号` VALUES ('23.50.20.17.11', 'Jetways');
INSERT INTO `omniclass 编号` VALUES ('23.50.20.17.14', 'Gangways');
INSERT INTO `omniclass 编号` VALUES ('23.50.20.21', 'Monorails');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.00', 'Materials Handling');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.11', 'Dumbwaiters');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.11.11', 'Manual Dumbwaiters');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.11.14', 'Electric Dumbwaiters');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.11.17', 'Hydraulic Dumbwaiters');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.14', 'Material Transport');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.14.11', 'Automated Document Filing and Retrieval');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.14.14', 'Automated Guided Vehicles');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.14.14.11', 'Guided Vehicle Material Handling');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.14.14.14', 'Track Vehicle Material Handling');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.17', 'Postal Conveying');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.21', 'Baggage Conveying and Dispensing');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24', 'Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.11', 'Conveyor Components');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.11.11', 'Conveyor Belts');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.14', 'Belt Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.17', 'Bucket Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.21', 'Container Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.24', 'Hopper and Track Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.27', 'Monorail Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.31', 'Oscillating Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.34', 'Pneumatic Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.37', 'Roller Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.41', 'Scoop Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.44', 'Screw Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.24.47', 'Selective Vertical Conveyors');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.34', 'Pneumatic Tubes');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.34.11', 'Document Conveying Systems');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37', 'Hoists and Cranes');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.11', 'Cranes');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.11.11', 'Crane Rails');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.11.14', 'Bridge Cranes');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.11.14.11', 'Top-Running Overhead Cranes');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.11.14.14', 'Underslung Overhead Cranes');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.11.17', 'Gantry Cranes');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.11.21', 'Jib Cranes');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.11.24', 'Tower Cranes');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.11.27', 'Mobile Cranes');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.11.31', 'Derricks');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.14', 'Fixed Hoists');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.14.11', 'Air Powered Fixed Hoists');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.14.14', 'Electric Fixed Hoists');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.14.17', 'Manual Fixed Hoists');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.17', 'Trolley Hoists');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.17.11', 'Air Powered Trolley Hoists');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.17.14', 'Electric Trolley Hoists');
INSERT INTO `omniclass 编号` VALUES ('23.50.30.37.17.17', 'Manual Trolley Hoists');
INSERT INTO `omniclass 编号` VALUES ('23.50.50.00', 'Turntables');
INSERT INTO `omniclass 编号` VALUES ('23.50.50.11', 'Restaurant Turntables');
INSERT INTO `omniclass 编号` VALUES ('23.50.50.14', 'Stage Turntables');
INSERT INTO `omniclass 编号` VALUES ('23.50.50.17', 'Exhibit and Display Turntables');
INSERT INTO `omniclass 编号` VALUES ('23.50.50.21', 'Vehicular Turntable');
INSERT INTO `omniclass 编号` VALUES ('23.50.55.00', 'Parking Systems');
INSERT INTO `omniclass 编号` VALUES ('23.50.55.11', 'Car Parking Systems');
INSERT INTO `omniclass 编号` VALUES ('23.50.70.00', 'Loading Dock Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.50.70.11', 'Dock Bumpers/Seals');
INSERT INTO `omniclass 编号` VALUES ('23.50.70.14', 'Dock Levelers');
INSERT INTO `omniclass 编号` VALUES ('23.50.70.14.11', 'Powered Dock Levelers');
INSERT INTO `omniclass 编号` VALUES ('23.50.70.14.14', 'Manual Dock Levelers');
INSERT INTO `omniclass 编号` VALUES ('23.50.70.17', 'Dock Lifts');
INSERT INTO `omniclass 编号` VALUES ('23.50.70.17.11', 'Powered Dock Lifts');
INSERT INTO `omniclass 编号` VALUES ('23.50.70.17.14', 'Manual Dock Lifts');
INSERT INTO `omniclass 编号` VALUES ('23.50.70.21', 'Portable Ramps, Bridges, and Platforms');
INSERT INTO `omniclass 编号` VALUES ('23.50.70.24', 'Seals and Shelters');
INSERT INTO `omniclass 编号` VALUES ('23.50.70.27', 'Truck Restraints');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.00', 'Scaffolding');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.11', 'Suspended Scaffolding');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.11.11', 'Beam Suspended Scaffolding');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.11.14', 'Carriage Suspended Scaffolding');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.11.17', 'Hook Suspended Scaffolding');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.14', 'Rope Climbers');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.14.11', 'Manual Rope Climbers');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.14.14', 'Powered Rope Climbers');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.17', 'Telescoping Platforms');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.17.11', 'Electric and Battery Telescoping Platforms');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.17.14', 'Pneumatic Telescoping Platforms');
INSERT INTO `omniclass 编号` VALUES ('23.50.85.21', 'Powered Scaffolding');
INSERT INTO `omniclass 编号` VALUES ('23.50.90.00', 'Building Maintenance Systems');
INSERT INTO `omniclass 编号` VALUES ('23.50.90.11', 'Window Washing Systems');
INSERT INTO `omniclass 编号` VALUES ('23.50.90.14', 'Building Maintenance Cradles and Platforms');
INSERT INTO `omniclass 编号` VALUES ('23.50.90.17', 'Roof Trolley Systems');
INSERT INTO `omniclass 编号` VALUES ('23.50.90.21', 'Traveling Ladder Systems');
INSERT INTO `omniclass 编号` VALUES ('23.50.90.24', 'Ancillary Building Maintenance Items');
INSERT INTO `omniclass 编号` VALUES ('23.50.90.24.11', 'Safety Tracks');
INSERT INTO `omniclass 编号` VALUES ('23.50.90.24.14', 'Anchors for Building Maintenance');
INSERT INTO `omniclass 编号` VALUES ('23.50.90.27', 'Fall Arrest Systems');
INSERT INTO `omniclass 编号` VALUES ('23.55.00.00', 'Manufactured Structures');
INSERT INTO `omniclass 编号` VALUES ('23.55.10.00', 'Towers and Superstructures');
INSERT INTO `omniclass 编号` VALUES ('23.55.10.11', 'Industrial Breechings, Chimneys, and Stacks');
INSERT INTO `omniclass 编号` VALUES ('23.55.10.11.11', 'Breechings');
INSERT INTO `omniclass 编号` VALUES ('23.55.10.11.11.11', 'Fabricated Breechings and Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.55.10.11.14', 'Chimney Shafts');
INSERT INTO `omniclass 编号` VALUES ('23.55.10.11.17', 'Chimney Linings');
INSERT INTO `omniclass 编号` VALUES ('23.55.10.11.21', 'Draft Control Devices');
INSERT INTO `omniclass 编号` VALUES ('23.55.10.11.24', 'Insulated Sectional Chimneys');
INSERT INTO `omniclass 编号` VALUES ('23.55.10.14', 'Towers');
INSERT INTO `omniclass 编号` VALUES ('23.55.10.14.11', 'Cooling Towers');
INSERT INTO `omniclass 编号` VALUES ('23.55.10.14.14', 'Water Towers');
INSERT INTO `omniclass 编号` VALUES ('23.60.00.00', 'General Purpose: Services');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.00', 'General Measuring Instruments');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.11', 'Temperature Measuring Instruments');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.14', 'Pressure Measuring Instruments');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.17', 'Flow Meters');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.21', 'Concentration Measuring Instruments');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.21.11', 'Humidity Concentration Measuring Instruments');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.21.14', 'Carbon Dioxide (CO?) Concentration Measuring Instruments');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.21.17', 'Ozone Concentration Measuring Instruments');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.21.21', 'Other Gas Concentration Measuring Instruments');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.24', 'Heat Measuring Instruments');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.27', 'Level Measuring Instruments');
INSERT INTO `omniclass 编号` VALUES ('23.60.10.31', 'Weighing Instruments');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.00', 'General Pipework and Ductwork Products');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.11', 'Pipework Products for General Use');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.11.14', 'Pipework Fittings');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.11.14.11', 'Water Hammer Arrestors');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.11.14.14', 'Pipe Expansion Compensators');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.11.17', 'Pipework/Ductwork Mechanical Fasteners/Supports');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.14', 'Ducting and Wireways for General Use');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.14.11', 'Underfloor Wireways');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.14.14', 'Service Penetrations');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.17', 'Manholes');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.21', 'Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.21.11', 'Pump Components');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.21.14', 'Manual Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.21.17', 'Motor Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.21.21', 'Pump Sets');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.21.24', 'Booster Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.24', 'Poles for Aerial Networks');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.24.11', 'Utility Poles');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.24.14', 'Lighting Poles and Standards');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.24.17', 'Antenna Towers');
INSERT INTO `omniclass 编号` VALUES ('23.60.30.24.21', 'Transmission Towers');
INSERT INTO `omniclass 编号` VALUES ('23.60.50.00', 'General Purpose Controls');
INSERT INTO `omniclass 编号` VALUES ('23.60.50.11', 'Photoelectric Cells');
INSERT INTO `omniclass 编号` VALUES ('23.60.50.14', 'Infra Red and Other Remote Controls');
INSERT INTO `omniclass 编号` VALUES ('23.60.50.17', 'Hydraulic Controls');
INSERT INTO `omniclass 编号` VALUES ('23.60.50.21', 'Pneumatic Controls');
INSERT INTO `omniclass 编号` VALUES ('23.60.50.24', 'Electric Controls');
INSERT INTO `omniclass 编号` VALUES ('23.60.50.27', 'Digital Controls');
INSERT INTO `omniclass 编号` VALUES ('23.60.70.00', 'General Protection for Services');
INSERT INTO `omniclass 编号` VALUES ('23.60.70.11', 'Fireproofing for Services');
INSERT INTO `omniclass 编号` VALUES ('23.60.70.11.11', 'Fire Dampers');
INSERT INTO `omniclass 编号` VALUES ('23.60.70.14', 'Smoke Seals for Ductwork');
INSERT INTO `omniclass 编号` VALUES ('23.60.70.14.11', 'Smoke Dampers');
INSERT INTO `omniclass 编号` VALUES ('23.65.00.00', 'Supply and Distribution of Liquids and Gases');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.00', 'Complete Supply, Storage and Distribution Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.11', 'Complete Systems for Supply, Storage and Distribution of Liquids');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.11.11', 'Water Supply Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.11.14', 'Consumable Liquids Supply Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.11.17', 'Liquid Fuel Supply Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.11.21', 'Liquid Fire Suppression Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.11.99', 'Other Liquid Supply Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.14', 'Complete Systems for Supply, Storage and Distribution of Gases');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.14.11', 'Steam Supply Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.14.14', 'Fuel Gas Supply Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.14.17', 'Medical Gases Supply Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.14.21', 'Gaseous Fire Suppression Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.05.14.99', 'Other Gas Supply Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.00', 'Storage Vessels for Supplied Liquids and Gases');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.11', 'Storage Vessels for Liquids');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.11.11', 'Liquid Storage Components');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.11.11.11', 'Overflow Regulators');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.11.11.14', 'Fill and Valve Caps');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.11.11.17', 'Vents for Liquid Storage Tanks');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.11.14', 'Rainwater Tanks');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.11.17', 'Supply Water Tanks');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.11.21', 'Consumable Liquid Storage Vessels');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.11.24', 'Liquid Fuel Storage Vessels');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.11.24.11', 'Fuel Oil Pre-Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.11.27', 'Other Liquid Storage Vessels');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.14', 'Storage Vessels for Gases');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.14.11', 'Vacuum/Pressurized Air Storage Vessels');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.14.14', 'Steam Storage Vessels');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.14.17', 'Medical Gases Storage Vessels');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.14.21', 'Fuel Gas and LPG Storage Vessels');
INSERT INTO `omniclass 编号` VALUES ('23.65.20.14.24', 'Other Gas Storage Vessels');
INSERT INTO `omniclass 编号` VALUES ('23.65.35.00', 'Heaters for Supplied Liquids');
INSERT INTO `omniclass 编号` VALUES ('23.65.35.11', 'Supply Water Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.65.35.11.11', 'Storage Water Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.65.35.11.14', 'Instantaneous Water Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.65.35.11.17', 'Thermodynamic Water Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.65.35.99', 'Heaters for Other Supplied Liquids');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.00', 'Treatment of Supplied Liquids/Gases');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.11', 'Water Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.11.11', 'Water Treatment Components');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.11.11.11', 'Water Filters');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.11.11.14', 'Water Softeners');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.11.11.17', 'Magnetic/Electronic Water Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.11.11.21', 'Sterilizers');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.11.11.24', 'Salinators');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.11.11.27', 'Chlorinators');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.11.11.31', 'Ionizers, Ozone Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.11.11.34', 'Additives for Water Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.65.50.11.14', 'Packaged Water Treatment Systems');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.00', 'Distribution of Supplied Liquids/Gases');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.11', 'Supply Pumps and Compressors');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.11.11', 'Gas Compressors/Vacuum Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.14', 'Valves for Liquid Services');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.14.11', 'Inlet/Outlet Valves for Liquid Services');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.14.11.11', 'Fill Valves for Liquid Services');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.14.11.14', 'Bleeding Valves for Liquid Services');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.14.11.17', 'Overflow Valves for Liquid Services');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.14.14', 'Isolation Valves for Liquid Services');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.14.17', 'Adjusting/Controlling Valves for Liquid Services');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.14.21', 'Non-Return Valves for Liquid Services');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.14.24', 'Mixing Valves for Liquid Services');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.17', 'Valves for Gas Supply Services');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.17.11', 'Inlet/Outlet Valves for Gas Supplies');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.17.11.11', 'Steam Outlet Valves');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.17.14', 'Isolation Valves for Gas Supplies');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.17.17', 'Adjusting/Controlling Valves for Gas Supplies');
INSERT INTO `omniclass 编号` VALUES ('23.65.55.17.21', 'Non-Return Valves for Gas Supplies');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.00', 'Terminals for Supplied Liquids and Gases');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.11', 'Fixtures for Supplied Liquids and Gases');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.11.11', 'Fixtures for Liquids');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.11.14', 'Gas Service Fixtures');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.14', 'Fountains');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.14.11', 'Drinking Fountains/Coolers');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.14.11.11', 'Security Drinking Fountains/Coolers');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17', 'Fire Fighting Terminals');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.11', 'Fire Fighting Terminal Components');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.11.11', 'Fire Hydrants');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.11.14', 'Fire Hose Reels');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.11.17', 'Fire Hoses');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.11.21', 'Fire Fighting Gas Terminals');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.11.24', 'Fire Fighting Sprinkler Heads');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.11.27', 'Cabinets for Fire Hoses');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.11.31', 'Fire Fighting Media');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.14', 'Water Fire Fighting Terminals');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.17', 'Gaseous Fire Fighting Terminals');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.21', 'Foam Fire Fighting Terminals');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.24', 'Powder Fire Fighting Terminals');
INSERT INTO `omniclass 编号` VALUES ('23.65.70.17.27', 'Fire Extinguishers');
INSERT INTO `omniclass 编号` VALUES ('23.70.00.00', 'Waste Management');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.00', 'Solid Waste Handling Products');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.11', 'Solid Waste Impelling Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.14', 'Solid Waste Treatment Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.14.11', 'Solid Waste Compactors, Destructors, and Balers');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.14.14', 'Solid Waste Crushers');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.14.17', 'Solid Waste Pulping Machines');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.14.21', 'Solid Waste Shredding Machines');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.14.24', 'Pneumatic Waste Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.14.27', 'Incinerators');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.14.27.11', 'Solid Waste Incinerators');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.14.27.14', 'Packaged Incinerators');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.14.31', 'Recycling Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.17', 'Solid Waste Monitoring and Control Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.17.11', 'Solid Waste Metal Detectors');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.17.14', 'Solid Waste Detectors for Other Solids');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.21', 'Solid Waste Collection and Removal Products');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.21.11', 'Complete Solid Waste Removal Systems');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.21.14', 'Solid Waste Bins');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.21.17', 'Gravity Chute Solid Waste Systems');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.21.21', 'Refuse Disposal Chutes');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.21.21.11', 'Refuse Hoppers');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.21.21.14', 'Refuse Chute Doors');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.21.21.17', 'Refuse Chute Decontamination Units');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.24', 'Solid Waste Handling Systems');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.24.11', 'Refuse Compactors');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.24.14', 'Refuse Containers');
INSERT INTO `omniclass 编号` VALUES ('23.70.30.24.17', 'Dust Collectors');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.00', 'Liquid Waste Handling Services');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.11', 'Pumps for Liquid Waste');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.11.11', 'Surface Waste Water Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.11.14', 'Sewage and Sludge Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.11.14.11', 'Oil-Water Separators');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.11.14.14', 'Packaged Sewage and Sludge Pump Stations');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.11.14.17', 'Sewage Ejectors');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.11.17', 'Combined Macerator-Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14', 'Liquid Waste Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.11', 'Packaged Sewage Treatment Plants');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14', 'General Waste Water Treatment Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.11', 'Grit Collecting Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.14', 'Screening and grinding Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.17', 'Sedimentation Tank Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.21', 'Scum Removal Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.24', 'Chemical Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.27', 'Sludge Handling and Treatment Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.31', 'Filter Underdrains and Media');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.31.11', 'Filter Bottoms');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.31.14', 'Filter Media');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.31.17', 'Package Filters');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.34', 'Filter Press Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.14.37', 'Trickling Filter Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17', 'Other Waste Water Treatment Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.11', 'Waste Water Compressors');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.14', 'Waste Water Aeration Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.17', 'Waste Water Oxygenation Systems');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.17.11', 'Waste Water Oxygen Dissolution System');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.17.14', 'Waste Water Oxygen Generators');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.17.17', 'Waste Water Oxygen Storage Facility');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.21', 'Sludge Digestion Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.21.11', 'Sludge Conditioning Systems');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.21.14', 'Sludge Incinerators');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.24', 'Digester Mixing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.24.11', 'Digester Covers and Appurtenances');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.24.11.11', 'Fixed Digester Covers');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.24.11.14', 'Floating Digester Covers');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.17.24.11.17', 'Gasholder Covers');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.21', 'Septic Tank Systems');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.21.11', 'Drainage Field');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.21.14', 'Grease Interceptor');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.21.17', 'Sand Filter');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.21.21', 'Septic Tank');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.21.24', 'Siphon Tank');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.24', 'Bacterial Filter Tanks');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.27', 'Liquid Waste Decanters');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.14.31', 'Liquid Waste Separators');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.17', 'Liquid Waste Monitoring and Control');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.17.11', 'Detectors of Water Pollution');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.21', 'Liquid Waste Collection and Removal');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.21.24', 'Waste Water Drains');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.21.24.11', 'Roof Waste Water Drains');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.21.24.14', 'Deck Waste Water Drains');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.21.27', 'Drainage Pipes, Couplings, Collectors');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.21.31', 'Pipework Access Fittings');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.21.34', 'French Drain');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.21.37', 'Valves for Removal Systems');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.21.37.11', 'Air Inlet Valves for Removal Systems');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.21.37.14', 'Non-Return Valves for Removal Systems');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.24', 'Rainwater Removal');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.24.11', 'Roof Gutters/Eavestroughs');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.24.14', 'Downspouts');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.24.14.11', 'Mechanical Fasteners for Downspouts');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.24.14.14', 'Downspout Strainers');
INSERT INTO `omniclass 编号` VALUES ('23.70.50.24.17', 'Siphonic Drains');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.00', 'Gaseous Waste Handling Services');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.11', 'Gaseous Waste Impelling Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.11.11', 'Flue Booster Fans');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.11.14', 'Flue Dilution Fans');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.11.17', 'Fume Extractor Fans');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.14', 'Gaseous Waste Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.14.11', 'Flue Gas Purifiers');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.17', 'Gaseous Waste Monitoring and Control');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.17.11', 'Air Pollution Detectors');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.17.14', 'Flue Gas Analyzers');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21', 'Gaseous Waste Removal');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.11', 'Complete Gaseous Waste Handling Systems');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.14', 'Complete Flue and Chimney Systems');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.14.11', 'Gas Vents');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.14.14', 'Fabricated Stacks');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.14.17', 'Fabricated Breechings and Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.14.21', 'Insulated Sectional Chimneys');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.17', 'Flue and Chimney Systems Components');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.17.11', 'Draft Control Devices');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.17.14', 'Fireplace Lintels');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.17.17', 'Flue Linings');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.17.21', 'Flue Caps, Cowls');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.17.24', 'Access Panels for Chimneys');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.17.27', 'Dampers for Chimneys');
INSERT INTO `omniclass 编号` VALUES ('23.70.70.21.17.31', 'Fire Shutter Extinguishers');
INSERT INTO `omniclass 编号` VALUES ('23.75.00.00', 'Climate Control (HVAC)');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.00', 'Transformation and Conversion of Energy');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11', 'Central Heat Generators');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.14', 'Hot Water Heat Generators');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.14.11', 'Cast-Iron Boilers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.14.14', 'Condensing Boilers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.14.17', 'Finned Water-Tube Boilers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.14.21', 'Firebox Heating Boilers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.14.24', 'Flexible Water-Tube Boilers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.14.27', 'Pulse Combustion Boilers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.14.31', 'Scotch Marine Boilers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.14.34', 'Steel Water-Tube Boilers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.17', 'Warm Air Heat Generators');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.17.11', 'Furnaces');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.17.11.11', 'Electric-Resistance Furnaces');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.17.11.14', 'Fuel-Fired Furnaces');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.21', 'Steam Heat Generators');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.24', 'Heat Generators, Thermal Liquid');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.27', 'Fuel Burners');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.27.11', 'Fuel Oil Filters');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.27.14', 'Nozzles');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.27.17', 'Burner Controls');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.31', 'Solid Fuel Transport and Handling Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.11.34', 'Fuel Gas Heat Recovery Devices');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14', 'Independent Electric Heating Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.11', 'Electric Convectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.11.11', 'Static Convectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.11.14', 'Fan Convectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.14', 'Electric Radiators');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.14.11', 'Storage Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.14.14', 'Infrared Radiators/Plates');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.14.17', 'Ultraviolet Radiators');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.14.21', 'Electric Heated Towel Bars');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.14.24', 'Electric Heated Ceiling Panels');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.14.27', 'Portable Radiators');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.17', 'Electric Surface Heating Products');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.17.11', 'Heating Sheets for Walls and Ceilings');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.17.14', 'Heating Sheets for Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.17.17', 'Pipe Heating Tapes/Cable Heating Trace');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.21', 'Embedded Electric Heating Appliances');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.21.11', 'Heating Sheets');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.14.21.14', 'Heating Cables');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17', 'Non-Electric Local Heating Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17.11', 'Non-Electric Stoves');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17.14', 'Fuel-Fired Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17.14.11', 'Fuel-Fired Duct Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17.14.14', 'Fuel-Fired Radiant Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17.14.17', 'Fuel-Fired Unit Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17.14.21', 'Fuel-Fired Air Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17.14.24', 'Fuel-Fired Domestic Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17.17', 'Combined Heating/Cooking Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17.17.11', 'Heat Pumps, Heating Function');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17.17.14', 'Heat Pumps, Cooling Function');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.17.17.17', 'Heat Pumps, Heating-Cooling Function');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.21', 'Heat Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.21.11', 'Air-Source Heat Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.21.14', 'Rooftop Heat Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.21.17', 'Water-Source Heat Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24', 'Cooling and Freeze Plant');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.11', 'Chilled Water Plant');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.14', 'Refrigeration Plant');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.17', 'Cold Room Plant');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21', 'Cooling and Freeze Components');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.11', 'Refrigerant Condensing Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.11.11', 'Packaged Refrigerant Condensing Coils and Fan Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.11.14', 'Refrigerant Condensing Coils');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.14', 'Refrigerant Evaporators');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.17', 'Refrigerant Compressors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.17.11', 'Centrifugal Refrigerant Compressors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.17.14', 'Reciprocating Refrigerant Compressors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.17.17', 'Rotary-Screw Refrigerant Compressors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.21', 'Packaged Water Chillers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.21.11', 'Absorption Water Chillers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.21.14', 'Centrifugal Water Chillers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.21.17', 'Reciprocating Water Chillers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.21.21', 'Rotary-Screw Water Chillers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.24', 'Liquid Coolers and Evaporative Condensers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.27', 'Unitary Air Conditioning Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.27.11', 'Packaged Air Conditioners');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.27.14', 'Packaged Rooftop Air Conditioning Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.27.17', 'Packaged Rooftop Make-Up Air Conditioning Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.27.21', 'Packaged Terminal Air Conditioning Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.27.24', 'Room Air Conditioners');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.27.27', 'Split System Air Conditioning Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.31', 'Cooling/Freeze Plant Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.24.21.31.11', 'Refrigerant Liquid');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27', 'Solar Collectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.11', 'Solar Collectors, Complete Systems');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.11.11', 'Packaged Solar Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.14', 'Solar Collector Components');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.14.11', 'Solar Absorber Plates or Tubing');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.14.14', 'Solar Coatings and Surface Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.14.17', 'Solar Collector Insulation');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.14.21', 'Solar Glazing');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.14.24', 'Solar Housing and Framing');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.14.27', 'Solar Reflectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.17', 'Solar Collector Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.17.11', 'Solar Flat Plate Collectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.17.14', 'Solar Concentrating Collectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.17.17', 'Solar Vacuum Tube Collectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.17.21', 'Heat Exchangers, Tubular');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.17.24', 'Heat Exchangers, Plate');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.17.27', 'Heat Exchangers, Rotary');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.27.21', 'Photovoltaic Collectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.31', 'Wind Energy Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.34', 'Energy Recovery Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.34.11', 'Energy Storage Tanks');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.34.14', 'Heat Pipe');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.34.17', 'Heat Wheels');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.34.21', 'Heat Exchangers for Ventilation Air');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.37', 'Cooling Towers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.37.11', 'Mechanical-Draft Cooling Towers');
INSERT INTO `omniclass 编号` VALUES ('23.75.10.37.14', 'Natural-Draft Cooling Towers');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.00', 'Impelling Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.14', 'Air Handling Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.14.11', 'Built-Up Indoor Air Handling Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.14.14', 'Customized Rooftop Air Handling Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.14.17', 'Modular Indoor Air Handling Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.14.21', 'Modular Rooftop Air Handling Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.17', 'Fans');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.17.11', 'Fans for Air Ductwork');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.17.14', 'Fans, Single Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.17.17', 'Room Air Circulation Fans');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.17.17.11', 'Ceiling Fans');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.17.21', 'Air Curtains');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.17.24', 'Axial Fans');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.17.27', 'Centrifugal Fans');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.21', 'Extractors');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.21.11', 'Emergency Smoke Extractors');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.21.14', 'Extractors for Process Air');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.21.17', 'Industrial Ventilating Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.75.35.21.21', 'Power Ventilators');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.00', 'Energy Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.11', 'Treatment of Circulation Liquids');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.11.14', 'Feedwater Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.11.14.11', 'Boiler Feedwater Pumps');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.11.14.14', 'Deaerators');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.11.14.17', 'Packaged Deaerator and Feedwater Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.14', 'Steam Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.14.11', 'Steam Dryers');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17', 'Supply Air Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.11', 'Air Filters');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.11.11', 'Air Filter Components');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.11.11.11', 'Air Filter Media');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.11.14', 'High-Efficiency Air Filters');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.11.17', 'ULPA Filters');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.11.21', 'HEPA Filters');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.14', 'Dust Collectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.17', 'Electronic Air Cleaners');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.21', 'Air Humidifiers');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.24', 'Dehumidifiers');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.24.11', 'Swimming Pool Dehumidification Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.27', 'Air Fresheners');
INSERT INTO `omniclass 编号` VALUES ('23.75.50.17.31', 'Clean Room Air Treatment');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.00', 'Monitoring and Control Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.11', 'Monitoring and Control of Internal Climate');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.11.11', 'Heating Controllers');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.11.14', 'Heating Programmers');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.11.17', 'Heating Optimizers/Economizers');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.14', 'Industrial Plant Performance Controls');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.14.14', 'Centralized Plant Controls');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.14.14.11', 'Temperature Controls');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.14.14.14', 'Pressure Controls');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.14.14.17', 'Flow Controls');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.14.14.21', 'Concentration Controls');
INSERT INTO `omniclass 编号` VALUES ('23.75.65.14.17', 'Control and Monitoring Boards/Panels');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.00', 'HVAC Distribution Devices');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.11', 'Circulation Pipe Fittings');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.11.11', 'Distribution Collectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.11.14', 'Expansion Vessels');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.11.14.11', 'Air Ducts');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.11.14.14', 'Dampers for Air Ductwork');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.11.14.17', 'Fire Shutters for Air Ductwork');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.11.14.21', 'Guide Vanes');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.11.14.24', 'Air Mixers');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.11.14.27', 'Sound Attenuators');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.14', 'Air Ductwork');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.14.11', 'Access Fittings for Air Ductwork');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.14.14', 'Couplings for Air Ductwork');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.14.17', 'Hangers and Supports, Mechanical Fasteners for Air Ductwork');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.14.21', 'Fibrous Glass Ducts');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.14.24', 'Flexible Ducts');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.14.27', 'Glass-Fiber-Reinforced Plastic Ducts');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.14.31', 'Metal Ducts');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.14.34', 'Air Duct Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.17', 'Water Heated and Cooled Terminal Heating and Cooling Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.17.11', 'Radiators');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.17.14', 'Convectors');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.17.17', 'Radiation Panels');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.17.21', 'Embedded Water Heating Terminals');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.17.24', 'Finned-Tube Radiation');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.17.27', 'Fan Coil Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.17.31', 'Induction Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.17.34', 'Unit Heaters');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.17.37', 'Unit Ventilators');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.17.41', 'Water Heated Towel Bars');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21', 'Terminals for Air');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.11', 'Supports, Mechanical Fasteners');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.14', 'Coil Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.17', 'Air Curtains');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.21', 'Local Air-Conditioning Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.24', 'Air Terminal Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.24.11', 'Constant Volume Air Terminal Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.24.14', 'Variable Volume Air Terminal Units');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.27', 'Air Outlets and Inlets');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.27.11', 'Diffusers, Registers, and Grilles');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.27.14', 'Gravity Ventilators');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.27.17', 'Intake and Relief Ventilators');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.27.21', 'Penthouse Ventilators');
INSERT INTO `omniclass 编号` VALUES ('23.75.70.21.31', 'Exhaust Terminals');
INSERT INTO `omniclass 编号` VALUES ('23.80.00.00', 'Electric Power and Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.00', 'Generation and Transformation Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.11', 'Electrical Generators');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.11.11', 'Electrical Generators, Single Units');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.11.11.11', 'Engine Generators');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.11.11.14', 'Motor Generators');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.11.14', 'Driven Electrical Generator Sets');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.11.14.11', 'Driving Units');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.11.14.14', 'Electricity Generation Units');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.11.17', 'Frequency Changers');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.11.21', 'Rotary Converters');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.11.24', 'Rotary Uninterruptible Power Units');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.14', 'Transformers');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.14.11', 'Power Transformers');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.14.14', 'Current Transformers');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.14.17', 'Safety Transformers');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.14.21', 'Transformer Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.14.21.11', 'Transformer Commutators');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.14.21.14', 'Transformer Ballasts');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.17', 'Static Power Converters');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.17.11', 'Static Rectifiers');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.17.14', 'Ondulators');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.17.17', 'Combined Converter Sets');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.17.21', 'Battery Chargers');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.17.24', 'Direct Current (DC) Drive Controllers');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.17.27', 'Slip Controllers');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.17.31', 'Static Frequency Converters');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.17.34', 'Static Uninterruptible Power Supplies');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.17.37', 'Variable Frequency Controllers');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.21', 'Electric Motors');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.21.11', 'Direct Current (DC) Motors');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.21.14', 'Alternating Current (AC) Motors');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.24', 'Power Storage');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.24.11', 'Batteries');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.24.11.11', 'Battery Racks');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.24.11.14', 'Central Battery Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.24.14', 'Battery Chargers');
INSERT INTO `omniclass 编号` VALUES ('23.80.10.24.17', 'Uninterrupted Power Supply (UPS) Units');
INSERT INTO `omniclass 编号` VALUES ('23.80.25.00', 'Measuring and Recording Devices');
INSERT INTO `omniclass 编号` VALUES ('23.80.25.11', 'Electrical Meters');
INSERT INTO `omniclass 编号` VALUES ('23.80.25.11.11', 'Power Meters');
INSERT INTO `omniclass 编号` VALUES ('23.80.25.11.14', 'Voltage Meters');
INSERT INTO `omniclass 编号` VALUES ('23.80.25.11.17', 'Resistance Meters');
INSERT INTO `omniclass 编号` VALUES ('23.80.25.11.21', 'Frequency Meters');
INSERT INTO `omniclass 编号` VALUES ('23.80.25.11.24', 'Multi-Meters');
INSERT INTO `omniclass 编号` VALUES ('23.80.25.14', 'Electrical Energy Recording Devices');
INSERT INTO `omniclass 编号` VALUES ('23.80.25.14.11', 'Watt-Hour Recorders (Electricity Usage Meters)');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.00', 'Distribution Devices');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.11', 'Power Supply Devices');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.11.11', 'Main Switches');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.11.14', 'Inverters');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.11.17', 'Distribution Boards and Control Panels');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.11.21', 'Photoelectric Cells');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.14', 'Power Distribution');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.14.24', 'Junction Boxes');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.17', 'Conduit, Wireways, and Ducts');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.17.11', 'Conduits');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.17.14', 'Wireways');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.17.17', 'Cable Trays and Horizontal Racks');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.17.21', 'Cable Reels');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.17.24', 'Mechanical Fasteners for Conduits and Trunking');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.24', 'Switchgear');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.24.11', 'Mechanical Switchgear');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.24.14', 'Electronic Switchgear');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.24.17', 'Remote Control Switchgear');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.24.21', 'Time Switchgear');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.27', 'Variable Power or Resistance Appliances');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.27.11', 'Commutators');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.27.14', 'Rheostats');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.27.17', 'Dimmers');
INSERT INTO `omniclass 编号` VALUES ('23.80.30.27.21', 'Speed Controllers');
INSERT INTO `omniclass 编号` VALUES ('23.80.40.00', 'Electric Power Protection Devices');
INSERT INTO `omniclass 编号` VALUES ('23.80.40.11', 'Earth Connection Electrodes');
INSERT INTO `omniclass 编号` VALUES ('23.80.40.14', 'Circuit Breakers');
INSERT INTO `omniclass 编号` VALUES ('23.80.40.14.11', 'Automatic Overload Circuit Breakers');
INSERT INTO `omniclass 编号` VALUES ('23.80.40.14.14', 'Ground Fault Intercept (GFI) Circuit Breakers');
INSERT INTO `omniclass 编号` VALUES ('23.80.40.14.17', 'Earth Leakage Circuit Breakers');
INSERT INTO `omniclass 编号` VALUES ('23.80.40.21', 'Lightning Protection');
INSERT INTO `omniclass 编号` VALUES ('23.80.45.00', 'Electric Power Treatment Devices');
INSERT INTO `omniclass 编号` VALUES ('23.80.45.14', 'Harmonic Control Devices');
INSERT INTO `omniclass 编号` VALUES ('23.80.45.14.11', 'Electric Interference Suppressor Filters');
INSERT INTO `omniclass 编号` VALUES ('23.80.50.00', 'Terminals for Power Supply');
INSERT INTO `omniclass 编号` VALUES ('23.80.50.11', 'Switches and Receptacles');
INSERT INTO `omniclass 编号` VALUES ('23.80.50.11.11', 'Receptacle Terminal Units');
INSERT INTO `omniclass 编号` VALUES ('23.80.50.11.14', 'Switches');
INSERT INTO `omniclass 编号` VALUES ('23.80.50.11.17', 'Ground Fault Receptacles');
INSERT INTO `omniclass 编号` VALUES ('23.80.50.14', 'Plug Connectors');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.00', 'Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.11', 'Luminaries for Internal Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.11.11', 'General Luminaries, Non Directional');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.11.14', 'General Luminaries, Directional');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.11.14.11', 'Downlights');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.11.14.14', 'Uplights');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.11.14.17', 'Direct/Indirect');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.11.14.21', 'Spots and Tracklight Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.11.17', 'Specialized Lighting by Location or Use');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.11.21', 'Emergency Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.11.24', 'Fiber Optic Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.14', 'Luminaries for External Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.14.11', 'Amenity Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.14.11.11', 'Lighting Bollards');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.14.11.14', 'Post-Top Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.14.11.17', 'Wall or Ceiling Mounted External Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.14.11.21', 'Buried Uplights');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.14.14', 'Exterior Floodlights');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.14.17', 'Exterior Spotlights');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.14.21', 'Street and Roadway Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.14.24', 'Aircraft Paving Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.14.27', 'Security Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.17', 'Communication Lighting Specialties');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.17.11', 'Emergency Signs');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.17.14', 'Illuminated Signs/Boards');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.17.17', 'Publicity Lighting');
INSERT INTO `omniclass 编号` VALUES ('23.80.70.17.21', 'Lasers');
INSERT INTO `omniclass 编号` VALUES ('23.85.00.00', 'Information and Communication');
INSERT INTO `omniclass 编号` VALUES ('23.85.05.00', 'Complete Information Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.05.14', 'Complete Visual Information Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.05.14.21', 'Complete Visual Signaling');
INSERT INTO `omniclass 编号` VALUES ('23.85.05.14.21.11', 'Mechanical Signals');
INSERT INTO `omniclass 编号` VALUES ('23.85.05.17', 'Complete Audio-Visual Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.05.17.11', 'Broadcasting Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.05.17.11.11', 'Television Broadcasting Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.05.17.11.14', 'Multimedia Broadcasting Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.05.17.11.17', 'Broadcasting Light Signals');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.00', 'General Information Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11', 'Audio Information, Sound Signals');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.11', 'Sound and Signal Devices');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.11.11', 'Bells, Carillons, Single Units');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.11.14', 'Sirens');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.11.17', 'Aerials');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.11.21', 'Speakers');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.14', 'Audio Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.14.11', 'Audio Recorders');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.14.14', 'Sound Reinforcement');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.14.14.11', 'Microphones');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.14.14.14', 'Loudspeakers');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.14.14.17', 'Sound Amplifiers');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.14.14.21', 'Audio Equalizers');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.14.17', 'Headphones');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.14.21', 'Audio Reproducing Units');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.11.14.24', 'Audio Information Accessories');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14', 'Visual Information Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.11', 'Cameras');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.11.11', 'Analog Cameras');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.11.14', 'Digital Cameras');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.14', 'Slide Projectors');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.17', 'Overhead Projectors');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.21', 'Presentation Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.24', 'Video Monitors');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.24.11', 'Cathode Ray Tube (CRT) Video Monitors');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.24.14', 'Liquid Crystal Display (LCD) Video Monitors');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.24.17', 'Plasma Video Monitors');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.27', 'Video Walls');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.14.31', 'Projection Screens');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.17', 'Audio-Visual Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.17.11', 'Audio-Visual System Components');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.17.11.11', 'Broadcasting Receiving Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.17.11.14', 'Audio-Visual Recorders (Cam-Corders)');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.17.11.17', 'Film Projectors');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.17.11.21', 'Data/Multi/Media Projectors');
INSERT INTO `omniclass 编号` VALUES ('23.85.10.17.11.24', 'Video Reproduction');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.00', 'Safety and Security Information Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.11', 'Access Controls');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.11.11', 'Access Control and Counting Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.11.14', 'Centralized Code Reading Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.11.17', 'Electronic Key Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.11.21', 'Pressure Mats');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.11.24', 'Micro-Switch Contacts for Doors and Windows');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.11.27', 'Door Answering');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.11.31', 'Security Access');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.14', 'Presence Detection/Registration');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.14.11', 'Clocking-In and Recording');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.14.14', 'Movement/Vibration Detection');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.14.17', 'Break-Glass Detection');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.14.21', 'Surveillance Mirrors');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.14.24', 'Manual Alert Control');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.14.27', 'Microwave Detectors');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.14.31', 'Infra-Red Radiation Detectors');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.14.34', 'Door Bells, Buzzers');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.17', 'Closed Circuit Guarding Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.17.11', 'Closed Circuit TV Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.17.14', 'Video Surveillance');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.17.17', 'Closed Circuit Television Recorders');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.17.17.11', 'Analog Closed Circuit Television Recorders');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.17.17.14', 'Digital Closed Circuit Television Recorders');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21', 'Environmental Detection/Registration');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21.11', 'Fire Detection, Monitoring and Alarm');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21.11.11', 'Fire/Smoke Detectors');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21.11.11.11', 'Smoke Detectors');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21.11.11.14', 'Inonization Detectors');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21.11.11.17', 'Temperature Monitors');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21.11.14', 'Alarm Panels');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21.11.17', 'Other Components');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21.14', 'Concentration Detection Components');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21.14.11', 'Concentration Detection Bells and Sounders');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21.14.14', 'Concentration Detection Alarm Glasses');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.21.14.99', 'Other Concentration Detection Components');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.24', 'Emergency Call Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.24.11', 'Call Systems for the Disabled');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.24.14', 'Nurse Call Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.27', 'Built-In Failure Detection');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.27.11', 'Infiltration Detection');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.27.14', 'Service Leak Detection');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.27.14.11', 'Gas Leak Detection Agents');
INSERT INTO `omniclass 编号` VALUES ('23.85.30.27.14.14', 'Water Leak Detection');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.00', 'Communication Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.11', 'Communication Circuits');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.14', 'Telephone and Intercommunication Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.14.11', 'Single Line Telephone Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.14.14', 'Multiple Line Telephone Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.14.17', 'Telephone Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.14.21', 'Intercommunication Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.17', 'Communication and Data Processing Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.17.11', 'Computer Network Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.17.11.11', 'Computer Servers');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.17.11.14', 'Network Switchers');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.17.11.17', 'Network Routers');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.21', 'Cable Transmission and Reception Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.21.11', 'Cable Transmission and Reception Amplifiers');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.21.14', 'Cable Transmission and Reception Modulators');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.21.17', 'Cable Transmission and Reception Control Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.24', 'Broadcast Transmission and Reception Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.24.11', 'Broadcast Transmitters');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.24.14', 'Broadcast Antennas');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.24.17', 'Broadcast Amplifiers');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.24.21', 'Broadcast Control Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.27', 'Microwave Transmission and Reception Equipment');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.27.11', 'Microwave Transmitters');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.27.14', 'Microwave Antennas');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.27.17', 'Satellite Dishes');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.27.21', 'Microwave Amplifiers');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.27.24', 'Microwave Receivers');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.31', 'Intercom Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.31.11', 'Door Entry Telephones');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.99', 'Other Communications Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.99.11', 'Videophone Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.99.14', 'Conference Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.50.99.17', 'Breakdown Call Systems');
INSERT INTO `omniclass 编号` VALUES ('23.85.80.00', 'Building Automation and Control');
INSERT INTO `omniclass 编号` VALUES ('23.85.80.11', 'Building Controls');
INSERT INTO `omniclass 编号` VALUES ('23.85.80.11.11', 'Clock Controls');
INSERT INTO `omniclass 编号` VALUES ('23.85.80.11.14', 'Door Controls');
INSERT INTO `omniclass 编号` VALUES ('23.85.80.11.17', 'Elevator Monitoring and Controls');
INSERT INTO `omniclass 编号` VALUES ('23.85.80.11.21', 'Energy Monitoring and Controls');
INSERT INTO `omniclass 编号` VALUES ('23.85.80.11.24', 'Environmental Controls');
INSERT INTO `omniclass 编号` VALUES ('23.85.80.11.27', 'Lighting Controls');

-- ----------------------------
-- Table structure for 专用设备
-- ----------------------------
DROP TABLE IF EXISTS `专用设备`;
CREATE TABLE `专用设备`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK专用设备1`(`类型 ID`) USING BTREE,
  INDEX `FK专用设备2`(`创建的阶段`) USING BTREE,
  INDEX `FK专用设备3`(`拆除的阶段`) USING BTREE,
  INDEX `FK专用设备4`(`设计选项`) USING BTREE,
  INDEX `FK专用设备5`(`标高`) USING BTREE,
  CONSTRAINT `FK专用设备1` FOREIGN KEY (`类型 ID`) REFERENCES `专用设备类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK专用设备2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK专用设备3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK专用设备4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK专用设备5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 专用设备
-- ----------------------------

-- ----------------------------
-- Table structure for 专用设备类型
-- ----------------------------
DROP TABLE IF EXISTS `专用设备类型`;
CREATE TABLE `专用设备类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK专用设备类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK专用设备类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK专用设备类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK专用设备类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 专用设备类型
-- ----------------------------

-- ----------------------------
-- Table structure for 体量
-- ----------------------------
DROP TABLE IF EXISTS `体量`;
CREATE TABLE `体量`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体积` double NULL DEFAULT NULL,
  `总表面积` double NULL DEFAULT NULL,
  `总楼层面积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `底部标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK体量1`(`类型 ID`) USING BTREE,
  INDEX `FK体量2`(`创建的阶段`) USING BTREE,
  INDEX `FK体量3`(`拆除的阶段`) USING BTREE,
  INDEX `FK体量4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK体量1` FOREIGN KEY (`类型 ID`) REFERENCES `体量类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 体量
-- ----------------------------

-- ----------------------------
-- Table structure for 体量内墙
-- ----------------------------
DROP TABLE IF EXISTS `体量内墙`;
CREATE TABLE `体量内墙`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `体量内墙面积` double NULL DEFAULT NULL,
  `概念类型` int NULL DEFAULT NULL,
  `图形外观` int NULL DEFAULT NULL,
  `体量: 注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族与类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK体量内墙1`(`创建的阶段`) USING BTREE,
  INDEX `FK体量内墙2`(`拆除的阶段`) USING BTREE,
  INDEX `FK体量内墙3`(`设计选项`) USING BTREE,
  INDEX `FK体量内墙4`(`图形外观`) USING BTREE,
  CONSTRAINT `FK体量内墙1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量内墙2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量内墙3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量内墙4` FOREIGN KEY (`图形外观`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 体量内墙
-- ----------------------------

-- ----------------------------
-- Table structure for 体量外墙
-- ----------------------------
DROP TABLE IF EXISTS `体量外墙`;
CREATE TABLE `体量外墙`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `值` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `目标窗台高度` double NULL DEFAULT NULL,
  `遮阳深度` double NULL DEFAULT NULL,
  `玻璃已遮阳` int NULL DEFAULT NULL,
  `目标玻璃百分比` double NULL DEFAULT NULL,
  `地下` int NULL DEFAULT NULL,
  `体量外墙面积` double NULL DEFAULT NULL,
  `子类别` int NULL DEFAULT NULL,
  `概念类型` int NULL DEFAULT NULL,
  `图形外观` int NULL DEFAULT NULL,
  `体量: 注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族与类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK体量外墙1`(`创建的阶段`) USING BTREE,
  INDEX `FK体量外墙2`(`拆除的阶段`) USING BTREE,
  INDEX `FK体量外墙3`(`设计选项`) USING BTREE,
  INDEX `FK体量外墙4`(`图形外观`) USING BTREE,
  CONSTRAINT `FK体量外墙1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量外墙2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量外墙3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量外墙4` FOREIGN KEY (`图形外观`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 体量外墙
-- ----------------------------

-- ----------------------------
-- Table structure for 体量天窗
-- ----------------------------
DROP TABLE IF EXISTS `体量天窗`;
CREATE TABLE `体量天窗`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量天窗面积` double NULL DEFAULT NULL,
  `概念类型` int NULL DEFAULT NULL,
  `图形外观` int NULL DEFAULT NULL,
  `体量: 注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族与类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK体量天窗1`(`创建的阶段`) USING BTREE,
  INDEX `FK体量天窗2`(`拆除的阶段`) USING BTREE,
  INDEX `FK体量天窗3`(`设计选项`) USING BTREE,
  INDEX `FK体量天窗4`(`图形外观`) USING BTREE,
  CONSTRAINT `FK体量天窗1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量天窗2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量天窗3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量天窗4` FOREIGN KEY (`图形外观`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 体量天窗
-- ----------------------------

-- ----------------------------
-- Table structure for 体量屋顶
-- ----------------------------
DROP TABLE IF EXISTS `体量屋顶`;
CREATE TABLE `体量屋顶`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `值` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `天窗宽度和深度` double NULL DEFAULT NULL,
  `目标天窗百分比` double NULL DEFAULT NULL,
  `地下` int NULL DEFAULT NULL,
  `体量屋顶面积` double NULL DEFAULT NULL,
  `子类别` int NULL DEFAULT NULL,
  `概念类型` int NULL DEFAULT NULL,
  `图形外观` int NULL DEFAULT NULL,
  `体量: 注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族与类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK体量屋顶1`(`创建的阶段`) USING BTREE,
  INDEX `FK体量屋顶2`(`拆除的阶段`) USING BTREE,
  INDEX `FK体量屋顶3`(`设计选项`) USING BTREE,
  INDEX `FK体量屋顶4`(`图形外观`) USING BTREE,
  CONSTRAINT `FK体量屋顶1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量屋顶2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量屋顶3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量屋顶4` FOREIGN KEY (`图形外观`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 体量屋顶
-- ----------------------------

-- ----------------------------
-- Table structure for 体量楼层
-- ----------------------------
DROP TABLE IF EXISTS `体量楼层`;
CREATE TABLE `体量楼层`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `板` int NULL DEFAULT NULL,
  `概念类型` int NULL DEFAULT NULL,
  `图形外观` int NULL DEFAULT NULL,
  `体量: 说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族与类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `用途` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层体积` double NULL DEFAULT NULL,
  `外表面积` double NULL DEFAULT NULL,
  `楼层面积` double NULL DEFAULT NULL,
  `楼层周长` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK体量楼层1`(`创建的阶段`) USING BTREE,
  INDEX `FK体量楼层2`(`拆除的阶段`) USING BTREE,
  INDEX `FK体量楼层3`(`设计选项`) USING BTREE,
  INDEX `FK体量楼层4`(`图形外观`) USING BTREE,
  CONSTRAINT `FK体量楼层1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量楼层2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量楼层3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量楼层4` FOREIGN KEY (`图形外观`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 体量楼层
-- ----------------------------

-- ----------------------------
-- Table structure for 体量洞口
-- ----------------------------
DROP TABLE IF EXISTS `体量洞口`;
CREATE TABLE `体量洞口`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量洞口面积` double NULL DEFAULT NULL,
  `概念类型` int NULL DEFAULT NULL,
  `图形外观` int NULL DEFAULT NULL,
  `体量: 注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族与类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK体量洞口1`(`创建的阶段`) USING BTREE,
  INDEX `FK体量洞口2`(`拆除的阶段`) USING BTREE,
  INDEX `FK体量洞口3`(`设计选项`) USING BTREE,
  INDEX `FK体量洞口4`(`图形外观`) USING BTREE,
  CONSTRAINT `FK体量洞口1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量洞口2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量洞口3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量洞口4` FOREIGN KEY (`图形外观`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 体量洞口
-- ----------------------------

-- ----------------------------
-- Table structure for 体量玻璃
-- ----------------------------
DROP TABLE IF EXISTS `体量玻璃`;
CREATE TABLE `体量玻璃`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量窗面积` double NULL DEFAULT NULL,
  `概念类型` int NULL DEFAULT NULL,
  `图形外观` int NULL DEFAULT NULL,
  `体量: 注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族与类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 族` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体量: 类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK体量玻璃1`(`创建的阶段`) USING BTREE,
  INDEX `FK体量玻璃2`(`拆除的阶段`) USING BTREE,
  INDEX `FK体量玻璃3`(`设计选项`) USING BTREE,
  INDEX `FK体量玻璃4`(`图形外观`) USING BTREE,
  CONSTRAINT `FK体量玻璃1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量玻璃2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量玻璃3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量玻璃4` FOREIGN KEY (`图形外观`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 体量玻璃
-- ----------------------------

-- ----------------------------
-- Table structure for 体量类型
-- ----------------------------
DROP TABLE IF EXISTS `体量类型`;
CREATE TABLE `体量类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK体量类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK体量类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK体量类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK体量类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 体量类型
-- ----------------------------

-- ----------------------------
-- Table structure for 修改器
-- ----------------------------
DROP TABLE IF EXISTS `修改器`;
CREATE TABLE `修改器`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `边界` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `围绕梁轴` int NULL DEFAULT NULL,
  `倾斜角度` double NULL DEFAULT NULL,
  `平面旋转` double NULL DEFAULT NULL,
  `横截面旋转` double NULL DEFAULT NULL,
  `Z轴偏移` double NULL DEFAULT NULL,
  `缩进` double NULL DEFAULT NULL,
  `钻孔` int NULL DEFAULT NULL,
  `半径` double NULL DEFAULT NULL,
  `边界距离 2` double NULL DEFAULT NULL,
  `边界距离 1` double NULL DEFAULT NULL,
  `间隙宽度` double NULL DEFAULT NULL,
  `沿角宽度` double NULL DEFAULT NULL,
  `沿角高度` double NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK修改器1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK修改器1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 修改器
-- ----------------------------

-- ----------------------------
-- Table structure for 停车场
-- ----------------------------
DROP TABLE IF EXISTS `停车场`;
CREATE TABLE `停车场`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK停车场1`(`类型 ID`) USING BTREE,
  INDEX `FK停车场2`(`创建的阶段`) USING BTREE,
  INDEX `FK停车场3`(`拆除的阶段`) USING BTREE,
  INDEX `FK停车场4`(`设计选项`) USING BTREE,
  INDEX `FK停车场5`(`标高`) USING BTREE,
  CONSTRAINT `FK停车场1` FOREIGN KEY (`类型 ID`) REFERENCES `停车场类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK停车场2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK停车场3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK停车场4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK停车场5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 停车场
-- ----------------------------

-- ----------------------------
-- Table structure for 停车场类型
-- ----------------------------
DROP TABLE IF EXISTS `停车场类型`;
CREATE TABLE `停车场类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK停车场类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK停车场类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK停车场类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK停车场类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 停车场类型
-- ----------------------------

-- ----------------------------
-- Table structure for 其他
-- ----------------------------
DROP TABLE IF EXISTS `其他`;
CREATE TABLE `其他`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK其他1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK其他1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 其他
-- ----------------------------

-- ----------------------------
-- Table structure for 内部点荷载
-- ----------------------------
DROP TABLE IF EXISTS `内部点荷载`;
CREATE TABLE `内部点荷载`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `性质` int NULL DEFAULT NULL,
  `全部非 0 荷载` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `Mz` double NULL DEFAULT NULL,
  `My` double NULL DEFAULT NULL,
  `Mx` double NULL DEFAULT NULL,
  `Fz` double NULL DEFAULT NULL,
  `Fy` double NULL DEFAULT NULL,
  `Fx` double NULL DEFAULT NULL,
  `为反作用力` int NULL DEFAULT NULL,
  `荷载工况` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK内部点荷载1`(`创建的阶段`) USING BTREE,
  INDEX `FK内部点荷载2`(`拆除的阶段`) USING BTREE,
  INDEX `FK内部点荷载3`(`设计选项`) USING BTREE,
  CONSTRAINT `FK内部点荷载1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK内部点荷载2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK内部点荷载3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 内部点荷载
-- ----------------------------

-- ----------------------------
-- Table structure for 内部线荷载
-- ----------------------------
DROP TABLE IF EXISTS `内部线荷载`;
CREATE TABLE `内部线荷载`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `性质` int NULL DEFAULT NULL,
  `全部非 0 荷载` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `Mz 2` double NULL DEFAULT NULL,
  `My 2` double NULL DEFAULT NULL,
  `Mx 2` double NULL DEFAULT NULL,
  `Mz 1` double NULL DEFAULT NULL,
  `My 1` double NULL DEFAULT NULL,
  `Mx 1` double NULL DEFAULT NULL,
  `Fz 2` double NULL DEFAULT NULL,
  `Fy 2` double NULL DEFAULT NULL,
  `Fx 2` double NULL DEFAULT NULL,
  `Fz 1` double NULL DEFAULT NULL,
  `Fy 1` double NULL DEFAULT NULL,
  `Fx 1` double NULL DEFAULT NULL,
  `为反作用力` int NULL DEFAULT NULL,
  `均布负荷` int NULL DEFAULT NULL,
  `荷载工况` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK内部线荷载1`(`创建的阶段`) USING BTREE,
  INDEX `FK内部线荷载2`(`拆除的阶段`) USING BTREE,
  INDEX `FK内部线荷载3`(`设计选项`) USING BTREE,
  CONSTRAINT `FK内部线荷载1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK内部线荷载2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK内部线荷载3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 内部线荷载
-- ----------------------------

-- ----------------------------
-- Table structure for 内部面荷载
-- ----------------------------
DROP TABLE IF EXISTS `内部面荷载`;
CREATE TABLE `内部面荷载`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `性质` int NULL DEFAULT NULL,
  `全部非 0 荷载` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `Fz 3` double NULL DEFAULT NULL,
  `Fy 3` double NULL DEFAULT NULL,
  `Fx 3` double NULL DEFAULT NULL,
  `Fz 2` double NULL DEFAULT NULL,
  `Fy 2` double NULL DEFAULT NULL,
  `Fx 2` double NULL DEFAULT NULL,
  `Fz 1` double NULL DEFAULT NULL,
  `Fy 1` double NULL DEFAULT NULL,
  `Fx 1` double NULL DEFAULT NULL,
  `为反作用力` int NULL DEFAULT NULL,
  `荷载工况` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK内部面荷载1`(`创建的阶段`) USING BTREE,
  INDEX `FK内部面荷载2`(`拆除的阶段`) USING BTREE,
  INDEX `FK内部面荷载3`(`设计选项`) USING BTREE,
  CONSTRAINT `FK内部面荷载1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK内部面荷载2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK内部面荷载3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 内部面荷载
-- ----------------------------

-- ----------------------------
-- Table structure for 分割轮廓
-- ----------------------------
DROP TABLE IF EXISTS `分割轮廓`;
CREATE TABLE `分割轮廓`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK分割轮廓1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK分割轮廓2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK分割轮廓1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK分割轮廓2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 分割轮廓
-- ----------------------------

-- ----------------------------
-- Table structure for 分区设备
-- ----------------------------
DROP TABLE IF EXISTS `分区设备`;
CREATE TABLE `分区设备`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `绘制通风` int NULL DEFAULT NULL,
  `可变冷媒流量循环` int NULL DEFAULT NULL,
  `再热热水回路` int NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `加热热水回路` int NULL DEFAULT NULL,
  `空调系统` int NULL DEFAULT NULL,
  `再热盘管` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `表现` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `设备类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `冷却水回路` int NULL DEFAULT NULL,
  `冷却盘管` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `加热盘管` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `冷凝水回路` int NULL DEFAULT NULL,
  `峰值风量` double NULL DEFAULT NULL,
  `峰值冷负荷` double NULL DEFAULT NULL,
  `峰值热负荷` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK分区设备1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK分区设备1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 分区设备
-- ----------------------------

-- ----------------------------
-- Table structure for 剪力钉
-- ----------------------------
DROP TABLE IF EXISTS `剪力钉`;
CREATE TABLE `剪力钉`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `编号` int NULL DEFAULT NULL,
  `半径` double NULL DEFAULT NULL,
  `边 2 的边缘距离` double NULL DEFAULT NULL,
  `边 1 的边缘距离` double NULL DEFAULT NULL,
  `边 2 的间距` double NULL DEFAULT NULL,
  `边 1 的间距` double NULL DEFAULT NULL,
  `边 2 的长度` double NULL DEFAULT NULL,
  `边 1 的长度` double NULL DEFAULT NULL,
  `边 2 的数量` int NULL DEFAULT NULL,
  `边 1 的数量` int NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `涂层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `直径` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `等级` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标准` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构材质` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK剪力钉1`(`创建的阶段`) USING BTREE,
  INDEX `FK剪力钉2`(`拆除的阶段`) USING BTREE,
  INDEX `FK剪力钉3`(`设计选项`) USING BTREE,
  INDEX `FK剪力钉4`(`结构材质`) USING BTREE,
  CONSTRAINT `FK剪力钉1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK剪力钉2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK剪力钉3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK剪力钉4` FOREIGN KEY (`结构材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 剪力钉
-- ----------------------------

-- ----------------------------
-- Table structure for 卫浴装置
-- ----------------------------
DROP TABLE IF EXISTS `卫浴装置`;
CREATE TABLE `卫浴装置`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `存水弯` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `排水管` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `供水管道` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `供水管件` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK卫浴装置1`(`类型 ID`) USING BTREE,
  INDEX `FK卫浴装置2`(`创建的阶段`) USING BTREE,
  INDEX `FK卫浴装置3`(`拆除的阶段`) USING BTREE,
  INDEX `FK卫浴装置4`(`设计选项`) USING BTREE,
  INDEX `FK卫浴装置5`(`标高`) USING BTREE,
  CONSTRAINT `FK卫浴装置1` FOREIGN KEY (`类型 ID`) REFERENCES `卫浴装置类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK卫浴装置2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK卫浴装置3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK卫浴装置4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK卫浴装置5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 卫浴装置
-- ----------------------------

-- ----------------------------
-- Table structure for 卫浴装置类型
-- ----------------------------
DROP TABLE IF EXISTS `卫浴装置类型`;
CREATE TABLE `卫浴装置类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `WFU` double NULL DEFAULT NULL,
  `HWFU` double NULL DEFAULT NULL,
  `CWFU` double NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `通气管连接` int NULL DEFAULT NULL,
  `废水管连接` int NULL DEFAULT NULL,
  `CW 连接` int NULL DEFAULT NULL,
  `HW 连接` int NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK卫浴装置类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK卫浴装置类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK卫浴装置类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK卫浴装置类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 卫浴装置类型
-- ----------------------------
INSERT INTO `卫浴装置类型` VALUES (1091511, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '厨房水槽-独立式 3D', '厨房水槽-独立式 3D', NULL, NULL, NULL, NULL);
INSERT INTO `卫浴装置类型` VALUES (1094741, NULL, 4, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '蹲式大便器 - 前孔', '蹲式大便器 - 前孔', NULL, NULL, NULL, NULL);
INSERT INTO `卫浴装置类型` VALUES (1095531, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '基于线-排水沟', '基于线-排水沟', NULL, NULL, NULL, NULL);
INSERT INTO `卫浴装置类型` VALUES (1102838, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '水龙头', '水龙头', NULL, NULL, NULL, NULL);
INSERT INTO `卫浴装置类型` VALUES (1104208, NULL, 0.75, 0.5, 0.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗脸盆 - 壁装式', '洗脸盆 - 壁装式', NULL, NULL, NULL, NULL);
INSERT INTO `卫浴装置类型` VALUES (1107899, NULL, 4, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.45.55.21', NULL, '洗衣机专用地漏', '洗衣机专用地漏', NULL, NULL, NULL, NULL);
INSERT INTO `卫浴装置类型` VALUES (1112824, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '自闭式冲洗阀蹲式大便器', '自闭式冲洗阀蹲式大便器', NULL, NULL, NULL, NULL);
INSERT INTO `卫浴装置类型` VALUES (1114496, NULL, 4.5, NULL, 0.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '坐便器 - 冲洗水箱', '坐便器 - 冲洗水箱', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 喷头
-- ----------------------------
DROP TABLE IF EXISTS `喷头`;
CREATE TABLE `喷头`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `流量` double NULL DEFAULT NULL,
  `压降` double NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK喷头1`(`类型 ID`) USING BTREE,
  INDEX `FK喷头2`(`创建的阶段`) USING BTREE,
  INDEX `FK喷头3`(`拆除的阶段`) USING BTREE,
  INDEX `FK喷头4`(`设计选项`) USING BTREE,
  INDEX `FK喷头5`(`标高`) USING BTREE,
  CONSTRAINT `FK喷头1` FOREIGN KEY (`类型 ID`) REFERENCES `喷头类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK喷头2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK喷头3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK喷头4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK喷头5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 喷头
-- ----------------------------

-- ----------------------------
-- Table structure for 喷头类型
-- ----------------------------
DROP TABLE IF EXISTS `喷头类型`;
CREATE TABLE `喷头类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `孔大小` double NULL DEFAULT NULL,
  `额定温度` double NULL DEFAULT NULL,
  `K 系数` double NULL DEFAULT NULL,
  `压力等级` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `孔` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `范围` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `响应` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `直径` double NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK喷头类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK喷头类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK喷头类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK喷头类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 喷头类型
-- ----------------------------
INSERT INTO `喷头类型` VALUES (896892, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5S-ZSD40A自动扫描射水灭火装置', '水炮', NULL, NULL, NULL, NULL);
INSERT INTO `喷头类型` VALUES (901190, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZSS-25自动扫描射水高空水炮灭火装置', '水炮', NULL, NULL, NULL, NULL);
INSERT INTO `喷头类型` VALUES (907067, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '基于墙-侧喷头-可调节距离', '20 mm', NULL, NULL, NULL, NULL);
INSERT INTO `喷头类型` VALUES (911623, NULL, NULL, 341.15, 80, '标准', '标准', '标准', '标准', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '喷头 - 上下喷', '15 mm', NULL, NULL, NULL, NULL);
INSERT INTO `喷头类型` VALUES (911625, NULL, NULL, 341.15, 80, '标准', '标准', '标准', '标准', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '喷头 - 上下喷', '20 mm', NULL, NULL, NULL, NULL);
INSERT INTO `喷头类型` VALUES (913190, NULL, NULL, 341.15, 80, '标准', '标准', '标准', '标准', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '喷头 - 下垂型', '15 mm', NULL, NULL, NULL, NULL);
INSERT INTO `喷头类型` VALUES (913192, NULL, NULL, 341.15, 80, '标准', '标准', '标准', '标准', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '喷头 - 下垂型', '20 mm', NULL, NULL, NULL, NULL);
INSERT INTO `喷头类型` VALUES (914751, NULL, NULL, 341.15, 80, '标准', '标准', '标准', '标准', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '喷头 - 直立型', '15 mm', NULL, NULL, NULL, NULL);
INSERT INTO `喷头类型` VALUES (914753, NULL, NULL, 341.15, 80, '标准', '标准', '标准', '标准', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '喷头 - 直立型', '20 mm', NULL, NULL, NULL, NULL);
INSERT INTO `喷头类型` VALUES (914755, NULL, NULL, 341.15, 80, '标准', '标准', '标准', '标准', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '喷头 - 直立型', '上喷喷头', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 地形
-- ----------------------------
DROP TABLE IF EXISTS `地形`;
CREATE TABLE `地形`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `净剪切填充` double NULL DEFAULT NULL,
  `投影面积` double NULL DEFAULT NULL,
  `填充` double NULL DEFAULT NULL,
  `截面` double NULL DEFAULT NULL,
  `表面积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK地形1`(`类型 ID`) USING BTREE,
  INDEX `FK地形2`(`创建的阶段`) USING BTREE,
  INDEX `FK地形3`(`拆除的阶段`) USING BTREE,
  INDEX `FK地形4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK地形1` FOREIGN KEY (`类型 ID`) REFERENCES `地形类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK地形2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK地形3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK地形4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 地形
-- ----------------------------

-- ----------------------------
-- Table structure for 地形类型
-- ----------------------------
DROP TABLE IF EXISTS `地形类型`;
CREATE TABLE `地形类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK地形类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK地形类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 地形类型
-- ----------------------------

-- ----------------------------
-- Table structure for 场地
-- ----------------------------
DROP TABLE IF EXISTS `场地`;
CREATE TABLE `场地`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK场地1`(`类型 ID`) USING BTREE,
  INDEX `FK场地2`(`创建的阶段`) USING BTREE,
  INDEX `FK场地3`(`拆除的阶段`) USING BTREE,
  INDEX `FK场地4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK场地1` FOREIGN KEY (`类型 ID`) REFERENCES `场地类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK场地2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK场地3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK场地4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 场地
-- ----------------------------

-- ----------------------------
-- Table structure for 场地类型
-- ----------------------------
DROP TABLE IF EXISTS `场地类型`;
CREATE TABLE `场地类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK场地类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK场地类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK场地类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK场地类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 场地类型
-- ----------------------------

-- ----------------------------
-- Table structure for 坡道
-- ----------------------------
DROP TABLE IF EXISTS `坡道`;
CREATE TABLE `坡道`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `多层顶部标高` int NULL DEFAULT NULL,
  `顶部偏移` double NULL DEFAULT NULL,
  `底部偏移` double NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `顶部标高` int NULL DEFAULT NULL,
  `底部标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK坡道1`(`类型 ID`) USING BTREE,
  INDEX `FK坡道2`(`创建的阶段`) USING BTREE,
  INDEX `FK坡道3`(`拆除的阶段`) USING BTREE,
  INDEX `FK坡道4`(`设计选项`) USING BTREE,
  INDEX `FK坡道5`(`多层顶部标高`) USING BTREE,
  INDEX `FK坡道6`(`顶部标高`) USING BTREE,
  INDEX `FK坡道7`(`底部标高`) USING BTREE,
  CONSTRAINT `FK坡道1` FOREIGN KEY (`类型 ID`) REFERENCES `坡道类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK坡道2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK坡道3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK坡道4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK坡道5` FOREIGN KEY (`多层顶部标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK坡道6` FOREIGN KEY (`顶部标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK坡道7` FOREIGN KEY (`底部标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 坡道
-- ----------------------------

-- ----------------------------
-- Table structure for 坡道类型
-- ----------------------------
DROP TABLE IF EXISTS `坡道类型`;
CREATE TABLE `坡道类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK坡道类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK坡道类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 坡道类型
-- ----------------------------
INSERT INTO `坡道类型` VALUES (350, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '坡道', '坡道 1', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 墙
-- ----------------------------
DROP TABLE IF EXISTS `墙`;
CREATE TABLE `墙`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `估计的钢筋体积` double NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构用途` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `顶部偏移` double NULL DEFAULT NULL,
  `底部偏移` double NULL DEFAULT NULL,
  `底部约束` int NULL DEFAULT NULL,
  `无连接高度` double NULL DEFAULT NULL,
  `顶部约束` int NULL DEFAULT NULL,
  `房间边界` int NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK墙1`(`类型 ID`) USING BTREE,
  INDEX `FK墙2`(`创建的阶段`) USING BTREE,
  INDEX `FK墙3`(`拆除的阶段`) USING BTREE,
  INDEX `FK墙4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK墙1` FOREIGN KEY (`类型 ID`) REFERENCES `墙类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK墙2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK墙3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK墙4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 墙
-- ----------------------------

-- ----------------------------
-- Table structure for 墙类型
-- ----------------------------
DROP TABLE IF EXISTS `墙类型`;
CREATE TABLE `墙类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构材质` int NULL DEFAULT NULL,
  `粗糙度` int NULL DEFAULT NULL,
  `吸收率` double NULL DEFAULT NULL,
  `热质量` double NULL DEFAULT NULL,
  `热阻(R)` double NULL DEFAULT NULL,
  `传热系数(U)` double NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `防火等级` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `厚度` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK墙类型1`(`结构材质`) USING BTREE,
  INDEX `FK墙类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK墙类型1` FOREIGN KEY (`结构材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK墙类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 墙类型
-- ----------------------------
INSERT INTO `墙类型` VALUES (397, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 416, 3, 0.7, 13411.438037973501, 9.485911949685534, 0.105419490008354, NULL, '基本墙', '外部 - 带砖与金属立筋龙骨复合墙', NULL, NULL, NULL, 0.35000000000000003, NULL, NULL);
INSERT INTO `墙类型` VALUES (398, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0.7, NULL, NULL, NULL, NULL, '基本墙', '常规 - 200mm', NULL, NULL, NULL, 0.2, NULL, NULL);
INSERT INTO `墙类型` VALUES (401, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 414, 3, 0.7, 10886.378227199999, 0.16666666666666666, 6, NULL, '基本墙', '常规 - 90mm 砖', NULL, NULL, NULL, 0.09, NULL, NULL);
INSERT INTO `墙类型` VALUES (6291, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0.7, NULL, NULL, NULL, NULL, '基本墙', '常规 - 300mm', NULL, NULL, NULL, 0.29999999999999993, NULL, NULL);
INSERT INTO `墙类型` VALUES (29096, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '幕墙', '外部玻璃', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `墙类型` VALUES (54538, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 416, 3, 0.7, 30618.939106773512, 9.473091436865019, 0.10556216063833702, NULL, '基本墙', '外部 - 带砌块与金属立筋龙骨复合墙', NULL, NULL, NULL, 0.4600000000000001, NULL, NULL);

-- ----------------------------
-- Table structure for 墙饰条
-- ----------------------------
DROP TABLE IF EXISTS `墙饰条`;
CREATE TABLE `墙饰条`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK墙饰条1`(`类型 ID`) USING BTREE,
  INDEX `FK墙饰条2`(`创建的阶段`) USING BTREE,
  INDEX `FK墙饰条3`(`拆除的阶段`) USING BTREE,
  INDEX `FK墙饰条4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK墙饰条1` FOREIGN KEY (`类型 ID`) REFERENCES `墙饰条类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK墙饰条2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK墙饰条3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK墙饰条4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 墙饰条
-- ----------------------------

-- ----------------------------
-- Table structure for 墙饰条类型
-- ----------------------------
DROP TABLE IF EXISTS `墙饰条类型`;
CREATE TABLE `墙饰条类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `墙的子类别` int NULL DEFAULT NULL,
  `轮廓` int NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `材质` int NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK墙饰条类型1`(`轮廓`) USING BTREE,
  INDEX `FK墙饰条类型2`(`部件代码`) USING BTREE,
  INDEX `FK墙饰条类型3`(`材质`) USING BTREE,
  CONSTRAINT `FK墙饰条类型1` FOREIGN KEY (`轮廓`) REFERENCES `轮廓1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK墙饰条类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK墙饰条类型3` FOREIGN KEY (`材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 墙饰条类型
-- ----------------------------
INSERT INTO `墙饰条类型` VALUES (7844, NULL, NULL, 19858, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '墙饰条', '檐口', NULL, NULL);

-- ----------------------------
-- Table structure for 天花板
-- ----------------------------
DROP TABLE IF EXISTS `天花板`;
CREATE TABLE `天花板`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `自标高的高度偏移` double NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `周长` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK天花板1`(`类型 ID`) USING BTREE,
  INDEX `FK天花板2`(`创建的阶段`) USING BTREE,
  INDEX `FK天花板3`(`拆除的阶段`) USING BTREE,
  INDEX `FK天花板4`(`设计选项`) USING BTREE,
  INDEX `FK天花板5`(`标高`) USING BTREE,
  CONSTRAINT `FK天花板1` FOREIGN KEY (`类型 ID`) REFERENCES `天花板类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK天花板2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK天花板3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK天花板4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK天花板5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 天花板
-- ----------------------------

-- ----------------------------
-- Table structure for 天花板类型
-- ----------------------------
DROP TABLE IF EXISTS `天花板类型`;
CREATE TABLE `天花板类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构材质` int NULL DEFAULT NULL,
  `粗糙度` int NULL DEFAULT NULL,
  `吸收率` double NULL DEFAULT NULL,
  `热质量` double NULL DEFAULT NULL,
  `热阻(R)` double NULL DEFAULT NULL,
  `传热系数(U)` double NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK天花板类型1`(`结构材质`) USING BTREE,
  INDEX `FK天花板类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK天花板类型1` FOREIGN KEY (`结构材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK天花板类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 天花板类型
-- ----------------------------
INSERT INTO `天花板类型` VALUES (757, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0.7, NULL, NULL, NULL, NULL, '基本天花板', '常规', NULL, NULL, NULL, NULL);
INSERT INTO `天花板类型` VALUES (19848, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0.7, 577.6339415040001, 0.2807017543859649, 3.5625, NULL, '复合天花板', '600 x 600mm 轴网', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 孔
-- ----------------------------
DROP TABLE IF EXISTS `孔`;
CREATE TABLE `孔`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `直径` double NULL DEFAULT NULL,
  `编号` int NULL DEFAULT NULL,
  `半径` double NULL DEFAULT NULL,
  `边 2 的边缘距离` double NULL DEFAULT NULL,
  `边 1 的边缘距离` double NULL DEFAULT NULL,
  `边 2 的间距` double NULL DEFAULT NULL,
  `边 1 的间距` double NULL DEFAULT NULL,
  `边 2 的长度` double NULL DEFAULT NULL,
  `边 1 的长度` double NULL DEFAULT NULL,
  `边 2 的数量` int NULL DEFAULT NULL,
  `边 1 的数量` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK孔1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK孔1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 孔
-- ----------------------------

-- ----------------------------
-- Table structure for 安全设备
-- ----------------------------
DROP TABLE IF EXISTS `安全设备`;
CREATE TABLE `安全设备`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气数据` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK安全设备1`(`类型 ID`) USING BTREE,
  INDEX `FK安全设备2`(`创建的阶段`) USING BTREE,
  INDEX `FK安全设备3`(`拆除的阶段`) USING BTREE,
  INDEX `FK安全设备4`(`设计选项`) USING BTREE,
  INDEX `FK安全设备5`(`标高`) USING BTREE,
  CONSTRAINT `FK安全设备1` FOREIGN KEY (`类型 ID`) REFERENCES `安全设备类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK安全设备2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK安全设备3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK安全设备4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK安全设备5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 安全设备
-- ----------------------------

-- ----------------------------
-- Table structure for 安全设备类型
-- ----------------------------
DROP TABLE IF EXISTS `安全设备类型`;
CREATE TABLE `安全设备类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK安全设备类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK安全设备类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK安全设备类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK安全设备类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 安全设备类型
-- ----------------------------

-- ----------------------------
-- Table structure for 家具
-- ----------------------------
DROP TABLE IF EXISTS `家具`;
CREATE TABLE `家具`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK家具1`(`类型 ID`) USING BTREE,
  INDEX `FK家具2`(`创建的阶段`) USING BTREE,
  INDEX `FK家具3`(`拆除的阶段`) USING BTREE,
  INDEX `FK家具4`(`设计选项`) USING BTREE,
  INDEX `FK家具5`(`标高`) USING BTREE,
  CONSTRAINT `FK家具1` FOREIGN KEY (`类型 ID`) REFERENCES `家具类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK家具2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK家具3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK家具4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK家具5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 家具
-- ----------------------------

-- ----------------------------
-- Table structure for 家具类型
-- ----------------------------
DROP TABLE IF EXISTS `家具类型`;
CREATE TABLE `家具类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK家具类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK家具类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK家具类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK家具类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 家具类型
-- ----------------------------

-- ----------------------------
-- Table structure for 家具系统
-- ----------------------------
DROP TABLE IF EXISTS `家具系统`;
CREATE TABLE `家具系统`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK家具系统1`(`类型 ID`) USING BTREE,
  INDEX `FK家具系统2`(`创建的阶段`) USING BTREE,
  INDEX `FK家具系统3`(`拆除的阶段`) USING BTREE,
  INDEX `FK家具系统4`(`设计选项`) USING BTREE,
  INDEX `FK家具系统5`(`标高`) USING BTREE,
  CONSTRAINT `FK家具系统1` FOREIGN KEY (`类型 ID`) REFERENCES `家具系统类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK家具系统2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK家具系统3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK家具系统4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK家具系统5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 家具系统
-- ----------------------------

-- ----------------------------
-- Table structure for 家具系统类型
-- ----------------------------
DROP TABLE IF EXISTS `家具系统类型`;
CREATE TABLE `家具系统类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK家具系统类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK家具系统类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK家具系统类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK家具系统类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 家具系统类型
-- ----------------------------

-- ----------------------------
-- Table structure for 导线
-- ----------------------------
DROP TABLE IF EXISTS `导线`;
CREATE TABLE `导线`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `线路说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路负荷名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `导体数` int NULL DEFAULT NULL,
  `记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `火线` int NULL DEFAULT NULL,
  `零线` int NULL DEFAULT NULL,
  `地线` int NULL DEFAULT NULL,
  `导线尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK导线1`(`类型 ID`) USING BTREE,
  INDEX `FK导线2`(`创建的阶段`) USING BTREE,
  INDEX `FK导线3`(`拆除的阶段`) USING BTREE,
  INDEX `FK导线4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK导线1` FOREIGN KEY (`类型 ID`) REFERENCES `导线类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 导线
-- ----------------------------

-- ----------------------------
-- Table structure for 导线材质
-- ----------------------------
DROP TABLE IF EXISTS `导线材质`;
CREATE TABLE `导线材质`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK导线材质1`(`类型 ID`) USING BTREE,
  INDEX `FK导线材质2`(`创建的阶段`) USING BTREE,
  INDEX `FK导线材质3`(`拆除的阶段`) USING BTREE,
  INDEX `FK导线材质4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK导线材质1` FOREIGN KEY (`类型 ID`) REFERENCES `导线材质类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线材质2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线材质3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线材质4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 导线材质
-- ----------------------------

-- ----------------------------
-- Table structure for 导线材质类型
-- ----------------------------
DROP TABLE IF EXISTS `导线材质类型`;
CREATE TABLE `导线材质类型`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 导线材质类型
-- ----------------------------
INSERT INTO `导线材质类型` VALUES (293191);
INSERT INTO `导线材质类型` VALUES (293192);
INSERT INTO `导线材质类型` VALUES (293193);
INSERT INTO `导线材质类型` VALUES (293194);

-- ----------------------------
-- Table structure for 导线类型
-- ----------------------------
DROP TABLE IF EXISTS `导线类型`;
CREATE TABLE `导线类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `共用零线` int NULL DEFAULT NULL,
  `共用地线` int NULL DEFAULT NULL,
  `材质` int NULL DEFAULT NULL,
  `额定温度` int NULL DEFAULT NULL,
  `隔热层` int NULL DEFAULT NULL,
  `最大大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `中性负荷乘数` double NULL DEFAULT NULL,
  `包含在平衡负荷中的中性负荷` int NULL DEFAULT NULL,
  `中性负荷大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线管类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK导线类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK导线类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 导线类型
-- ----------------------------
INSERT INTO `导线类型` VALUES (55171, NULL, 1, 1, 293191, 293221, 293211, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '导线类型', 'THWN', NULL, NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (261496, NULL, 1, 1, 293191, 293221, 293218, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '导线类型', 'XHHW', NULL, NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (466477, NULL, 1, 1, 293191, 293221, 466471, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '导线类型', 'BV', '1', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (466478, NULL, 1, 1, 293191, 293221, 466472, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '导线类型', 'YJV', '2', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854581, NULL, 1, 1, 293191, 293221, 293218, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '导线类型', '默认', '3', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854598, NULL, 1, 1, 293191, 293221, 293211, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '电梯运行显示线 SC40 由电梯厂家确定', NULL, NULL, NULL, '导线类型', '电梯运行显示线', '4', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854599, NULL, 1, 1, 293191, 293221, 293218, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '一般照明线路 WDZ-BYJF-450V-3×2.5 mm2 SC20', NULL, NULL, NULL, '导线类型', '一般照明线路', '5', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854600, NULL, 1, 1, 293191, 293221, 466471, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '应急照明线路 WDZN-BYJF-750V-3×2.5 mm2 SC20', NULL, NULL, NULL, '导线类型', '应急照明线路', '6', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854601, NULL, 1, 1, 293191, 293221, 466472, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '避雷带', NULL, NULL, NULL, '导线类型', '避雷带', '7', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854602, NULL, 1, 1, 293191, 293221, 466472, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '接地线', NULL, NULL, NULL, '导线类型', '接地线', '8', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854603, NULL, 1, 1, 293191, 293221, 466472, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '防漏电火灾报警系统线路 RWP-4×1.5 SC20', NULL, NULL, NULL, '导线类型', '防漏电火灾报警系统线路', '9', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854604, NULL, 1, 1, 293191, 293221, 466472, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '消防联动线 WDZN-KW-7×2.5 SC40', NULL, NULL, NULL, '导线类型', '消防联动线', '10', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854605, NULL, 1, 1, 293191, 293221, 466472, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '消火栓按钮控制线 WDZN-KW-4×2.5 SC25', NULL, NULL, NULL, '导线类型', '消火栓按钮控制线', '11', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854606, NULL, 1, 1, 293191, 293221, 466472, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '压力开关起泵线 WDZN-KW-4×2.5 SC25', NULL, NULL, NULL, '导线类型', '压力开关起泵线', '12', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854607, NULL, 1, 1, 293191, 293221, 466472, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '消防电源线 WDZN-BYJF-2×2.5 SC20', NULL, NULL, NULL, '导线类型', '消防电源线', '13', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854608, NULL, 1, 1, 293191, 293221, 466472, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '消防报警总线 NH-RVS2×2.5 SC20', NULL, NULL, NULL, '导线类型', '消防报警总线', '14', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854609, NULL, 1, 1, 293191, 293221, 466472, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '对讲电话线/直通电话线 WDZN-RVS2×1.5 SC20', NULL, NULL, NULL, '导线类型', '对讲电话线/直通电话线', '15', NULL, NULL, NULL);
INSERT INTO `导线类型` VALUES (854610, NULL, 1, 1, 293191, 293221, 466472, '2000', 1, 1, '火线尺寸', '非磁性', NULL, NULL, NULL, '消防紧急广播线 NH-RVS2×1.5 SC20', NULL, NULL, NULL, '导线类型', '消防紧急广播线', '16', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 导线绝缘层
-- ----------------------------
DROP TABLE IF EXISTS `导线绝缘层`;
CREATE TABLE `导线绝缘层`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK导线绝缘层1`(`类型 ID`) USING BTREE,
  INDEX `FK导线绝缘层2`(`创建的阶段`) USING BTREE,
  INDEX `FK导线绝缘层3`(`拆除的阶段`) USING BTREE,
  INDEX `FK导线绝缘层4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK导线绝缘层1` FOREIGN KEY (`类型 ID`) REFERENCES `导线绝缘层类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线绝缘层2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线绝缘层3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线绝缘层4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 导线绝缘层
-- ----------------------------

-- ----------------------------
-- Table structure for 导线绝缘层类型
-- ----------------------------
DROP TABLE IF EXISTS `导线绝缘层类型`;
CREATE TABLE `导线绝缘层类型`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 导线绝缘层类型
-- ----------------------------
INSERT INTO `导线绝缘层类型` VALUES (293195);
INSERT INTO `导线绝缘层类型` VALUES (293196);
INSERT INTO `导线绝缘层类型` VALUES (293197);
INSERT INTO `导线绝缘层类型` VALUES (293198);
INSERT INTO `导线绝缘层类型` VALUES (293199);
INSERT INTO `导线绝缘层类型` VALUES (293200);
INSERT INTO `导线绝缘层类型` VALUES (293201);
INSERT INTO `导线绝缘层类型` VALUES (293202);
INSERT INTO `导线绝缘层类型` VALUES (293203);
INSERT INTO `导线绝缘层类型` VALUES (293204);
INSERT INTO `导线绝缘层类型` VALUES (293205);
INSERT INTO `导线绝缘层类型` VALUES (293206);
INSERT INTO `导线绝缘层类型` VALUES (293207);
INSERT INTO `导线绝缘层类型` VALUES (293208);
INSERT INTO `导线绝缘层类型` VALUES (293209);
INSERT INTO `导线绝缘层类型` VALUES (293210);
INSERT INTO `导线绝缘层类型` VALUES (293211);
INSERT INTO `导线绝缘层类型` VALUES (293212);
INSERT INTO `导线绝缘层类型` VALUES (293213);
INSERT INTO `导线绝缘层类型` VALUES (293214);
INSERT INTO `导线绝缘层类型` VALUES (293215);
INSERT INTO `导线绝缘层类型` VALUES (293216);
INSERT INTO `导线绝缘层类型` VALUES (293217);
INSERT INTO `导线绝缘层类型` VALUES (293218);
INSERT INTO `导线绝缘层类型` VALUES (293219);
INSERT INTO `导线绝缘层类型` VALUES (293220);
INSERT INTO `导线绝缘层类型` VALUES (466462);
INSERT INTO `导线绝缘层类型` VALUES (466463);
INSERT INTO `导线绝缘层类型` VALUES (466464);
INSERT INTO `导线绝缘层类型` VALUES (466465);
INSERT INTO `导线绝缘层类型` VALUES (466466);
INSERT INTO `导线绝缘层类型` VALUES (466467);
INSERT INTO `导线绝缘层类型` VALUES (466468);
INSERT INTO `导线绝缘层类型` VALUES (466469);
INSERT INTO `导线绝缘层类型` VALUES (466470);
INSERT INTO `导线绝缘层类型` VALUES (466471);
INSERT INTO `导线绝缘层类型` VALUES (466472);
INSERT INTO `导线绝缘层类型` VALUES (466473);
INSERT INTO `导线绝缘层类型` VALUES (466474);
INSERT INTO `导线绝缘层类型` VALUES (466475);
INSERT INTO `导线绝缘层类型` VALUES (466476);

-- ----------------------------
-- Table structure for 导线额定温度
-- ----------------------------
DROP TABLE IF EXISTS `导线额定温度`;
CREATE TABLE `导线额定温度`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK导线额定温度1`(`类型 ID`) USING BTREE,
  INDEX `FK导线额定温度2`(`创建的阶段`) USING BTREE,
  INDEX `FK导线额定温度3`(`拆除的阶段`) USING BTREE,
  INDEX `FK导线额定温度4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK导线额定温度1` FOREIGN KEY (`类型 ID`) REFERENCES `导线额定温度类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线额定温度2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线额定温度3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK导线额定温度4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 导线额定温度
-- ----------------------------

-- ----------------------------
-- Table structure for 导线额定温度类型
-- ----------------------------
DROP TABLE IF EXISTS `导线额定温度类型`;
CREATE TABLE `导线额定温度类型`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 导线额定温度类型
-- ----------------------------
INSERT INTO `导线额定温度类型` VALUES (293221);
INSERT INTO `导线额定温度类型` VALUES (293222);
INSERT INTO `导线额定温度类型` VALUES (293223);

-- ----------------------------
-- Table structure for 封檐板
-- ----------------------------
DROP TABLE IF EXISTS `封檐板`;
CREATE TABLE `封檐板`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK封檐板1`(`类型 ID`) USING BTREE,
  INDEX `FK封檐板2`(`创建的阶段`) USING BTREE,
  INDEX `FK封檐板3`(`拆除的阶段`) USING BTREE,
  INDEX `FK封檐板4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK封檐板1` FOREIGN KEY (`类型 ID`) REFERENCES `封檐板类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK封檐板2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK封檐板3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK封檐板4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 封檐板
-- ----------------------------

-- ----------------------------
-- Table structure for 封檐板类型
-- ----------------------------
DROP TABLE IF EXISTS `封檐板类型`;
CREATE TABLE `封檐板类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `轮廓` int NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `材质` int NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK封檐板类型1`(`轮廓`) USING BTREE,
  INDEX `FK封檐板类型2`(`部件代码`) USING BTREE,
  INDEX `FK封檐板类型3`(`材质`) USING BTREE,
  CONSTRAINT `FK封檐板类型1` FOREIGN KEY (`轮廓`) REFERENCES `轮廓1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK封檐板类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK封檐板类型3` FOREIGN KEY (`材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 封檐板类型
-- ----------------------------
INSERT INTO `封檐板类型` VALUES (19885, NULL, NULL, 20380, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '封檐板', '封檐带', NULL, NULL);

-- ----------------------------
-- Table structure for 屋顶
-- ----------------------------
DROP TABLE IF EXISTS `屋顶`;
CREATE TABLE `屋顶`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `封檐板深度` double NULL DEFAULT NULL,
  `椽截面` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `椽或桁架` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `底部标高` int NULL DEFAULT NULL,
  `截断偏移` double NULL DEFAULT NULL,
  `截断标高` int NULL DEFAULT NULL,
  `自标高的底部偏移` double NULL DEFAULT NULL,
  `厚度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK屋顶1`(`类型 ID`) USING BTREE,
  INDEX `FK屋顶2`(`创建的阶段`) USING BTREE,
  INDEX `FK屋顶3`(`拆除的阶段`) USING BTREE,
  INDEX `FK屋顶4`(`设计选项`) USING BTREE,
  INDEX `FK屋顶5`(`底部标高`) USING BTREE,
  INDEX `FK屋顶6`(`截断标高`) USING BTREE,
  CONSTRAINT `FK屋顶1` FOREIGN KEY (`类型 ID`) REFERENCES `屋顶类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK屋顶2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK屋顶3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK屋顶4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK屋顶5` FOREIGN KEY (`底部标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK屋顶6` FOREIGN KEY (`截断标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 屋顶
-- ----------------------------

-- ----------------------------
-- Table structure for 屋顶类型
-- ----------------------------
DROP TABLE IF EXISTS `屋顶类型`;
CREATE TABLE `屋顶类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构材质` int NULL DEFAULT NULL,
  `粗糙度` int NULL DEFAULT NULL,
  `吸收率` double NULL DEFAULT NULL,
  `热质量` double NULL DEFAULT NULL,
  `热阻(R)` double NULL DEFAULT NULL,
  `传热系数(U)` double NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK屋顶类型1`(`结构材质`) USING BTREE,
  INDEX `FK屋顶类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK屋顶类型1` FOREIGN KEY (`结构材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK屋顶类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 屋顶类型
-- ----------------------------
INSERT INTO `屋顶类型` VALUES (335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0.7, NULL, NULL, NULL, NULL, '基本屋顶', '常规 - 400mm', NULL, NULL, NULL, NULL);
INSERT INTO `屋顶类型` VALUES (338, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '玻璃斜窗', '玻璃斜窗', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 属性线类型
-- ----------------------------
DROP TABLE IF EXISTS `属性线类型`;
CREATE TABLE `属性线类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK属性线类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK属性线类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 属性线类型
-- ----------------------------
INSERT INTO `属性线类型` VALUES (23742, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '建筑红线', '建筑红线 - 米/平方米', NULL, NULL);

-- ----------------------------
-- Table structure for 布管系统配置
-- ----------------------------
DROP TABLE IF EXISTS `布管系统配置`;
CREATE TABLE `布管系统配置`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK布管系统配置1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK布管系统配置1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 布管系统配置
-- ----------------------------

-- ----------------------------
-- Table structure for 常规模型
-- ----------------------------
DROP TABLE IF EXISTS `常规模型`;
CREATE TABLE `常规模型`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK常规模型1`(`类型 ID`) USING BTREE,
  INDEX `FK常规模型2`(`创建的阶段`) USING BTREE,
  INDEX `FK常规模型3`(`拆除的阶段`) USING BTREE,
  INDEX `FK常规模型4`(`设计选项`) USING BTREE,
  INDEX `FK常规模型5`(`标高`) USING BTREE,
  CONSTRAINT `FK常规模型1` FOREIGN KEY (`类型 ID`) REFERENCES `常规模型类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK常规模型2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK常规模型3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK常规模型4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK常规模型5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 常规模型
-- ----------------------------

-- ----------------------------
-- Table structure for 常规模型类型
-- ----------------------------
DROP TABLE IF EXISTS `常规模型类型`;
CREATE TABLE `常规模型类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK常规模型类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK常规模型类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK常规模型类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK常规模型类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 常规模型类型
-- ----------------------------
INSERT INTO `常规模型类型` VALUES (7848, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '模型文字', '600 mm Arial', NULL, NULL, NULL, NULL);
INSERT INTO `常规模型类型` VALUES (1015786, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '吸水喇叭口支座DN100-200', '吸水喇叭口支座DN100-200', NULL, NULL, NULL, NULL);
INSERT INTO `常规模型类型` VALUES (1016877, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '吸水喇叭口支座DN250-450', '吸水喇叭口支座DN250-450', NULL, NULL, NULL, NULL);
INSERT INTO `常规模型类型` VALUES (1271323, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手提式灭火器', '手提式灭火器', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 幕墙嵌板
-- ----------------------------
DROP TABLE IF EXISTS `幕墙嵌板`;
CREATE TABLE `幕墙嵌板`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `高度` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK幕墙嵌板1`(`创建的阶段`) USING BTREE,
  INDEX `FK幕墙嵌板2`(`拆除的阶段`) USING BTREE,
  INDEX `FK幕墙嵌板3`(`设计选项`) USING BTREE,
  CONSTRAINT `FK幕墙嵌板1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK幕墙嵌板2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK幕墙嵌板3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 幕墙嵌板
-- ----------------------------

-- ----------------------------
-- Table structure for 幕墙嵌板类型
-- ----------------------------
DROP TABLE IF EXISTS `幕墙嵌板类型`;
CREATE TABLE `幕墙嵌板类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `可见光透过率` double NULL DEFAULT NULL,
  `日光得热系数` double NULL DEFAULT NULL,
  `热阻(R)` double NULL DEFAULT NULL,
  `传热系数(U)` double NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `完成` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `构造类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK幕墙嵌板类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK幕墙嵌板类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK幕墙嵌板类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK幕墙嵌板类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 幕墙嵌板类型
-- ----------------------------
INSERT INTO `幕墙嵌板类型` VALUES (12611, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '系统嵌板', '玻璃', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `幕墙嵌板类型` VALUES (54539, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '系统嵌板', '墙', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 幕墙竖梃
-- ----------------------------
DROP TABLE IF EXISTS `幕墙竖梃`;
CREATE TABLE `幕墙竖梃`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK幕墙竖梃1`(`类型 ID`) USING BTREE,
  INDEX `FK幕墙竖梃2`(`创建的阶段`) USING BTREE,
  INDEX `FK幕墙竖梃3`(`拆除的阶段`) USING BTREE,
  INDEX `FK幕墙竖梃4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK幕墙竖梃1` FOREIGN KEY (`类型 ID`) REFERENCES `幕墙竖梃类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK幕墙竖梃2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK幕墙竖梃3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK幕墙竖梃4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 幕墙竖梃
-- ----------------------------

-- ----------------------------
-- Table structure for 幕墙竖梃类型
-- ----------------------------
DROP TABLE IF EXISTS `幕墙竖梃类型`;
CREATE TABLE `幕墙竖梃类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK幕墙竖梃类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK幕墙竖梃类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 幕墙竖梃类型
-- ----------------------------
INSERT INTO `幕墙竖梃类型` VALUES (8486, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形竖梃', '50 x 150mm', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 幕墙系统
-- ----------------------------
DROP TABLE IF EXISTS `幕墙系统`;
CREATE TABLE `幕墙系统`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK幕墙系统1`(`类型 ID`) USING BTREE,
  INDEX `FK幕墙系统2`(`创建的阶段`) USING BTREE,
  INDEX `FK幕墙系统3`(`拆除的阶段`) USING BTREE,
  INDEX `FK幕墙系统4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK幕墙系统1` FOREIGN KEY (`类型 ID`) REFERENCES `幕墙系统类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK幕墙系统2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK幕墙系统3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK幕墙系统4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 幕墙系统
-- ----------------------------

-- ----------------------------
-- Table structure for 幕墙系统类型
-- ----------------------------
DROP TABLE IF EXISTS `幕墙系统类型`;
CREATE TABLE `幕墙系统类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK幕墙系统类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK幕墙系统类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 幕墙系统类型
-- ----------------------------
INSERT INTO `幕墙系统类型` VALUES (49034, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '幕墙系统', '1500 x 3000mm', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 平板
-- ----------------------------
DROP TABLE IF EXISTS `平板`;
CREATE TABLE `平板`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `涂层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `厚度` double NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构材质` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK平板1`(`创建的阶段`) USING BTREE,
  INDEX `FK平板2`(`拆除的阶段`) USING BTREE,
  INDEX `FK平板3`(`设计选项`) USING BTREE,
  INDEX `FK平板4`(`结构材质`) USING BTREE,
  CONSTRAINT `FK平板1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK平板2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK平板3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK平板4` FOREIGN KEY (`结构材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 平板
-- ----------------------------

-- ----------------------------
-- Table structure for 建筑类型设置
-- ----------------------------
DROP TABLE IF EXISTS `建筑类型设置`;
CREATE TABLE `建筑类型设置`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK建筑类型设置1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK建筑类型设置1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 建筑类型设置
-- ----------------------------
INSERT INTO `建筑类型设置` VALUES (388168, NULL);
INSERT INTO `建筑类型设置` VALUES (388169, NULL);
INSERT INTO `建筑类型设置` VALUES (388170, NULL);
INSERT INTO `建筑类型设置` VALUES (388171, NULL);
INSERT INTO `建筑类型设置` VALUES (388172, NULL);
INSERT INTO `建筑类型设置` VALUES (388173, NULL);
INSERT INTO `建筑类型设置` VALUES (388174, NULL);
INSERT INTO `建筑类型设置` VALUES (388175, NULL);
INSERT INTO `建筑类型设置` VALUES (388176, NULL);
INSERT INTO `建筑类型设置` VALUES (388177, NULL);
INSERT INTO `建筑类型设置` VALUES (388178, NULL);
INSERT INTO `建筑类型设置` VALUES (388179, NULL);
INSERT INTO `建筑类型设置` VALUES (388180, NULL);
INSERT INTO `建筑类型设置` VALUES (388181, NULL);
INSERT INTO `建筑类型设置` VALUES (388182, NULL);
INSERT INTO `建筑类型设置` VALUES (388183, NULL);
INSERT INTO `建筑类型设置` VALUES (388184, NULL);
INSERT INTO `建筑类型设置` VALUES (388185, NULL);
INSERT INTO `建筑类型设置` VALUES (388186, NULL);
INSERT INTO `建筑类型设置` VALUES (388187, NULL);
INSERT INTO `建筑类型设置` VALUES (388188, NULL);
INSERT INTO `建筑类型设置` VALUES (388189, NULL);
INSERT INTO `建筑类型设置` VALUES (388190, NULL);
INSERT INTO `建筑类型设置` VALUES (388191, NULL);
INSERT INTO `建筑类型设置` VALUES (388192, NULL);
INSERT INTO `建筑类型设置` VALUES (388193, NULL);
INSERT INTO `建筑类型设置` VALUES (388194, NULL);
INSERT INTO `建筑类型设置` VALUES (388195, NULL);
INSERT INTO `建筑类型设置` VALUES (388196, NULL);
INSERT INTO `建筑类型设置` VALUES (388197, NULL);
INSERT INTO `建筑类型设置` VALUES (388198, NULL);
INSERT INTO `建筑类型设置` VALUES (388199, NULL);
INSERT INTO `建筑类型设置` VALUES (388200, NULL);

-- ----------------------------
-- Table structure for 建筑红线
-- ----------------------------
DROP TABLE IF EXISTS `建筑红线`;
CREATE TABLE `建筑红线`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK建筑红线1`(`类型 ID`) USING BTREE,
  INDEX `FK建筑红线2`(`设计选项`) USING BTREE,
  CONSTRAINT `FK建筑红线1` FOREIGN KEY (`类型 ID`) REFERENCES `属性线类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK建筑红线2` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 建筑红线
-- ----------------------------

-- ----------------------------
-- Table structure for 开关系统
-- ----------------------------
DROP TABLE IF EXISTS `开关系统`;
CREATE TABLE `开关系统`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `开关 ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK开关系统1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK开关系统1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 开关系统
-- ----------------------------

-- ----------------------------
-- Table structure for 房间
-- ----------------------------
DROP TABLE IF EXISTS `房间`;
CREATE TABLE `房间`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `阶段 ID` int NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `周长` double NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `占用` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `基面面层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `天花板面层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `墙面面层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼板面层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `占用者` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `区域` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼地面：编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼地面：材料` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼地面：厚度 (mm)` double NULL DEFAULT NULL,
  `墙面：编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `墙面：材料` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `墙面：厚度 (mm)` double NULL DEFAULT NULL,
  `顶棚：编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `顶棚：材料` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `顶棚：厚度 (mm)` double NULL DEFAULT NULL,
  `踢脚：编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `踢脚：材料` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `吊顶高度 (mm)` double NULL DEFAULT NULL,
  `占用者：人数 (人)` int NULL DEFAULT NULL,
  `占用者：指标 (人m?)` double NULL DEFAULT NULL,
  `荷载 (kNm?)` double NULL DEFAULT NULL,
  `消防配置` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `设计温度 (℃)` double NULL DEFAULT NULL,
  `通风形式` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `采暖空调形式` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK房间1`(`设计选项`) USING BTREE,
  INDEX `FK房间2`(`阶段 ID`) USING BTREE,
  INDEX `FK房间3`(`标高`) USING BTREE,
  CONSTRAINT `FK房间1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK房间2` FOREIGN KEY (`阶段 ID`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK房间3` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 房间
-- ----------------------------

-- ----------------------------
-- Table structure for 房间从到关联
-- ----------------------------
DROP TABLE IF EXISTS `房间从到关联`;
CREATE TABLE `房间从到关联`  (
  `ID` int NOT NULL,
  `阶段 ID` int NOT NULL,
  `设计选项 ID` int NOT NULL,
  `从房间` int NULL DEFAULT NULL,
  `到房间` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `阶段 ID`, `设计选项 ID`) USING BTREE,
  INDEX `FK房间从到关联1`(`阶段 ID`) USING BTREE,
  INDEX `FK房间从到关联2`(`从房间`) USING BTREE,
  INDEX `FK房间从到关联3`(`到房间`) USING BTREE,
  CONSTRAINT `FK房间从到关联1` FOREIGN KEY (`阶段 ID`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK房间从到关联2` FOREIGN KEY (`从房间`) REFERENCES `房间` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK房间从到关联3` FOREIGN KEY (`到房间`) REFERENCES `房间` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 房间从到关联
-- ----------------------------

-- ----------------------------
-- Table structure for 房间关联
-- ----------------------------
DROP TABLE IF EXISTS `房间关联`;
CREATE TABLE `房间关联`  (
  `ID` int NOT NULL,
  `阶段 ID` int NOT NULL,
  `设计选项 ID` int NOT NULL,
  `房间 ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `阶段 ID`, `设计选项 ID`) USING BTREE,
  INDEX `FK房间关联1`(`阶段 ID`) USING BTREE,
  INDEX `FK房间关联2`(`房间 ID`) USING BTREE,
  CONSTRAINT `FK房间关联1` FOREIGN KEY (`阶段 ID`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK房间关联2` FOREIGN KEY (`房间 ID`) REFERENCES `房间` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 房间关联
-- ----------------------------

-- ----------------------------
-- Table structure for 护理呼叫设备
-- ----------------------------
DROP TABLE IF EXISTS `护理呼叫设备`;
CREATE TABLE `护理呼叫设备`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气数据` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK护理呼叫设备1`(`类型 ID`) USING BTREE,
  INDEX `FK护理呼叫设备2`(`创建的阶段`) USING BTREE,
  INDEX `FK护理呼叫设备3`(`拆除的阶段`) USING BTREE,
  INDEX `FK护理呼叫设备4`(`设计选项`) USING BTREE,
  INDEX `FK护理呼叫设备5`(`标高`) USING BTREE,
  CONSTRAINT `FK护理呼叫设备1` FOREIGN KEY (`类型 ID`) REFERENCES `护理呼叫设备类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK护理呼叫设备2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK护理呼叫设备3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK护理呼叫设备4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK护理呼叫设备5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 护理呼叫设备
-- ----------------------------

-- ----------------------------
-- Table structure for 护理呼叫设备类型
-- ----------------------------
DROP TABLE IF EXISTS `护理呼叫设备类型`;
CREATE TABLE `护理呼叫设备类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK护理呼叫设备类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK护理呼叫设备类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK护理呼叫设备类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK护理呼叫设备类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 护理呼叫设备类型
-- ----------------------------

-- ----------------------------
-- Table structure for 数据设备
-- ----------------------------
DROP TABLE IF EXISTS `数据设备`;
CREATE TABLE `数据设备`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气数据` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK数据设备1`(`类型 ID`) USING BTREE,
  INDEX `FK数据设备2`(`创建的阶段`) USING BTREE,
  INDEX `FK数据设备3`(`拆除的阶段`) USING BTREE,
  INDEX `FK数据设备4`(`设计选项`) USING BTREE,
  INDEX `FK数据设备5`(`标高`) USING BTREE,
  CONSTRAINT `FK数据设备1` FOREIGN KEY (`类型 ID`) REFERENCES `数据设备类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK数据设备2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK数据设备3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK数据设备4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK数据设备5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 数据设备
-- ----------------------------

-- ----------------------------
-- Table structure for 数据设备类型
-- ----------------------------
DROP TABLE IF EXISTS `数据设备类型`;
CREATE TABLE `数据设备类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK数据设备类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK数据设备类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK数据设备类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK数据设备类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 数据设备类型
-- ----------------------------
INSERT INTO `数据设备类型` VALUES (993020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Z_B类，壁装双口面板（1个数据点，1个语音点）', 'B类，壁装双口面板（1个数据点，1个语音点）', NULL, NULL, NULL, NULL);
INSERT INTO `数据设备类型` VALUES (994594, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Z_D类，壁装单口面板（1个数据点）', 'D类，壁装单口面板（1个数据点）', NULL, NULL, NULL, NULL);
INSERT INTO `数据设备类型` VALUES (995809, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Z_D类，壁装单口面板（1个语音点）', 'D类，壁装单口面板（1个语音点）', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 机械设备
-- ----------------------------
DROP TABLE IF EXISTS `机械设备`;
CREATE TABLE `机械设备`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `机械设备集` int NULL DEFAULT NULL,
  `重要路径` int NULL DEFAULT NULL,
  `计算的压降` double NULL DEFAULT NULL,
  `计算的流量` double NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK机械设备1`(`类型 ID`) USING BTREE,
  INDEX `FK机械设备2`(`创建的阶段`) USING BTREE,
  INDEX `FK机械设备3`(`拆除的阶段`) USING BTREE,
  INDEX `FK机械设备4`(`设计选项`) USING BTREE,
  INDEX `FK机械设备5`(`标高`) USING BTREE,
  CONSTRAINT `FK机械设备1` FOREIGN KEY (`类型 ID`) REFERENCES `机电设备类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK机械设备2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK机械设备3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK机械设备4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK机械设备5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 机械设备
-- ----------------------------

-- ----------------------------
-- Table structure for 机械设备集
-- ----------------------------
DROP TABLE IF EXISTS `机械设备集`;
CREATE TABLE `机械设备集`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `待命中` int NULL DEFAULT NULL,
  `使用中` int NULL DEFAULT NULL,
  `计算的压降` double NULL DEFAULT NULL,
  `计算的流量` double NULL DEFAULT NULL,
  `分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK机械设备集1`(`类型 ID`) USING BTREE,
  INDEX `FK机械设备集2`(`设计选项`) USING BTREE,
  CONSTRAINT `FK机械设备集1` FOREIGN KEY (`类型 ID`) REFERENCES `机械设备集类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK机械设备集2` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 机械设备集
-- ----------------------------

-- ----------------------------
-- Table structure for 机械设备集类型
-- ----------------------------
DROP TABLE IF EXISTS `机械设备集类型`;
CREATE TABLE `机械设备集类型`  (
  `ID` int NOT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 机械设备集类型
-- ----------------------------
INSERT INTO `机械设备集类型` VALUES (2164530, NULL, NULL);

-- ----------------------------
-- Table structure for 机电设备类型
-- ----------------------------
DROP TABLE IF EXISTS `机电设备类型`;
CREATE TABLE `机电设备类型`  (
  `ID` int NOT NULL,
  `分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK机电设备类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK机电设备类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK机电设备类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK机电设备类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 机电设备类型
-- ----------------------------
INSERT INTO `机电设备类型` VALUES (689873, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '膨胀水箱 - 方形', '0.5 立方米', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (689875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '膨胀水箱 - 方形', '1.0 立方米', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (689877, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '膨胀水箱 - 方形', '2.0 立方米', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (689879, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '膨胀水箱 - 方形', '3.0 立方米', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (689881, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '膨胀水箱 - 方形', '4.0 立方米', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (689883, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '膨胀水箱 - 方形', '5.0 立方米', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (698705, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道泵 - 单头', '250 mm - 280 m - 4 极', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (698707, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道泵 - 单头', '200 mm - 240 m - 4 极', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (698709, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道泵 - 单头', '150 mm - 200 m - 4 极', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (698711, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道泵 - 单头', '125 mm - 160 m - 4 极', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (698713, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道泵 - 单头', '100 mm - 150 m - 4 极', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (698715, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道泵 - 单头', '50 mm - 110 m - 4 极', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (698717, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道泵 - 单头', '80 mm - 140 m - 2 极', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (698719, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道泵 - 单头', '65 mm - 120 m - 2 极', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (698721, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道泵 - 单头', '40 mm - 90 m - 2 极', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (698723, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道泵 - 单头', '32 mm - 60 m - 2 极', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (698725, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道泵 - 单头', '25 mm - 50 m - 2 极', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1014752, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'XBD系列多级消防泵', 'XBD系列多级消防泵', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1019296, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '消防泵', '消防泵', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1023800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '消防水箱', '5.0 立方米', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1026637, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '消火栓箱（后接口）', '消火栓箱（后接口）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1031630, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '消火栓箱（左接口）', '消火栓箱（左接口）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033241, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '3机号(ABCDEF)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033243, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '3.5机号（ABCDE)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033245, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '3.5机号（F）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033247, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '4机号（ABCD）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033249, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '4机号（E）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033251, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '4机号（F）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033253, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '4.5机号（ABCD)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033255, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '4.5机号（EF）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033257, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '5机号(ABCDE)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033259, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '5机号（F）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033261, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '5.5机号（ABCD)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033263, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '5.5机号（EF）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033265, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '6机号（ABCD)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033267, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '6机号（E）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033269, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '6机号（F）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '6.5机号（ABC)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033273, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '6.5机号（DE）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033275, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '6.5机号（F）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033277, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '7机号（ABCD）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033279, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '7机号（EF）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033281, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '8机号（ABC)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033283, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '8机号（DE）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033285, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '8机号（F）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033287, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '9机号（AB）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033289, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '9机号（CDE）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033291, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '9机号（F)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033293, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '10机号（ABCD)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033295, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '10机号（E）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '10机号（F）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033299, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '11机号（ABCD）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '11机号（E）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033303, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '11机号（F）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033305, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '12机号（AB）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033307, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '12机号（CD）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '12机号（EF）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033311, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '13机号（ABC）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '13机号（D）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033315, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '13机号（EF)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033317, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '14机号（ABC）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033319, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '14机号（D）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033321, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '14机号（EF）', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033323, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '10机号（ABCD)-30000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033325, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '10机号（ABCD)-23000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033327, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '10机号（ABCD)-25000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033329, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '10机号（ABCD)-12000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033331, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '7机号（ABCD)-16000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033333, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '4机号（ABCD）-2500', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '6机号（ABCD)-13000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033337, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '5机号(ABCDE)-10000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033339, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '8机号（ABC)-19000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033341, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '5.5机号（ABCD)-13000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033343, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '3.5机号（ABCDE)-7000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033345, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '5机号(ABCDE)-5600', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033347, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '10机号（ABCD)-20000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033349, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '7机号（ABCD）风量10000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033351, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '7机号（ABCD）风量27000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1033353, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'GXF型斜流风机', '7机号（ABCD）风量8000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050585, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '1650-4954 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050587, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '1850-5415 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050589, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '2600-8048 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050591, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '4500-12653 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050593, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '6030-17278 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050595, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '7900-22891 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050597, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '11056-28858 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050599, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '14821-37999 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050601, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '19092-49492 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050603, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '19092-65278 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050605, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '31320-95228 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1050607, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '离心式风机 - 箱式 - 电动机外置', '35990-114673 CMH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1060775, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制', 'FP-02', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1060777, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制', 'FP-03', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1060779, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制', 'FP-04', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1060781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制', 'FP-05', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1060783, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制', 'FP-06', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1060785, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制', 'FP-08', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1064741, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制-带回风口', 'FP-02', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1064743, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制-带回风口', 'FP-03', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1064745, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制-带回风口', 'FP-04', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1064747, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制-带回风口', 'FP-05', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1064749, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制-带回风口', 'FP-06', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1064751, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 双管制-带回风口', 'FP-08', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1068620, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制', 'FP-02', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1068622, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制', 'FP-03', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1068624, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制', 'FP-04', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1068626, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制', 'FP-05', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1068628, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制', 'FP-06', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1068630, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制', 'FP-08', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1072631, NULL, NULL, NULL, NULL, NULL, 'FP', NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制-带回风口', 'FP-05', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1072633, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制-带回风口', 'FP-02', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1072635, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制-带回风口', 'FP-03', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1072637, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制-带回风口', 'FP-04', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1072639, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制-带回风口', 'FP-06', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1072641, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 底部回风- 四管制-带回风口', 'FP-08', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1076566, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 双管制-带回风口', 'FP-05', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1076568, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 双管制-带回风口', 'FP-02', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1076570, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 双管制-带回风口', 'FP-03', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1076572, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 双管制-带回风口', 'FP-04', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1076574, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 双管制-带回风口', 'FP-06', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1076576, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 双管制-带回风口', 'FP-08', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1080552, NULL, NULL, NULL, NULL, NULL, 'FP', NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 四管制-带回风口', 'FP-05', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1080554, NULL, NULL, NULL, NULL, NULL, 'FP', NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 四管制-带回风口', 'FP-02', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1080556, NULL, NULL, NULL, NULL, NULL, 'FP', NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 四管制-带回风口', 'FP-03', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1080558, NULL, NULL, NULL, NULL, NULL, 'FP', NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 四管制-带回风口', 'FP-04', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1080560, NULL, NULL, NULL, NULL, NULL, 'FP', NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 四管制-带回风口', 'FP-06', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1080562, NULL, NULL, NULL, NULL, NULL, 'FP', NULL, NULL, NULL, NULL, '卧式暗装风机盘管 - 2排 - 后部回风- 四管制-带回风口', 'FP-08', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1083085, NULL, NULL, NULL, '08A-0913', NULL, NULL, NULL, NULL, NULL, NULL, '组合式空调机组', '风量15000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1083087, NULL, NULL, NULL, '08A-0913', NULL, NULL, NULL, NULL, NULL, NULL, '组合式空调机组', '风量18000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1083089, NULL, NULL, NULL, '08A-0913', NULL, NULL, NULL, NULL, NULL, NULL, '组合式空调机组', '风量20000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1083091, NULL, NULL, NULL, '08A-0913', NULL, NULL, NULL, NULL, NULL, NULL, '组合式空调机组', '风量25000 新风量5500', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1083093, NULL, NULL, NULL, '08A-0913', NULL, NULL, NULL, NULL, NULL, NULL, '组合式空调机组', '风量30000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1083095, NULL, NULL, NULL, '08A-0913', NULL, NULL, NULL, NULL, NULL, NULL, '组合式空调机组', '风量29000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1083097, NULL, NULL, NULL, '08A-0913', NULL, NULL, NULL, NULL, NULL, NULL, '组合式空调机组', '风量25000 新风量5000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1083099, NULL, NULL, NULL, '08A-0913', NULL, NULL, NULL, NULL, NULL, NULL, '组合式空调机组', '风量25000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1083101, NULL, NULL, NULL, '08A-0913', NULL, NULL, NULL, NULL, NULL, NULL, '组合式空调机组', '风量27000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1083103, NULL, NULL, NULL, '08A-0913', NULL, NULL, NULL, NULL, NULL, NULL, '组合式空调机组', '风量10000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085543, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量3000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085545, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量4000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085547, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量5000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085549, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量6000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085551, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量7000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085553, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量8000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085555, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量10000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085557, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量12000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085559, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量15000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085561, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量25000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085563, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量18000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085565, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量20000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085567, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量30000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085569, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量13000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085571, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量17000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1085573, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合新风机组', '风量14000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1185050, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'HV_排气扇_侧出口_独立', '排气扇345×345', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1358151, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, '3EHP150F1500以上', '2EIHP390F3000', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1463622, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'H-斜流风机-GXF型', '5机号(ABCDE)', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1478757, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.35.17.17.11', NULL, 'H-机柜排风器-圆形连接件-吸顶式', '47-84 LPS', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1478759, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.35.17.17.11', NULL, 'H-机柜排风器-圆形连接件-吸顶式', '94-150 LPS', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1483733, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-风机盘管-卧式暗装-2排-底部回风-带回风口-双管制', 'FP-03', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1483735, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-风机盘管-卧式暗装-2排-底部回风-带回风口-双管制', 'FP-04', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1483737, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-风机盘管-卧式暗装-2排-底部回风-带回风口-双管制', 'FP-05', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1483739, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-风机盘管-卧式暗装-2排-底部回风-带回风口-双管制', 'FP-06', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1500249, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'H-新风换气机-大金', 'XHBX-D13TH', NULL, NULL, NULL, NULL);
INSERT INTO `机电设备类型` VALUES (1653353, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.00.00', NULL, 'HV_排气扇_侧出口_独立', '排气扇150', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 材质
-- ----------------------------
DROP TABLE IF EXISTS `材质`;
CREATE TABLE `材质`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 材质
-- ----------------------------
INSERT INTO `材质` VALUES (23, NULL, '默认', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (24, NULL, '默认墙', NULL, NULL, NULL, '渲染外观不会升级 ', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (25, NULL, '默认屋顶', NULL, NULL, NULL, '渲染外观不会升级 ', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (26, NULL, '玻璃', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (27, NULL, '阶段 - 拆除', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (28, NULL, '阶段 - 现有', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (29, NULL, '阶段 - 临时', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (414, NULL, '砖，普通', NULL, NULL, NULL, NULL, NULL, '普通砖', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (415, NULL, '混凝土砌块', NULL, NULL, NULL, NULL, NULL, '混凝土砌块', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (416, NULL, '金属立筋龙骨层', NULL, NULL, NULL, NULL, NULL, '轻型钢框架，空气隔热层', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (417, NULL, '胶合板，壁板', NULL, NULL, NULL, NULL, NULL, '胶合板，壁板等级', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (418, NULL, '空气', NULL, NULL, NULL, NULL, NULL, '空气', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (419, NULL, '气密层', NULL, NULL, NULL, NULL, NULL, '物理材质', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (421, NULL, '隔汽层', NULL, NULL, NULL, NULL, NULL, '聚乙烯薄膜', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (423, NULL, '石膏墙板', NULL, NULL, NULL, NULL, NULL, '石膏墙板', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (519, NULL, '土壤', NULL, NULL, NULL, NULL, NULL, '土', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (523, NULL, '混凝土，现场浇注', NULL, NULL, NULL, NULL, NULL, '物理材质', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (533, NULL, '铝', NULL, NULL, NULL, NULL, NULL, '铝 6061', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (758, NULL, '默认楼板', NULL, NULL, NULL, '渲染外观不会升级 ', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (792, NULL, '屋顶材料，EPDM 薄膜', NULL, NULL, NULL, NULL, NULL, 'EPDM 屋顶涂膜', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (812, NULL, '面砖', NULL, NULL, NULL, NULL, NULL, '物理材质', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (865, NULL, '沥青', NULL, NULL, NULL, NULL, NULL, '沥青屋顶材料', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (7247, NULL, '天花板 - 扣板 600 x 600mm', NULL, NULL, NULL, NULL, NULL, '隔音天花板扣板', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (8798, NULL, '阶段 - 新建', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (21208, NULL, '门 - 把手', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (51455, NULL, '土层', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (52139, NULL, '默认楼层面积面', NULL, NULL, NULL, '渲染外观不会升级 ', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (85087, NULL, '钢，45-345', NULL, NULL, NULL, NULL, NULL, '钢 345 MPa', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (127667, NULL, '钢，油漆面层，象牙白，有光泽', NULL, NULL, NULL, NULL, NULL, '钢，油漆面层，象牙白，有光泽', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (294514, NULL, '默认光源', NULL, NULL, NULL, '渲染外观不会升级 ', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (458403, NULL, '默认形状', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (518704, NULL, '默认体量楼层', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (518707, NULL, '默认体量洞口', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (518708, NULL, '默认体量着色', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (518710, NULL, '软木，木料', NULL, NULL, NULL, NULL, NULL, '短叶松', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (518711, NULL, '玻璃，透明玻璃', NULL, NULL, NULL, NULL, NULL, '透明玻璃', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (592898, NULL, '隔热层 - 纤维玻璃', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (592899, NULL, '隔热层 - 酚醛泡沫体', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (592900, NULL, '隔热层 - 矿棉', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (592901, NULL, '内衬 - 纤维玻璃板', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (592902, NULL, '内衬 - 纺织品', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (680415, NULL, '钢，碳钢', NULL, NULL, NULL, NULL, NULL, '碳钢', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (680421, NULL, '铜', NULL, NULL, NULL, NULL, NULL, '铜，粗面面层', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (680431, NULL, '铁，铸铁', NULL, NULL, NULL, NULL, NULL, 'Ductile cast iron', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (680437, NULL, 'PE 63', NULL, NULL, NULL, NULL, NULL, '低密度聚乙烯', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (680447, NULL, 'PE 100', NULL, NULL, NULL, NULL, NULL, '低密度聚乙烯', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (680453, NULL, 'PVC-U', NULL, NULL, NULL, NULL, NULL, '刚性聚氯乙烯 - 未增塑', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (680459, NULL, '不锈钢', NULL, NULL, NULL, NULL, NULL, '不锈钢 18/8', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (680469, NULL, '钢塑复合', NULL, NULL, NULL, NULL, NULL, '不锈钢 18/8', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (684767, NULL, '分析楼板表面', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (684768, NULL, '分析板表面', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (684769, NULL, '分析墙表面', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (689898, NULL, '拆除阶段', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (689899, NULL, '现有阶段', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (689900, NULL, '临时阶段', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (840987, NULL, '分析楼层表面', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (848157, NULL, '场地 - 土壤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (848765, NULL, '场地 - 土', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (848766, NULL, '默认体量', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (849760, NULL, '土壤 - 自然', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (851966, NULL, '实心材质 - 粗面，织纹，绿色，深色', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (851982, NULL, '实心材质 - 特殊，树皮(2)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (851992, NULL, '台面', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (856834, NULL, '标准', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (860882, NULL, 'UPVC排水管（GB-T_5836.1-2006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (860883, NULL, '排水铸铁（GB/T 12772-2008）', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (860884, NULL, '无缝钢管（GB/T 8163-2008）', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (860885, NULL, '碳钢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (860895, NULL, '热镀锌', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (860897, NULL, 'PP-R管', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (860900, NULL, '聚丙烯排水管1', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (864634, NULL, '新建阶段', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (901206, NULL, '玻璃 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (915495, NULL, '指示灯板材质', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1019312, NULL, '钢，S 460', NULL, NULL, NULL, NULL, NULL, 'Eurocode structural steel, S 460', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1090894, NULL, '金属 - 钢，抛光', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1168980, NULL, '渲染材质 255-255-255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1168983, NULL, '渲染材质 255-0-255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1171790, NULL, '渲染材质 128-128-128', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1171799, NULL, '渲染材质 0-255-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1171844, NULL, '渲染材质 0-0-255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1171847, NULL, '渲染材质 255-255-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1171864, NULL, '渲染材质 255-0-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1171869, NULL, '渲染材质 255-191-127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1171892, NULL, '渲染材质 0-255-255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1171971, NULL, '渲染材质 127-127-63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1171974, NULL, '渲染材质 191-0-255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1171983, NULL, '渲染材质 0-165-124', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1171988, NULL, '渲染材质 0-95-127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1172011, NULL, '渲染材质 127-127-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1186285, NULL, '渲染材质 124-0-165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1186290, NULL, '渲染材质 127-0-63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1186315, NULL, '渲染材质 255-159-127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1186338, NULL, '渲染材质 192-192-192', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1186343, NULL, '渲染材质 0-82-165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1186421, NULL, '渲染材质 101-101-101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1186434, NULL, '渲染材质 127-63-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1225833, NULL, '渲染材质 159-127-255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1225846, NULL, '渲染材质 0-127-255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1225853, NULL, '渲染材质 0-165-165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1253286, NULL, '渲染材质 102-102-102', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1253379, NULL, '渲染材质 82-165-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1253384, NULL, '渲染材质 127-255-127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1270348, NULL, '金属', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1270351, NULL, '灭火器', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1270353, NULL, '黑', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1353078, NULL, '渲染材质 255-191-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1353105, NULL, '渲染材质 0-57-76', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1358141, NULL, 'Material - Aaon - Logo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1358142, NULL, 'Material - Aaon - Body', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1392165, NULL, '渲染材质 95-127-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1461956, NULL, '图例材质', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1464434, NULL, '不锈钢 AISI 304', NULL, NULL, NULL, NULL, NULL, 'Stainless Steel 18/8', 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1515974, NULL, '渲染材质 0-127-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1515989, NULL, '渲染材质 38-76-66', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1516070, NULL, '渲染材质 165-145-82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1518616, NULL, '渲染材质 255-0-63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1525467, NULL, '渲染材质 255-63-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1526947, NULL, '渲染材质 255-127-127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1582224, NULL, '渲染材质 153-153-153', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1582295, NULL, '渲染材质 0-38-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1638178, NULL, '渲染材质 127-0-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1638185, NULL, '渲染材质 82-103-165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1638252, NULL, '渲染材质 127-111-63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1639150, NULL, '渲染材质 165-0-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1639197, NULL, '渲染材质 255-0-127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1639204, NULL, '渲染材质 255-127-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1646394, NULL, '渲染材质 255-127-255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1646399, NULL, '渲染材质 0-165-41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1646570, NULL, '渲染材质 255-223-127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1679303, NULL, '渲染材质 0-124-165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1679392, NULL, '渲染材质 124-82-165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1679403, NULL, '渲染材质 76-57-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1681271, NULL, '渲染材质 0-255-63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1681278, NULL, '渲染材质 76-0-38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1681540, NULL, '渲染材质 0-0-0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1681856, NULL, '渲染材质 165-103-82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1682083, NULL, '渲染材质 127-63-95', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1682092, NULL, '渲染材质 127-63-79', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1933258, NULL, '渲染材质 82-0-165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1933261, NULL, '渲染材质 127-223-255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (1933268, NULL, '渲染材质 191-255-127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2133618, NULL, '透明玻璃', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2133630, NULL, '塑料-白', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2133636, NULL, '模型文字', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2170362, NULL, '系统分区', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200522, NULL, '分析空间', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200524, NULL, '外墙', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200526, NULL, '屋顶', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200528, NULL, '平整表面上的板', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200530, NULL, '内墙', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200532, NULL, '内部楼板', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200534, NULL, '天花板', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200536, NULL, '空气曲面', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200538, NULL, '地下墙', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200540, NULL, '可操作窗口', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200542, NULL, '可操作天窗', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200544, NULL, '推拉门', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200546, NULL, '空气洞口', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `材质` VALUES (2200548, NULL, '着色', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 材质数量
-- ----------------------------
DROP TABLE IF EXISTS `材质数量`;
CREATE TABLE `材质数量`  (
  `图元 ID` int NOT NULL,
  `材质 ID` int NOT NULL,
  `为绘制` int NOT NULL,
  `面积` double NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  PRIMARY KEY (`图元 ID`, `材质 ID`, `为绘制`) USING BTREE,
  INDEX `FK材质数量1`(`材质 ID`) USING BTREE,
  CONSTRAINT `FK材质数量1` FOREIGN KEY (`材质 ID`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 材质数量
-- ----------------------------

-- ----------------------------
-- Table structure for 构造
-- ----------------------------
DROP TABLE IF EXISTS `构造`;
CREATE TABLE `构造`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK构造1`(`类型 ID`) USING BTREE,
  INDEX `FK构造2`(`创建的阶段`) USING BTREE,
  INDEX `FK构造3`(`拆除的阶段`) USING BTREE,
  INDEX `FK构造4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK构造1` FOREIGN KEY (`类型 ID`) REFERENCES `构造类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK构造2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK构造3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK构造4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 构造
-- ----------------------------

-- ----------------------------
-- Table structure for 构造类型
-- ----------------------------
DROP TABLE IF EXISTS `构造类型`;
CREATE TABLE `构造类型`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 构造类型
-- ----------------------------
INSERT INTO `构造类型` VALUES (270261);

-- ----------------------------
-- Table structure for 柱
-- ----------------------------
DROP TABLE IF EXISTS `柱`;
CREATE TABLE `柱`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `顶部偏移` double NULL DEFAULT NULL,
  `底部偏移` double NULL DEFAULT NULL,
  `顶部标高` int NULL DEFAULT NULL,
  `底部标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK柱1`(`类型 ID`) USING BTREE,
  INDEX `FK柱2`(`创建的阶段`) USING BTREE,
  INDEX `FK柱3`(`拆除的阶段`) USING BTREE,
  INDEX `FK柱4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK柱1` FOREIGN KEY (`类型 ID`) REFERENCES `柱类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK柱2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK柱3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK柱4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 柱
-- ----------------------------

-- ----------------------------
-- Table structure for 柱类型
-- ----------------------------
DROP TABLE IF EXISTS `柱类型`;
CREATE TABLE `柱类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK柱类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK柱类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK柱类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK柱类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 柱类型
-- ----------------------------

-- ----------------------------
-- Table structure for 标高
-- ----------------------------
DROP TABLE IF EXISTS `标高`;
CREATE TABLE `标高`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构` int NULL DEFAULT NULL,
  `建筑楼层` int NULL DEFAULT NULL,
  `上方楼层` int NULL DEFAULT NULL,
  `立面` double NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK标高1`(`类型 ID`) USING BTREE,
  INDEX `FK标高2`(`设计选项`) USING BTREE,
  CONSTRAINT `FK标高1` FOREIGN KEY (`类型 ID`) REFERENCES `标高类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK标高2` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 标高
-- ----------------------------
INSERT INTO `标高` VALUES (1581413, 480862, NULL, 'F1', 0, 1, NULL, 0, NULL, NULL);
INSERT INTO `标高` VALUES (1581414, 480862, NULL, '室外地坪', 0, 1, NULL, -0.30000000000000004, NULL, NULL);
INSERT INTO `标高` VALUES (1581415, 480862, NULL, 'F2', 0, 1, NULL, 4.999999999999999, NULL, NULL);
INSERT INTO `标高` VALUES (1581416, 480862, NULL, 'B1', 0, 1, NULL, -4.2, NULL, NULL);
INSERT INTO `标高` VALUES (1581417, 480862, NULL, 'B2', 0, 1, NULL, -7.800000000000001, NULL, NULL);
INSERT INTO `标高` VALUES (1581418, 480862, NULL, 'B3', 0, 1, NULL, -12.4, NULL, NULL);
INSERT INTO `标高` VALUES (1581419, 480862, NULL, 'F3', 0, 1, NULL, 10, NULL, NULL);
INSERT INTO `标高` VALUES (1581420, 480862, NULL, 'F4', 0, 1, NULL, 14.2, NULL, NULL);
INSERT INTO `标高` VALUES (1581421, 480862, NULL, 'F5', 0, 1, NULL, 18.4, NULL, NULL);
INSERT INTO `标高` VALUES (1581422, 480862, NULL, 'F6', 0, 1, NULL, 22.599999999999994, NULL, NULL);
INSERT INTO `标高` VALUES (1581423, 480862, NULL, 'F7', 0, 1, NULL, 26.799999999999994, NULL, NULL);
INSERT INTO `标高` VALUES (1581424, 480862, NULL, 'F8', 0, 1, NULL, 30.999999999999993, NULL, NULL);
INSERT INTO `标高` VALUES (1581425, 480862, NULL, 'F9', 0, 1, NULL, 35.19999999999999, NULL, NULL);
INSERT INTO `标高` VALUES (1581426, 480862, NULL, 'F10', 0, 1, NULL, 39.399999999999984, NULL, NULL);
INSERT INTO `标高` VALUES (1581427, 480862, NULL, 'F11', 0, 1, NULL, 43.59999999999998, NULL, NULL);
INSERT INTO `标高` VALUES (1581428, 480862, NULL, 'F12', 0, 1, NULL, 47.79999999999998, NULL, NULL);
INSERT INTO `标高` VALUES (1581429, 480862, NULL, 'F13', 0, 1, NULL, 51.99999999999998, NULL, NULL);
INSERT INTO `标高` VALUES (1581430, 480862, NULL, 'F14', 0, 1, NULL, 56.199999999999974, NULL, NULL);
INSERT INTO `标高` VALUES (1581431, 480862, NULL, 'F15', 0, 1, NULL, 60.39999999999998, NULL, NULL);
INSERT INTO `标高` VALUES (1581432, 480862, NULL, 'F16', 0, 1, NULL, 64.59999999999997, NULL, NULL);
INSERT INTO `标高` VALUES (1581433, 480862, NULL, 'F17', 0, 1, NULL, 68.79999999999997, NULL, NULL);
INSERT INTO `标高` VALUES (1581434, 480862, NULL, '设备层(S)', 1, 1, NULL, 72.99999999999997, NULL, NULL);
INSERT INTO `标高` VALUES (1581435, 480862, NULL, '女儿墙', 0, 1, NULL, 77.19999999999997, NULL, NULL);
INSERT INTO `标高` VALUES (1581436, 480862, NULL, 'B3(S)', 1, 1, NULL, -12.5, NULL, NULL);
INSERT INTO `标高` VALUES (1581437, 480862, NULL, 'B2(S)', 1, 1, NULL, -7.8999999999999995, NULL, NULL);
INSERT INTO `标高` VALUES (1581438, 480862, NULL, 'B1(S)', 1, 1, NULL, -4.300000000000001, NULL, NULL);
INSERT INTO `标高` VALUES (1581439, 480862, NULL, 'F1(S)', 1, 1, NULL, -0.09999999999999946, NULL, NULL);
INSERT INTO `标高` VALUES (1581440, 480862, NULL, 'F2(S)', 1, 1, NULL, 4.849999999999999, NULL, NULL);
INSERT INTO `标高` VALUES (1581441, 480862, NULL, 'F3(S)', 1, 1, NULL, 9.849999999999998, NULL, NULL);
INSERT INTO `标高` VALUES (1581442, 480862, NULL, 'F4(S)', 1, 1, NULL, 14.049999999999999, NULL, NULL);
INSERT INTO `标高` VALUES (1581443, 480862, NULL, 'F5(S)', 1, 1, NULL, 18.25, NULL, NULL);
INSERT INTO `标高` VALUES (1581444, 480862, NULL, 'F6(S)', 1, 1, NULL, 22.45, NULL, NULL);
INSERT INTO `标高` VALUES (1581445, 480862, NULL, 'F7(S)', 1, 1, NULL, 26.650000000000002, NULL, NULL);
INSERT INTO `标高` VALUES (1581446, 480862, NULL, 'F8(S)', 1, 1, NULL, 30.850000000000005, NULL, NULL);
INSERT INTO `标高` VALUES (1581447, 480862, NULL, 'F9(S)', 1, 1, NULL, 35.050000000000004, NULL, NULL);
INSERT INTO `标高` VALUES (1581448, 480862, NULL, 'F10(S)', 1, 1, NULL, 39.25, NULL, NULL);
INSERT INTO `标高` VALUES (1581449, 480862, NULL, 'F11(S)', 1, 1, NULL, 43.449999999999996, NULL, NULL);
INSERT INTO `标高` VALUES (1581450, 480862, NULL, 'F12(S)', 1, 1, NULL, 47.65, NULL, NULL);
INSERT INTO `标高` VALUES (1581451, 480862, NULL, 'F13(S)', 1, 1, NULL, 51.849999999999994, NULL, NULL);
INSERT INTO `标高` VALUES (1581452, 480862, NULL, 'F14(S)', 1, 1, NULL, 56.04999999999999, NULL, NULL);
INSERT INTO `标高` VALUES (1581453, 480862, NULL, 'F15(S)', 1, 1, NULL, 60.24999999999999, NULL, NULL);
INSERT INTO `标高` VALUES (1581454, 480862, NULL, 'F16(S)', 1, 1, NULL, 64.44999999999999, NULL, NULL);
INSERT INTO `标高` VALUES (1581455, 480862, NULL, 'F17(S)', 1, 1, NULL, 68.64999999999999, NULL, NULL);
INSERT INTO `标高` VALUES (1581456, 480862, NULL, '机房屋顶(S)', 1, 1, NULL, 77.4, NULL, NULL);
INSERT INTO `标高` VALUES (1581457, 480862, NULL, '机房女儿墙', 0, 1, NULL, 79.7, NULL, NULL);

-- ----------------------------
-- Table structure for 标高类型
-- ----------------------------
DROP TABLE IF EXISTS `标高类型`;
CREATE TABLE `标高类型`  (
  `ID` int NOT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 标高类型
-- ----------------------------
INSERT INTO `标高类型` VALUES (480862, NULL, NULL);
INSERT INTO `标高类型` VALUES (485470, NULL, NULL);
INSERT INTO `标高类型` VALUES (485536, NULL, NULL);
INSERT INTO `标高类型` VALUES (841761, NULL, NULL);
INSERT INTO `标高类型` VALUES (841787, NULL, NULL);
INSERT INTO `标高类型` VALUES (841813, NULL, NULL);
INSERT INTO `标高类型` VALUES (1581458, NULL, NULL);
INSERT INTO `标高类型` VALUES (1581464, NULL, NULL);

-- ----------------------------
-- Table structure for 栏杆扶手
-- ----------------------------
DROP TABLE IF EXISTS `栏杆扶手`;
CREATE TABLE `栏杆扶手`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `从路径偏移` double NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `底部偏移` double NULL DEFAULT NULL,
  `底部标高` int NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK栏杆扶手1`(`类型 ID`) USING BTREE,
  INDEX `FK栏杆扶手2`(`创建的阶段`) USING BTREE,
  INDEX `FK栏杆扶手3`(`拆除的阶段`) USING BTREE,
  INDEX `FK栏杆扶手4`(`设计选项`) USING BTREE,
  INDEX `FK栏杆扶手5`(`底部标高`) USING BTREE,
  CONSTRAINT `FK栏杆扶手1` FOREIGN KEY (`类型 ID`) REFERENCES `栏杆扶手类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK栏杆扶手2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK栏杆扶手3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK栏杆扶手4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK栏杆扶手5` FOREIGN KEY (`底部标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 栏杆扶手
-- ----------------------------

-- ----------------------------
-- Table structure for 栏杆扶手类型
-- ----------------------------
DROP TABLE IF EXISTS `栏杆扶手类型`;
CREATE TABLE `栏杆扶手类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `栏杆扶手高度` double NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK栏杆扶手类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK栏杆扶手类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 栏杆扶手类型
-- ----------------------------
INSERT INTO `栏杆扶手类型` VALUES (25223, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.1, NULL, '栏杆扶手', '1100mm', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 桥台
-- ----------------------------
DROP TABLE IF EXISTS `桥台`;
CREATE TABLE `桥台`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK桥台1`(`类型 ID`) USING BTREE,
  INDEX `FK桥台2`(`创建的阶段`) USING BTREE,
  INDEX `FK桥台3`(`拆除的阶段`) USING BTREE,
  INDEX `FK桥台4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK桥台1` FOREIGN KEY (`类型 ID`) REFERENCES `桥台1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥台2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥台3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥台4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥台
-- ----------------------------

-- ----------------------------
-- Table structure for 桥台1
-- ----------------------------
DROP TABLE IF EXISTS `桥台1`;
CREATE TABLE `桥台1`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥台1
-- ----------------------------

-- ----------------------------
-- Table structure for 桥塔
-- ----------------------------
DROP TABLE IF EXISTS `桥塔`;
CREATE TABLE `桥塔`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK桥塔1`(`类型 ID`) USING BTREE,
  INDEX `FK桥塔2`(`创建的阶段`) USING BTREE,
  INDEX `FK桥塔3`(`拆除的阶段`) USING BTREE,
  INDEX `FK桥塔4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK桥塔1` FOREIGN KEY (`类型 ID`) REFERENCES `桥塔1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥塔2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥塔3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥塔4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥塔
-- ----------------------------

-- ----------------------------
-- Table structure for 桥塔1
-- ----------------------------
DROP TABLE IF EXISTS `桥塔1`;
CREATE TABLE `桥塔1`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥塔1
-- ----------------------------

-- ----------------------------
-- Table structure for 桥墩
-- ----------------------------
DROP TABLE IF EXISTS `桥墩`;
CREATE TABLE `桥墩`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK桥墩1`(`类型 ID`) USING BTREE,
  INDEX `FK桥墩2`(`创建的阶段`) USING BTREE,
  INDEX `FK桥墩3`(`拆除的阶段`) USING BTREE,
  INDEX `FK桥墩4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK桥墩1` FOREIGN KEY (`类型 ID`) REFERENCES `桥墩1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥墩2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥墩3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥墩4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥墩
-- ----------------------------

-- ----------------------------
-- Table structure for 桥墩1
-- ----------------------------
DROP TABLE IF EXISTS `桥墩1`;
CREATE TABLE `桥墩1`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥墩1
-- ----------------------------

-- ----------------------------
-- Table structure for 桥拱
-- ----------------------------
DROP TABLE IF EXISTS `桥拱`;
CREATE TABLE `桥拱`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK桥拱1`(`类型 ID`) USING BTREE,
  INDEX `FK桥拱2`(`创建的阶段`) USING BTREE,
  INDEX `FK桥拱3`(`拆除的阶段`) USING BTREE,
  INDEX `FK桥拱4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK桥拱1` FOREIGN KEY (`类型 ID`) REFERENCES `桥拱1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥拱2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥拱3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥拱4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥拱
-- ----------------------------

-- ----------------------------
-- Table structure for 桥拱1
-- ----------------------------
DROP TABLE IF EXISTS `桥拱1`;
CREATE TABLE `桥拱1`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥拱1
-- ----------------------------

-- ----------------------------
-- Table structure for 桥梁基础
-- ----------------------------
DROP TABLE IF EXISTS `桥梁基础`;
CREATE TABLE `桥梁基础`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK桥梁基础1`(`类型 ID`) USING BTREE,
  INDEX `FK桥梁基础2`(`创建的阶段`) USING BTREE,
  INDEX `FK桥梁基础3`(`拆除的阶段`) USING BTREE,
  INDEX `FK桥梁基础4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK桥梁基础1` FOREIGN KEY (`类型 ID`) REFERENCES `桥梁基础1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁基础2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁基础3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁基础4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥梁基础
-- ----------------------------

-- ----------------------------
-- Table structure for 桥梁基础1
-- ----------------------------
DROP TABLE IF EXISTS `桥梁基础1`;
CREATE TABLE `桥梁基础1`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥梁基础1
-- ----------------------------

-- ----------------------------
-- Table structure for 桥梁大梁
-- ----------------------------
DROP TABLE IF EXISTS `桥梁大梁`;
CREATE TABLE `桥梁大梁`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK桥梁大梁1`(`类型 ID`) USING BTREE,
  INDEX `FK桥梁大梁2`(`创建的阶段`) USING BTREE,
  INDEX `FK桥梁大梁3`(`拆除的阶段`) USING BTREE,
  INDEX `FK桥梁大梁4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK桥梁大梁1` FOREIGN KEY (`类型 ID`) REFERENCES `桥梁大梁1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁大梁2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁大梁3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁大梁4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥梁大梁
-- ----------------------------

-- ----------------------------
-- Table structure for 桥梁大梁1
-- ----------------------------
DROP TABLE IF EXISTS `桥梁大梁1`;
CREATE TABLE `桥梁大梁1`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥梁大梁1
-- ----------------------------

-- ----------------------------
-- Table structure for 桥梁支座
-- ----------------------------
DROP TABLE IF EXISTS `桥梁支座`;
CREATE TABLE `桥梁支座`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK桥梁支座1`(`类型 ID`) USING BTREE,
  INDEX `FK桥梁支座2`(`创建的阶段`) USING BTREE,
  INDEX `FK桥梁支座3`(`拆除的阶段`) USING BTREE,
  INDEX `FK桥梁支座4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK桥梁支座1` FOREIGN KEY (`类型 ID`) REFERENCES `桥梁支座1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁支座2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁支座3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁支座4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥梁支座
-- ----------------------------

-- ----------------------------
-- Table structure for 桥梁支座1
-- ----------------------------
DROP TABLE IF EXISTS `桥梁支座1`;
CREATE TABLE `桥梁支座1`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥梁支座1
-- ----------------------------

-- ----------------------------
-- Table structure for 桥梁缆索
-- ----------------------------
DROP TABLE IF EXISTS `桥梁缆索`;
CREATE TABLE `桥梁缆索`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK桥梁缆索1`(`类型 ID`) USING BTREE,
  INDEX `FK桥梁缆索2`(`创建的阶段`) USING BTREE,
  INDEX `FK桥梁缆索3`(`拆除的阶段`) USING BTREE,
  INDEX `FK桥梁缆索4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK桥梁缆索1` FOREIGN KEY (`类型 ID`) REFERENCES `桥梁缆索1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁缆索2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁缆索3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥梁缆索4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥梁缆索
-- ----------------------------

-- ----------------------------
-- Table structure for 桥梁缆索1
-- ----------------------------
DROP TABLE IF EXISTS `桥梁缆索1`;
CREATE TABLE `桥梁缆索1`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥梁缆索1
-- ----------------------------

-- ----------------------------
-- Table structure for 桥面
-- ----------------------------
DROP TABLE IF EXISTS `桥面`;
CREATE TABLE `桥面`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK桥面1`(`类型 ID`) USING BTREE,
  INDEX `FK桥面2`(`创建的阶段`) USING BTREE,
  INDEX `FK桥面3`(`拆除的阶段`) USING BTREE,
  INDEX `FK桥面4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK桥面1` FOREIGN KEY (`类型 ID`) REFERENCES `桥面1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥面2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥面3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK桥面4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥面
-- ----------------------------

-- ----------------------------
-- Table structure for 桥面1
-- ----------------------------
DROP TABLE IF EXISTS `桥面1`;
CREATE TABLE `桥面1`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 桥面1
-- ----------------------------

-- ----------------------------
-- Table structure for 植物
-- ----------------------------
DROP TABLE IF EXISTS `植物`;
CREATE TABLE `植物`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK植物1`(`类型 ID`) USING BTREE,
  INDEX `FK植物2`(`创建的阶段`) USING BTREE,
  INDEX `FK植物3`(`拆除的阶段`) USING BTREE,
  INDEX `FK植物4`(`设计选项`) USING BTREE,
  INDEX `FK植物5`(`标高`) USING BTREE,
  CONSTRAINT `FK植物1` FOREIGN KEY (`类型 ID`) REFERENCES `植物类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK植物2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK植物3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK植物4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK植物5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 植物
-- ----------------------------

-- ----------------------------
-- Table structure for 植物类型
-- ----------------------------
DROP TABLE IF EXISTS `植物类型`;
CREATE TABLE `植物类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK植物类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK植物类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK植物类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK植物类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 植物类型
-- ----------------------------

-- ----------------------------
-- Table structure for 楼板
-- ----------------------------
DROP TABLE IF EXISTS `楼板`;
CREATE TABLE `楼板`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `估计的钢筋体积` double NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `结构` int NULL DEFAULT NULL,
  `周长` double NULL DEFAULT NULL,
  `自标高的高度偏移` double NULL DEFAULT NULL,
  `底部高程测量` double NULL DEFAULT NULL,
  `顶部高程测量` double NULL DEFAULT NULL,
  `顶部高程` double NULL DEFAULT NULL,
  `底部高程` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK楼板1`(`类型 ID`) USING BTREE,
  INDEX `FK楼板2`(`创建的阶段`) USING BTREE,
  INDEX `FK楼板3`(`拆除的阶段`) USING BTREE,
  INDEX `FK楼板4`(`设计选项`) USING BTREE,
  INDEX `FK楼板5`(`标高`) USING BTREE,
  CONSTRAINT `FK楼板1` FOREIGN KEY (`类型 ID`) REFERENCES `楼板类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼板2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼板3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼板4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼板5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 楼板
-- ----------------------------

-- ----------------------------
-- Table structure for 楼板类型
-- ----------------------------
DROP TABLE IF EXISTS `楼板类型`;
CREATE TABLE `楼板类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构材质` int NULL DEFAULT NULL,
  `粗糙度` int NULL DEFAULT NULL,
  `吸收率` double NULL DEFAULT NULL,
  `热质量` double NULL DEFAULT NULL,
  `热阻(R)` double NULL DEFAULT NULL,
  `传热系数(U)` double NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK楼板类型1`(`结构材质`) USING BTREE,
  INDEX `FK楼板类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK楼板类型1` FOREIGN KEY (`结构材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼板类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 楼板类型
-- ----------------------------
INSERT INTO `楼板类型` VALUES (759, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0.7, NULL, NULL, NULL, NULL, '楼板', '常规 - 300mm', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 楼板边缘
-- ----------------------------
DROP TABLE IF EXISTS `楼板边缘`;
CREATE TABLE `楼板边缘`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK楼板边缘1`(`类型 ID`) USING BTREE,
  INDEX `FK楼板边缘2`(`创建的阶段`) USING BTREE,
  INDEX `FK楼板边缘3`(`拆除的阶段`) USING BTREE,
  INDEX `FK楼板边缘4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK楼板边缘1` FOREIGN KEY (`类型 ID`) REFERENCES `楼板边缘类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼板边缘2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼板边缘3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼板边缘4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 楼板边缘
-- ----------------------------

-- ----------------------------
-- Table structure for 楼板边缘类型
-- ----------------------------
DROP TABLE IF EXISTS `楼板边缘类型`;
CREATE TABLE `楼板边缘类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `轮廓` int NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `材质` int NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK楼板边缘类型1`(`轮廓`) USING BTREE,
  INDEX `FK楼板边缘类型2`(`部件代码`) USING BTREE,
  INDEX `FK楼板边缘类型3`(`材质`) USING BTREE,
  CONSTRAINT `FK楼板边缘类型1` FOREIGN KEY (`轮廓`) REFERENCES `轮廓1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼板边缘类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼板边缘类型3` FOREIGN KEY (`材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 楼板边缘类型
-- ----------------------------
INSERT INTO `楼板边缘类型` VALUES (19887, NULL, NULL, 20074, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '楼板边缘', '楼板边缘', NULL, NULL);

-- ----------------------------
-- Table structure for 楼梯
-- ----------------------------
DROP TABLE IF EXISTS `楼梯`;
CREATE TABLE `楼梯`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `实际踢面数` int NULL DEFAULT NULL,
  `多层顶部标高` int NULL DEFAULT NULL,
  `顶部偏移` double NULL DEFAULT NULL,
  `底部偏移` double NULL DEFAULT NULL,
  `实际踢面高度` double NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `顶部标高` int NULL DEFAULT NULL,
  `底部标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK楼梯1`(`类型 ID`) USING BTREE,
  INDEX `FK楼梯2`(`创建的阶段`) USING BTREE,
  INDEX `FK楼梯3`(`拆除的阶段`) USING BTREE,
  INDEX `FK楼梯4`(`设计选项`) USING BTREE,
  INDEX `FK楼梯5`(`多层顶部标高`) USING BTREE,
  INDEX `FK楼梯6`(`顶部标高`) USING BTREE,
  INDEX `FK楼梯7`(`底部标高`) USING BTREE,
  CONSTRAINT `FK楼梯1` FOREIGN KEY (`类型 ID`) REFERENCES `楼梯类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼梯2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼梯3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼梯4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼梯5` FOREIGN KEY (`多层顶部标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼梯6` FOREIGN KEY (`顶部标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK楼梯7` FOREIGN KEY (`底部标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 楼梯
-- ----------------------------

-- ----------------------------
-- Table structure for 楼梯类型
-- ----------------------------
DROP TABLE IF EXISTS `楼梯类型`;
CREATE TABLE `楼梯类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `踏板厚度` double NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK楼梯类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK楼梯类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 楼梯类型
-- ----------------------------
INSERT INTO `楼梯类型` VALUES (28598, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.05, NULL, '楼梯', '190mm 最大踢面 250mm 梯段', NULL, NULL, NULL, NULL);
INSERT INTO `楼梯类型` VALUES (679999, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '组合楼梯', '190mm 最大踢面 250mm 梯段', NULL, NULL, NULL, NULL);
INSERT INTO `楼梯类型` VALUES (680002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '现场浇注楼梯', '现场浇注楼梯', NULL, NULL, NULL, NULL);
INSERT INTO `楼梯类型` VALUES (680003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '预浇注楼梯', '预制楼梯', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 橱柜
-- ----------------------------
DROP TABLE IF EXISTS `橱柜`;
CREATE TABLE `橱柜`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK橱柜1`(`类型 ID`) USING BTREE,
  INDEX `FK橱柜2`(`创建的阶段`) USING BTREE,
  INDEX `FK橱柜3`(`拆除的阶段`) USING BTREE,
  INDEX `FK橱柜4`(`设计选项`) USING BTREE,
  INDEX `FK橱柜5`(`标高`) USING BTREE,
  CONSTRAINT `FK橱柜1` FOREIGN KEY (`类型 ID`) REFERENCES `橱柜类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK橱柜2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK橱柜3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK橱柜4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK橱柜5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 橱柜
-- ----------------------------

-- ----------------------------
-- Table structure for 橱柜类型
-- ----------------------------
DROP TABLE IF EXISTS `橱柜类型`;
CREATE TABLE `橱柜类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `深度` double NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `高度` double NULL DEFAULT NULL,
  `完成` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `构造类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK橱柜类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK橱柜类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK橱柜类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK橱柜类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 橱柜类型
-- ----------------------------

-- ----------------------------
-- Table structure for 檐沟
-- ----------------------------
DROP TABLE IF EXISTS `檐沟`;
CREATE TABLE `檐沟`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK檐沟1`(`类型 ID`) USING BTREE,
  INDEX `FK檐沟2`(`创建的阶段`) USING BTREE,
  INDEX `FK檐沟3`(`拆除的阶段`) USING BTREE,
  INDEX `FK檐沟4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK檐沟1` FOREIGN KEY (`类型 ID`) REFERENCES `檐沟类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK檐沟2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK檐沟3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK檐沟4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 檐沟
-- ----------------------------

-- ----------------------------
-- Table structure for 檐沟类型
-- ----------------------------
DROP TABLE IF EXISTS `檐沟类型`;
CREATE TABLE `檐沟类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `轮廓` int NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `材质` int NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK檐沟类型1`(`轮廓`) USING BTREE,
  INDEX `FK檐沟类型2`(`部件代码`) USING BTREE,
  INDEX `FK檐沟类型3`(`材质`) USING BTREE,
  CONSTRAINT `FK檐沟类型1` FOREIGN KEY (`轮廓`) REFERENCES `轮廓1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK檐沟类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK檐沟类型3` FOREIGN KEY (`材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 檐沟类型
-- ----------------------------
INSERT INTO `檐沟类型` VALUES (19886, NULL, NULL, 20244, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '檐沟', '檐沟', NULL, NULL);

-- ----------------------------
-- Table structure for 水回路
-- ----------------------------
DROP TABLE IF EXISTS `水回路`;
CREATE TABLE `水回路`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `冷凝水回路` int NULL DEFAULT NULL,
  `冷水机组类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `回路类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK水回路1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK水回路1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 水回路
-- ----------------------------

-- ----------------------------
-- Table structure for 流体
-- ----------------------------
DROP TABLE IF EXISTS `流体`;
CREATE TABLE `流体`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK流体1`(`类型 ID`) USING BTREE,
  INDEX `FK流体2`(`创建的阶段`) USING BTREE,
  INDEX `FK流体3`(`拆除的阶段`) USING BTREE,
  INDEX `FK流体4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK流体1` FOREIGN KEY (`类型 ID`) REFERENCES `流体类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK流体2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK流体3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK流体4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 流体
-- ----------------------------

-- ----------------------------
-- Table structure for 流体类型
-- ----------------------------
DROP TABLE IF EXISTS `流体类型`;
CREATE TABLE `流体类型`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 流体类型
-- ----------------------------
INSERT INTO `流体类型` VALUES (293160);
INSERT INTO `流体类型` VALUES (293170);
INSERT INTO `流体类型` VALUES (293171);
INSERT INTO `流体类型` VALUES (293172);
INSERT INTO `流体类型` VALUES (293173);
INSERT INTO `流体类型` VALUES (293174);
INSERT INTO `流体类型` VALUES (293175);
INSERT INTO `流体类型` VALUES (293176);
INSERT INTO `流体类型` VALUES (293177);
INSERT INTO `流体类型` VALUES (293178);
INSERT INTO `流体类型` VALUES (293592);
INSERT INTO `流体类型` VALUES (293593);
INSERT INTO `流体类型` VALUES (293594);
INSERT INTO `流体类型` VALUES (293595);
INSERT INTO `流体类型` VALUES (293596);
INSERT INTO `流体类型` VALUES (293597);
INSERT INTO `流体类型` VALUES (293598);
INSERT INTO `流体类型` VALUES (293599);
INSERT INTO `流体类型` VALUES (293600);

-- ----------------------------
-- Table structure for 火警设备
-- ----------------------------
DROP TABLE IF EXISTS `火警设备`;
CREATE TABLE `火警设备`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气数据` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK火警设备1`(`类型 ID`) USING BTREE,
  INDEX `FK火警设备2`(`创建的阶段`) USING BTREE,
  INDEX `FK火警设备3`(`拆除的阶段`) USING BTREE,
  INDEX `FK火警设备4`(`设计选项`) USING BTREE,
  INDEX `FK火警设备5`(`标高`) USING BTREE,
  CONSTRAINT `FK火警设备1` FOREIGN KEY (`类型 ID`) REFERENCES `火警设备类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK火警设备2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK火警设备3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK火警设备4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK火警设备5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 火警设备
-- ----------------------------

-- ----------------------------
-- Table structure for 火警设备类型
-- ----------------------------
DROP TABLE IF EXISTS `火警设备类型`;
CREATE TABLE `火警设备类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK火警设备类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK火警设备类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK火警设备类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK火警设备类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 火警设备类型
-- ----------------------------
INSERT INTO `火警设备类型` VALUES (917568, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_带地址感温探测器_天花板安装', '带地址感温探测器', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (918837, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_带地址感烟探测器_天花板安装', '带地址感烟探测器', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (942946, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_非地址感烟探测器_天花板安装', '非地址感烟探测器', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (944182, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.00.00', NULL, 'Y_复合式感烟感温火灾探测器-天花板安装', '复合式感烟感温火灾探测器-天花板安装', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (949650, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_可燃气体探测器_天花板安装', '可燃气体探测器', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (959134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_区域型火灾报警控制器-壁装', '区域型火灾报警控制器-壁装', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (964582, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_手动火灾报警（带电话插孔）_壁装', '手动火灾报警（带电话插孔）_壁装', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (979147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_消防报警控制器(带报警重复显示器）', '消防报警控制器（带报警重复显示器）', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (980119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_消防接线箱-壁装', '消防接线箱-壁装', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (981467, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_消防声光警报器(带报警控制地址模块)', '消防声光警报器（带报警控制地址模块）', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (982447, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_消防水湿式报警开关(带地址模块)', '消防水湿式报警开关（带地址模块）', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (983829, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_消防专用电话分机-壁装', '消防专用电话分机-壁装', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (984827, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_消火栓按钮（带地址模块）-壁装', '消火栓按钮（带地址模块）-壁装', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1010942, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_报警地址模块', 'Y_报警地址模块', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1011617, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_报警控制地址模块', 'Y_报警控制地址模块', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1188693, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, '3-1带地址感烟探测器100', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1190578, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, '3-1带地址感烟探测器-防爆', '防爆', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1191898, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-2带地址感温探测器', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1193078, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-3可燃气体探测器', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1194523, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-4手动报警按钮100', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1195924, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-5消防专用电话分机', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1197447, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-6消火栓起泵按钮', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1199027, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-7火灾声光报警器100', '97 mmx160 mmx59 mm', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1199029, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-7火灾声光报警器100', '90 mmx142 mmx60 mm', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1199031, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-7火灾声光报警器100', '90 mmx110 mmx46.5 mm', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1200442, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-8火灾显示盘', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1201870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-9扬声器-壁挂', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1203375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-9扬声器-吸顶100', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1205034, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, '3-10防火门门磁开关.0001', '220*22*30', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1206693, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, '3-10防火门门磁开关', '220*22*30', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1208102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-11气体灭火控制盘.0001', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1209510, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3-11气体灭火控制盘', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1210851, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, '3-11消防接线箱', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `火警设备类型` VALUES (1213215, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, '27短路隔离模块', '带地址感温探测器-基于面', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 灯具
-- ----------------------------
DROP TABLE IF EXISTS `灯具`;
CREATE TABLE `灯具`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `开关 ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气数据` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK灯具1`(`类型 ID`) USING BTREE,
  INDEX `FK灯具2`(`创建的阶段`) USING BTREE,
  INDEX `FK灯具3`(`拆除的阶段`) USING BTREE,
  INDEX `FK灯具4`(`设计选项`) USING BTREE,
  INDEX `FK灯具5`(`标高`) USING BTREE,
  CONSTRAINT `FK灯具1` FOREIGN KEY (`类型 ID`) REFERENCES `灯具类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK灯具2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK灯具3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK灯具4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK灯具5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 灯具
-- ----------------------------

-- ----------------------------
-- Table structure for 灯具类型
-- ----------------------------
DROP TABLE IF EXISTS `灯具类型`;
CREATE TABLE `灯具类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK灯具类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK灯具类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK灯具类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK灯具类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 灯具类型
-- ----------------------------
INSERT INTO `灯具类型` VALUES (925547, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_单相单联照明开关 250V,10A  底距地1-3米', '单相单联照明开关', NULL, NULL, NULL, NULL);
INSERT INTO `灯具类型` VALUES (931784, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_单相三联照明开关 250V,10A(壁装距地1-3米）', '单相三联照明开关', NULL, NULL, NULL, NULL);
INSERT INTO `灯具类型` VALUES (932796, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_单相双联照明开关 250V,10A(壁装距地1-3米）', '单相双联照明开关', NULL, NULL, NULL, NULL);
INSERT INTO `灯具类型` VALUES (1319404, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-1单管荧光灯-壁装.0001', '标准', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 点荷载
-- ----------------------------
DROP TABLE IF EXISTS `点荷载`;
CREATE TABLE `点荷载`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `性质` int NULL DEFAULT NULL,
  `全部非 0 荷载` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `Mz` double NULL DEFAULT NULL,
  `My` double NULL DEFAULT NULL,
  `Mx` double NULL DEFAULT NULL,
  `Fz` double NULL DEFAULT NULL,
  `Fy` double NULL DEFAULT NULL,
  `Fx` double NULL DEFAULT NULL,
  `为反作用力` int NULL DEFAULT NULL,
  `定向到` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `荷载工况` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK点荷载1`(`创建的阶段`) USING BTREE,
  INDEX `FK点荷载2`(`拆除的阶段`) USING BTREE,
  INDEX `FK点荷载3`(`设计选项`) USING BTREE,
  CONSTRAINT `FK点荷载1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK点荷载2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK点荷载3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 点荷载
-- ----------------------------

-- ----------------------------
-- Table structure for 焊缝
-- ----------------------------
DROP TABLE IF EXISTS `焊缝`;
CREATE TABLE `焊缝`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `前缀` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `文本模块` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `双重准备深度` double NULL DEFAULT NULL,
  `双重有效管喉` double NULL DEFAULT NULL,
  `双重根部洞口` double NULL DEFAULT NULL,
  `双重焊接准备` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `双重表面形状` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `双重文本` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `双重厚度` double NULL DEFAULT NULL,
  `双重类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主要准备高度` double NULL DEFAULT NULL,
  `主要有效管喉` double NULL DEFAULT NULL,
  `主要根部洞口` double NULL DEFAULT NULL,
  `主要焊接准备` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `表面形状` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主要文本` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `螺距` double NULL DEFAULT NULL,
  `连续` int NULL DEFAULT NULL,
  `位置` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `主要厚度` double NULL DEFAULT NULL,
  `主要类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK焊缝1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK焊缝1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 焊缝
-- ----------------------------

-- ----------------------------
-- Table structure for 照明设备
-- ----------------------------
DROP TABLE IF EXISTS `照明设备`;
CREATE TABLE `照明设备`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `开关 ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气数据` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `使用系数` double NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK照明设备1`(`类型 ID`) USING BTREE,
  INDEX `FK照明设备2`(`创建的阶段`) USING BTREE,
  INDEX `FK照明设备3`(`拆除的阶段`) USING BTREE,
  INDEX `FK照明设备4`(`设计选项`) USING BTREE,
  INDEX `FK照明设备5`(`标高`) USING BTREE,
  CONSTRAINT `FK照明设备1` FOREIGN KEY (`类型 ID`) REFERENCES `照明设备类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK照明设备2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK照明设备3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK照明设备4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK照明设备5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 照明设备
-- ----------------------------

-- ----------------------------
-- Table structure for 照明设备类型
-- ----------------------------
DROP TABLE IF EXISTS `照明设备类型`;
CREATE TABLE `照明设备类型`  (
  `ID` int NOT NULL,
  `光源符号长度` double NULL DEFAULT NULL,
  `光源符号尺寸` double NULL DEFAULT NULL,
  `沿着圆直径发光` double NULL DEFAULT NULL,
  `沿着矩形长度发光` double NULL DEFAULT NULL,
  `沿着矩形宽度发光` double NULL DEFAULT NULL,
  `沿着线长度发光` double NULL DEFAULT NULL,
  `渲染时可见发光形状` int NULL DEFAULT NULL,
  `暗显光线色温偏移` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `灯具尘埃减能` double NULL DEFAULT NULL,
  `灯流明降落` double NULL DEFAULT NULL,
  `表面减光损失` double NULL DEFAULT NULL,
  `灯倾斜损失` double NULL DEFAULT NULL,
  `电压损失` double NULL DEFAULT NULL,
  `温度损失` double NULL DEFAULT NULL,
  `初始色温` double NULL DEFAULT NULL,
  `照度` double NULL DEFAULT NULL,
  `发光强度` double NULL DEFAULT NULL,
  `效力` double NULL DEFAULT NULL,
  `瓦特` double NULL DEFAULT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `光域网文件` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `视在负荷` double NULL DEFAULT NULL,
  `流明损失` double NULL DEFAULT NULL,
  `光总损失系数` double NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `聚光灯光场角` double NULL DEFAULT NULL,
  `聚光灯光束角` double NULL DEFAULT NULL,
  `倾斜角` double NULL DEFAULT NULL,
  `光通量` double NULL DEFAULT NULL,
  `灯` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `瓦特备注` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK照明设备类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK照明设备类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK照明设备类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK照明设备类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 照明设备类型
-- ----------------------------
INSERT INTO `照明设备类型` VALUES (916228, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_层号灯-壁装式', '400×150', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (921242, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 14, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-壁装式-垂直面安装', '1×14W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (921244, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 18, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-壁装式-垂直面安装', '1×18W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (921246, NULL, 1.2000000000000002, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 28, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-壁装式-垂直面安装', '1×28W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (921248, NULL, 1.2000000000000002, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 36, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-壁装式-垂直面安装', '1×36W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (922348, NULL, 0.6096, NULL, NULL, NULL, 0.6096, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 60, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '单管荧光灯', NULL, NULL, '23.80.70.00', NULL, 'Y_单管荧光灯-吊装式-顶面安装', '1×36W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (922350, NULL, 0.6096, NULL, NULL, NULL, 0.6096, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 60, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '单管荧光灯', NULL, NULL, '23.80.70.00', NULL, 'Y_单管荧光灯-吊装式-顶面安装', '1×28W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (922352, NULL, 0.6096, NULL, NULL, NULL, 0.6096, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 60, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '单管荧光灯', NULL, NULL, '23.80.70.00', NULL, 'Y_单管荧光灯-吊装式-顶面安装', '1×18W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (922354, NULL, 0.6096, NULL, NULL, NULL, 0.6096, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 60, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '单管荧光灯', NULL, NULL, '23.80.70.00', NULL, 'Y_单管荧光灯-吊装式-顶面安装', '1×14W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (923445, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 14, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-嵌顶式-顶面安装', '1×14W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (923447, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 18, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-嵌顶式-顶面安装', '1×18W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (923449, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 28, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-嵌顶式-顶面安装', '1×28W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (923451, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 36, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-嵌顶式-顶面安装', '1×36W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (924550, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 14, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-吸顶式-顶面安装', '1×14W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (924552, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 18, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-吸顶式-顶面安装', '1×18W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (924554, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 28, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-吸顶式-顶面安装', '1×28W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (924556, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 36, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_单管荧光灯-吸顶式-顶面安装', '1×36W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (945730, NULL, 0.6000000000000001, 0.2, NULL, NULL, NULL, 0, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 47.282375574968384, 439.2676429336311, 148.54196375059416, 9.290304, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1380, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.00', NULL, 'Y_管吊球灯', '200×40', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (945732, NULL, 0.6000000000000001, 0.2, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, NULL, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.00', NULL, 'Y_管吊球灯', '管掉球灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (954560, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_嵌顶筒灯', '嵌顶筒灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (955446, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_嵌顶圆灯', '嵌顶圆灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (960097, NULL, 0.6096, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 108, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '1200mm', NULL, '1x28W,T5单管萤光灯,配以电子镇流器及棱镜折光罩紧急照明用 ,  应连接至中央电池系统 (天花或吊装)', '23.80.70.00', NULL, 'Y_三管荧光灯-吊装式-顶面安装', '3×36W吊装式', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (960099, NULL, 0.6096, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 84, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '1200mm', NULL, '1x28W,T5单管萤光灯,配以电子镇流器及棱镜折光罩紧急照明用 ,  应连接至中央电池系统 (天花或吊装)', '23.80.70.00', NULL, 'Y_三管荧光灯-吊装式-顶面安装', '3×28W吊装式', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (960101, NULL, 0.6096, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 54, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '1200mm', NULL, '1x28W,T5单管萤光灯,配以电子镇流器及棱镜折光罩紧急照明用 ,  应连接至中央电池系统 (天花或吊装)', '23.80.70.00', NULL, 'Y_三管荧光灯-吊装式-顶面安装', '3×18W吊装式', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (960103, NULL, 0.6096, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 42, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '1200mm', NULL, '1x28W,T5单管萤光灯,配以电子镇流器及棱镜折光罩紧急照明用 ,  应连接至中央电池系统 (天花或吊装)', '23.80.70.00', NULL, 'Y_三管荧光灯-吊装式-顶面安装', '3×14W吊装式', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (960934, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 54, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_三管荧光灯-嵌顶式-顶面安装', '3×14W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (960936, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 54, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_三管荧光灯-嵌顶式-顶面安装', '3×18W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (960938, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 84, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_三管荧光灯-嵌顶式-顶面安装', '3×28W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (960940, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 108, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_三管荧光灯-嵌顶式-顶面安装', '3×36W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (961780, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 54, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_三管荧光灯-吸顶式-顶面安装', '3×14W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (961782, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 54, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_三管荧光灯-吸顶式-顶面安装', '3×18W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (961784, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 84, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_三管荧光灯-吸顶式-顶面安装', '3×28W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (961786, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 108, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_三管荧光灯-吸顶式-顶面安装', '3×36W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (968398, NULL, 0.6096, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 72, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '1200mm', NULL, '1x28W,T5单管萤光灯,配以电子镇流器及棱镜折光罩紧急照明用 ,  应连接至中央电池系统 (天花或吊装)', '23.80.70.00', NULL, 'Y_双管荧光灯-吊装式-顶面安装', '2×36W吊装式', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (968400, NULL, 0.6096, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 56, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '1200mm', NULL, '1x28W,T5单管萤光灯,配以电子镇流器及棱镜折光罩紧急照明用 ,  应连接至中央电池系统 (天花或吊装)', '23.80.70.00', NULL, 'Y_双管荧光灯-吊装式-顶面安装', '2×28W吊装式', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (968402, NULL, 0.6096, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 36, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '1200mm', NULL, '1x28W,T5单管萤光灯,配以电子镇流器及棱镜折光罩紧急照明用 ,  应连接至中央电池系统 (天花或吊装)', '23.80.70.00', NULL, 'Y_双管荧光灯-吊装式-顶面安装', '2×18W吊装式', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (968404, NULL, 0.6096, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 28, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '1200mm', NULL, '1x28W,T5单管萤光灯,配以电子镇流器及棱镜折光罩紧急照明用 ,  应连接至中央电池系统 (天花或吊装)', '23.80.70.00', NULL, 'Y_双管荧光灯-吊装式-顶面安装', '2×14W吊装式', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (969280, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 56, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_双管荧光灯-嵌顶式-顶面安装', '2X28W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (969282, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 28, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_双管荧光灯-嵌顶式-顶面安装', '2X14W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (969284, NULL, 0.6000000000000001, NULL, NULL, NULL, 0.6000000000000001, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 36, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_双管荧光灯-嵌顶式-顶面安装', '2X18W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (969286, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 72, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_双管荧光灯-嵌顶式-顶面安装', '2X36W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (970150, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_吸顶防爆灯', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (971040, NULL, 0.6096, NULL, NULL, NULL, NULL, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 61.672663793437025, 572.9577951308232, 148.54196375059416, 12.117787826086957, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.00', NULL, 'Y_吸顶防爆灯-顶面安装-非基于面', '吸顶防爆灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (971880, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_吸顶花灯', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (972743, NULL, 0.6096, NULL, NULL, NULL, NULL, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 61.672663793437025, 572.9577951308232, 148.54196375059416, 12.117787826086957, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.00', NULL, 'Y_吸顶花灯-顶面安装-非基于面', '吸顶花灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (973597, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_吸顶密闭灯', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (974480, NULL, 0.6096, NULL, NULL, NULL, NULL, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 61.672663793437025, 572.9577951308232, 148.54196375059416, 12.117787826086957, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.00', NULL, 'Y_吸顶密闭灯-顶面安装-非基于面', '吸顶密闭灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (975394, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_吸顶圆灯', '吸顶圆灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (976325, NULL, 0.6096, NULL, NULL, NULL, NULL, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 61.672663793437025, 572.9577951308232, 148.54196375059416, 12.117787826086957, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.00', NULL, 'Y_吸顶圆灯-顶面安装-非基于面', '吸顶圆灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (996585, 3.0000000000000004, NULL, NULL, NULL, NULL, NULL, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 647.817858356456, 6018.424840760417, 148.54196375059416, 12.117787826086957, NULL, NULL, NULL, NULL, 1, NULL, 1.570796326794895, 0.5235987755982984, 1.570796326794895, 1800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.00', NULL, 'Z_嵌顶筒灯-嵌入式-顶面安装', '1×9W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (996587, 3.0000000000000004, NULL, NULL, NULL, NULL, NULL, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 647.817858356456, 6018.424840760417, 148.54196375059416, 12.117787826086957, NULL, NULL, NULL, NULL, 1, NULL, 1.570796326794895, 0.5235987755982984, 1.570796326794895, 1800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.00', NULL, 'Z_嵌顶筒灯-嵌入式-顶面安装', '2×9W', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (997347, NULL, 0.6000000000000001, 0.2, NULL, NULL, NULL, 0, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 47.282375574968384, 439.2676429336311, 148.54196375059416, 9.290304, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1380, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.00', NULL, 'Z_吸顶圆灯-顶面安装', '200×40', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1000960, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_安全出口指示灯（壁装底距门口0-2米）', '安全出口指示灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1002435, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '吊装式疏散指示灯', NULL, NULL, NULL, NULL, 'Y_安全出口指示灯-吊装式', '400×150', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1003644, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_安全疏散指示灯1（壁装距地0-5米）', '安全疏散指示灯1', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1004862, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_安全疏散指示灯2（壁装距地0-5米）', '安全疏散指示灯2', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1006748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '吊装式疏散指示灯', NULL, NULL, NULL, NULL, 'Y_安全疏散指示灯单向-吊装式', '400×150', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1007950, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_安全疏散指示灯双向-壁装式', '400×150', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1010263, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '吊装式疏散指示灯', NULL, NULL, NULL, NULL, 'Y_安全疏散指示灯双向-吊装式', '400×150', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1012376, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, 'Y_壁装球灯', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1286464, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 56, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-2双管荧光灯-基于面', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1287686, NULL, 0.6096, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 84, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '1200mm', NULL, '1x28W,T5单管萤光灯,配以电子镇流器及棱镜折光罩紧急照明用 ,  应连接至中央电池系统 (天花或吊装)', '23.80.70.00', NULL, '4-3三管荧光灯-吊装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1289204, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 54, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-3三管荧光灯-基于面', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1290370, 3.048, NULL, NULL, NULL, NULL, NULL, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 3077.048451478719, 28586.715536966552, 89.06, 96.00000000000001, NULL, NULL, 54, 0.88, 0.88, NULL, 1.570796326794895, 0.5235987755982984, 1.0471975511965967, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-4嵌顶筒灯1', '1', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1291536, 3.048, NULL, NULL, NULL, NULL, NULL, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 3077.048451478719, 28586.715536966552, 89.06, 96.00000000000001, NULL, NULL, 54, 0.88, 0.88, NULL, 1.570796326794895, 0.5235987755982984, 1.0471975511965967, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-4嵌顶筒灯2', '2', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1292702, 3.048, NULL, NULL, NULL, NULL, NULL, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 3077.048451478719, 28586.715536966552, 89.06, 96.00000000000001, NULL, NULL, 54, 0.88, 0.88, NULL, 1.570796326794895, 0.5235987755982984, 1.0471975511965967, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-4嵌顶筒灯7', '7', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1293868, 3.048, NULL, NULL, NULL, NULL, NULL, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 3077.048451478719, 28586.715536966552, 89.06, 96.00000000000001, NULL, NULL, 54, 0.88, 0.88, NULL, 1.570796326794895, 0.5235987755982984, 1.0471975511965967, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-4嵌顶筒灯9', '9', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1294984, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-5吸顶防爆灯', '防爆', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1296100, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-5吸顶密闭灯', '密闭灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1297216, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-5吸顶圆灯1', '1', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1298347, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-5吸顶圆灯2', '2', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1299488, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-5吸顶圆灯3', '3', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1300719, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-6LED疏散照明灯', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1302102, NULL, NULL, NULL, 0.39899999999999997, 0.155, NULL, 0, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 2800, 0.4060117033067938, 3.77197215127792, 15.8, 3.0000000000000004, NULL, '常规', 3.0000000000000004, NULL, 1, NULL, NULL, NULL, -1.570796326794895, 47.400000000000006, 'LED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4-7安全疏散指示灯1', '右', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1303302, NULL, 0.6096, NULL, NULL, NULL, 0.6096, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 60, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '单管荧光灯', NULL, NULL, '23.80.70.00', NULL, '4-7安全疏散指示灯1-吊装', '右', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1304671, NULL, NULL, NULL, 0.4, 0.16, NULL, 0, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 2800, 0.4060117033067938, 3.77197215127792, 15.8, 3.0000000000000004, NULL, '常规', 3.0000000000000004, NULL, 1, NULL, NULL, NULL, -1.570796326794895, 47.400000000000006, 'LED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4-7安全疏散指示灯2', '左', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1305869, NULL, 0.6096, NULL, NULL, NULL, 0.6096, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 60, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '单管荧光灯', NULL, NULL, '23.80.70.00', NULL, '4-7安全疏散指示灯2-吊装', '左', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1308478, NULL, NULL, NULL, 0.4, 0.16, NULL, 0, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 2800, 0.4060117033067938, 3.77197215127792, 15.8, 3.0000000000000004, NULL, '常规', 3.0000000000000004, NULL, 1, NULL, NULL, NULL, -1.570796326794895, 47.400000000000006, 'LED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4-7安全疏散指示灯双向', '双向', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1309657, NULL, 0.6096, NULL, NULL, NULL, 0.6096, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 60, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '单管荧光灯', NULL, NULL, '23.80.70.00', NULL, '4-7安全疏散指示灯双向-吊装', '双向', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1312214, NULL, NULL, NULL, 0.6000000000000001, 2.5, NULL, 0, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 2800, 0.4060117033067938, 3.77197215127792, 15.8, 3.0000000000000004, NULL, '常规', 3.0000000000000004, NULL, 1, NULL, NULL, NULL, -1.570796326794895, 47.400000000000006, 'LED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4-8安全出口指示灯', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1313384, NULL, 0.6096, NULL, NULL, NULL, 0.6096, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 60, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '单管荧光灯', NULL, NULL, '23.80.70.00', NULL, '4-8安全出口指示灯-吊装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1315933, NULL, NULL, NULL, 0.6000000000000001, 2.5, NULL, 0, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 2800, 0.4060117033067938, 3.77197215127792, 15.8, 3.0000000000000004, NULL, '常规', 3.0000000000000004, NULL, 1, NULL, NULL, NULL, -1.570796326794895, 47.400000000000006, 'LED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4-8层号灯', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1317070, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-9裸灯灯座', '密闭灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1318206, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-9吸顶灯灯座', '密闭灯', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1320598, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-1单管荧光灯-壁装.0002', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1321792, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-1单管荧光灯-壁装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1323024, NULL, 0.6096, NULL, NULL, NULL, 0.6096, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 60, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '单管荧光灯', NULL, NULL, '23.80.70.00', NULL, '4-1单管荧光灯-吊装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1324265, NULL, 0.6096, NULL, NULL, NULL, 0.6096, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 60, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '单管荧光灯', NULL, NULL, '23.80.70.00', NULL, '4-1单管荧光灯-防爆灯', '防爆', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1325494, NULL, 0.6000000000000001, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', 1, 1, 1, 1, 1, 1, 4230, 73.23423249924672, 680.3682831246817, 89.06, 96.00000000000001, NULL, NULL, 28, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-1单管荧光灯-基于面', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1326841, NULL, 0.6096, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 56, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '1200mm', NULL, '1x28W,T5单管萤光灯,配以电子镇流器及棱镜折光罩紧急照明用 ,  应连接至中央电池系统 (天花或吊装)', '23.80.70.00', NULL, '4-2双管荧光灯-吊装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1328181, NULL, 0.6096, NULL, NULL, NULL, 1.2000000000000002, NULL, '<无>', NULL, NULL, NULL, NULL, NULL, NULL, 3000, 20.55755459781234, 190.9859317102744, 148.54196375059416, 16.15705043478261, NULL, NULL, 56, NULL, 1, NULL, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, '1200mm', NULL, '1x28W,T5单管萤光灯,配以电子镇流器及棱镜折光罩紧急照明用 ,  应连接至中央电池系统 (天花或吊装)', '23.80.70.00', NULL, '4-2双管荧光灯-防爆灯', '防爆', NULL, NULL, NULL, NULL);
INSERT INTO `照明设备类型` VALUES (1348932, NULL, 0.6000000000000001, 0.6096, NULL, NULL, NULL, 0, '<无>', 1, 1, 1, 1, 1, 1, 4230, 292.93692999698686, 2721.473132498727, 89.06, 96.00000000000001, NULL, NULL, 60, 0.88, 0.88, NULL, NULL, NULL, NULL, 8549.760000000002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.70.11.11', NULL, '4-5圆形壁灯', '2', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 电压
-- ----------------------------
DROP TABLE IF EXISTS `电压`;
CREATE TABLE `电压`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电压1`(`类型 ID`) USING BTREE,
  INDEX `FK电压2`(`创建的阶段`) USING BTREE,
  INDEX `FK电压3`(`拆除的阶段`) USING BTREE,
  INDEX `FK电压4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK电压1` FOREIGN KEY (`类型 ID`) REFERENCES `电压类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电压2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电压3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电压4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电压
-- ----------------------------

-- ----------------------------
-- Table structure for 电压类型
-- ----------------------------
DROP TABLE IF EXISTS `电压类型`;
CREATE TABLE `电压类型`  (
  `ID` int NOT NULL,
  `实际电压` double NULL DEFAULT NULL,
  `最小电压` double NULL DEFAULT NULL,
  `最大电压` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电压类型
-- ----------------------------
INSERT INTO `电压类型` VALUES (55359, 120, 110, 130);
INSERT INTO `电压类型` VALUES (142450, 208, 200.00000000000003, 220);
INSERT INTO `电压类型` VALUES (277806, 240, 220, 250);
INSERT INTO `电压类型` VALUES (277807, 277, 260, 280);
INSERT INTO `电压类型` VALUES (277808, 480, 460, 490);
INSERT INTO `电压类型` VALUES (466457, 220, 210.00000000000003, 240);
INSERT INTO `电压类型` VALUES (466458, 380, 360, 410);
INSERT INTO `电压类型` VALUES (466459, 10000, 10000, 12000);

-- ----------------------------
-- Table structure for 电气装置
-- ----------------------------
DROP TABLE IF EXISTS `电气装置`;
CREATE TABLE `电气装置`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气数据` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电气装置1`(`类型 ID`) USING BTREE,
  INDEX `FK电气装置2`(`创建的阶段`) USING BTREE,
  INDEX `FK电气装置3`(`拆除的阶段`) USING BTREE,
  INDEX `FK电气装置4`(`设计选项`) USING BTREE,
  INDEX `FK电气装置5`(`标高`) USING BTREE,
  CONSTRAINT `FK电气装置1` FOREIGN KEY (`类型 ID`) REFERENCES `电气装置类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电气装置2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电气装置3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电气装置4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电气装置5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电气装置
-- ----------------------------

-- ----------------------------
-- Table structure for 电气装置类型
-- ----------------------------
DROP TABLE IF EXISTS `电气装置类型`;
CREATE TABLE `电气装置类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电气装置类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK电气装置类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK电气装置类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电气装置类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电气装置类型
-- ----------------------------
INSERT INTO `电气装置类型` VALUES (920221, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_带开关单相三孔插座 250V，10A（壁装距地1-8米）', '带开关单相三孔插座', NULL, NULL, NULL, NULL);
INSERT INTO `电气装置类型` VALUES (926975, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_单相二孔+三孔组合插座 250V,10A（壁装距地0-3米）', '单相二孔+三孔组合插座 250V,10A（壁装距地0.3米）', NULL, NULL, NULL, NULL);
INSERT INTO `电气装置类型` VALUES (928397, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_单相二孔+三孔组合插座 250V,10A（壁装距地1-3米）', '单相二孔+三孔组合插座 250V,10A（壁装距地1.3米）', NULL, NULL, NULL, NULL);
INSERT INTO `电气装置类型` VALUES (929389, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_单相风机盘管控制开关 250V,10A(壁装距地1-3米）', '单相风机盘管控制开关', NULL, NULL, NULL, NULL);
INSERT INTO `电气装置类型` VALUES (930765, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_单相三孔插座 250V，10A（壁装距地0-3米）', '单相三孔插座 250V，10A（壁装距地0.3米）', NULL, NULL, NULL, NULL);
INSERT INTO `电气装置类型` VALUES (935665, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_地面插座盒-地面安装', '地面插座盒-地面安装', NULL, NULL, NULL, NULL);
INSERT INTO `电气装置类型` VALUES (937009, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_地面接线盒-地面安装', '地面插座盒-地面安装', NULL, NULL, NULL, NULL);
INSERT INTO `电气装置类型` VALUES (941714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_顶面接线盒-顶面安装', '地面插座盒-地面安装', NULL, NULL, NULL, NULL);
INSERT INTO `电气装置类型` VALUES (953785, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_密闭单相三孔插座 250V，10A（壁装距地1-3米）', '密闭单相三孔插座 250V，10A（壁装距地1.3米）', NULL, NULL, NULL, NULL);
INSERT INTO `电气装置类型` VALUES (956814, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_墙面插座盒-墙面安装', '地面插座盒-地面安装', NULL, NULL, NULL, NULL);
INSERT INTO `电气装置类型` VALUES (958161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_墙面接线盒-墙面安装', '地面插座盒-地面安装', NULL, NULL, NULL, NULL);
INSERT INTO `电气装置类型` VALUES (963177, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.30.21.11.11.11', NULL, 'Y_三相四孔插座 400V，10A（壁装距地1-3米）', '三相四孔插座 400V，10A（壁装距地1.3米）', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 电气设备
-- ----------------------------
DROP TABLE IF EXISTS `电气设备`;
CREATE TABLE `电气设备`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `馈线片` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `位置` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `相位 C 电流` double NULL DEFAULT NULL,
  `相位 B 电流` double NULL DEFAULT NULL,
  `相位 A 电流` double NULL DEFAULT NULL,
  `总估计需用电流` double NULL DEFAULT NULL,
  `总连接电流` double NULL DEFAULT NULL,
  `总需求系数` double NULL DEFAULT NULL,
  `导线数` int NULL DEFAULT NULL,
  `相位数` int NULL DEFAULT NULL,
  `副馈线片` int NULL DEFAULT NULL,
  `供给源` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MCB 额定值` double NULL DEFAULT NULL,
  `馈线` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `修改` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `外围` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干线` double NULL DEFAULT NULL,
  `安装` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `额定短路` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `最多 #1 极断路器` int NULL DEFAULT NULL,
  `配电盘名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总估计需用` double NULL DEFAULT NULL,
  `总连接` double NULL DEFAULT NULL,
  `相位 C 视在负荷` double NULL DEFAULT NULL,
  `相位 B 视在负荷` double NULL DEFAULT NULL,
  `相位 A 视在负荷` double NULL DEFAULT NULL,
  `电气数据` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电气设备1`(`类型 ID`) USING BTREE,
  INDEX `FK电气设备2`(`创建的阶段`) USING BTREE,
  INDEX `FK电气设备3`(`拆除的阶段`) USING BTREE,
  INDEX `FK电气设备4`(`设计选项`) USING BTREE,
  INDEX `FK电气设备5`(`标高`) USING BTREE,
  CONSTRAINT `FK电气设备1` FOREIGN KEY (`类型 ID`) REFERENCES `电气设备类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电气设备2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电气设备3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电气设备4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电气设备5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电气设备
-- ----------------------------
INSERT INTO `电气设备` VALUES (1660590, 1124815, 86961, NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, -1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1581419, '102', NULL, NULL);
INSERT INTO `电气设备` VALUES (1660597, 1124815, 86961, NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, -1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1581419, '103', NULL, NULL);

-- ----------------------------
-- Table structure for 电气设备类型
-- ----------------------------
DROP TABLE IF EXISTS `电气设备类型`;
CREATE TABLE `电气设备类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `中性额定值` double NULL DEFAULT NULL,
  `中性母线` int NULL DEFAULT NULL,
  `接地母线` int NULL DEFAULT NULL,
  `母线` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `干线类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电压` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `瓦特` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电气设备类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK电气设备类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK电气设备类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电气设备类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电气设备类型
-- ----------------------------
INSERT INTO `电气设备类型` VALUES (915467, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_变压器（落地式）', '变压器1', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (915469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_变压器（落地式）', '变压器2', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (933601, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_低压配电柜（抽屉柜）（落地式）', '1000X1000X2200', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (933603, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_低压配电柜（抽屉柜）（落地式）', '800X1000X2200', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (933605, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_低压配电柜（抽屉柜）（落地式）', '600X1000X2200', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (934310, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_低压配电柜（落地式）', '低压配电柜（固定柜）1', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (934312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_低压配电柜（落地式）', '低压配电柜（固定柜）2', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (934314, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_低压配电柜（落地式）', '低压配电柜（固定柜）3', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (938231, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_电力配电箱（壁挂式）600', '电力配电箱-壁挂式', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (939158, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_电力配电箱（落地式）600', '电力配电箱-落地式', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (940368, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_电力配电箱（内嵌壁挂式）600', '电力配电箱-壁挂式', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (944887, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_高压配电柜（落地式）', '高压配电柜（下进下出）', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (944889, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_高压配电柜（落地式）', '高压配电柜（上进上出）', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (948412, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_环网柜（落地式）', '环网柜-落地式', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (950661, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_控制箱AC（壁装顶距地2-0米）600', '控制箱AC（壁装顶距地2.0米）', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (951396, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_控制箱AC（落地式）600', '控制箱-落地式', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (952404, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_控制箱AC（内嵌壁装顶距地2-0米）600', '控制箱AC（壁装顶距地2.0米）', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (965600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_双电源互投箱（柜）（壁装顶距地2-0米）600', '双电源互投箱(柜)（壁装顶距地2.0米）', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (966338, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_双电源互投箱（柜）（落地式）600', '双电源互投箱-落地式', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (967345, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_双电源互投箱（柜）（内嵌壁装顶距地2-0米）600', '双电源互投箱(柜)（壁装顶距地2.0米）', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (985850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_应急照明配电箱（壁挂式）600', '应急照明配电箱-壁挂式', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (986589, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_应急照明配电箱（落地式）600', '应急照明配电箱-落地式', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (987600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_应急照明配电箱（内嵌壁挂式）600', '应急照明配电箱-壁挂式', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (988739, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_照明配电箱（壁装顶距地2-0米）600', '照明配电箱（壁装顶距地2.0米）', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (989598, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_照明配电箱（落地式）600', '照明配电箱-落地式', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (990727, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_照明配电箱（内嵌壁装顶距地2-0米）600', '照明配电箱（壁装顶距地2.0米）', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (991442, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'Y_直流屏（落地式）', '直流屏-落地式', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (998850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FDSH-280°C防火阀-电气符号', 'FDSH-280°C防火阀-电气符号', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (999319, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FDVS-70°C防火阀-电气符号', 'FDVS-70°C防火阀-电气符号', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (999812, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FDVS-150°C防火阀-电气符号 ', 'FDVS-150°C防火阀-电气符号 ', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1014688, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '水专业-电气图例-电动机', '水专业-电气图例-电动机', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1033216, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, '风机-电符号&接线', '风机-电符号&接线', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1060745, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, '盘管-电符号&接线', '盘管-电符号&接线', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1083040, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, '机组-电符号&接线', '机组-电符号&接线', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1124815, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GP加压阀-电气符号', 'GP加压阀-电气符号', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1135678, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FDH-280°C防火阀-电气符号', 'FDH-280°C防火阀-电气符号', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1153821, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FVD-70°C防火阀-电气符号', 'FVD-70°C防火阀-电气符号', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1158923, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FVD-150°C防火阀-电气符号', 'FVD-150°C防火阀-电气符号', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1166881, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MED-70°C防火阀-电气符号', 'MED-70°C防火阀-电气符号', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1463593, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E-风机电气符号', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1478713, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, '风扇-电符号&接线', '风扇-电符号&接线', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1483668, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.30.11.17', NULL, 'E-风盘-电符号&接线', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电气设备类型` VALUES (1485659, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E-FVD-70°C防火阀-电气符号', '标准', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 电气负荷分类
-- ----------------------------
DROP TABLE IF EXISTS `电气负荷分类`;
CREATE TABLE `电气负荷分类`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电气负荷分类1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK电气负荷分类1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电气负荷分类
-- ----------------------------
INSERT INTO `电气负荷分类` VALUES (501458, NULL);
INSERT INTO `电气负荷分类` VALUES (501460, NULL);
INSERT INTO `电气负荷分类` VALUES (501462, NULL);
INSERT INTO `电气负荷分类` VALUES (501464, NULL);
INSERT INTO `电气负荷分类` VALUES (501466, NULL);
INSERT INTO `电气负荷分类` VALUES (505161, NULL);
INSERT INTO `电气负荷分类` VALUES (506968, NULL);
INSERT INTO `电气负荷分类` VALUES (508014, NULL);
INSERT INTO `电气负荷分类` VALUES (509467, NULL);
INSERT INTO `电气负荷分类` VALUES (512890, NULL);
INSERT INTO `电气负荷分类` VALUES (512947, NULL);
INSERT INTO `电气负荷分类` VALUES (512949, NULL);
INSERT INTO `电气负荷分类` VALUES (512951, NULL);
INSERT INTO `电气负荷分类` VALUES (512953, NULL);
INSERT INTO `电气负荷分类` VALUES (512955, NULL);
INSERT INTO `电气负荷分类` VALUES (512957, NULL);
INSERT INTO `电气负荷分类` VALUES (512959, NULL);
INSERT INTO `电气负荷分类` VALUES (512961, NULL);
INSERT INTO `电气负荷分类` VALUES (512963, NULL);
INSERT INTO `电气负荷分类` VALUES (512965, NULL);
INSERT INTO `电气负荷分类` VALUES (512966, NULL);
INSERT INTO `电气负荷分类` VALUES (512968, NULL);
INSERT INTO `电气负荷分类` VALUES (512970, NULL);
INSERT INTO `电气负荷分类` VALUES (512972, NULL);
INSERT INTO `电气负荷分类` VALUES (512974, NULL);
INSERT INTO `电气负荷分类` VALUES (512976, NULL);
INSERT INTO `电气负荷分类` VALUES (512978, NULL);
INSERT INTO `电气负荷分类` VALUES (513077, NULL);
INSERT INTO `电气负荷分类` VALUES (685699, NULL);
INSERT INTO `电气负荷分类` VALUES (685700, NULL);
INSERT INTO `电气负荷分类` VALUES (838198, NULL);
INSERT INTO `电气负荷分类` VALUES (1014769, NULL);

-- ----------------------------
-- Table structure for 电气负荷分类参数图元
-- ----------------------------
DROP TABLE IF EXISTS `电气负荷分类参数图元`;
CREATE TABLE `电气负荷分类参数图元`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电气负荷分类参数图元1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK电气负荷分类参数图元1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电气负荷分类参数图元
-- ----------------------------
INSERT INTO `电气负荷分类参数图元` VALUES (520444, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520445, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520446, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520447, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520448, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520449, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520450, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520451, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520452, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520453, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520454, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520455, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520456, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520457, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520458, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520459, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520460, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520461, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520462, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520463, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520464, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520465, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520466, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520467, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520468, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520469, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520470, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520471, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520472, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520473, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520474, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520475, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520476, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520477, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520478, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520479, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520480, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520481, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520482, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520483, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520484, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520485, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520486, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520487, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520488, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520489, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520490, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520491, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520492, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520493, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520494, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520495, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520496, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520497, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520498, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520499, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520500, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520501, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520502, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520503, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520504, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520505, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520506, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520507, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520508, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520509, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520510, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520511, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520512, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520513, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520514, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520515, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520516, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520517, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520518, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520519, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520520, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520521, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520522, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520523, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520524, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520525, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520526, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520527, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520528, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520529, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520530, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520531, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520532, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520533, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520534, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520535, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520536, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520537, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520538, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520539, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520540, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520541, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520542, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520543, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520544, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520545, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520546, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520547, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520548, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520549, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520550, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520551, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520552, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520553, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520554, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520555, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520556, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520557, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520558, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520559, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520560, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520561, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520562, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520563, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520564, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520565, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520566, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520567, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520568, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520569, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520570, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520571, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520572, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520573, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520574, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520575, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520576, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520577, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520578, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520579, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520580, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520581, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520582, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520583, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520584, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520585, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520586, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520587, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520588, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520589, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520590, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520591, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520592, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520593, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520594, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520595, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520596, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520597, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520598, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520599, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520600, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520601, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520602, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520603, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520604, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520605, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520606, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520607, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520608, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520609, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520610, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (520611, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (685702, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (685703, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (685704, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (685705, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (685706, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (685707, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (685708, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (685709, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (685710, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (685711, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (707788, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (707789, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (838199, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (838200, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (838201, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (838202, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (838203, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (838204, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (1014770, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (1014771, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (1014772, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (1014773, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (1014774, NULL);
INSERT INTO `电气负荷分类参数图元` VALUES (1014775, NULL);

-- ----------------------------
-- Table structure for 电气需求系数定义
-- ----------------------------
DROP TABLE IF EXISTS `电气需求系数定义`;
CREATE TABLE `电气需求系数定义`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电气需求系数定义1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK电气需求系数定义1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电气需求系数定义
-- ----------------------------
INSERT INTO `电气需求系数定义` VALUES (501457, NULL);
INSERT INTO `电气需求系数定义` VALUES (501459, NULL);
INSERT INTO `电气需求系数定义` VALUES (501461, NULL);
INSERT INTO `电气需求系数定义` VALUES (501463, NULL);
INSERT INTO `电气需求系数定义` VALUES (501465, NULL);
INSERT INTO `电气需求系数定义` VALUES (505160, NULL);
INSERT INTO `电气需求系数定义` VALUES (505162, NULL);
INSERT INTO `电气需求系数定义` VALUES (506969, NULL);
INSERT INTO `电气需求系数定义` VALUES (508015, NULL);
INSERT INTO `电气需求系数定义` VALUES (509465, NULL);
INSERT INTO `电气需求系数定义` VALUES (509468, NULL);
INSERT INTO `电气需求系数定义` VALUES (512891, NULL);
INSERT INTO `电气需求系数定义` VALUES (512948, NULL);
INSERT INTO `电气需求系数定义` VALUES (512950, NULL);
INSERT INTO `电气需求系数定义` VALUES (512952, NULL);
INSERT INTO `电气需求系数定义` VALUES (512954, NULL);
INSERT INTO `电气需求系数定义` VALUES (512956, NULL);
INSERT INTO `电气需求系数定义` VALUES (512958, NULL);
INSERT INTO `电气需求系数定义` VALUES (512960, NULL);
INSERT INTO `电气需求系数定义` VALUES (512962, NULL);
INSERT INTO `电气需求系数定义` VALUES (512964, NULL);
INSERT INTO `电气需求系数定义` VALUES (512967, NULL);
INSERT INTO `电气需求系数定义` VALUES (512969, NULL);
INSERT INTO `电气需求系数定义` VALUES (512971, NULL);
INSERT INTO `电气需求系数定义` VALUES (512973, NULL);
INSERT INTO `电气需求系数定义` VALUES (512975, NULL);
INSERT INTO `电气需求系数定义` VALUES (512977, NULL);
INSERT INTO `电气需求系数定义` VALUES (512979, NULL);
INSERT INTO `电气需求系数定义` VALUES (513076, NULL);
INSERT INTO `电气需求系数定义` VALUES (896907, NULL);
INSERT INTO `电气需求系数定义` VALUES (901205, NULL);

-- ----------------------------
-- Table structure for 电缆桥架
-- ----------------------------
DROP TABLE IF EXISTS `电缆桥架`;
CREATE TABLE `电缆桥架`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `设备类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `底部高程` double NULL DEFAULT NULL,
  `顶部高程` double NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `高度` double NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电缆桥架1`(`类型 ID`) USING BTREE,
  INDEX `FK电缆桥架2`(`创建的阶段`) USING BTREE,
  INDEX `FK电缆桥架3`(`拆除的阶段`) USING BTREE,
  INDEX `FK电缆桥架4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK电缆桥架1` FOREIGN KEY (`类型 ID`) REFERENCES `电缆桥架类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电缆桥架2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电缆桥架3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电缆桥架4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电缆桥架
-- ----------------------------
INSERT INTO `电缆桥架` VALUES (1644486, 1680761, 86961, NULL, NULL, NULL, NULL, 3.2499999999999996, 3.3499999999999988, 0.2, 0.1, '200 mmx100 mm?', NULL, '普通电力桥架', 2.656970008874353, '280', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (1644487, 1680761, 86961, NULL, NULL, NULL, NULL, 3.2499999999999996, 3.3499999999999988, 0.2, 0.1, '200 mmx100 mm?', NULL, '普通电力桥架', 4.750427446654877, '281', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (1644488, 1680761, 86961, NULL, NULL, NULL, NULL, 3.2499999999999996, 3.350000000000005, 0.2, 0.1, '200 mmx100 mm?', NULL, '普通电力桥架', 0.9964373741528011, '282', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (1644491, 1680761, 86961, NULL, NULL, NULL, NULL, 3.2499999999999996, 3.3499999999999988, 0.2, 0.1, '200 mmx100 mm?', NULL, '普通电力桥架', 8.937022919162041, '285', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (1644496, 1680761, 86961, NULL, NULL, NULL, NULL, 3.2499999999999996, 3.3499999999999988, 0.2, 0.1, '200 mmx100 mm?', NULL, '普通电力桥架', 1.053820463990636, '286', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (1645380, 854613, 86961, NULL, NULL, NULL, NULL, 2.9500000000000006, 3.050000000000006, 0.2, 0.1, '200 mmx100 mm?', NULL, '有线电视、手机信号', 1.4249999868534655, '301', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (1645389, 854613, 86961, NULL, NULL, NULL, NULL, 2.9500000000000006, 3.05, 0.2, 0.1, '200 mmx100 mm?', NULL, '有线电视、手机信号', 1.6726637776573257, '304', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (1645391, 854613, 86961, NULL, NULL, NULL, NULL, 3.150000000000001, 3.2499999999999996, 0.2, 0.1, '200 mmx100 mm?', NULL, '弱电', 0.8976635958381489, '306', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (1645392, 854613, 86961, NULL, NULL, NULL, NULL, 2.9499999999999726, 3.05, 0.2, 0.1, '200 mmx100 mm?', NULL, '有线电视、手机信号', 1.2124589461515132, '307', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (1645413, 854613, 86961, NULL, NULL, NULL, NULL, 3.150000000000001, 3.2499999999999996, 0.2, 0.1, '200 mmx100 mm?', NULL, '弱电', 7.400257681535929, '318', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (1680718, 854613, 86961, NULL, NULL, NULL, NULL, 3.149999999999977, 3.2499999999999996, 0.2, 0.1, '200 mmx100 mm?', NULL, '弱电', 0.9374589461514515, '333', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (2004936, 854613, 86961, NULL, NULL, NULL, NULL, 2.9500000000000006, 3.0500000000000083, 0.2, 0.1, '200 mmx100 mm?', NULL, '有线电视、手机信号', 7.375257863355093, '382', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (2005029, 854613, 86961, NULL, NULL, NULL, NULL, 3.150000000000001, 3.2499999999999996, 0.2, 0.1, '200 mmx100 mm?', NULL, '弱电', 1.4000001686726489, '383', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (2065174, 854613, 86961, NULL, NULL, NULL, NULL, 3.149999999999994, 3.2499999999999996, 0.2, 0.1, '200 mmx100 mm?', NULL, '弱电', 18.300000000068856, '483', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (2065847, 854613, 86961, NULL, NULL, NULL, NULL, 2.9500000000000006, 3.050000000000006, 0.2, 0.1, '200 mmx100 mm?', NULL, '有线电视、手机信号', 18.325000000068872, '489', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (2066654, 854613, 86961, NULL, NULL, NULL, NULL, 3.150000000000001, 3.2499999999999996, 0.2, 0.1, '200 mmx100 mm?', NULL, '弱电', 18.300000000068877, '494', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (2066732, 854613, 86961, NULL, NULL, NULL, NULL, 2.9500000000000006, 3.0500000000000083, 0.2, 0.1, '200 mmx100 mm?', NULL, '有线电视、手机信号', 18.325000000068858, '498', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (2071683, 1680761, 86961, NULL, NULL, NULL, NULL, 3.2499999999999996, 3.3499999999999988, 0.2, 0.1, '200 mmx100 mm?', NULL, '普通电力桥架', 8.946660321339516, '514', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (2130080, 1680761, 86961, NULL, NULL, NULL, NULL, 3.2499999999999996, 3.3499999999999988, 0.2, 0.1, '200 mmx100 mm?', NULL, '普通电力桥架', 18.900000000068843, '567', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (2130118, 1680761, 86961, NULL, NULL, NULL, NULL, 3.2499999999999996, 3.3499999999999988, 0.2, 0.1, '200 mmx100 mm?', NULL, '普通电力桥架', 18.900000000068854, '569', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (2133399, 854613, 86961, NULL, NULL, NULL, NULL, 2.9500000000000006, 3.05, 0.2, 0.1, '200 mmx100 mm?', NULL, '有线电视、手机信号', 5.366472873302226, '579', NULL, NULL, NULL);
INSERT INTO `电缆桥架` VALUES (2133445, 854613, 86961, NULL, NULL, NULL, NULL, 3.150000000000001, 3.2499999999999996, 0.2, 0.1, '200 mmx100 mm?', NULL, '弱电', 5.666472873302261, '581', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 电缆桥架类型
-- ----------------------------
DROP TABLE IF EXISTS `电缆桥架类型`;
CREATE TABLE `电缆桥架类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `弯曲半径乘数` double NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电缆桥架类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK电缆桥架类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电缆桥架类型
-- ----------------------------
INSERT INTO `电缆桥架类型` VALUES (552354, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '带配件的电缆桥架', '槽式电缆桥架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (552355, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '带配件的电缆桥架', '梯级式电缆桥架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (552356, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '无配件的电缆桥架', '钢丝网电缆桥架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (552359, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '带配件的电缆桥架', '实体底部电缆桥架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (552374, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '无配件的电缆桥架', '单轨电缆桥架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (854593, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '无配件的电缆桥架', '电-桥架-线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (854594, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '无配件的电缆桥架', '电-桥架-防火线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (854595, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '无配件的电缆桥架', '电-桥架-托盘', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (854596, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '无配件的电缆桥架', '电-桥架-封闭母线', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (854597, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '带配件的电缆桥架', '电-桥架-梯架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (854611, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '带配件的电缆桥架', '电-桥架-线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (854612, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '带配件的电缆桥架', '电-桥架-托盘', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (854613, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '带配件的电缆桥架', '电-桥架-防火线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (854614, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '带配件的电缆桥架', '电-桥架-封闭母线', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架类型` VALUES (1680761, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '带配件的电缆桥架', '电-桥架-线槽-电力', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 电缆桥架配件
-- ----------------------------
DROP TABLE IF EXISTS `电缆桥架配件`;
CREATE TABLE `电缆桥架配件`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `设备类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电缆桥架配件1`(`类型 ID`) USING BTREE,
  INDEX `FK电缆桥架配件2`(`创建的阶段`) USING BTREE,
  INDEX `FK电缆桥架配件3`(`拆除的阶段`) USING BTREE,
  INDEX `FK电缆桥架配件4`(`设计选项`) USING BTREE,
  INDEX `FK电缆桥架配件5`(`标高`) USING BTREE,
  CONSTRAINT `FK电缆桥架配件1` FOREIGN KEY (`类型 ID`) REFERENCES `电缆桥架配件类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电缆桥架配件2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电缆桥架配件3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电缆桥架配件4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电缆桥架配件5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电缆桥架配件
-- ----------------------------
INSERT INTO `电缆桥架配件` VALUES (1644492, 1680784, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?', NULL, '普通电力桥架', 1581419, '554', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (1644493, 1680784, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?', NULL, '普通电力桥架', 1581419, '555', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (1644495, 1680780, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?-200 mmx100 mm?', NULL, '普通电力桥架', 1581419, '557', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (1644497, 1680784, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?', NULL, '普通电力桥架', 1581419, '558', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (1644498, 1680780, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?-200 mmx100 mm?', NULL, '普通电力桥架', 1581419, '559', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (2004935, 854642, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?-200 mmx100 mm?', NULL, '有线电视、手机信号', 1581419, '934', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (2005028, 854642, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?-200 mmx100 mm?', NULL, '弱电', 1581419, '944', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (2005070, 854687, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?', NULL, '有线电视、手机信号', 1581419, '950', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (2005073, 854687, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?', NULL, '弱电', 1581419, '953', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (2066738, 854687, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?', NULL, '有线电视、手机信号', 1581419, '1401', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (2115294, 854687, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?', NULL, '有线电视、手机信号', 1581419, '1551', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (2115323, 854687, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?', NULL, '弱电', 1581419, '1552', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (2117845, 854687, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?', NULL, '弱电', 1581419, '1581', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (2133407, 854687, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?', NULL, '有线电视、手机信号', 1581419, '1657', NULL, NULL, NULL);
INSERT INTO `电缆桥架配件` VALUES (2133451, 854687, 86961, NULL, NULL, NULL, NULL, '200 mmx100 mm?-200 mmx100 mm?', NULL, '弱电', 1581419, '1664', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 电缆桥架配件类型
-- ----------------------------
DROP TABLE IF EXISTS `电缆桥架配件类型`;
CREATE TABLE `电缆桥架配件类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电缆桥架配件类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK电缆桥架配件类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电缆桥架配件类型
-- ----------------------------
INSERT INTO `电缆桥架配件类型` VALUES (527158, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '托盘式电缆桥架垂直凸弯通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (528085, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平弯通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (529680, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架水平弯通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (530967, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '托盘式电缆桥架水平弯通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (531992, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平四通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (533115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架水平四通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (534138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '托盘式电缆桥架水平四通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (535077, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平三通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (536111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架水平三通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (537048, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '托盘式电缆桥架水平三通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (538655, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架异径接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (541015, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架异径接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (542622, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '托盘式电缆桥架异径接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (543449, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架活接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (544717, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架活接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (545544, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '托盘式电缆桥架活接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (546459, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径下弯通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (548075, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架垂直凹弯通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (549366, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '托盘式电缆桥架垂直凹弯通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (550725, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径上弯通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (552341, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架垂直凸弯通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854582, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径下弯通', '电-桥架-托盘', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854584, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架异径接头', '电-桥架-托盘', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854586, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平弯通', '电-桥架-托盘', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854588, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架活接头', '电-桥架-托盘', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854590, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径上弯通', '电-桥架-封闭母线', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854592, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径下弯通', '电-桥架-封闭母线', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854618, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架异径接头', '电-桥架-封闭母线', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854620, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平弯通', '电-桥架-封闭母线', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854622, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架活接头', '电-桥架-封闭母线', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854624, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架垂直凸弯通', '电-桥架-梯架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854626, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架垂直凹弯通', '电-桥架-梯架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854628, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架异径接头', '电-桥架-梯架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854630, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架水平三通', '电-桥架-梯架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854632, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架水平四通', '电-桥架-梯架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854634, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架水平弯通', '电-桥架-梯架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854636, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梯级式电缆桥架活接头', '电-桥架-梯架', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854638, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平三通', '电-桥架-线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854640, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平四通', '电-桥架-线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854642, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平三通', '电-桥架-防火线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854644, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平四通', '电-桥架-防火线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854646, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平三通', '电-桥架-封闭母线', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平四通', '电-桥架-封闭母线', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854650, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平三通', '电-桥架-托盘', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854652, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平四通', '电-桥架-托盘', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854671, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径上弯通', '电-桥架-线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854673, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径下弯通', '电-桥架-线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854675, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架异径接头', '电-桥架-线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854677, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平弯通', '电-桥架-线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854679, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架活接头', '电-桥架-线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854681, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径上弯通', '电-桥架-防火线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854683, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径下弯通', '电-桥架-防火线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854685, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架异径接头', '电-桥架-防火线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854687, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平弯通', '电-桥架-防火线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854689, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架活接头', '电-桥架-防火线槽', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (854691, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径上弯通', '电-桥架-托盘', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (1680774, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径上弯通', '电-桥架-线槽-电力', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (1680776, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架垂直等径下弯通', '电-桥架-线槽-电力', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (1680778, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架异径接头', '电-桥架-线槽-电力', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (1680780, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平三通', '电-桥架-线槽-电力', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (1680782, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平四通', '电-桥架-线槽-电力', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (1680784, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架水平弯通', '电-桥架-线槽-电力', NULL, NULL, NULL, NULL);
INSERT INTO `电缆桥架配件类型` VALUES (1680786, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '槽式电缆桥架活接头', '电-桥架-线槽-电力', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 电话设备
-- ----------------------------
DROP TABLE IF EXISTS `电话设备`;
CREATE TABLE `电话设备`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气数据` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电话设备1`(`类型 ID`) USING BTREE,
  INDEX `FK电话设备2`(`创建的阶段`) USING BTREE,
  INDEX `FK电话设备3`(`拆除的阶段`) USING BTREE,
  INDEX `FK电话设备4`(`设计选项`) USING BTREE,
  INDEX `FK电话设备5`(`标高`) USING BTREE,
  CONSTRAINT `FK电话设备1` FOREIGN KEY (`类型 ID`) REFERENCES `电话设备类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电话设备2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电话设备3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电话设备4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电话设备5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电话设备
-- ----------------------------

-- ----------------------------
-- Table structure for 电话设备类型
-- ----------------------------
DROP TABLE IF EXISTS `电话设备类型`;
CREATE TABLE `电话设备类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电话设备类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK电话设备类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK电话设备类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK电话设备类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电话设备类型
-- ----------------------------
INSERT INTO `电话设备类型` VALUES (998352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '电话机', '标准', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 电路
-- ----------------------------
DROP TABLE IF EXISTS `电路`;
CREATE TABLE `电路`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `连接类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `图元数` int NULL DEFAULT NULL,
  `帧` double NULL DEFAULT NULL,
  `负荷分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `布网数目` int NULL DEFAULT NULL,
  `火线数目` int NULL DEFAULT NULL,
  `零线数目` int NULL DEFAULT NULL,
  `地线数目` int NULL DEFAULT NULL,
  `负荷名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `相位 C 视在负荷` double NULL DEFAULT NULL,
  `相位 B 视在负荷` double NULL DEFAULT NULL,
  `相位 A 视在负荷` double NULL DEFAULT NULL,
  `相位 C 实际负荷` double NULL DEFAULT NULL,
  `相位 B 实际负荷` double NULL DEFAULT NULL,
  `相位 A 实际负荷` double NULL DEFAULT NULL,
  `实际电流` double NULL DEFAULT NULL,
  `相位 A 实际电流` double NULL DEFAULT NULL,
  `相位 B 实际电流` double NULL DEFAULT NULL,
  `相位 C 实际电流` double NULL DEFAULT NULL,
  `视在电流` double NULL DEFAULT NULL,
  `相位 A 视在电流` double NULL DEFAULT NULL,
  `相位 B 视在电流` double NULL DEFAULT NULL,
  `相位 C 视在电流` double NULL DEFAULT NULL,
  `电压降` double NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `额定` double NULL DEFAULT NULL,
  `导线尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `导线类型` int NULL DEFAULT NULL,
  `系统类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `实际负荷` double NULL DEFAULT NULL,
  `功率系数的状态` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `功率系数` double NULL DEFAULT NULL,
  `视在负荷` double NULL DEFAULT NULL,
  `平衡负荷` int NULL DEFAULT NULL,
  `电压` double NULL DEFAULT NULL,
  `极数` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK电路1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK电路1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 电路
-- ----------------------------

-- ----------------------------
-- Table structure for 空调系统
-- ----------------------------
DROP TABLE IF EXISTS `空调系统`;
CREATE TABLE `空调系统`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `风机` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `冷却水回路` int NULL DEFAULT NULL,
  `冷却盘管` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `加热热水回路` int NULL DEFAULT NULL,
  `加热盘管` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `预热热水回路` int NULL DEFAULT NULL,
  `预热盘管` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `热交换器` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK空调系统1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK空调系统1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 空调系统
-- ----------------------------

-- ----------------------------
-- Table structure for 空间
-- ----------------------------
DROP TABLE IF EXISTS `空间`;
CREATE TABLE `空间`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `新风量` double NULL DEFAULT NULL,
  `新风方法` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `每小时换气次数` double NULL DEFAULT NULL,
  `每单位面积的新风量` double NULL DEFAULT NULL,
  `每人的新风量` double NULL DEFAULT NULL,
  `新风信息` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `照明计算光源平面` double NULL DEFAULT NULL,
  `房间空置率` double NULL DEFAULT NULL,
  `平均估算照度` double NULL DEFAULT NULL,
  `楼板反射` double NULL DEFAULT NULL,
  `墙反射` double NULL DEFAULT NULL,
  `天花板反射` double NULL DEFAULT NULL,
  `照明计算工作平面` double NULL DEFAULT NULL,
  `正压送风系统` int NULL DEFAULT NULL,
  `占用` int NULL DEFAULT NULL,
  `房间编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `房间名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `计算的单位面积送风量` double NULL DEFAULT NULL,
  `计算的单位面积冷负荷` double NULL DEFAULT NULL,
  `计算的单位面积热负荷` double NULL DEFAULT NULL,
  `每个区域的实际照明负荷` double NULL DEFAULT NULL,
  `每个区域的实际电力负荷` double NULL DEFAULT NULL,
  `热负荷值` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `设计冷负荷` double NULL DEFAULT NULL,
  `计算的冷负荷` double NULL DEFAULT NULL,
  `设计热负荷` double NULL DEFAULT NULL,
  `计算的热负荷` double NULL DEFAULT NULL,
  `构造类型` int NULL DEFAULT NULL,
  `每人的显热增量` double NULL DEFAULT NULL,
  `指定的照明负荷` double NULL DEFAULT NULL,
  `指定的电力负荷` double NULL DEFAULT NULL,
  `实际照明荷载` double NULL DEFAULT NULL,
  `实际电力荷载` double NULL DEFAULT NULL,
  `设计每个区域的其他负荷` double NULL DEFAULT NULL,
  `设计每个区域的 HVAC 负荷` double NULL DEFAULT NULL,
  `指定的每个区域的照明负荷` double NULL DEFAULT NULL,
  `指定的每个区域的电力负荷` double NULL DEFAULT NULL,
  `实际排风量` double NULL DEFAULT NULL,
  `实际回风量` double NULL DEFAULT NULL,
  `实际送风量` double NULL DEFAULT NULL,
  `每人的潜热增量` double NULL DEFAULT NULL,
  `每人的总热增量` double NULL DEFAULT NULL,
  `计算的送风量` double NULL DEFAULT NULL,
  `指定的排风量` double NULL DEFAULT NULL,
  `指定的回风量` double NULL DEFAULT NULL,
  `指定的送风量` double NULL DEFAULT NULL,
  `人均面积` double NULL DEFAULT NULL,
  `人数` double NULL DEFAULT NULL,
  `空间类型` int NULL DEFAULT NULL,
  `条件类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `阶段 ID` int NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `周长` double NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK空间1`(`设计选项`) USING BTREE,
  INDEX `FK空间2`(`阶段 ID`) USING BTREE,
  INDEX `FK空间3`(`标高`) USING BTREE,
  CONSTRAINT `FK空间1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK空间2` FOREIGN KEY (`阶段 ID`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK空间3` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 空间
-- ----------------------------

-- ----------------------------
-- Table structure for 空间类型设置
-- ----------------------------
DROP TABLE IF EXISTS `空间类型设置`;
CREATE TABLE `空间类型设置`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK空间类型设置1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK空间类型设置1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 空间类型设置
-- ----------------------------
INSERT INTO `空间类型设置` VALUES (388201, NULL);
INSERT INTO `空间类型设置` VALUES (388202, NULL);
INSERT INTO `空间类型设置` VALUES (388203, NULL);
INSERT INTO `空间类型设置` VALUES (388204, NULL);
INSERT INTO `空间类型设置` VALUES (388205, NULL);
INSERT INTO `空间类型设置` VALUES (388206, NULL);
INSERT INTO `空间类型设置` VALUES (388207, NULL);
INSERT INTO `空间类型设置` VALUES (388208, NULL);
INSERT INTO `空间类型设置` VALUES (388209, NULL);
INSERT INTO `空间类型设置` VALUES (388210, NULL);
INSERT INTO `空间类型设置` VALUES (388211, NULL);
INSERT INTO `空间类型设置` VALUES (388212, NULL);
INSERT INTO `空间类型设置` VALUES (388213, NULL);
INSERT INTO `空间类型设置` VALUES (388214, NULL);
INSERT INTO `空间类型设置` VALUES (388215, NULL);
INSERT INTO `空间类型设置` VALUES (388216, NULL);
INSERT INTO `空间类型设置` VALUES (388217, NULL);
INSERT INTO `空间类型设置` VALUES (388218, NULL);
INSERT INTO `空间类型设置` VALUES (388219, NULL);
INSERT INTO `空间类型设置` VALUES (388220, NULL);
INSERT INTO `空间类型设置` VALUES (388221, NULL);
INSERT INTO `空间类型设置` VALUES (388222, NULL);
INSERT INTO `空间类型设置` VALUES (388223, NULL);
INSERT INTO `空间类型设置` VALUES (388224, NULL);
INSERT INTO `空间类型设置` VALUES (388225, NULL);
INSERT INTO `空间类型设置` VALUES (388226, NULL);
INSERT INTO `空间类型设置` VALUES (388227, NULL);
INSERT INTO `空间类型设置` VALUES (388228, NULL);
INSERT INTO `空间类型设置` VALUES (388229, NULL);
INSERT INTO `空间类型设置` VALUES (388230, NULL);
INSERT INTO `空间类型设置` VALUES (388231, NULL);
INSERT INTO `空间类型设置` VALUES (388232, NULL);
INSERT INTO `空间类型设置` VALUES (388233, NULL);
INSERT INTO `空间类型设置` VALUES (388234, NULL);
INSERT INTO `空间类型设置` VALUES (388235, NULL);
INSERT INTO `空间类型设置` VALUES (388236, NULL);
INSERT INTO `空间类型设置` VALUES (388237, NULL);
INSERT INTO `空间类型设置` VALUES (388238, NULL);
INSERT INTO `空间类型设置` VALUES (388239, NULL);
INSERT INTO `空间类型设置` VALUES (388240, NULL);
INSERT INTO `空间类型设置` VALUES (388241, NULL);
INSERT INTO `空间类型设置` VALUES (388242, NULL);
INSERT INTO `空间类型设置` VALUES (388243, NULL);
INSERT INTO `空间类型设置` VALUES (388244, NULL);
INSERT INTO `空间类型设置` VALUES (388245, NULL);
INSERT INTO `空间类型设置` VALUES (388246, NULL);
INSERT INTO `空间类型设置` VALUES (388247, NULL);
INSERT INTO `空间类型设置` VALUES (388248, NULL);
INSERT INTO `空间类型设置` VALUES (388249, NULL);
INSERT INTO `空间类型设置` VALUES (388250, NULL);
INSERT INTO `空间类型设置` VALUES (388251, NULL);
INSERT INTO `空间类型设置` VALUES (388252, NULL);
INSERT INTO `空间类型设置` VALUES (388253, NULL);
INSERT INTO `空间类型设置` VALUES (388254, NULL);
INSERT INTO `空间类型设置` VALUES (388255, NULL);
INSERT INTO `空间类型设置` VALUES (388256, NULL);
INSERT INTO `空间类型设置` VALUES (388257, NULL);
INSERT INTO `空间类型设置` VALUES (388258, NULL);
INSERT INTO `空间类型设置` VALUES (388259, NULL);
INSERT INTO `空间类型设置` VALUES (388260, NULL);
INSERT INTO `空间类型设置` VALUES (388261, NULL);
INSERT INTO `空间类型设置` VALUES (388262, NULL);
INSERT INTO `空间类型设置` VALUES (388263, NULL);
INSERT INTO `空间类型设置` VALUES (388264, NULL);
INSERT INTO `空间类型设置` VALUES (388265, NULL);
INSERT INTO `空间类型设置` VALUES (388266, NULL);
INSERT INTO `空间类型设置` VALUES (388267, NULL);
INSERT INTO `空间类型设置` VALUES (388268, NULL);
INSERT INTO `空间类型设置` VALUES (388269, NULL);
INSERT INTO `空间类型设置` VALUES (388270, NULL);
INSERT INTO `空间类型设置` VALUES (388271, NULL);
INSERT INTO `空间类型设置` VALUES (388272, NULL);
INSERT INTO `空间类型设置` VALUES (388273, NULL);
INSERT INTO `空间类型设置` VALUES (388274, NULL);
INSERT INTO `空间类型设置` VALUES (388275, NULL);
INSERT INTO `空间类型设置` VALUES (388276, NULL);
INSERT INTO `空间类型设置` VALUES (388277, NULL);
INSERT INTO `空间类型设置` VALUES (388278, NULL);
INSERT INTO `空间类型设置` VALUES (388279, NULL);
INSERT INTO `空间类型设置` VALUES (388280, NULL);
INSERT INTO `空间类型设置` VALUES (388281, NULL);
INSERT INTO `空间类型设置` VALUES (388282, NULL);
INSERT INTO `空间类型设置` VALUES (388283, NULL);
INSERT INTO `空间类型设置` VALUES (388284, NULL);
INSERT INTO `空间类型设置` VALUES (388285, NULL);
INSERT INTO `空间类型设置` VALUES (388286, NULL);
INSERT INTO `空间类型设置` VALUES (388287, NULL);
INSERT INTO `空间类型设置` VALUES (388288, NULL);
INSERT INTO `空间类型设置` VALUES (388289, NULL);
INSERT INTO `空间类型设置` VALUES (388290, NULL);
INSERT INTO `空间类型设置` VALUES (388291, NULL);
INSERT INTO `空间类型设置` VALUES (388292, NULL);
INSERT INTO `空间类型设置` VALUES (388293, NULL);
INSERT INTO `空间类型设置` VALUES (388294, NULL);
INSERT INTO `空间类型设置` VALUES (388295, NULL);
INSERT INTO `空间类型设置` VALUES (388296, NULL);
INSERT INTO `空间类型设置` VALUES (388297, NULL);
INSERT INTO `空间类型设置` VALUES (388298, NULL);
INSERT INTO `空间类型设置` VALUES (388299, NULL);
INSERT INTO `空间类型设置` VALUES (388300, NULL);
INSERT INTO `空间类型设置` VALUES (388301, NULL);
INSERT INTO `空间类型设置` VALUES (388302, NULL);
INSERT INTO `空间类型设置` VALUES (388303, NULL);
INSERT INTO `空间类型设置` VALUES (388304, NULL);
INSERT INTO `空间类型设置` VALUES (388305, NULL);
INSERT INTO `空间类型设置` VALUES (388306, NULL);
INSERT INTO `空间类型设置` VALUES (388307, NULL);
INSERT INTO `空间类型设置` VALUES (388308, NULL);
INSERT INTO `空间类型设置` VALUES (388309, NULL);
INSERT INTO `空间类型设置` VALUES (388310, NULL);
INSERT INTO `空间类型设置` VALUES (388311, NULL);
INSERT INTO `空间类型设置` VALUES (388312, NULL);
INSERT INTO `空间类型设置` VALUES (388313, NULL);
INSERT INTO `空间类型设置` VALUES (388314, NULL);
INSERT INTO `空间类型设置` VALUES (388315, NULL);
INSERT INTO `空间类型设置` VALUES (388316, NULL);
INSERT INTO `空间类型设置` VALUES (388317, NULL);
INSERT INTO `空间类型设置` VALUES (388318, NULL);
INSERT INTO `空间类型设置` VALUES (388319, NULL);
INSERT INTO `空间类型设置` VALUES (388320, NULL);
INSERT INTO `空间类型设置` VALUES (388321, NULL);
INSERT INTO `空间类型设置` VALUES (388322, NULL);
INSERT INTO `空间类型设置` VALUES (388323, NULL);
INSERT INTO `空间类型设置` VALUES (388324, NULL);
INSERT INTO `空间类型设置` VALUES (388325, NULL);

-- ----------------------------
-- Table structure for 窗
-- ----------------------------
DROP TABLE IF EXISTS `窗`;
CREATE TABLE `窗`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `顶高度` double NULL DEFAULT NULL,
  `底高度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK窗1`(`类型 ID`) USING BTREE,
  INDEX `FK窗2`(`创建的阶段`) USING BTREE,
  INDEX `FK窗3`(`拆除的阶段`) USING BTREE,
  INDEX `FK窗4`(`设计选项`) USING BTREE,
  INDEX `FK窗5`(`标高`) USING BTREE,
  CONSTRAINT `FK窗1` FOREIGN KEY (`类型 ID`) REFERENCES `窗类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK窗2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK窗3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK窗4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK窗5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 窗
-- ----------------------------

-- ----------------------------
-- Table structure for 窗类型
-- ----------------------------
DROP TABLE IF EXISTS `窗类型`;
CREATE TABLE `窗类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `可见光透过率` double NULL DEFAULT NULL,
  `日光得热系数` double NULL DEFAULT NULL,
  `热阻(R)` double NULL DEFAULT NULL,
  `传热系数(U)` double NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `粗略宽度` double NULL DEFAULT NULL,
  `粗略高度` double NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `高度` double NULL DEFAULT NULL,
  `操作` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `构造类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK窗类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK窗类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK窗类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK窗类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 窗类型
-- ----------------------------

-- ----------------------------
-- Table structure for 管件
-- ----------------------------
DROP TABLE IF EXISTS `管件`;
CREATE TABLE `管件`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `重要路径` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `最大尺寸` double NULL DEFAULT NULL,
  `最小尺寸` double NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管件1`(`类型 ID`) USING BTREE,
  INDEX `FK管件2`(`创建的阶段`) USING BTREE,
  INDEX `FK管件3`(`拆除的阶段`) USING BTREE,
  INDEX `FK管件4`(`设计选项`) USING BTREE,
  INDEX `FK管件5`(`标高`) USING BTREE,
  CONSTRAINT `FK管件1` FOREIGN KEY (`类型 ID`) REFERENCES `管件类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管件2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管件3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管件4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管件5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管件
-- ----------------------------
INSERT INTO `管件` VALUES (1642662, 591994, 86961, NULL, NULL, NULL, 'Z3', '20 mm-20 mm-20 mm', 0, NULL, NULL, 860908, '家用冷水', 'Z3 1', 0.02, 0.02, '20 mm-20 mm-20 mm', NULL, 0.000042365172997497965, NULL, NULL, 1581413, '5436', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1642666, 591183, 86961, NULL, NULL, NULL, 'Z3', '20 mm-20 mm', 0, NULL, NULL, 860908, '家用冷水', 'Z3 1', 0.02, 0.02, '20 mm-20 mm', NULL, 0.000021586793027177142, NULL, NULL, 1581413, '5458', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1642668, 591183, 86961, NULL, NULL, NULL, 'Z3', '20 mm-20 mm', 0, NULL, NULL, 860908, '家用冷水', 'Z3 1', 0.02, 0.02, '20 mm-20 mm', NULL, 0.000021586793027177142, NULL, NULL, 1581413, '5459', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1642670, 592842, 86961, NULL, NULL, NULL, 'Z3', '25 mm-20 mm', 0, NULL, NULL, 860908, '家用冷水', 'Z3 1', 0.025, 0.02, '25 mm-20 mm', NULL, 0.000036219961888742824, 0.0012763139246257237, NULL, 1581413, '5460', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1642674, 591183, 86961, NULL, NULL, NULL, 'Z3', '25 mm-25 mm', 0, NULL, NULL, 860908, '家用冷水', 'Z3 1', 0.025, 0.025, '25 mm-25 mm', NULL, 0.0000344056407695878, NULL, NULL, 1581413, '5462', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1689306, 591994, 86961, NULL, NULL, NULL, 'RH', '20 mm-20 mm-20 mm', 0, NULL, NULL, 860867, '家用热水', 'RH 2', 0.02, 0.02, '20 mm-20 mm-20 mm', NULL, 0.000042365172997497965, NULL, NULL, 1581419, '6870', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1689312, 591183, 86961, NULL, NULL, NULL, 'RH', '20 mm-20 mm', 0, NULL, NULL, 860867, '家用热水', 'RH 2', 0.02, 0.02, '20 mm-20 mm', NULL, 0.00002158679302717714, NULL, NULL, 1581419, '6871', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1689318, 591183, 86961, NULL, NULL, NULL, 'RH', '20 mm-20 mm', 0, NULL, NULL, 860867, '家用热水', 'RH 2', 0.02, 0.02, '20 mm-20 mm', NULL, 0.00002158679302717714, NULL, NULL, 1581419, '6872', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1689377, 591183, 86961, NULL, NULL, NULL, 'J', '20 mm-20 mm', 0, NULL, NULL, 860822, '家用冷水', 'J 4', 0.02, 0.02, '20 mm-20 mm', NULL, 0.00002158679302717714, NULL, NULL, 1581419, '6877', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1689379, 591994, 86961, NULL, NULL, NULL, 'J', '20 mm-20 mm-20 mm', 0, NULL, NULL, 860822, '家用冷水', 'J 4', 0.02, 0.02, '20 mm-20 mm-20 mm', NULL, 0.000042365172997497965, NULL, NULL, 1581419, '6878', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1689438, 591183, 86961, NULL, NULL, NULL, 'Z2', '50 mm-50 mm', 0, NULL, NULL, 885930, '其他', 'Z2 3', 0.05, 0.05, '50 mm-50 mm', NULL, 0.00022877128343219247, NULL, NULL, 1581419, '6882', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1689440, 591994, 86961, NULL, NULL, NULL, 'Z2', '50 mm-50 mm-50 mm', 0, NULL, NULL, 885930, '其他', 'Z2 3', 0.05, 0.05, '50 mm-50 mm-50 mm', NULL, 0.0004752059540976258, NULL, NULL, 1581419, '6883', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (1863230, 591183, 86961, NULL, NULL, NULL, 'RH', '20 mm-20 mm', 0, NULL, NULL, 860867, '家用热水', 'RH 2', 0.02, 0.02, '20 mm-20 mm', NULL, 0.000021586793027177142, NULL, NULL, 1581419, '6006', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2067579, 591183, 86961, NULL, NULL, NULL, 'n', '32 mm-32 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', 0.032, 0.032, '32 mm-32 mm', NULL, 0.00007030263264583194, NULL, NULL, 1581419, '5864', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2095463, 589540, 86961, NULL, NULL, NULL, 'n', '32 mm-32 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', 0.032, 0.032, '32 mm-32 mm', NULL, 0.0000797203185411449, NULL, NULL, 1581419, '5859', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2095465, 591994, 86961, NULL, NULL, NULL, 'n', '32 mm-32 mm-32 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', 0.032, 0.032, '32 mm-32 mm-32 mm', NULL, 0.0001763509363576806, NULL, NULL, 1581419, '6020', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2116588, 591994, 86961, NULL, NULL, NULL, 'ZP', '65 mm-65 mm-65 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.065, 0.065, '65 mm-65 mm-65 mm', NULL, 0.0008245568921459183, NULL, NULL, 1581419, '6038', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2117638, 591183, 86961, NULL, NULL, NULL, 'J', '25 mm-25 mm', 0, NULL, NULL, 860822, '家用冷水', 'J 4', 0.025, 0.025, '25 mm-25 mm', NULL, 0.0000344056407695878, NULL, NULL, 1581419, '6876', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2130518, 591183, 86961, NULL, NULL, NULL, 'ZP', '80 mm-80 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.08, 0.08, '80 mm-80 mm', NULL, 0.0007409925174148471, NULL, NULL, 1581419, '5470', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2130843, 592842, 86961, NULL, NULL, NULL, 'ZP', '80 mm-65 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.08, 0.065, '80 mm-65 mm', NULL, 0.0004592711969388379, 0.007792060141907234, NULL, 1581419, '5762', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2130908, 591183, 86961, NULL, NULL, NULL, 'RG', '25 mm-25 mm', 0, NULL, NULL, 860821, '家用热水', 'RG 2', 0.025, 0.025, '25 mm-25 mm', NULL, 0.0000344056407695878, NULL, NULL, 1581419, '5777', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2130972, 591183, 86961, NULL, NULL, NULL, 'Z2', '50 mm-50 mm', 0, NULL, NULL, 885930, '其他', 'Z2 3', 0.05, 0.05, '50 mm-50 mm', NULL, 0.0002287712834321924, NULL, NULL, 1581419, '5675', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2130974, 591183, 86961, NULL, NULL, NULL, 'J', '25 mm-25 mm', 0, NULL, NULL, 860822, '家用冷水', 'J 4', 0.025, 0.025, '25 mm-25 mm', NULL, 0.0000344056407695878, NULL, NULL, 1581419, '5678', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2133292, 591183, 86961, NULL, NULL, NULL, 'LH', '65 mm-65 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', 0.065, 0.065, '65 mm-65 mm', NULL, 0.00042074833153976616, NULL, NULL, 1581419, '5857', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2133294, 591183, 86961, NULL, NULL, NULL, 'LG', '65 mm-65 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', 0.065, 0.065, '65 mm-65 mm', NULL, 0.00042074833153976616, NULL, NULL, 1581419, '5854', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2133298, 592842, 86961, NULL, NULL, NULL, 'J', '25 mm-20 mm', 0, NULL, NULL, 860822, '家用冷水', 'J 4', 0.025, 0.02, '25 mm-20 mm', NULL, 0.00003616352285315539, 0.0012763139246257096, NULL, 1581419, '6879', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2133300, 591183, 86961, NULL, NULL, NULL, 'RG', '25 mm-25 mm', 0, NULL, NULL, 860821, '家用热水', 'RG 2', 0.025, 0.025, '25 mm-25 mm', NULL, 0.0000344056407695878, NULL, NULL, 1581419, '6888', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2133302, 591183, 86961, NULL, NULL, NULL, 'Z2', '50 mm-50 mm', 0, NULL, NULL, 885930, '其他', 'Z2 3', 0.05, 0.05, '50 mm-50 mm', NULL, 0.0002287712834321924, NULL, NULL, 1581419, '6881', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169049, 592842, 86961, NULL, NULL, NULL, 'ZP', '40 mm-25 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.04, 0.025, '40 mm-25 mm', NULL, 0.00008461287948567149, 0.0023652417631288302, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169052, 592842, 86961, NULL, NULL, NULL, 'ZP', '50 mm-40 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.05, 0.04, '50 mm-40 mm', NULL, 0.00017651445549472412, 0.003936196662189887, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169158, 591183, 86961, NULL, NULL, NULL, 'ZP', '50 mm-50 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.05, 0.05, '50 mm-50 mm', NULL, 0.0002287712834321924, NULL, NULL, 1581419, '113', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169173, 591994, 86961, NULL, NULL, NULL, 'LG', '100 mm-100 mm-100 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', 0.1, 0.1, '100 mm-100 mm-100 mm', NULL, 0.0027342503416441025, NULL, NULL, 1581419, '5849', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169181, 592842, 86961, NULL, NULL, NULL, 'LG', '100 mm-65 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', 0.1, 0.065, '100 mm-65 mm', NULL, 0.0007136085589349468, 0.010254601430671303, NULL, 1581419, '5894', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169183, 591994, 86961, NULL, NULL, NULL, 'LH', '100 mm-100 mm-100 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', 0.1, 0.1, '100 mm-100 mm-100 mm', NULL, 0.0027342503416441025, NULL, NULL, 1581419, '5856', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169191, 592842, 86961, NULL, NULL, NULL, 'LH', '100 mm-65 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', 0.1, 0.065, '100 mm-65 mm', NULL, 0.0007136085589349468, 0.010254601430671303, NULL, 1581419, '5938', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169210, 592842, 86961, NULL, NULL, NULL, 'LG', '100 mm-65 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', 0.1, 0.065, '100 mm-65 mm', NULL, 0.0007136085589349468, 0.010254601430671303, NULL, 1581419, '95', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169212, 592842, 86961, NULL, NULL, NULL, 'LH', '100 mm-65 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', 0.1, 0.065, '100 mm-65 mm', NULL, 0.0007136085589349468, 0.010254601430671303, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169335, 591183, 86961, NULL, NULL, NULL, 'ZP', '150 mm-150 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.15, 0.15, '150 mm-150 mm', NULL, 0.0053113941162131915, NULL, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169430, 592842, 86961, NULL, NULL, NULL, 'ZP', '65 mm-50 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.065, 0.05, '65 mm-50 mm', NULL, 0.00031120063620822757, 0.005967194250478146, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169435, 592842, 86961, NULL, NULL, NULL, 'ZP', '65 mm-50 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.065, 0.05, '65 mm-50 mm', NULL, 0.00031109148372079264, 0.005967194250478192, NULL, 1581419, '5765', NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169496, 592842, 86961, NULL, NULL, NULL, 'LH', '65 mm-50 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', 0.065, 0.05, '65 mm-50 mm', NULL, 0.00031120063620822757, 0.005967194250478146, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169498, 592842, 86961, NULL, NULL, NULL, 'LG', '65 mm-50 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', 0.065, 0.05, '65 mm-50 mm', NULL, 0.00031120063620822757, 0.005967194250478146, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169502, 592842, 86961, NULL, NULL, NULL, 'n', '32 mm-25 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', 0.032, 0.025, '32 mm-25 mm', NULL, 0.000057334755015605236, 0.0016613343867369782, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169511, 591183, 86961, NULL, NULL, NULL, 'ZP', '80 mm-80 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.08, 0.08, '80 mm-80 mm', NULL, 0.0007409925174148471, NULL, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169513, 592842, 86961, NULL, NULL, NULL, 'ZP', '100 mm-80 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.1, 0.08, '100 mm-80 mm', NULL, 0.0008308250003715995, 0.01125200607111517, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169516, 592842, 86961, NULL, NULL, NULL, 'ZP', '150 mm-100 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', 0.15000000000000002, 0.1, '150 mm-100 mm', NULL, 0.0022215477227749015, 0.021700914158330444, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169631, 592842, 86961, NULL, NULL, NULL, 'n', '32 mm-25 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', 0.032, 0.025, '32 mm-25 mm', NULL, 0.00005738970607809504, 0.0016613343867369576, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169635, 592842, 86961, NULL, NULL, NULL, 'LG', '65 mm-50 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', 0.065, 0.05, '65 mm-50 mm', NULL, 0.00031120063620822757, 0.005967194250478146, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `管件` VALUES (2169639, 592842, 86961, NULL, NULL, NULL, 'LH', '65 mm-50 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', 0.065, 0.05, '65 mm-50 mm', NULL, 0.00031109148372079264, 0.005967194250478192, NULL, 1581419, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 管件类型
-- ----------------------------
DROP TABLE IF EXISTS `管件类型`;
CREATE TABLE `管件类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管件类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK管件类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK管件类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管件类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管件类型
-- ----------------------------
INSERT INTO `管件类型` VALUES (462027, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '弯头 - PVC-U - 排水', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (463003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '顺水三通 - PVC-U - 排水', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (463848, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '同心变径管 - PVC-U - 排水', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (464623, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管接头 - PVC-U - 排水', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (465445, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管帽 - PVC-U - 排水', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (466444, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '双 45 度 Y 形三通 - PVC-U - 排水', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (588754, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管帽 - 常规', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (589540, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管接头 - 常规', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (590371, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '四通 - 常规', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (591183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '弯头 - 常规', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (591994, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T 形三通 - 常规', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (592842, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '过渡件 - 常规', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (856866, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.60.30.11.14', NULL, 'T型三通（异）', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (860845, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.60.30.11.14', NULL, '碳钢-三通（异）-焊接', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (860848, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '顺水四通 - PVC-U - 排水', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (860909, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.60.30.11.14', NULL, 'TY三通', 'TY三通', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (865419, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.60.30.11.14', NULL, '直接头', '直接头', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (866200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.60.30.11.14', NULL, 'M_T 形三通 - 焊接 - 常规', 'M_T 形三通 - 焊接 - 常规', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (867021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'P 型存水弯 - PVC-U - 排水', 'P 型存水弯 - PVC-U - 排水', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (867875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'P 型存水弯', 'P 型存水弯', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (868699, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S 型存水弯 - PVC-U - 排水', 'S 型存水弯 - PVC-U - 排水', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (871236, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.60.30.11.14', NULL, 'Y三通', 'Y三通', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (872058, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.60.30.11.14', NULL, '大便器接头', '大便器接头', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (872871, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.60.30.11.14', NULL, '管箍', '管箍', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (875112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管帽 - PVC-U - 排水', '管帽 - PVC-U - 排水', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (875845, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管帽 - 常规', '管帽 - 常规', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (876581, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管帽', '管帽', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (878229, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '检查口 - PVC-U - 排水', '检查口 - PVC-U - 排水', NULL, NULL, NULL, NULL);
INSERT INTO `管件类型` VALUES (879142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '双 45 度 Y 形三通 - PVC-U - 排水', '双 45 度 Y 形三通 - PVC-U - 排水', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 管段
-- ----------------------------
DROP TABLE IF EXISTS `管段`;
CREATE TABLE `管段`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `管段描述` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `连接类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `粗糙度` double NULL DEFAULT NULL,
  `材质` int NULL DEFAULT NULL,
  `规格类型` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管段1`(`设计选项`) USING BTREE,
  INDEX `FK管段2`(`材质`) USING BTREE,
  CONSTRAINT `FK管段1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管段2` FOREIGN KEY (`材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管段
-- ----------------------------
INSERT INTO `管段` VALUES (680419, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680420, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680435, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680436, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680522, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680524, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680526, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680528, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680530, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680532, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680536, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680538, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680540, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680542, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680544, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (680570, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (856833, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (860877, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (860878, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (860879, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (860880, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (860881, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (860896, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (860899, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管段` VALUES (860902, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 管道
-- ----------------------------
DROP TABLE IF EXISTS `管道`;
CREATE TABLE `管道`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `底部高程` double NULL DEFAULT NULL,
  `顶部高程` double NULL DEFAULT NULL,
  `环边界` int NULL DEFAULT NULL,
  `重要路径` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `管段描述` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `连接类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `卫浴装置当量` double NULL DEFAULT NULL,
  `外径` double NULL DEFAULT NULL,
  `管内底标高` double NULL DEFAULT NULL,
  `其他流量` double NULL DEFAULT NULL,
  `直径` double NULL DEFAULT NULL,
  `流量` double NULL DEFAULT NULL,
  `内径` double NULL DEFAULT NULL,
  `雷诺数` double NULL DEFAULT NULL,
  `相对粗糙度` double NULL DEFAULT NULL,
  `流量状态` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `摩擦系数` double NULL DEFAULT NULL,
  `速度` double NULL DEFAULT NULL,
  `摩擦` double NULL DEFAULT NULL,
  `压降` double NULL DEFAULT NULL,
  `粗糙度` double NULL DEFAULT NULL,
  `材质` int NULL DEFAULT NULL,
  `规格类型` int NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `剖面` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `管道编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管道1`(`类型 ID`) USING BTREE,
  INDEX `FK管道2`(`创建的阶段`) USING BTREE,
  INDEX `FK管道3`(`拆除的阶段`) USING BTREE,
  INDEX `FK管道4`(`设计选项`) USING BTREE,
  INDEX `FK管道5`(`材质`) USING BTREE,
  CONSTRAINT `FK管道1` FOREIGN KEY (`类型 ID`) REFERENCES `管道类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道5` FOREIGN KEY (`材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道
-- ----------------------------
INSERT INTO `管道` VALUES (1629192, 860892, 86961, NULL, NULL, 3.1158624999999835, 3.2841375000000017, NULL, NULL, 'ZP', '150 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', NULL, '常规', NULL, 0.168275, 13.122974499999984, NULL, 0.15, NULL, 0.154051, NULL, 0.09046001648804616, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '150 mm', 58, NULL, NULL, 20.295999999910794, '4333', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1630000, 860892, 86961, NULL, NULL, 3.142849999999998, 3.257149999999998, NULL, NULL, 'ZP', '100 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', NULL, '常规', NULL, 0.11430000000000001, 13.148869999999999, NULL, 0.1, NULL, 0.10226, NULL, 0.13627475063563466, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '100 mm', 606, NULL, NULL, 6.57520879873248, '4408', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1630532, 860892, 86961, NULL, NULL, 3.1158624999999835, 3.2841375000000017, NULL, NULL, 'ZP', '150 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', NULL, '常规', NULL, 0.168275, 13.122974499999984, NULL, 0.15000000000000002, NULL, 0.154051, NULL, 0.09046001648804616, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '150 mm', 58, NULL, NULL, 4.355014075695275, '4437', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1642029, 860892, 86961, NULL, NULL, 3.1832995000000026, 3.216700500000009, NULL, NULL, 'ZP', '25 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', NULL, '常规', NULL, 0.033401, 13.186677500000004, NULL, 0.025, NULL, 0.026645000000000002, NULL, 0.5230045411897166, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '25 mm', 64, NULL, NULL, 2.180284613904637, '5247', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1642080, 860892, 86961, NULL, NULL, 3.1698374999999865, 3.2301624999999987, NULL, NULL, 'ZP', '50 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', NULL, '常规', NULL, 0.06032500000000001, 13.173748999999988, NULL, 0.05, NULL, 0.05250200000000001, NULL, 0.26542714563254727, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '50 mm', 513, NULL, NULL, 3.242789095123331, '5253', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1642086, 860892, 86961, NULL, NULL, 3.175869999999994, 3.224130000000013, NULL, NULL, 'ZP', '40 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', NULL, '常规', NULL, 0.04826, 13.179552999999993, NULL, 0.04, NULL, 0.040894, NULL, 0.34077018633540374, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '40 mm', 601, NULL, NULL, 2.5109265353505257, '5254', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1642654, 860890, 86961, NULL, NULL, 5.17238513765137, 5.197385137651371, NULL, NULL, 'Z3', '20 mm', 0, NULL, NULL, 860908, '家用冷水', 'Z3 1', NULL, '常规', 0, 0.025, 5.17413513765137, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 2, NULL, NULL, 9.762088277211312, '4891', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1642656, 860890, 86961, NULL, NULL, 5.17238513765137, 5.197385137651371, NULL, NULL, 'Z3', '20 mm', 0, NULL, NULL, 860908, '家用冷水', 'Z3 1', NULL, '常规', 0, 0.025, 5.17413513765137, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 2, NULL, NULL, 1.1420247293005548, '4892', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1642658, 860890, 86961, NULL, NULL, 5.168885137651371, 5.200885137651379, NULL, NULL, 'Z3', '25 mm', 0, NULL, NULL, 860908, '家用冷水', 'Z3 1', NULL, '常规', 0, 0.032, 5.17108513765137, 0, 0.025, 0, 0.027600000000000003, 0, 0.035057246376811596, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '25 mm', 4, NULL, NULL, 23.32508828125, '4893', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1642660, 860890, 86961, NULL, NULL, 5.17238513765137, 5.197385137651371, NULL, NULL, 'Z3', '20 mm', 0, NULL, NULL, 860908, '家用冷水', 'Z3 1', NULL, '常规', 0, 0.025, 5.17413513765137, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 3, NULL, NULL, 1.0412110246939164, '4894', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1642663, 860890, 86961, NULL, NULL, 5.17238513765137, 5.197385137651371, NULL, NULL, 'Z3', '20 mm', 0, NULL, NULL, 860908, '家用冷水', 'Z3 1', NULL, '常规', 0, 0.025, 5.17413513765137, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 1, NULL, NULL, 1.352090300983779, '4895', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1642672, 860890, 86961, NULL, NULL, 1.8848851376513664, 5.159885137651376, NULL, NULL, 'Z3', '25 mm', 0, NULL, NULL, 860908, '家用冷水', 'Z3 1', NULL, '常规', 0, 0.032, 1.8848851376513664, 0, 0.025, 0, 0.027600000000000003, 0, 0.035057246376811596, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '25 mm', 4, NULL, NULL, 3.2750000000000092, '4896', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1654862, 856867, 86961, NULL, NULL, 2.969837499999991, 3.030162500000012, NULL, NULL, 'LG', '50 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', NULL, '常规', NULL, 0.06032500000000001, 12.973749099999992, 0, 0.05, 0, 0.05250180000000001, 0, 0.2654281567489114, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '50 mm', 51, NULL, NULL, 9.807167851228348, '5309', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1654868, 856867, 86961, NULL, NULL, 2.9698374999999952, 3.030162500000014, NULL, NULL, 'LH', '50 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', NULL, '常规', NULL, 0.06032500000000001, 12.973749099999996, 0, 0.05, 0, 0.05250180000000001, 0, 0.2654281567489114, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '50 mm', 51, NULL, NULL, 9.85022786036805, '5310', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1654874, 856867, 86961, NULL, NULL, 2.9832994999999896, 3.0167005000000047, NULL, NULL, 'n', '25 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', NULL, '常规', 0, 0.033401, 12.986677699999989, NULL, 0.025, NULL, 0.0266446, NULL, 0.5230123927550047, NULL, NULL, NULL, NULL, NULL, 0.013935456, 856834, 293140, '25 mm', 28, NULL, NULL, 10.019057083993825, '5311', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1654949, 856867, 86961, NULL, NULL, 2.9832994999999918, 3.016700500000011, NULL, NULL, 'n', '25 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', NULL, '常规', 0, 0.033401, 12.986677699999992, NULL, 0.025, NULL, 0.0266446, NULL, 0.5230123927550047, NULL, NULL, NULL, NULL, NULL, 0.013935456, 856834, 293140, '25 mm', 9, NULL, NULL, 10.052015955833948, '5316', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1655009, 856867, 86961, NULL, NULL, 2.969837499999991, 3.030162500000014, NULL, NULL, 'LH', '50 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', NULL, '常规', NULL, 0.06032500000000001, 12.973749099999992, 0, 0.05, 0, 0.05250180000000001, 0, 0.2654281567489114, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '50 mm', 32, NULL, NULL, 9.810666948367109, '5321', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1655158, 856867, 86961, NULL, NULL, 2.969837499999991, 3.030162500000012, NULL, NULL, 'LG', '50 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', NULL, '常规', NULL, 0.06032500000000001, 12.973749099999992, 0, 0.05, 0, 0.05250180000000001, 0, 0.2654281567489114, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '50 mm', 32, NULL, NULL, 9.878719854340464, '5325', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1655551, 856867, 86961, NULL, NULL, 2.9789180000000064, 3.021082000000009, NULL, NULL, 'n', '32 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', NULL, '常规', 0, 0.042164, 12.982474000000009, NULL, 0.032, NULL, 0.035052, NULL, 0.39756521739130435, NULL, NULL, NULL, NULL, NULL, 0.013935456, 856834, 293140, '32 mm', 15, NULL, NULL, 10.198982414364675, '5353', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1655573, 856867, 86961, NULL, NULL, 2.9634875000000074, 3.036512500000006, NULL, NULL, 'LG', '65 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', NULL, '常规', NULL, 0.073025, 12.968643700000008, 0, 0.065, 0, 0.06271260000000001, 0, 0.22221142162818952, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '65 mm', 142, NULL, NULL, 7.214471185670775, '5357', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1655595, 856867, 86961, NULL, NULL, 2.963487500000003, 3.036512500000017, NULL, NULL, 'LH', '65 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', NULL, '常规', NULL, 0.073025, 12.968643700000005, 0, 0.065, 0, 0.06271260000000001, 0, 0.22221142162818952, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '65 mm', 147, NULL, NULL, 7.880178534657749, '5361', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1657054, 856867, 86961, NULL, NULL, 2.9634874999999856, 3.036512500000006, NULL, NULL, 'LG', '65 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', NULL, '常规', NULL, 0.073025, 12.968643699999987, 0, 0.065, 0, 0.06271260000000001, 0, 0.22221142162818952, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '65 mm', 165, NULL, NULL, 10.689832148627033, '5530', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1657076, 856867, 86961, NULL, NULL, 2.96348749999999, 3.036512500000008, NULL, NULL, 'LH', '65 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', NULL, '常规', NULL, 0.073025, 12.96864369999999, 0, 0.065, 0, 0.06271260000000001, 0, 0.22221142162818952, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '65 mm', 176, NULL, NULL, 10.496770509830585, '5534', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1657134, 856867, 86961, NULL, NULL, 2.978917999999998, 3.021082000000009, NULL, NULL, 'n', '32 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', NULL, '常规', 0, 0.042164, 12.982474, NULL, 0.032, NULL, 0.035052, NULL, 0.39756521739130435, NULL, NULL, NULL, NULL, NULL, 0.013935456, 856834, 293140, '32 mm', 32, NULL, NULL, 10.24794128620479, '5538', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689298, 860891, 86961, NULL, NULL, 2.9875000000000007, 3.0124999999999997, NULL, NULL, 'RH', '20 mm', 0, NULL, NULL, 860867, '家用热水', 'RH 2', NULL, '常规', 0, 0.025, 12.989250000000002, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 8, NULL, NULL, 6.9100880500062125, '6043', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689300, 860891, 86961, NULL, NULL, 2.9875000000000007, 3.0124999999999997, NULL, NULL, 'RH', '20 mm', 0, NULL, NULL, 860867, '家用热水', 'RH 2', NULL, '常规', 0, 0.025, 12.989250000000002, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 4, NULL, NULL, 1.052088476215855, '6044', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689304, 860891, 86961, NULL, NULL, 2.9875000000000007, 3.0124999999999997, NULL, NULL, 'RH', '20 mm', 0, NULL, NULL, 860867, '家用热水', 'RH 2', NULL, '常规', 0, 0.025, 12.989250000000002, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 3, NULL, NULL, 1.8520882810729367, '6045', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689307, 860891, 86961, NULL, NULL, 2.9875000000000007, 3.0124999999999997, NULL, NULL, 'RH', '20 mm', 0, NULL, NULL, 860867, '家用热水', 'RH 2', NULL, '常规', 0, 0.025, 12.989250000000002, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 8, NULL, NULL, 2.102088281208036, '6046', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689310, 860891, 86961, NULL, NULL, 0, 2.9810882812500026, NULL, NULL, 'RH', '20 mm', 0, NULL, NULL, 860867, '家用热水', 'RH 2', NULL, '常规', 0, 0.025, 10, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 3, NULL, NULL, 2.9810882812500026, '6047', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689316, 860891, 86961, NULL, NULL, 2.9875000000000007, 3.0124999999999997, NULL, NULL, 'RH', '20 mm', 0, NULL, NULL, 860867, '家用热水', 'RH 2', NULL, '常规', 0, 0.025, 12.989250000000002, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 4, NULL, NULL, 1.6721765289640516, '6049', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689365, 860890, 86961, NULL, NULL, 2.9874999999999967, 3.0124999999999953, NULL, NULL, 'J', '20 mm', 0, NULL, NULL, 860822, '家用冷水', 'J 4', NULL, '常规', 0, 0.025, 12.989249999999997, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 1, NULL, NULL, 3.2085400355944196, '6053', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689367, 860890, 86961, NULL, NULL, 2.9839999999999907, 3.016000000000001, NULL, NULL, 'J', '25 mm', 0, NULL, NULL, 860822, '家用冷水', 'J 4', NULL, '常规', 0, 0.032, 12.986199999999993, 0, 0.025, 0, 0.027600000000000003, 0, 0.035057246376811596, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '25 mm', 12, NULL, NULL, 2.1099999990221634, '6054', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689369, 860890, 86961, NULL, NULL, 2.9839999999999995, 3.016000000000001, NULL, NULL, 'J', '25 mm', 0, NULL, NULL, 860822, '家用冷水', 'J 4', NULL, '常规', 0, 0.032, 12.986200000000002, 0, 0.025, 0, 0.027600000000000003, 0, 0.035057246376811596, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '25 mm', 12, NULL, NULL, 1.4092762443246758, '6055', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689375, 860890, 86961, NULL, NULL, 2.9874999999999967, 3.0124999999999953, NULL, NULL, 'J', '20 mm', 0, NULL, NULL, 860822, '家用冷水', 'J 4', NULL, '常规', 0, 0.025, 12.989249999999997, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 1, NULL, NULL, 1.1826573295130307, '6056', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689424, 860890, 86961, NULL, NULL, 2.9684999999999877, 3.0314999999999994, NULL, NULL, 'Z2', '50 mm', 0, NULL, NULL, 885930, '其他', 'Z2 3', NULL, '常规', NULL, 0.063, 12.972799999999987, NULL, 0.05, NULL, 0.054400000000000004, NULL, 0.017786397058823532, NULL, NULL, NULL, NULL, NULL, 0.0009675800000000001, 860897, 860898, '50 mm', 4, NULL, NULL, 6.927999895956335, '6058', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689426, 860890, 86961, NULL, NULL, 2.968500000000001, 3.0314999999999994, NULL, NULL, 'Z2', '50 mm', 0, NULL, NULL, 885930, '其他', 'Z2 3', NULL, '常规', NULL, 0.063, 12.972800000000001, NULL, 0.05, NULL, 0.054400000000000004, NULL, 0.017786397058823532, NULL, NULL, NULL, NULL, NULL, 0.0009675800000000001, 860897, 860898, '50 mm', 1, NULL, NULL, 3.7349999990879623, '6059', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689428, 860890, 86961, NULL, NULL, 2.9684999999999877, 3.031500000000006, NULL, NULL, 'Z2', '50 mm', 0, NULL, NULL, 885930, '其他', 'Z2 3', NULL, '常规', NULL, 0.063, 12.972799999999987, NULL, 0.05, NULL, 0.054400000000000004, NULL, 0.017786397058823532, NULL, NULL, NULL, NULL, NULL, 0.0009675800000000001, 860897, 860898, '50 mm', 4, NULL, NULL, 2.158937446466854, '6060', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689430, 860890, 86961, NULL, NULL, 2.968500000000001, 3.031500000000006, NULL, NULL, 'Z2', '50 mm', 0, NULL, NULL, 885930, '其他', 'Z2 3', NULL, '常规', NULL, 0.063, 12.972800000000001, NULL, 0.05, NULL, 0.054400000000000004, NULL, 0.017786397058823532, NULL, NULL, NULL, NULL, NULL, 0.0009675800000000001, 860897, 860898, '50 mm', 4, NULL, NULL, 1.5329131159272769, '6061', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689436, 860890, 86961, NULL, NULL, 2.968500000000001, 3.0314999999999994, NULL, NULL, 'Z2', '50 mm', 0, NULL, NULL, 885930, '其他', 'Z2 3', NULL, '常规', NULL, 0.063, 12.972800000000001, NULL, 0.05, NULL, 0.054400000000000004, NULL, 0.017786397058823532, NULL, NULL, NULL, NULL, NULL, 0.0009675800000000001, 860897, 860898, '50 mm', 1, NULL, NULL, 1.2505690482675664, '6062', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689442, 860890, 86961, NULL, NULL, 2.968500000000001, 3.031500000000006, NULL, NULL, 'Z2', '50 mm', 0, NULL, NULL, 885930, '其他', 'Z2 3', NULL, '常规', NULL, 0.063, 12.972800000000001, NULL, 0.05, NULL, 0.054400000000000004, NULL, 0.017786397058823532, NULL, NULL, NULL, NULL, NULL, 0.0009675800000000001, 860897, 860898, '50 mm', 7, NULL, NULL, 7.061999765379443, '6063', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689561, 860891, 86961, NULL, NULL, 2.9839999999999867, 3.0160000000000076, NULL, NULL, 'RG', '25 mm', 0, NULL, NULL, 860821, '家用热水', 'RG 2', NULL, '常规', 0, 0.032, 12.98619999999999, 0, 0.025, 0, 0.027600000000000003, 0, 0.035057246376811596, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '25 mm', 8, NULL, NULL, 3.3000001949239657, '6065', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1689565, 860891, 86961, NULL, NULL, 2.9839999999999995, 3.0160000000000076, NULL, NULL, 'RG', '25 mm', 0, NULL, NULL, 860821, '家用热水', 'RG 2', NULL, '常规', 0, 0.032, 12.986200000000002, 0, 0.025, 0, 0.027600000000000003, 0, 0.035057246376811596, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '25 mm', 8, NULL, NULL, 1.7019129963244535, '6067', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (1759490, 860892, 86961, NULL, NULL, 3.155549999999993, 3.2444500000000054, NULL, NULL, 'ZP', '80 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', NULL, '常规', NULL, 0.0889, 13.161036499999994, NULL, 0.08, NULL, 0.07792700000000001, NULL, 0.1788270560909569, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '80 mm', 582, NULL, NULL, 17.39800000017851, '6120', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2068159, 856867, 86961, NULL, NULL, 2.978917999999998, 3.0210820000000114, NULL, NULL, 'n', '32 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', NULL, '常规', 0, 0.042164, 12.982474, NULL, 0.032, NULL, 0.035052, NULL, 0.39756521739130435, NULL, NULL, NULL, NULL, NULL, 0.013935456, 856834, 293140, '32 mm', 32, NULL, NULL, 9.452627800411694, '6567', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2069192, 856867, 86961, NULL, NULL, 2.942849999999998, 3.0571500000000023, NULL, NULL, 'LG', '100 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', NULL, '常规', NULL, 0.11430000000000001, 12.948869799999999, 0, 0.1, 0, 0.10226040000000002, 0, 0.13627421758569297, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '100 mm', 151, NULL, NULL, 3.260808959844123, '6573', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2070238, 860892, 86961, NULL, NULL, 3.155550000000004, 3.2444500000000116, NULL, NULL, 'ZP', '80 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', NULL, '常规', NULL, 0.0889, 13.161036500000005, NULL, 0.08, NULL, 0.07792700000000001, NULL, 0.1788270560909569, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '80 mm', 582, NULL, NULL, 2.219445042500528, '6582', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2095461, 860892, 86961, NULL, NULL, 2.9789180000000086, 3.0210820000000114, NULL, NULL, 'n', '32 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', NULL, '常规', 0, 0.042164, 12.98247400000001, NULL, 0.032, NULL, 0.035052, NULL, 0.39756521739130435, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '32 mm', 32, NULL, NULL, 2.8103716111537222, '6695', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2095466, 856867, 86961, NULL, NULL, 2.9789179999999935, 3.021082000000009, NULL, NULL, 'n', '32 mm', 0, NULL, NULL, 856868, '卫生设备', 'n 3', NULL, '常规', 0, 0.042164, 12.982473999999995, NULL, 0.032, NULL, 0.035052, NULL, 0.39756521739130435, NULL, NULL, NULL, NULL, NULL, 0.013935456, 856834, 293140, '32 mm', 16, NULL, NULL, 1.2020018326172317, '6696', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2116760, 860892, 86961, NULL, NULL, 3.1698374999999994, 3.2301625000000076, NULL, NULL, 'ZP', '50 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', NULL, '常规', NULL, 0.06032500000000001, 13.173749, NULL, 0.05, NULL, 0.05250200000000001, NULL, 0.26542714563254727, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '50 mm', 566, NULL, NULL, 5.934009450409773, '6760', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2117128, 860891, 86961, NULL, NULL, 2.9839999999999867, 3.016000000000001, NULL, NULL, 'RG', '25 mm', 0, NULL, NULL, 860821, '家用热水', 'RG 2', NULL, '常规', 0, 0.032, 12.98619999999999, 0, 0.025, 0, 0.027600000000000003, 0, 0.035057246376811596, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '25 mm', 8, NULL, NULL, 14.000999780938667, '6768', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2117179, 860890, 86961, NULL, NULL, 2.9839999999999907, 3.0159999999999965, NULL, NULL, 'J', '25 mm', 0, NULL, NULL, 860822, '家用冷水', 'J 4', NULL, '常规', 0, 0.032, 12.986199999999993, 0, 0.025, 0, 0.027600000000000003, 0, 0.035057246376811596, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '25 mm', 12, NULL, NULL, 7.187636767563468, '6771', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2120236, 860890, 86961, NULL, NULL, 2.9874999999999967, 3.0125000000000015, NULL, NULL, 'J', '20 mm', 0, NULL, NULL, 860822, '家用冷水', 'J 4', NULL, '常规', 0, 0.025, 12.989249999999997, 0, 0.02, 0, 0.021500000000000002, 0, 0.045003720930232555, '层流', 0, 0, 0, 0, 0.0009675800000000001, 860897, 860898, '20 mm', 9, NULL, NULL, 6.99699976537488, '6806', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2130236, 856867, 86961, NULL, NULL, 2.9634874999999856, 3.0365125000000015, NULL, NULL, 'LG', '65 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', NULL, '常规', NULL, 0.073025, 12.968643699999987, 0, 0.065, 0, 0.06271260000000001, 0, 0.22221142162818952, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '65 mm', 165, NULL, NULL, 12.128999411566342, '6865', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2130285, 856867, 86961, NULL, NULL, 2.96348749999999, 3.036512500000006, NULL, NULL, 'LH', '65 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', NULL, '常规', NULL, 0.073025, 12.96864369999999, 0, 0.065, 0, 0.06271260000000001, 0, 0.22221142162818952, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '65 mm', 176, NULL, NULL, 12.128999411566323, '6867', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2130291, 856867, 86961, NULL, NULL, 2.942849999999998, 3.0571500000000023, NULL, NULL, 'LH', '100 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', NULL, '常规', NULL, 0.11430000000000001, 12.948869799999999, 0, 0.1, 0, 0.10226040000000002, 0, 0.13627421758569297, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '100 mm', 113, NULL, NULL, 2.5131528871737667, '6868', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2131091, 860892, 86961, NULL, NULL, 3.163487500000003, 3.236512500000006, NULL, NULL, 'ZP', '65 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', NULL, '常规', NULL, 0.073025, 13.168643500000002, NULL, 0.065, NULL, 0.062713, NULL, 0.22221000430532742, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '65 mm', 604, NULL, NULL, 4.894162471714781, '6874', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2131111, 860892, 86961, NULL, NULL, 3.1698374999999865, 3.2301625000000076, NULL, NULL, 'ZP', '50 mm', 0, NULL, NULL, 860863, '湿式消防系统', 'ZP 1', NULL, '常规', NULL, 0.06032500000000001, 13.173748999999988, NULL, 0.05, NULL, 0.05250200000000001, NULL, 0.26542714563254727, NULL, NULL, NULL, NULL, NULL, 0.013935456, 860895, 860839, '50 mm', 513, NULL, NULL, 1.979615343019427, '6876', NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2169174, 856867, 86961, NULL, NULL, 2.942849999999987, 3.0571499999999983, NULL, NULL, 'LG', '100 mm', 0, NULL, NULL, 856847, '循环供水', 'LG 3', NULL, '常规', NULL, 0.11430000000000001, 12.948869799999988, 0, 0.1, 0, 0.10226040000000002, 0, 0.13627421758569297, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '100 mm', 175, NULL, NULL, 0.8450002029604937, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道` VALUES (2169184, 856867, 86961, NULL, NULL, 2.942849999999998, 3.0571500000000023, NULL, NULL, 'LH', '100 mm', 0, NULL, NULL, 856848, '循环回水', 'LH 3', NULL, '常规', NULL, 0.11430000000000001, 12.948869799999999, 0, 0.1, 0, 0.10226040000000002, 0, 0.13627421758569297, '层流', 0, 0, 0, 0, 0.013935456, 856834, 293140, '100 mm', 181, NULL, NULL, 0.995001832617231, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 管道占位符
-- ----------------------------
DROP TABLE IF EXISTS `管道占位符`;
CREATE TABLE `管道占位符`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `底部高程` double NULL DEFAULT NULL,
  `顶部高程` double NULL DEFAULT NULL,
  `环边界` int NULL DEFAULT NULL,
  `重要路径` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `管段描述` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `连接类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `卫浴装置当量` double NULL DEFAULT NULL,
  `外径` double NULL DEFAULT NULL,
  `管内底标高` double NULL DEFAULT NULL,
  `其他流量` double NULL DEFAULT NULL,
  `直径` double NULL DEFAULT NULL,
  `流量` double NULL DEFAULT NULL,
  `内径` double NULL DEFAULT NULL,
  `雷诺数` double NULL DEFAULT NULL,
  `相对粗糙度` double NULL DEFAULT NULL,
  `流量状态` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `摩擦系数` double NULL DEFAULT NULL,
  `速度` double NULL DEFAULT NULL,
  `摩擦` double NULL DEFAULT NULL,
  `压降` double NULL DEFAULT NULL,
  `粗糙度` double NULL DEFAULT NULL,
  `材质` int NULL DEFAULT NULL,
  `规格类型` int NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `剖面` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管道占位符1`(`类型 ID`) USING BTREE,
  INDEX `FK管道占位符2`(`创建的阶段`) USING BTREE,
  INDEX `FK管道占位符3`(`拆除的阶段`) USING BTREE,
  INDEX `FK管道占位符4`(`设计选项`) USING BTREE,
  INDEX `FK管道占位符5`(`材质`) USING BTREE,
  CONSTRAINT `FK管道占位符1` FOREIGN KEY (`类型 ID`) REFERENCES `管道类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道占位符2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道占位符3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道占位符4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道占位符5` FOREIGN KEY (`材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道占位符
-- ----------------------------

-- ----------------------------
-- Table structure for 管道明细表
-- ----------------------------
DROP TABLE IF EXISTS `管道明细表`;
CREATE TABLE `管道明细表`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管道明细表1`(`类型 ID`) USING BTREE,
  INDEX `FK管道明细表2`(`创建的阶段`) USING BTREE,
  INDEX `FK管道明细表3`(`拆除的阶段`) USING BTREE,
  INDEX `FK管道明细表4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK管道明细表1` FOREIGN KEY (`类型 ID`) REFERENCES `管道明细表类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道明细表2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道明细表3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道明细表4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道明细表
-- ----------------------------

-- ----------------------------
-- Table structure for 管道明细表类型
-- ----------------------------
DROP TABLE IF EXISTS `管道明细表类型`;
CREATE TABLE `管道明细表类型`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道明细表类型
-- ----------------------------
INSERT INTO `管道明细表类型` VALUES (293140);
INSERT INTO `管道明细表类型` VALUES (293141);
INSERT INTO `管道明细表类型` VALUES (293148);
INSERT INTO `管道明细表类型` VALUES (293149);
INSERT INTO `管道明细表类型` VALUES (293150);
INSERT INTO `管道明细表类型` VALUES (293151);
INSERT INTO `管道明细表类型` VALUES (293157);
INSERT INTO `管道明细表类型` VALUES (293158);
INSERT INTO `管道明细表类型` VALUES (461173);
INSERT INTO `管道明细表类型` VALUES (680521);
INSERT INTO `管道明细表类型` VALUES (680523);
INSERT INTO `管道明细表类型` VALUES (680525);
INSERT INTO `管道明细表类型` VALUES (680527);
INSERT INTO `管道明细表类型` VALUES (680529);
INSERT INTO `管道明细表类型` VALUES (680531);
INSERT INTO `管道明细表类型` VALUES (680533);
INSERT INTO `管道明细表类型` VALUES (680535);
INSERT INTO `管道明细表类型` VALUES (680537);
INSERT INTO `管道明细表类型` VALUES (680539);
INSERT INTO `管道明细表类型` VALUES (680541);
INSERT INTO `管道明细表类型` VALUES (680543);
INSERT INTO `管道明细表类型` VALUES (860839);
INSERT INTO `管道明细表类型` VALUES (860840);
INSERT INTO `管道明细表类型` VALUES (860841);
INSERT INTO `管道明细表类型` VALUES (860842);
INSERT INTO `管道明细表类型` VALUES (860843);
INSERT INTO `管道明细表类型` VALUES (860898);
INSERT INTO `管道明细表类型` VALUES (860901);

-- ----------------------------
-- Table structure for 管道材质
-- ----------------------------
DROP TABLE IF EXISTS `管道材质`;
CREATE TABLE `管道材质`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管道材质1`(`类型 ID`) USING BTREE,
  INDEX `FK管道材质2`(`创建的阶段`) USING BTREE,
  INDEX `FK管道材质3`(`拆除的阶段`) USING BTREE,
  INDEX `FK管道材质4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK管道材质1` FOREIGN KEY (`类型 ID`) REFERENCES `管道材质类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道材质2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道材质3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道材质4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道材质
-- ----------------------------

-- ----------------------------
-- Table structure for 管道材质类型
-- ----------------------------
DROP TABLE IF EXISTS `管道材质类型`;
CREATE TABLE `管道材质类型`  (
  `ID` int NOT NULL,
  `粗糙度` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道材质类型
-- ----------------------------
INSERT INTO `管道材质类型` VALUES (293136, 0.000046);
INSERT INTO `管道材质类型` VALUES (293142, 0.000046);
INSERT INTO `管道材质类型` VALUES (293145, 0.00001);
INSERT INTO `管道材质类型` VALUES (293154, 0.0005);
INSERT INTO `管道材质类型` VALUES (461164, 0.0000020000000000000003);
INSERT INTO `管道材质类型` VALUES (461169, 0.0000020000000000000003);
INSERT INTO `管道材质类型` VALUES (461177, 0.0000020000000000000003);
INSERT INTO `管道材质类型` VALUES (461179, 0.0000020000000000000003);
INSERT INTO `管道材质类型` VALUES (856842, 0.013935456);
INSERT INTO `管道材质类型` VALUES (860820, 0.013935000000000001);

-- ----------------------------
-- Table structure for 管道类型
-- ----------------------------
DROP TABLE IF EXISTS `管道类型`;
CREATE TABLE `管道类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管道类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK管道类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道类型
-- ----------------------------
INSERT INTO `管道类型` VALUES (142438, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (261488, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', 'PVC-U - 排水', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (856867, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', 'HVAC标准-异径三通', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860813, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '标准-正三通', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860844, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '标准-异径三通', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860852, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '排水管道-斜三通', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860853, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '排水管道-顺水三通', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860886, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '压力排水管道', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860887, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '冷却循环管道', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860888, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '中水管道', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860889, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '雨水管道', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860890, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '给水管道', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860891, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '热水管道', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860892, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '消防管道', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860903, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管道类型', '排水承插连接', NULL, NULL, NULL, NULL);
INSERT INTO `管道类型` VALUES (860904, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '管道类型', '排水铸铁管', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 管道系统
-- ----------------------------
DROP TABLE IF EXISTS `管道系统`;
CREATE TABLE `管道系统`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `图元数` int NULL DEFAULT NULL,
  `系统设备` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `卫浴装置当量` double NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `流量` double NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管道系统1`(`类型 ID`) USING BTREE,
  INDEX `FK管道系统2`(`设计选项`) USING BTREE,
  CONSTRAINT `FK管道系统1` FOREIGN KEY (`类型 ID`) REFERENCES `管道系统类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道系统2` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道系统
-- ----------------------------
INSERT INTO `管道系统` VALUES (1628220, 860863, NULL, 0, NULL, 'ZP 1', NULL, 0.6611515141275272, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统` VALUES (1642676, 860908, NULL, 0, NULL, 'Z3 1', 0, 0.020846281072482098, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统` VALUES (1689328, 860867, NULL, 0, NULL, 'RH 2', 0, 0.006088385573389895, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统` VALUES (1689385, 860822, NULL, 0, NULL, 'J 4', 0, 0.010654676289183745, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统` VALUES (1689444, 885930, NULL, 0, NULL, 'Z2 3', NULL, 0.05384282592977333, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统` VALUES (1689577, 860821, NULL, 0, NULL, 'RG 2', 0, 0.01142898447182618, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统` VALUES (2169272, 856847, NULL, 0, NULL, 'LG 3', NULL, 0.1725984343661501, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统` VALUES (2169273, 856848, NULL, 0, NULL, 'LH 3', NULL, 0.16913681419522295, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统` VALUES (2169274, 856868, NULL, 0, NULL, 'n 3', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 管道系统类型
-- ----------------------------
DROP TABLE IF EXISTS `管道系统类型`;
CREATE TABLE `管道系统类型`  (
  `ID` int NOT NULL,
  `缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `流体类型` int NULL DEFAULT NULL,
  `流体温度` double NULL DEFAULT NULL,
  `流体动态粘度` double NULL DEFAULT NULL,
  `流体密度` double NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道系统类型
-- ----------------------------
INSERT INTO `管道系统类型` VALUES (585476, NULL, '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (585477, NULL, '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (585478, NULL, '卫生设备', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (585479, NULL, '家用热水', 293160, 333.15000000000003, 0.0004662913689851268, 983.2132818936733, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (585480, NULL, '家用冷水', 293160, 288.70555555555563, 0.0011210835041557305, 998.9113760001543, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (585481, NULL, '湿式消防系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (585482, NULL, '干式消防系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (585483, NULL, '预作用消防系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (585484, NULL, '其他消防系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (587349, NULL, '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (587491, NULL, '通气管', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856822, 'LH2', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856823, 'DPG', '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856825, 'RG1', '循环供水', 293160, 344.2611111111112, 0.00039767047603164187, 977.1262658115684, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856826, 'RH1', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856827, 'SR', '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856828, 'LM', '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856829, 'S', '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856830, 'YG', '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856831, 'YH', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856832, 'XS', '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856845, 'LQG', '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856846, 'LQH', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856847, 'LG', '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856848, 'LH', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856849, 'KRG', '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856850, 'KRH', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856851, 'LRG', '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856852, 'LRH', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856853, NULL, '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856854, 'RG', '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856855, 'RH', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856856, 'BS', '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856868, 'n', '卫生设备', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856873, 'LG1', '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856874, 'LG2', '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856875, 'LH1', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (856911, 'n', '卫生设备', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860819, 'XH', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860821, 'RG', '家用热水', 293160, 333.15000000000003, 0.0004662913689851268, 983.2132818936733, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860822, 'J', '家用冷水', 293160, 288.70555555555563, 0.0011210835041557305, 998.9113760001543, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860854, 'Z2', '家用冷水', 293160, 288.70555555555563, 0.0011210835041557305, 998.9113760001543, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860855, 'W', '卫生设备', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860856, 'F', '卫生设备', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860857, 'Y', '卫生设备', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860858, 'YH', '卫生设备', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860859, 'YW', '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860860, 'YF', '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860861, 'YY', '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860862, 'XH', '其他消防系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860863, 'ZP', '湿式消防系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860864, 'YL', '其他消防系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860865, 'SP', '其他消防系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860866, 'T', '卫生设备', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860867, 'RH', '家用热水', 293160, 333.15000000000003, 0.0004662913689851268, 983.2132818936733, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860868, 'ZQ', '家用热水', 293160, 333.15000000000003, 0.0004662913689851268, 983.2132818936733, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860869, 'XJ', '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860870, 'N', '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860871, 'TR', '循环供水', 293160, 277.5944444444445, 0.0015638122773676726, 999.8724838025919, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860872, 'RMH', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860873, 'M', '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860874, 'Q', '其他消防系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860875, 'XSW', '其他消防系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860876, 'SPW', '其他消防系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860893, 'YXH', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860894, 'YXJ', '循环回水', 293160, 283.15000000000003, 0.0013058638604822833, 999.7122991688522, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860905, 'J2', '家用冷水', 293160, 288.70555555555563, 0.0011210835041557305, 998.9113760001543, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860907, 'J3', '家用冷水', 293160, 288.70555555555563, 0.0011210835041557305, 998.9113760001543, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (860908, 'Z3', '家用冷水', 293160, 288.70555555555563, 0.0011210835041557305, 998.9113760001543, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (885929, 'ZJ', '家用冷水', 293160, 288.70555555555563, 0.0011210835041557305, 998.9113760001543, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (885930, 'Z2', '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (885931, 'CW', '卫生设备', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `管道系统类型` VALUES (1133177, 'ZH', '家用冷水', 293160, 288.70555555555563, 0.0011210835041557305, 998.9113760001543, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 管道连接
-- ----------------------------
DROP TABLE IF EXISTS `管道连接`;
CREATE TABLE `管道连接`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管道连接1`(`类型 ID`) USING BTREE,
  INDEX `FK管道连接2`(`创建的阶段`) USING BTREE,
  INDEX `FK管道连接3`(`拆除的阶段`) USING BTREE,
  INDEX `FK管道连接4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK管道连接1` FOREIGN KEY (`类型 ID`) REFERENCES `管道连接类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道连接2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道连接3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道连接4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道连接
-- ----------------------------

-- ----------------------------
-- Table structure for 管道连接类型
-- ----------------------------
DROP TABLE IF EXISTS `管道连接类型`;
CREATE TABLE `管道连接类型`  (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道连接类型
-- ----------------------------
INSERT INTO `管道连接类型` VALUES (293137);
INSERT INTO `管道连接类型` VALUES (293138);
INSERT INTO `管道连接类型` VALUES (293139);
INSERT INTO `管道连接类型` VALUES (293146);
INSERT INTO `管道连接类型` VALUES (293147);
INSERT INTO `管道连接类型` VALUES (293155);
INSERT INTO `管道连接类型` VALUES (293156);
INSERT INTO `管道连接类型` VALUES (461162);
INSERT INTO `管道连接类型` VALUES (461165);
INSERT INTO `管道连接类型` VALUES (461171);
INSERT INTO `管道连接类型` VALUES (477698);
INSERT INTO `管道连接类型` VALUES (483719);
INSERT INTO `管道连接类型` VALUES (856843);
INSERT INTO `管道连接类型` VALUES (860818);

-- ----------------------------
-- Table structure for 管道附件
-- ----------------------------
DROP TABLE IF EXISTS `管道附件`;
CREATE TABLE `管道附件`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `忽略流量分析` int NULL DEFAULT NULL,
  `重要路径` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `最大尺寸` double NULL DEFAULT NULL,
  `最小尺寸` double NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管道附件1`(`类型 ID`) USING BTREE,
  INDEX `FK管道附件2`(`创建的阶段`) USING BTREE,
  INDEX `FK管道附件3`(`拆除的阶段`) USING BTREE,
  INDEX `FK管道附件4`(`设计选项`) USING BTREE,
  INDEX `FK管道附件5`(`标高`) USING BTREE,
  CONSTRAINT `FK管道附件1` FOREIGN KEY (`类型 ID`) REFERENCES `管道附件类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道附件2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道附件3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道附件4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道附件5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道附件
-- ----------------------------

-- ----------------------------
-- Table structure for 管道附件类型
-- ----------------------------
DROP TABLE IF EXISTS `管道附件类型`;
CREATE TABLE `管道附件类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK管道附件类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK管道附件类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK管道附件类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK管道附件类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管道附件类型
-- ----------------------------
INSERT INTO `管道附件类型` VALUES (1087346, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '87型雨水斗', '87型雨水斗', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1088226, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.65.55.14', NULL, 'M_干式报警阀', 'M_干式报警阀', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1089018, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.65.55.14.17', NULL, 'M_校准压力安全阀', 'M_校准压力安全阀', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1089929, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.60.10.14', NULL, 'M_压力表', 'M_压力表', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1090879, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.65.55.14.17', NULL, 'M_压力调节阀 - 15-40 mm - 法兰式', 'M_压力调节阀 - 15-40 mm - 法兰式', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1092474, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '蝶阀 - 涡轮传动 - 50-200 mm - 法兰式 - 消防', '蝶阀 - 涡轮传动 - 50-200 mm - 法兰式 - 消防', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1093832, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.65.55.14.17', NULL, '蝶阀（50-150mm）', '蝶阀（50-150mm）', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1097070, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '清扫口 - PVC-U', '清扫口 - PVC-U', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1097937, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.65.55.14.17', NULL, '球阀 - 25-150 mm', '球阀 - 25-150 mm', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1099190, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.65.55.14.17', NULL, '热水器调节阀', '热水器调节阀', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1100378, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '水表50-150mm', '水表50-150mm', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1102057, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.65.55.14.17', NULL, '水流指示器(100-150mm)', '水流指示器(100-150mm)', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1108870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '闸阀 - 明杆楔式 - 50-300 mm - 法兰式', '闸阀 - 明杆楔式 - 50-300 mm - 法兰式', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1109704, NULL, NULL, '80mm', '国标', NULL, NULL, NULL, '23.65.55.14.21', NULL, '止回阀 - 10-100 mm - 螺纹', '止回阀 - 10-100 mm - 螺纹', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1229947, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '波纹补偿器', '波纹补偿器', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1229949, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '波纹补偿器', '波纹补偿器 100mm', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1229951, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '波纹补偿器', '波纹补偿器 300mm', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1230536, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '波纹补偿器', '波纹补偿器 250mm', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1237485, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.65.55.14.17', NULL, '动态平衡阀', '65mm', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1237487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.65.55.14.17', NULL, '动态平衡阀', '32mm', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1237489, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.65.55.14.17', NULL, '动态平衡阀', '100mm', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1239372, NULL, NULL, 'AVAX系列自动排气阀', NULL, NULL, NULL, NULL, NULL, NULL, 'AVAX系列自动排气阀', 'DN20', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1261664, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '直通地漏', '75 mm', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1261666, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '直通地漏', '100 mm', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1261668, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '直通地漏', '50 mm', NULL, NULL, NULL, NULL);
INSERT INTO `管道附件类型` VALUES (1504777, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '波纹补偿器', '波纹补偿器 350mm', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 系统分区
-- ----------------------------
DROP TABLE IF EXISTS `系统分区`;
CREATE TABLE `系统分区`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `分区设备` int NULL DEFAULT NULL,
  `标高偏移` double NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK系统分区1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK系统分区1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 系统分区
-- ----------------------------

-- ----------------------------
-- Table structure for 线管
-- ----------------------------
DROP TABLE IF EXISTS `线管`;
CREATE TABLE `线管`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `设备类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `外径` double NULL DEFAULT NULL,
  `内径` double NULL DEFAULT NULL,
  `底部高程` double NULL DEFAULT NULL,
  `顶部高程` double NULL DEFAULT NULL,
  `直径(公称尺寸)` double NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK线管1`(`类型 ID`) USING BTREE,
  INDEX `FK线管2`(`创建的阶段`) USING BTREE,
  INDEX `FK线管3`(`拆除的阶段`) USING BTREE,
  INDEX `FK线管4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK线管1` FOREIGN KEY (`类型 ID`) REFERENCES `线管类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK线管2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK线管3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK线管4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 线管
-- ----------------------------

-- ----------------------------
-- Table structure for 线管类型
-- ----------------------------
DROP TABLE IF EXISTS `线管类型`;
CREATE TABLE `线管类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标准` int NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK线管类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK线管类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 线管类型
-- ----------------------------
INSERT INTO `线管类型` VALUES (552361, NULL, 501473, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '带配件的线管', '刚性非金属线管(RNC Sch 40)', NULL, NULL, NULL, NULL);
INSERT INTO `线管类型` VALUES (552362, NULL, 501473, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '无配件的线管', '刚性非金属线管(RNC Sch 40)', NULL, NULL, NULL, NULL);
INSERT INTO `线管类型` VALUES (552386, NULL, 501474, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '带配件的线管', '刚性非金属线管(RNC Sch 80)', NULL, NULL, NULL, NULL);
INSERT INTO `线管类型` VALUES (552387, NULL, 501474, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '无配件的线管', '刚性非金属线管(RNC Sch 80)', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 线管配件
-- ----------------------------
DROP TABLE IF EXISTS `线管配件`;
CREATE TABLE `线管配件`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `设备类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK线管配件1`(`类型 ID`) USING BTREE,
  INDEX `FK线管配件2`(`创建的阶段`) USING BTREE,
  INDEX `FK线管配件3`(`拆除的阶段`) USING BTREE,
  INDEX `FK线管配件4`(`设计选项`) USING BTREE,
  INDEX `FK线管配件5`(`标高`) USING BTREE,
  CONSTRAINT `FK线管配件1` FOREIGN KEY (`类型 ID`) REFERENCES `线管配件类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK线管配件2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK线管配件3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK线管配件4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK线管配件5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 线管配件
-- ----------------------------

-- ----------------------------
-- Table structure for 线管配件类型
-- ----------------------------
DROP TABLE IF EXISTS `线管配件类型`;
CREATE TABLE `线管配件类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK线管配件类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK线管配件类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 线管配件类型
-- ----------------------------
INSERT INTO `线管配件类型` VALUES (521415, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '线管接线盒 - 过渡件 - PVC', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `线管配件类型` VALUES (522698, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '线管接头 - PVC', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `线管配件类型` VALUES (523492, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '线管弯头 - 平端口 - PVC', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `线管配件类型` VALUES (524286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '线管弯头 - 无配件 - RNC', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `线管配件类型` VALUES (525079, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '线管接线盒 - 四通 - PVC', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `线管配件类型` VALUES (525869, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '线管接线盒 - T 形三通 - PVC', '标准', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 线荷载
-- ----------------------------
DROP TABLE IF EXISTS `线荷载`;
CREATE TABLE `线荷载`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `性质` int NULL DEFAULT NULL,
  `全部非 0 荷载` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `Mz 2` double NULL DEFAULT NULL,
  `My 2` double NULL DEFAULT NULL,
  `Mx 2` double NULL DEFAULT NULL,
  `Mz 1` double NULL DEFAULT NULL,
  `My 1` double NULL DEFAULT NULL,
  `Mx 1` double NULL DEFAULT NULL,
  `Fz 2` double NULL DEFAULT NULL,
  `Fy 2` double NULL DEFAULT NULL,
  `Fx 2` double NULL DEFAULT NULL,
  `Fz 1` double NULL DEFAULT NULL,
  `Fy 1` double NULL DEFAULT NULL,
  `Fx 1` double NULL DEFAULT NULL,
  `为反作用力` int NULL DEFAULT NULL,
  `均布负荷` int NULL DEFAULT NULL,
  `定向到` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `荷载工况` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK线荷载1`(`创建的阶段`) USING BTREE,
  INDEX `FK线荷载2`(`拆除的阶段`) USING BTREE,
  INDEX `FK线荷载3`(`设计选项`) USING BTREE,
  CONSTRAINT `FK线荷载1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK线荷载2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK线荷载3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 线荷载
-- ----------------------------

-- ----------------------------
-- Table structure for 组成部分
-- ----------------------------
DROP TABLE IF EXISTS `组成部分`;
CREATE TABLE `组成部分`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `形状被修改` int NULL DEFAULT NULL,
  `排除` int NULL DEFAULT NULL,
  `底部标高` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `构造` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `高度` double NULL DEFAULT NULL,
  `厚度` double NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `原始类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `材质` int NULL DEFAULT NULL,
  `原始族` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `原始类别` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK组成部分1`(`创建的阶段`) USING BTREE,
  INDEX `FK组成部分2`(`拆除的阶段`) USING BTREE,
  INDEX `FK组成部分3`(`设计选项`) USING BTREE,
  INDEX `FK组成部分4`(`材质`) USING BTREE,
  CONSTRAINT `FK组成部分1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK组成部分2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK组成部分3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK组成部分4` FOREIGN KEY (`材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 组成部分
-- ----------------------------

-- ----------------------------
-- Table structure for 结构加强板
-- ----------------------------
DROP TABLE IF EXISTS `结构加强板`;
CREATE TABLE `结构加强板`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构加强板1`(`类型 ID`) USING BTREE,
  INDEX `FK结构加强板2`(`创建的阶段`) USING BTREE,
  INDEX `FK结构加强板3`(`拆除的阶段`) USING BTREE,
  INDEX `FK结构加强板4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK结构加强板1` FOREIGN KEY (`类型 ID`) REFERENCES `结构加强板类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构加强板2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构加强板3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构加强板4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构加强板
-- ----------------------------

-- ----------------------------
-- Table structure for 结构加强板类型
-- ----------------------------
DROP TABLE IF EXISTS `结构加强板类型`;
CREATE TABLE `结构加强板类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构加强板类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK结构加强板类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK结构加强板类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构加强板类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构加强板类型
-- ----------------------------

-- ----------------------------
-- Table structure for 结构基础
-- ----------------------------
DROP TABLE IF EXISTS `结构基础`;
CREATE TABLE `结构基础`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `估计的钢筋体积` double NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `底部高程测量` double NULL DEFAULT NULL,
  `顶部高程测量` double NULL DEFAULT NULL,
  `顶部高程` double NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `底部高程` double NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构基础1`(`类型 ID`) USING BTREE,
  INDEX `FK结构基础2`(`创建的阶段`) USING BTREE,
  INDEX `FK结构基础3`(`拆除的阶段`) USING BTREE,
  INDEX `FK结构基础4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK结构基础1` FOREIGN KEY (`类型 ID`) REFERENCES `结构基础类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构基础2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构基础3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构基础4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构基础
-- ----------------------------

-- ----------------------------
-- Table structure for 结构基础类型
-- ----------------------------
DROP TABLE IF EXISTS `结构基础类型`;
CREATE TABLE `结构基础类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构材质` int NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构基础类型1`(`结构材质`) USING BTREE,
  INDEX `FK结构基础类型2`(`OmniClass 编号`) USING BTREE,
  INDEX `FK结构基础类型3`(`部件代码`) USING BTREE,
  CONSTRAINT `FK结构基础类型1` FOREIGN KEY (`结构材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构基础类型2` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构基础类型3` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构基础类型
-- ----------------------------
INSERT INTO `结构基础类型` VALUES (85113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 523, NULL, NULL, '条形基础', '承重基础 - 900 x 300', NULL, NULL, NULL, NULL);
INSERT INTO `结构基础类型` VALUES (86313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 523, NULL, NULL, '基础底板', '150mm 基础底板', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 结构柱
-- ----------------------------
DROP TABLE IF EXISTS `结构柱`;
CREATE TABLE `结构柱`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `涂层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `终点所有非 0 的力` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `起点所有非 0 的力` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `估计的钢筋体积` double NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构材质` int NULL DEFAULT NULL,
  `顶部偏移` double NULL DEFAULT NULL,
  `底部偏移` double NULL DEFAULT NULL,
  `顶部标高` int NULL DEFAULT NULL,
  `底部标高` int NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构柱1`(`类型 ID`) USING BTREE,
  INDEX `FK结构柱2`(`创建的阶段`) USING BTREE,
  INDEX `FK结构柱3`(`拆除的阶段`) USING BTREE,
  INDEX `FK结构柱4`(`设计选项`) USING BTREE,
  INDEX `FK结构柱5`(`结构材质`) USING BTREE,
  CONSTRAINT `FK结构柱1` FOREIGN KEY (`类型 ID`) REFERENCES `结构柱类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构柱2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构柱3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构柱4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构柱5` FOREIGN KEY (`结构材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构柱
-- ----------------------------

-- ----------------------------
-- Table structure for 结构柱类型
-- ----------------------------
DROP TABLE IF EXISTS `结构柱类型`;
CREATE TABLE `结构柱类型`  (
  `ID` int NOT NULL,
  `横断面形状` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构柱类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK结构柱类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK结构柱类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构柱类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构柱类型
-- ----------------------------
INSERT INTO `结构柱类型` VALUES (12190, '未定义', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'UC-通用柱 - 柱', '305x305x97UC', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 结构桁架
-- ----------------------------
DROP TABLE IF EXISTS `结构桁架`;
CREATE TABLE `结构桁架`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构桁架1`(`类型 ID`) USING BTREE,
  INDEX `FK结构桁架2`(`创建的阶段`) USING BTREE,
  INDEX `FK结构桁架3`(`拆除的阶段`) USING BTREE,
  INDEX `FK结构桁架4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK结构桁架1` FOREIGN KEY (`类型 ID`) REFERENCES `结构桁架类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构桁架2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构桁架3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构桁架4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构桁架
-- ----------------------------

-- ----------------------------
-- Table structure for 结构桁架类型
-- ----------------------------
DROP TABLE IF EXISTS `结构桁架类型`;
CREATE TABLE `结构桁架类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构桁架类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK结构桁架类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构桁架类型
-- ----------------------------

-- ----------------------------
-- Table structure for 结构框架
-- ----------------------------
DROP TABLE IF EXISTS `结构框架`;
CREATE TABLE `结构框架`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `涂层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `终点所有非 0 的力` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `起点所有非 0 的力` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `估计的钢筋体积` double NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构材质` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `参照标高高程` double NULL DEFAULT NULL,
  `顶部高程` double NULL DEFAULT NULL,
  `底部高程` double NULL DEFAULT NULL,
  `剪切长度` double NULL DEFAULT NULL,
  `参照标高` int NULL DEFAULT NULL,
  `结构用途` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构框架1`(`类型 ID`) USING BTREE,
  INDEX `FK结构框架2`(`创建的阶段`) USING BTREE,
  INDEX `FK结构框架3`(`拆除的阶段`) USING BTREE,
  INDEX `FK结构框架4`(`设计选项`) USING BTREE,
  INDEX `FK结构框架5`(`结构材质`) USING BTREE,
  INDEX `FK结构框架6`(`标高`) USING BTREE,
  INDEX `FK结构框架7`(`参照标高`) USING BTREE,
  CONSTRAINT `FK结构框架1` FOREIGN KEY (`类型 ID`) REFERENCES `结构框架类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构框架2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构框架3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构框架4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构框架5` FOREIGN KEY (`结构材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构框架6` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构框架7` FOREIGN KEY (`参照标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构框架
-- ----------------------------

-- ----------------------------
-- Table structure for 结构框架类型
-- ----------------------------
DROP TABLE IF EXISTS `结构框架类型`;
CREATE TABLE `结构框架类型`  (
  `ID` int NOT NULL,
  `横断面形状` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `防火等级` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构框架类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK结构框架类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK结构框架类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构框架类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构框架类型
-- ----------------------------

-- ----------------------------
-- Table structure for 结构连接
-- ----------------------------
DROP TABLE IF EXISTS `结构连接`;
CREATE TABLE `结构连接`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `输入图元` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `规范检查状态` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `批准状态` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构连接1`(`类型 ID`) USING BTREE,
  INDEX `FK结构连接2`(`创建的阶段`) USING BTREE,
  INDEX `FK结构连接3`(`拆除的阶段`) USING BTREE,
  INDEX `FK结构连接4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK结构连接1` FOREIGN KEY (`类型 ID`) REFERENCES `结构连接类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构连接2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构连接3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构连接4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构连接
-- ----------------------------

-- ----------------------------
-- Table structure for 结构连接类型
-- ----------------------------
DROP TABLE IF EXISTS `结构连接类型`;
CREATE TABLE `结构连接类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构连接类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK结构连接类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK结构连接类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构连接类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构连接类型
-- ----------------------------

-- ----------------------------
-- Table structure for 结构钢筋
-- ----------------------------
DROP TABLE IF EXISTS `结构钢筋`;
CREATE TABLE `结构钢筋`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `终点的端部处理` int NULL DEFAULT NULL,
  `起点的端部处理` int NULL DEFAULT NULL,
  `钢筋编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `分区` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `钢筋体积` double NULL DEFAULT NULL,
  `弯曲直径` double NULL DEFAULT NULL,
  `明细表标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `样式` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `钢筋长度` double NULL DEFAULT NULL,
  `造型` int NULL DEFAULT NULL,
  `间距` double NULL DEFAULT NULL,
  `数量` int NULL DEFAULT NULL,
  `布局规则` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `终点的弯钩` int NULL DEFAULT NULL,
  `起点的弯钩` int NULL DEFAULT NULL,
  `总钢筋长度` double NULL DEFAULT NULL,
  `钢筋直径` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构钢筋1`(`类型 ID`) USING BTREE,
  INDEX `FK结构钢筋2`(`创建的阶段`) USING BTREE,
  INDEX `FK结构钢筋3`(`拆除的阶段`) USING BTREE,
  INDEX `FK结构钢筋4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK结构钢筋1` FOREIGN KEY (`类型 ID`) REFERENCES `结构钢筋类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构钢筋2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构钢筋3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构钢筋4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构钢筋
-- ----------------------------

-- ----------------------------
-- Table structure for 结构钢筋类型
-- ----------------------------
DROP TABLE IF EXISTS `结构钢筋类型`;
CREATE TABLE `结构钢筋类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `形变` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `材质` int NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构钢筋类型1`(`部件代码`) USING BTREE,
  INDEX `FK结构钢筋类型2`(`材质`) USING BTREE,
  CONSTRAINT `FK结构钢筋类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构钢筋类型2` FOREIGN KEY (`材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构钢筋类型
-- ----------------------------

-- ----------------------------
-- Table structure for 结构钢筋网
-- ----------------------------
DROP TABLE IF EXISTS `结构钢筋网`;
CREATE TABLE `结构钢筋网`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `钢筋网编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `分区` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `共享族关键字` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `切片质量` double NULL DEFAULT NULL,
  `切口总宽度` double NULL DEFAULT NULL,
  `切口总长度` double NULL DEFAULT NULL,
  `分布筋搭接接头长度` double NULL DEFAULT NULL,
  `主筋搭接接头长度` double NULL DEFAULT NULL,
  `位置` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构钢筋网1`(`类型 ID`) USING BTREE,
  INDEX `FK结构钢筋网2`(`创建的阶段`) USING BTREE,
  INDEX `FK结构钢筋网3`(`拆除的阶段`) USING BTREE,
  INDEX `FK结构钢筋网4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK结构钢筋网1` FOREIGN KEY (`类型 ID`) REFERENCES `结构钢筋网类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构钢筋网2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构钢筋网3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构钢筋网4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构钢筋网
-- ----------------------------

-- ----------------------------
-- Table structure for 结构钢筋网类型
-- ----------------------------
DROP TABLE IF EXISTS `结构钢筋网类型`;
CREATE TABLE `结构钢筋网类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `每单位面积的切片质量` double NULL DEFAULT NULL,
  `分布筋钢筋面积` double NULL DEFAULT NULL,
  `主筋钢筋面积` double NULL DEFAULT NULL,
  `切片质量` double NULL DEFAULT NULL,
  `分布筋间距` double NULL DEFAULT NULL,
  `分布筋钢筋条数` int NULL DEFAULT NULL,
  `分布筋结尾悬挑` double NULL DEFAULT NULL,
  `分布筋起始悬挑` double NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `总宽度` double NULL DEFAULT NULL,
  `正面的切片间距` double NULL DEFAULT NULL,
  `主筋钢筋条数` int NULL DEFAULT NULL,
  `主筋结尾悬挑` double NULL DEFAULT NULL,
  `主筋起始悬挑` double NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `总长度` double NULL DEFAULT NULL,
  `分布筋方向钢筋条类型` int NULL DEFAULT NULL,
  `主筋方向钢筋条类型` int NULL DEFAULT NULL,
  `物理材质资源` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `材质` int NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK结构钢筋网类型1`(`部件代码`) USING BTREE,
  INDEX `FK结构钢筋网类型2`(`材质`) USING BTREE,
  CONSTRAINT `FK结构钢筋网类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK结构钢筋网类型2` FOREIGN KEY (`材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 结构钢筋网类型
-- ----------------------------

-- ----------------------------
-- Table structure for 螺栓
-- ----------------------------
DROP TABLE IF EXISTS `螺栓`;
CREATE TABLE `螺栓`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `编号` int NULL DEFAULT NULL,
  `半径` double NULL DEFAULT NULL,
  `边 2 的边缘距离` double NULL DEFAULT NULL,
  `边 1 的边缘距离` double NULL DEFAULT NULL,
  `边 2 的间距` double NULL DEFAULT NULL,
  `边 1 的间距` double NULL DEFAULT NULL,
  `边 2 的长度` double NULL DEFAULT NULL,
  `边 1 的长度` double NULL DEFAULT NULL,
  `边 2 的数量` int NULL DEFAULT NULL,
  `边 1 的数量` int NULL DEFAULT NULL,
  `涂层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `直径` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `等级` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标准` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构材质` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK螺栓1`(`创建的阶段`) USING BTREE,
  INDEX `FK螺栓2`(`拆除的阶段`) USING BTREE,
  INDEX `FK螺栓3`(`设计选项`) USING BTREE,
  INDEX `FK螺栓4`(`结构材质`) USING BTREE,
  CONSTRAINT `FK螺栓1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK螺栓2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK螺栓3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK螺栓4` FOREIGN KEY (`结构材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 螺栓
-- ----------------------------

-- ----------------------------
-- Table structure for 设计选项
-- ----------------------------
DROP TABLE IF EXISTS `设计选项`;
CREATE TABLE `设计选项`  (
  `ID` int NOT NULL,
  `设计选项集 ID` int NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 设计选项
-- ----------------------------

-- ----------------------------
-- Table structure for 设计选项集
-- ----------------------------
DROP TABLE IF EXISTS `设计选项集`;
CREATE TABLE `设计选项集`  (
  `ID` int NOT NULL,
  `主选项 ID` int NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK设计选项集1`(`主选项 ID`) USING BTREE,
  CONSTRAINT `FK设计选项集1` FOREIGN KEY (`主选项 ID`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 设计选项集
-- ----------------------------

-- ----------------------------
-- Table structure for 轮廓
-- ----------------------------
DROP TABLE IF EXISTS `轮廓`;
CREATE TABLE `轮廓`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK轮廓1`(`创建的阶段`) USING BTREE,
  INDEX `FK轮廓2`(`拆除的阶段`) USING BTREE,
  INDEX `FK轮廓3`(`设计选项`) USING BTREE,
  CONSTRAINT `FK轮廓1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK轮廓2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK轮廓3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 轮廓
-- ----------------------------

-- ----------------------------
-- Table structure for 轮廓1
-- ----------------------------
DROP TABLE IF EXISTS `轮廓1`;
CREATE TABLE `轮廓1`  (
  `ID` int NOT NULL,
  `横断面形状` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK轮廓11`(`OmniClass 编号`) USING BTREE,
  INDEX `FK轮廓12`(`部件代码`) USING BTREE,
  CONSTRAINT `FK轮廓11` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK轮廓12` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 轮廓1
-- ----------------------------
INSERT INTO `轮廓1` VALUES (16216, '未定义', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形扶手', '50 x 50mm', NULL, NULL);
INSERT INTO `轮廓1` VALUES (16334, '未定义', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形扶手', '40mm', NULL, NULL);
INSERT INTO `轮廓1` VALUES (20074, '未定义', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '楼板边缘 - 加厚', '600 x 300mm', NULL, NULL);
INSERT INTO `轮廓1` VALUES (20244, '未定义', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '檐沟 - 斜角', '125 x 125mm', NULL, NULL);
INSERT INTO `轮廓1` VALUES (20380, '未定义', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '封檐带 - 平板', '19 x 235mm', NULL, NULL);

-- ----------------------------
-- Table structure for 软管
-- ----------------------------
DROP TABLE IF EXISTS `软管`;
CREATE TABLE `软管`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `卫浴装置当量` double NULL DEFAULT NULL,
  `外径` double NULL DEFAULT NULL,
  `其他流量` double NULL DEFAULT NULL,
  `直径` double NULL DEFAULT NULL,
  `流量` double NULL DEFAULT NULL,
  `内径` double NULL DEFAULT NULL,
  `雷诺数` double NULL DEFAULT NULL,
  `相对粗糙度` double NULL DEFAULT NULL,
  `流量状态` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `摩擦系数` double NULL DEFAULT NULL,
  `速度` double NULL DEFAULT NULL,
  `摩擦` double NULL DEFAULT NULL,
  `压降` double NULL DEFAULT NULL,
  `剖面` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK软管1`(`类型 ID`) USING BTREE,
  INDEX `FK软管2`(`创建的阶段`) USING BTREE,
  INDEX `FK软管3`(`拆除的阶段`) USING BTREE,
  INDEX `FK软管4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK软管1` FOREIGN KEY (`类型 ID`) REFERENCES `软管类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK软管2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK软管3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK软管4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 软管
-- ----------------------------

-- ----------------------------
-- Table structure for 软管类型
-- ----------------------------
DROP TABLE IF EXISTS `软管类型`;
CREATE TABLE `软管类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `粗糙度` double NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK软管类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK软管类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 软管类型
-- ----------------------------
INSERT INTO `软管类型` VALUES (142445, NULL, 0.000046, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形软管', '软管 - 圆形', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 软风管
-- ----------------------------
DROP TABLE IF EXISTS `软风管`;
CREATE TABLE `软风管`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `可用大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `内衬厚度` double NULL DEFAULT NULL,
  `内衬类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `尺寸锁定` int NULL DEFAULT NULL,
  `其他流量` double NULL DEFAULT NULL,
  `水力直径` double NULL DEFAULT NULL,
  `雷诺数` double NULL DEFAULT NULL,
  `当量直径` double NULL DEFAULT NULL,
  `剖面` int NULL DEFAULT NULL,
  `损耗系数` double NULL DEFAULT NULL,
  `风压` double NULL DEFAULT NULL,
  `摩擦` double NULL DEFAULT NULL,
  `压降` double NULL DEFAULT NULL,
  `速度` double NULL DEFAULT NULL,
  `直径` double NULL DEFAULT NULL,
  `高度` double NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `流量` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK软风管1`(`类型 ID`) USING BTREE,
  INDEX `FK软风管2`(`创建的阶段`) USING BTREE,
  INDEX `FK软风管3`(`拆除的阶段`) USING BTREE,
  INDEX `FK软风管4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK软风管1` FOREIGN KEY (`类型 ID`) REFERENCES `软风管类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK软风管2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK软风管3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK软风管4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 软风管
-- ----------------------------

-- ----------------------------
-- Table structure for 软风管类型
-- ----------------------------
DROP TABLE IF EXISTS `软风管类型`;
CREATE TABLE `软风管类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK软风管类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK软风管类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 软风管类型
-- ----------------------------
INSERT INTO `软风管类型` VALUES (142443, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形软风管', '软管 - 矩形', NULL, NULL, NULL, NULL);
INSERT INTO `软风管类型` VALUES (142444, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形软风管', '软管 - 圆形', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 通讯设备
-- ----------------------------
DROP TABLE IF EXISTS `通讯设备`;
CREATE TABLE `通讯设备`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `嵌板` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `线路数` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气数据` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK通讯设备1`(`类型 ID`) USING BTREE,
  INDEX `FK通讯设备2`(`创建的阶段`) USING BTREE,
  INDEX `FK通讯设备3`(`拆除的阶段`) USING BTREE,
  INDEX `FK通讯设备4`(`设计选项`) USING BTREE,
  INDEX `FK通讯设备5`(`标高`) USING BTREE,
  CONSTRAINT `FK通讯设备1` FOREIGN KEY (`类型 ID`) REFERENCES `通讯设备类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK通讯设备2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK通讯设备3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK通讯设备4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK通讯设备5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 通讯设备
-- ----------------------------

-- ----------------------------
-- Table structure for 通讯设备类型
-- ----------------------------
DROP TABLE IF EXISTS `通讯设备类型`;
CREATE TABLE `通讯设备类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK通讯设备类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK通讯设备类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK通讯设备类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK通讯设备类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 通讯设备类型
-- ----------------------------
INSERT INTO `通讯设备类型` VALUES (946718, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_广播接线箱-壁装', '消防接线箱-壁装', NULL, NULL, NULL, NULL);
INSERT INTO `通讯设备类型` VALUES (947697, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_广播调音开关（壁装距地1-3米）', '消防报警广播3W(壁装距地2.5米）', NULL, NULL, NULL, NULL);
INSERT INTO `通讯设备类型` VALUES (977322, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.85.50.14', NULL, 'Y_消防报警广播3W（壁装距地2-5米）', '消防报警广播3W(壁装距地2.5米）', NULL, NULL, NULL, NULL);
INSERT INTO `通讯设备类型` VALUES (978163, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.00.00', NULL, 'Y_消防报警广播3W（嵌顶装）', '消防报警广播3W（嵌顶装）', NULL, NULL, NULL, NULL);
INSERT INTO `通讯设备类型` VALUES (978165, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.80.00.00', NULL, 'Y_消防报警广播3W（嵌顶装）', '火灾应急广播扬声器', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 部件
-- ----------------------------
DROP TABLE IF EXISTS `部件`;
CREATE TABLE `部件`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `命名类别` int NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK部件1`(`类型 ID`) USING BTREE,
  INDEX `FK部件2`(`创建的阶段`) USING BTREE,
  INDEX `FK部件3`(`拆除的阶段`) USING BTREE,
  INDEX `FK部件4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK部件1` FOREIGN KEY (`类型 ID`) REFERENCES `部件类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK部件2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK部件3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK部件4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 部件
-- ----------------------------

-- ----------------------------
-- Table structure for 部件代码
-- ----------------------------
DROP TABLE IF EXISTS `部件代码`;
CREATE TABLE `部件代码`  (
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `部件说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`部件代码`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 部件代码
-- ----------------------------
INSERT INTO `部件代码` VALUES ('A', 'Substructure');
INSERT INTO `部件代码` VALUES ('A10', 'Foundations');
INSERT INTO `部件代码` VALUES ('A1010', 'Standard Foundations');
INSERT INTO `部件代码` VALUES ('A1010100', 'Footings & Pile Caps');
INSERT INTO `部件代码` VALUES ('A1010110', 'Strip Footings');
INSERT INTO `部件代码` VALUES ('A1010120', 'Spread Footings');
INSERT INTO `部件代码` VALUES ('A1010130', 'Pile Caps');
INSERT INTO `部件代码` VALUES ('A1010200', 'Foundation Walls');
INSERT INTO `部件代码` VALUES ('A1010210', 'Foundation Walls - CIP');
INSERT INTO `部件代码` VALUES ('A1010220', 'Foundation Walls - CMU');
INSERT INTO `部件代码` VALUES ('A1010230', 'Foundation Walls - Wood');
INSERT INTO `部件代码` VALUES ('A1010300', 'Perimeter Drainage');
INSERT INTO `部件代码` VALUES ('A1010310', 'Footing Drains');
INSERT INTO `部件代码` VALUES ('A1010400', 'Perimeter Insulation');
INSERT INTO `部件代码` VALUES ('A1010410', 'Perimeter Insulation - Rigid');
INSERT INTO `部件代码` VALUES ('A1020', 'Special Foundations');
INSERT INTO `部件代码` VALUES ('A1020100', 'Pile Foundations');
INSERT INTO `部件代码` VALUES ('A1020110', 'Piles - CIP');
INSERT INTO `部件代码` VALUES ('A1020120', 'Piles - Precast Concrete');
INSERT INTO `部件代码` VALUES ('A1020130', 'Piles - Steel Pipe');
INSERT INTO `部件代码` VALUES ('A1020140', 'Piles - Steel H');
INSERT INTO `部件代码` VALUES ('A1020150', 'Piles - Step Tapered');
INSERT INTO `部件代码` VALUES ('A1020160', 'Piles - Treated Wood');
INSERT INTO `部件代码` VALUES ('A1020200', 'Grade Beams');
INSERT INTO `部件代码` VALUES ('A1020210', 'Grade Beams - CIP');
INSERT INTO `部件代码` VALUES ('A1020300', 'Caissons');
INSERT INTO `部件代码` VALUES ('A1020310', 'Caissons - Bell');
INSERT INTO `部件代码` VALUES ('A1020400', 'Underpinning');
INSERT INTO `部件代码` VALUES ('A1020500', 'Dewatering');
INSERT INTO `部件代码` VALUES ('A1020600', 'Raft Foundations');
INSERT INTO `部件代码` VALUES ('A1020700', 'Pressure Injected Grouting');
INSERT INTO `部件代码` VALUES ('A1020710', 'Pressure Injected Footings');
INSERT INTO `部件代码` VALUES ('A1020900', 'Other Special Foundation Conditions');
INSERT INTO `部件代码` VALUES ('A1030', 'Slab on Grade');
INSERT INTO `部件代码` VALUES ('A1030100', 'Standard Slab on Grade');
INSERT INTO `部件代码` VALUES ('A1030110', 'SOG - Reinforced');
INSERT INTO `部件代码` VALUES ('A1030120', 'SOG - Unreinforced');
INSERT INTO `部件代码` VALUES ('A1030200', 'Structural Slab on Grade');
INSERT INTO `部件代码` VALUES ('A1030300', 'Inclined Slab on Grade');
INSERT INTO `部件代码` VALUES ('A1030400', 'Trenches');
INSERT INTO `部件代码` VALUES ('A1030500', 'Pits & Bases');
INSERT INTO `部件代码` VALUES ('A1030600', 'Under-Slab Drainage');
INSERT INTO `部件代码` VALUES ('A1030700', 'Under-Slab Insulation');
INSERT INTO `部件代码` VALUES ('A1030710', 'Subdrainage Piping');
INSERT INTO `部件代码` VALUES ('A20', 'Basement Construction');
INSERT INTO `部件代码` VALUES ('A2010', 'Basement Excavation');
INSERT INTO `部件代码` VALUES ('A2010100', 'Excavation for Basements');
INSERT INTO `部件代码` VALUES ('A2010110', 'Basement Excavation & Backfill');
INSERT INTO `部件代码` VALUES ('A2010200', 'Structural Backfill & Compaction');
INSERT INTO `部件代码` VALUES ('A2010300', 'Shoring');
INSERT INTO `部件代码` VALUES ('A2010310', 'Shoring');
INSERT INTO `部件代码` VALUES ('A2020', 'Basement Walls');
INSERT INTO `部件代码` VALUES ('A2020100', 'Basement Wall Construction');
INSERT INTO `部件代码` VALUES ('A2020110', 'Basement Walls - CIP');
INSERT INTO `部件代码` VALUES ('A2020120', 'Basement Walls - CMU');
INSERT INTO `部件代码` VALUES ('A2020130', 'Basement Walls - Wood');
INSERT INTO `部件代码` VALUES ('A2020200', 'Moisture Protection');
INSERT INTO `部件代码` VALUES ('A2020210', 'Foundation Dampproofing');
INSERT INTO `部件代码` VALUES ('A2020300', 'Basement Wall Insulation');
INSERT INTO `部件代码` VALUES ('A2020310', 'Basement Wall Insulation - Rigid');
INSERT INTO `部件代码` VALUES ('A2020400', 'Interior Skin');
INSERT INTO `部件代码` VALUES ('B', 'Shell');
INSERT INTO `部件代码` VALUES ('B10', 'Superstructure');
INSERT INTO `部件代码` VALUES ('B1010', 'Floor Construction');
INSERT INTO `部件代码` VALUES ('B1010100', 'Suspended Basement Floor Construction');
INSERT INTO `部件代码` VALUES ('B1010200', 'Upper Floor Framing - Vertical Elements');
INSERT INTO `部件代码` VALUES ('B1010210', 'Bearing Walls - CIP');
INSERT INTO `部件代码` VALUES ('B1010215', 'Bearing Walls - Block');
INSERT INTO `部件代码` VALUES ('B1010220', 'Bearing Walls - Drywall w/Studs');
INSERT INTO `部件代码` VALUES ('B1010225', 'Bearing Walls - Plaster w/Studs');
INSERT INTO `部件代码` VALUES ('B1010240', 'Columns - CIP');
INSERT INTO `部件代码` VALUES ('B1010245', 'Columns - Precast');
INSERT INTO `部件代码` VALUES ('B1010250', 'Columns - Steel');
INSERT INTO `部件代码` VALUES ('B1010255', 'Columns - Wood');
INSERT INTO `部件代码` VALUES ('B1010300', 'Upper Floor Framing - Horizontal Elements');
INSERT INTO `部件代码` VALUES ('B1010310', 'Beams - CIP');
INSERT INTO `部件代码` VALUES ('B1010320', 'Beams - Precast');
INSERT INTO `部件代码` VALUES ('B1010325', 'Beams - Precast Double T');
INSERT INTO `部件代码` VALUES ('B1010330', 'Beams - Steel');
INSERT INTO `部件代码` VALUES ('B1010340', 'Beams - Wood (Dimensional Lumber)');
INSERT INTO `部件代码` VALUES ('B1010345', 'Beams - Wood (Laminated)');
INSERT INTO `部件代码` VALUES ('B1010350', 'Joists - Steel');
INSERT INTO `部件代码` VALUES ('B1010355', 'Joists - Wood (Dimensional Lumber)');
INSERT INTO `部件代码` VALUES ('B1010358', 'Joists - Wood (Manufactured)');
INSERT INTO `部件代码` VALUES ('B1010370', 'Deck - Metal');
INSERT INTO `部件代码` VALUES ('B1010375', 'Deck - Wood');
INSERT INTO `部件代码` VALUES ('B1010380', 'Planks - Precast');
INSERT INTO `部件代码` VALUES ('B1010400', 'Upper Floor Framing - Systems');
INSERT INTO `部件代码` VALUES ('B1010410', 'CIP Slabs - One Way');
INSERT INTO `部件代码` VALUES ('B1010412', 'CIP Slabs - Flat Plate');
INSERT INTO `部件代码` VALUES ('B1010414', 'CIP Slabs - Flat Plate w/Drop Panels');
INSERT INTO `部件代码` VALUES ('B1010416', 'CIP Slabs - Multispan Joist');
INSERT INTO `部件代码` VALUES ('B1010418', 'CIP Slabs - Waffle');
INSERT INTO `部件代码` VALUES ('B1010420', 'CIP Beam & Slab - One Way');
INSERT INTO `部件代码` VALUES ('B1010422', 'CIP Beam & Slab - Two Way');
INSERT INTO `部件代码` VALUES ('B1010430', 'Composite Beam & Slab');
INSERT INTO `部件代码` VALUES ('B1010432', 'Composite Beam, Deck & Slab');
INSERT INTO `部件代码` VALUES ('B1010434', 'W Shape Composite Deck & Slab');
INSERT INTO `部件代码` VALUES ('B1010440', 'Precast Beams w/ Precast Planks');
INSERT INTO `部件代码` VALUES ('B1010442', 'Precast Beams w/Precast Double T');
INSERT INTO `部件代码` VALUES ('B1010460', 'Steel Girders w/ Steel Beams');
INSERT INTO `部件代码` VALUES ('B1010462', 'Steel Beams w/ Steel Joists');
INSERT INTO `部件代码` VALUES ('B1010464', 'Joist Girders w/ Steel Joists');
INSERT INTO `部件代码` VALUES ('B1010470', 'Steel Light Gauge Floor System');
INSERT INTO `部件代码` VALUES ('B1010480', 'Wood Beams w/ Wood Joists');
INSERT INTO `部件代码` VALUES ('B1010482', 'Wood Laminated Beams w/ Wood Joists');
INSERT INTO `部件代码` VALUES ('B1010500', 'Balcony Floor Construction');
INSERT INTO `部件代码` VALUES ('B1010600', 'Ramps');
INSERT INTO `部件代码` VALUES ('B1010700', 'Exterior Stairs & Fire Escapes');
INSERT INTO `部件代码` VALUES ('B1010800', 'Floor Raceway Systems');
INSERT INTO `部件代码` VALUES ('B1010900', 'Fireproofing - Floor Construction');
INSERT INTO `部件代码` VALUES ('B1010910', 'Steel Beam Fireproofing');
INSERT INTO `部件代码` VALUES ('B1010920', 'Steel Column Fireproofing');
INSERT INTO `部件代码` VALUES ('B1020', 'Roof Construction');
INSERT INTO `部件代码` VALUES ('B1020100', 'Flat Roof Framing - Vertical Elements');
INSERT INTO `部件代码` VALUES ('B1020110', 'Bearing Walls - CIP');
INSERT INTO `部件代码` VALUES ('B1020115', 'Bearing Walls - Block');
INSERT INTO `部件代码` VALUES ('B1020120', 'Bearing Walls - Drywall w/Studs');
INSERT INTO `部件代码` VALUES ('B1020125', 'Bearing Walls - Plaster w/Studs');
INSERT INTO `部件代码` VALUES ('B1020140', 'Columns - CIP');
INSERT INTO `部件代码` VALUES ('B1020145', 'Columns - Precast');
INSERT INTO `部件代码` VALUES ('B1020150', 'Columns - Steel');
INSERT INTO `部件代码` VALUES ('B1020155', 'Columns - Wood');
INSERT INTO `部件代码` VALUES ('B1020200', 'Flat Roof Framing - Horizontal Elements');
INSERT INTO `部件代码` VALUES ('B1020210', 'Beams - CIP');
INSERT INTO `部件代码` VALUES ('B1020220', 'Beams - Precast');
INSERT INTO `部件代码` VALUES ('B1020225', 'Beams - Precast Double T');
INSERT INTO `部件代码` VALUES ('B1020230', 'Beams - Steel');
INSERT INTO `部件代码` VALUES ('B1020240', 'Beams - Wood (Dimensional Lumber)');
INSERT INTO `部件代码` VALUES ('B1020245', 'Beams - Wood (Laminated)');
INSERT INTO `部件代码` VALUES ('B1020250', 'Joists - Steel');
INSERT INTO `部件代码` VALUES ('B1020255', 'Joists - Wood (Dimensional Lumber)');
INSERT INTO `部件代码` VALUES ('B1020258', 'Joists - Wood (Manufactured)');
INSERT INTO `部件代码` VALUES ('B1020260', 'Deck - Metal');
INSERT INTO `部件代码` VALUES ('B1020265', 'Deck - Wood');
INSERT INTO `部件代码` VALUES ('B1020270', 'Planks - Precast');
INSERT INTO `部件代码` VALUES ('B1020300', 'Flat Roof Framing - Systems');
INSERT INTO `部件代码` VALUES ('B1020310', 'CIP Slabs - One Way');
INSERT INTO `部件代码` VALUES ('B1020312', 'CIP Slabs - Flat Plate');
INSERT INTO `部件代码` VALUES ('B1020314', 'CIP Slabs - Flat Plate w/Drop Panels');
INSERT INTO `部件代码` VALUES ('B1020316', 'CIP Slabs - Multispan Joist');
INSERT INTO `部件代码` VALUES ('B1020318', 'CIP Slabs - Waffle');
INSERT INTO `部件代码` VALUES ('B1020320', 'CIP Beam & Slab - One Way');
INSERT INTO `部件代码` VALUES ('B1020322', 'CIP Beam & Slab - Two Way');
INSERT INTO `部件代码` VALUES ('B1020330', 'Composite Beam & Slab');
INSERT INTO `部件代码` VALUES ('B1020332', 'Composite Beam, Deck & Slab');
INSERT INTO `部件代码` VALUES ('B1020334', 'W Shape Composite Deck & Slab');
INSERT INTO `部件代码` VALUES ('B1020340', 'Precast Beams w/ Precast Planks');
INSERT INTO `部件代码` VALUES ('B1020342', 'Precast Beams w/Precast Double T');
INSERT INTO `部件代码` VALUES ('B1020360', 'Steel Girders w/ Steel Beams');
INSERT INTO `部件代码` VALUES ('B1020362', 'Steel Beams w/ Steel Joists');
INSERT INTO `部件代码` VALUES ('B1020364', 'Joist Girders w/ Steel Joists');
INSERT INTO `部件代码` VALUES ('B1020370', 'Steel Light Gauge Floor System');
INSERT INTO `部件代码` VALUES ('B1020380', 'Wood Beams w/ Wood Joists');
INSERT INTO `部件代码` VALUES ('B1020382', 'Wood Laminated Beams w/ Wood Joists');
INSERT INTO `部件代码` VALUES ('B1020400', 'Pitched Roof Construction');
INSERT INTO `部件代码` VALUES ('B1020500', 'Vaulted Roof Construction');
INSERT INTO `部件代码` VALUES ('B1020600', 'Dome Construction');
INSERT INTO `部件代码` VALUES ('B1020700', 'Fabric (Tensile) Roof Construction');
INSERT INTO `部件代码` VALUES ('B1020800', 'Canopies');
INSERT INTO `部件代码` VALUES ('B1020900', 'Fireproofing - Roof Construction');
INSERT INTO `部件代码` VALUES ('B1020910', 'Steel Beam Fireproofing');
INSERT INTO `部件代码` VALUES ('B1020920', 'Steel Column Fireproofing');
INSERT INTO `部件代码` VALUES ('B20', 'Exterior Enclosure');
INSERT INTO `部件代码` VALUES ('B2010', 'Exterior Walls');
INSERT INTO `部件代码` VALUES ('B2010100', 'Exterior Wall Construction');
INSERT INTO `部件代码` VALUES ('B2010110', 'Ext. Wall - CIP');
INSERT INTO `部件代码` VALUES ('B2010120', 'Ext. Wall - Precast');
INSERT INTO `部件代码` VALUES ('B2010125', 'Ext. Wall - Precast Lintels & Specialties');
INSERT INTO `部件代码` VALUES ('B2010130', 'Ext. Wall - Tilt-up');
INSERT INTO `部件代码` VALUES ('B2010140', 'Ext. Wall - CMU');
INSERT INTO `部件代码` VALUES ('B2010142', 'Ext. Wall - CMU Cavity');
INSERT INTO `部件代码` VALUES ('B2010144', 'Ext. Wall - CMU Composite');
INSERT INTO `部件代码` VALUES ('B2010146', 'Ext. Wall - CMU Lintels & Specialties');
INSERT INTO `部件代码` VALUES ('B2010148', 'Ext. Wall - Glass Block');
INSERT INTO `部件代码` VALUES ('B2010150', 'Ext. Wall - Brick (Single Wythe)');
INSERT INTO `部件代码` VALUES ('B2010152', 'Ext. Wall - Brick (Double Wythe)');
INSERT INTO `部件代码` VALUES ('B2010154', 'Ext. Wall - Brick Cavity');
INSERT INTO `部件代码` VALUES ('B2010156', 'Ext. Wall - Brick Composite');
INSERT INTO `部件代码` VALUES ('B2010158', 'Ext. Wall - Brick Veneer w/ Stud');
INSERT INTO `部件代码` VALUES ('B2010160', 'Ext. Wall - Stone Veneer w/ Stud');
INSERT INTO `部件代码` VALUES ('B2010170', 'Ext. Wall - Metal Siding Supports');
INSERT INTO `部件代码` VALUES ('B2010175', 'Ext. Wall - Metal Siding Panels');
INSERT INTO `部件代码` VALUES ('B2010180', 'Ext. Wall - Wood Stud w/ Siding & Shingles');
INSERT INTO `部件代码` VALUES ('B2010185', 'Ext. Wall - Wood Stud w/ Stucco');
INSERT INTO `部件代码` VALUES ('B2010200', 'Parapets');
INSERT INTO `部件代码` VALUES ('B2010300', 'Exterior Louvers, Screens & Fencing');
INSERT INTO `部件代码` VALUES ('B2010400', 'Exterior Sun Control Devices');
INSERT INTO `部件代码` VALUES ('B2010500', 'Balcony Walls & Handrails');
INSERT INTO `部件代码` VALUES ('B2010600', 'Exterior Soffits');
INSERT INTO `部件代码` VALUES ('B2020', 'Exterior Windows');
INSERT INTO `部件代码` VALUES ('B2020100', 'Windows');
INSERT INTO `部件代码` VALUES ('B2020110', 'Windows - Aluminum');
INSERT INTO `部件代码` VALUES ('B2020120', 'Windows - Steel');
INSERT INTO `部件代码` VALUES ('B2020130', 'Windows - Wood');
INSERT INTO `部件代码` VALUES ('B2020200', 'Curtain Walls');
INSERT INTO `部件代码` VALUES ('B2020210', 'Curtain Walls - Framing');
INSERT INTO `部件代码` VALUES ('B2020220', 'Curtain Walls - Panels');
INSERT INTO `部件代码` VALUES ('B2020300', 'Storefronts');
INSERT INTO `部件代码` VALUES ('B2020400', 'Screened Openings');
INSERT INTO `部件代码` VALUES ('B2030', 'Exterior Doors');
INSERT INTO `部件代码` VALUES ('B2030100', 'Glazed Doors & Entrances');
INSERT INTO `部件代码` VALUES ('B2030110', 'Exterior Glazed Doors - Aluminum');
INSERT INTO `部件代码` VALUES ('B2030120', 'Exterior Glazed Doors - Steel');
INSERT INTO `部件代码` VALUES ('B2030130', 'Exterior Glazed Doors - Wood');
INSERT INTO `部件代码` VALUES ('B2030200', 'Solid Exterior Doors');
INSERT INTO `部件代码` VALUES ('B2030210', 'Exterior Solid Doors - Aluminum');
INSERT INTO `部件代码` VALUES ('B2030220', 'Exterior Solid Doors - Steel');
INSERT INTO `部件代码` VALUES ('B2030230', 'Exterior Solid Doors - Wood');
INSERT INTO `部件代码` VALUES ('B2030300', 'Revolving Doors');
INSERT INTO `部件代码` VALUES ('B2030400', 'Overhead Doors & Roll-up Grilles');
INSERT INTO `部件代码` VALUES ('B2030410', 'Overhead Doors');
INSERT INTO `部件代码` VALUES ('B2030420', 'Roll-up Grilles');
INSERT INTO `部件代码` VALUES ('B2030500', 'Door Wall Opening Elements');
INSERT INTO `部件代码` VALUES ('B2030900', 'Other Exterior Doors');
INSERT INTO `部件代码` VALUES ('B30', 'Roofing');
INSERT INTO `部件代码` VALUES ('B3010', 'Roof Coverings');
INSERT INTO `部件代码` VALUES ('B3010100', 'Roof Finishes');
INSERT INTO `部件代码` VALUES ('B3010110', 'Roofing - Built-up');
INSERT INTO `部件代码` VALUES ('B3010120', 'Roofing - Single Ply Membrane');
INSERT INTO `部件代码` VALUES ('B3010130', 'Roofing - Preformed Metal');
INSERT INTO `部件代码` VALUES ('B3010140', 'Roofing - Formed Metal');
INSERT INTO `部件代码` VALUES ('B3010150', 'Roofing - Shingle & Tile');
INSERT INTO `部件代码` VALUES ('B3010200', 'Traffic Toppings & Paving Membranes');
INSERT INTO `部件代码` VALUES ('B3010300', 'Roof Insulation & Fill');
INSERT INTO `部件代码` VALUES ('B3010310', 'Roof Insulation - Rigid');
INSERT INTO `部件代码` VALUES ('B3010400', 'Roof Flashing & Trim');
INSERT INTO `部件代码` VALUES ('B3010410', 'Base Flashing');
INSERT INTO `部件代码` VALUES ('B3010420', 'Roof Edges');
INSERT INTO `部件代码` VALUES ('B3010430', 'Roof Flashing');
INSERT INTO `部件代码` VALUES ('B3010500', 'Roof Eaves & Soffits');
INSERT INTO `部件代码` VALUES ('B3010600', 'Gutters & Downspouts');
INSERT INTO `部件代码` VALUES ('B3010610', 'Gutters');
INSERT INTO `部件代码` VALUES ('B3010620', 'Downspouts');
INSERT INTO `部件代码` VALUES ('B3020', 'Roof Openings');
INSERT INTO `部件代码` VALUES ('B3020100', 'Glazed Roof Openings');
INSERT INTO `部件代码` VALUES ('B3020110', 'Skylights');
INSERT INTO `部件代码` VALUES ('B3020200', 'Roof Hatches');
INSERT INTO `部件代码` VALUES ('B3020210', 'Roof Hatches');
INSERT INTO `部件代码` VALUES ('B3020220', 'Smoke Vents');
INSERT INTO `部件代码` VALUES ('B3020230', 'Roof Accessories');
INSERT INTO `部件代码` VALUES ('B3020300', 'Gravity Roof Ventilators');
INSERT INTO `部件代码` VALUES ('C', 'Interiors');
INSERT INTO `部件代码` VALUES ('C10', 'Interior Construction');
INSERT INTO `部件代码` VALUES ('C1010', 'Partitions');
INSERT INTO `部件代码` VALUES ('C1010100', 'Fixed Partitions');
INSERT INTO `部件代码` VALUES ('C1010110', 'Partitions - Brick, Solid');
INSERT INTO `部件代码` VALUES ('C1010115', 'Partitions - Brick Veneer w/ Stud');
INSERT INTO `部件代码` VALUES ('C1010118', 'Partitions - Stone Veneer w/ Stud');
INSERT INTO `部件代码` VALUES ('C1010120', 'Partitions - CMU');
INSERT INTO `部件代码` VALUES ('C1010130', 'Partitions - Glass Block');
INSERT INTO `部件代码` VALUES ('C1010135', 'Partitions - Tile');
INSERT INTO `部件代码` VALUES ('C1010140', 'Partitions - Drywall w/ Wood Stud');
INSERT INTO `部件代码` VALUES ('C1010145', 'Partitions - Drywall w/ Metal Stud');
INSERT INTO `部件代码` VALUES ('C1010150', 'Partitions - Plaster w/ Wood Stud');
INSERT INTO `部件代码` VALUES ('C1010155', 'Partitions - Plaster w/ Metal Stud');
INSERT INTO `部件代码` VALUES ('C1010180', 'Partition Components - Wood Framing');
INSERT INTO `部件代码` VALUES ('C1010185', 'Partition Components - Metal Framing');
INSERT INTO `部件代码` VALUES ('C1010190', 'Partition Components - Drywall');
INSERT INTO `部件代码` VALUES ('C1010195', 'Partition Components - Plaster');
INSERT INTO `部件代码` VALUES ('C1010200', 'Demountable Partitions');
INSERT INTO `部件代码` VALUES ('C1010210', 'Partitions- Demountable, Drywall');
INSERT INTO `部件代码` VALUES ('C1010300', 'Retractable Partitions');
INSERT INTO `部件代码` VALUES ('C1010310', 'Partitions - Folding');
INSERT INTO `部件代码` VALUES ('C1010400', 'Site Built Toilet Partitions');
INSERT INTO `部件代码` VALUES ('C1010500', 'Site Built Compartments & Cubicles');
INSERT INTO `部件代码` VALUES ('C1010600', 'Interior Balustrades & Screens');
INSERT INTO `部件代码` VALUES ('C1010700', 'Interior Windows & Storefronts');
INSERT INTO `部件代码` VALUES ('C1010710', 'Interior Glazed Openings');
INSERT INTO `部件代码` VALUES ('C1020', 'Interior Doors');
INSERT INTO `部件代码` VALUES ('C1020100', 'Interior Doors');
INSERT INTO `部件代码` VALUES ('C1020110', 'Interior Doors - Metal');
INSERT INTO `部件代码` VALUES ('C1020120', 'Interior Doors - Wood');
INSERT INTO `部件代码` VALUES ('C1020200', 'Interior Door Frames');
INSERT INTO `部件代码` VALUES ('C1020210', 'Interior Door Frames - Metal');
INSERT INTO `部件代码` VALUES ('C1020220', 'Interior Door Frames - Wood');
INSERT INTO `部件代码` VALUES ('C1020300', 'Interior Doors with Frames');
INSERT INTO `部件代码` VALUES ('C1020310', 'Interior Metal Doors with Metal Frames');
INSERT INTO `部件代码` VALUES ('C1020320', 'Interior Wood Doors with Metal Frames');
INSERT INTO `部件代码` VALUES ('C1020330', 'Interior Wood Doors with Wood Frames');
INSERT INTO `部件代码` VALUES ('C1020400', 'Interior Door Hardware');
INSERT INTO `部件代码` VALUES ('C1020410', 'Door Hardware');
INSERT INTO `部件代码` VALUES ('C1020500', 'Interior Door Wall Opening Elements');
INSERT INTO `部件代码` VALUES ('C1020600', 'Interior Door Sidelights & Transoms');
INSERT INTO `部件代码` VALUES ('C1020700', 'Interior Hatches & Access Doors');
INSERT INTO `部件代码` VALUES ('C1030', 'Fittings');
INSERT INTO `部件代码` VALUES ('C1030100', 'Fabricated Compartments & Cubicles');
INSERT INTO `部件代码` VALUES ('C1030110', 'Toilet Partitions');
INSERT INTO `部件代码` VALUES ('C1030120', 'Telephone Enclosures');
INSERT INTO `部件代码` VALUES ('C1030200', 'Bath & Toilet Accessories');
INSERT INTO `部件代码` VALUES ('C1030210', 'Bath & Toilet Accessories - Commercial');
INSERT INTO `部件代码` VALUES ('C1030220', 'Bath & Toilet Accessories - Residential');
INSERT INTO `部件代码` VALUES ('C1030230', 'Hospital Curtains');
INSERT INTO `部件代码` VALUES ('C1030300', 'Storage Specialties');
INSERT INTO `部件代码` VALUES ('C1030310', 'Lockers');
INSERT INTO `部件代码` VALUES ('C1030320', 'Shelving');
INSERT INTO `部件代码` VALUES ('C1030330', 'Parts Bins');
INSERT INTO `部件代码` VALUES ('C1030400', 'Fabricated Cabinets & Counters');
INSERT INTO `部件代码` VALUES ('C1030410', 'Cabinets');
INSERT INTO `部件代码` VALUES ('C1030500', 'Identifying/Visual Aid Specialties');
INSERT INTO `部件代码` VALUES ('C1030510', 'Signs');
INSERT INTO `部件代码` VALUES ('C1030520', 'Building Directory Boards');
INSERT INTO `部件代码` VALUES ('C1030530', 'Bulletin Boards');
INSERT INTO `部件代码` VALUES ('C1030540', 'Chalkboards & Whiteboards');
INSERT INTO `部件代码` VALUES ('C1030600', 'Internal Traffic Protection Aids');
INSERT INTO `部件代码` VALUES ('C1030610', 'Turnstiles');
INSERT INTO `部件代码` VALUES ('C1030700', 'Integrated Appurtenances');
INSERT INTO `部件代码` VALUES ('C1030900', 'Other Fittings');
INSERT INTO `部件代码` VALUES ('C1030910', 'Mailboxes');
INSERT INTO `部件代码` VALUES ('C20', 'Stairs');
INSERT INTO `部件代码` VALUES ('C2010', 'Stair Construction');
INSERT INTO `部件代码` VALUES ('C2010100', 'Regular Stairs');
INSERT INTO `部件代码` VALUES ('C2010110', 'Stairs - CIP');
INSERT INTO `部件代码` VALUES ('C2010120', 'Stairs - Precast');
INSERT INTO `部件代码` VALUES ('C2010130', 'Stairs - Steel');
INSERT INTO `部件代码` VALUES ('C2010140', 'Stairs - Wood');
INSERT INTO `部件代码` VALUES ('C2010200', 'Curved Stairs');
INSERT INTO `部件代码` VALUES ('C2010300', 'Spiral Stairs');
INSERT INTO `部件代码` VALUES ('C2010310', 'Spiral Stairs - Metal');
INSERT INTO `部件代码` VALUES ('C2010320', 'Spiral Stairs - Wood');
INSERT INTO `部件代码` VALUES ('C2010400', 'Stair Handrails/Balustrades');
INSERT INTO `部件代码` VALUES ('C2020', 'Stair Finishes');
INSERT INTO `部件代码` VALUES ('C2020100', 'Stair, Tread & Landing Finishes');
INSERT INTO `部件代码` VALUES ('C2020200', 'Stair Soffit Finishes');
INSERT INTO `部件代码` VALUES ('C2020300', 'Stair Handrail & Balustrade Finishes');
INSERT INTO `部件代码` VALUES ('C30', 'Interior Finishes');
INSERT INTO `部件代码` VALUES ('C3010', 'Wall Finishes');
INSERT INTO `部件代码` VALUES ('C3010100', 'Wall Finishes');
INSERT INTO `部件代码` VALUES ('C3010110', 'Wall Finishes - Paint');
INSERT INTO `部件代码` VALUES ('C3010120', 'Wall Finishes - Coatings');
INSERT INTO `部件代码` VALUES ('C3010130', 'Wall Finishes - Coverings');
INSERT INTO `部件代码` VALUES ('C3010140', 'Wall Finishes - Paneling');
INSERT INTO `部件代码` VALUES ('C3010150', 'Wall Finishes - Tile');
INSERT INTO `部件代码` VALUES ('C3010300', 'Column Finishes');
INSERT INTO `部件代码` VALUES ('C3020', 'Floor Finishes');
INSERT INTO `部件代码` VALUES ('C3020100', 'Floor Toppings & Coatings');
INSERT INTO `部件代码` VALUES ('C3020110', 'Concrete Toppings');
INSERT INTO `部件代码` VALUES ('C3020120', 'Acrylic Coatings');
INSERT INTO `部件代码` VALUES ('C3020130', 'Epoxy Coatings');
INSERT INTO `部件代码` VALUES ('C3020200', 'Traffic Membranes');
INSERT INTO `部件代码` VALUES ('C3020300', 'Hardeners & Sealers');
INSERT INTO `部件代码` VALUES ('C3020400', 'Flooring');
INSERT INTO `部件代码` VALUES ('C3020410', 'Flooring - Sheet Goods');
INSERT INTO `部件代码` VALUES ('C3020420', 'Flooring - Terrazzo');
INSERT INTO `部件代码` VALUES ('C3020430', 'Flooring - Tile');
INSERT INTO `部件代码` VALUES ('C3020440', 'Flooring - VCT');
INSERT INTO `部件代码` VALUES ('C3020450', 'Flooring - Wood');
INSERT INTO `部件代码` VALUES ('C3020490', 'Flooring - Other');
INSERT INTO `部件代码` VALUES ('C3020500', 'Carpeting');
INSERT INTO `部件代码` VALUES ('C3020510', 'Carpet');
INSERT INTO `部件代码` VALUES ('C3020520', 'Carpet Tile');
INSERT INTO `部件代码` VALUES ('C3020600', 'Bases, Curbs & Trim');
INSERT INTO `部件代码` VALUES ('C3020610', 'Base - Vinyl & Rubber');
INSERT INTO `部件代码` VALUES ('C3020620', 'Base - Wood');
INSERT INTO `部件代码` VALUES ('C3020700', 'Access Pedestal Flooring');
INSERT INTO `部件代码` VALUES ('C3020800', 'Subflooring & Underlayment');
INSERT INTO `部件代码` VALUES ('C3020810', 'Subflooring & Underlayment - Wood');
INSERT INTO `部件代码` VALUES ('C3030', 'Ceiling Finishes');
INSERT INTO `部件代码` VALUES ('C3030100', 'Applied Ceiling Finishes');
INSERT INTO `部件代码` VALUES ('C3030110', 'Ceiling Finishes - Paint');
INSERT INTO `部件代码` VALUES ('C3030120', 'Ceiling Finishes - Coatings');
INSERT INTO `部件代码` VALUES ('C3030130', 'Ceiling Finishes - Coverings');
INSERT INTO `部件代码` VALUES ('C3030140', 'Ceiling Finishes - Paneling');
INSERT INTO `部件代码` VALUES ('C3030150', 'Ceiling Finishes - Tile');
INSERT INTO `部件代码` VALUES ('C3030200', 'Suspended Ceilings');
INSERT INTO `部件代码` VALUES ('C3030210', 'Suspended Ceilings - Acoustical');
INSERT INTO `部件代码` VALUES ('C3030220', 'Suspended Ceilings - Gypsum Board');
INSERT INTO `部件代码` VALUES ('C3030230', 'Suspended Ceilings - Plaster');
INSERT INTO `部件代码` VALUES ('C3030300', 'Drywall & Plaster Ceiling Components');
INSERT INTO `部件代码` VALUES ('C3030310', 'Ceiling Components - Drywall');
INSERT INTO `部件代码` VALUES ('C3030320', 'Ceiling components - Plaster');
INSERT INTO `部件代码` VALUES ('C3030900', 'Other Ceiling Finishes');
INSERT INTO `部件代码` VALUES ('D', 'Services');
INSERT INTO `部件代码` VALUES ('D10', 'Conveying');
INSERT INTO `部件代码` VALUES ('D1010', 'Elevators and Lifts');
INSERT INTO `部件代码` VALUES ('D1010100', 'Passenger Elevators');
INSERT INTO `部件代码` VALUES ('D1010110', 'Elevators - Hydraulic');
INSERT INTO `部件代码` VALUES ('D1010130', 'Elevators - Oil Hydraulic');
INSERT INTO `部件代码` VALUES ('D1010140', 'Elevators - Traction Geared');
INSERT INTO `部件代码` VALUES ('D1010150', 'Elevators - Traction Gearless');
INSERT INTO `部件代码` VALUES ('D1010200', 'Freight Elevators');
INSERT INTO `部件代码` VALUES ('D1010210', 'Elevators - Freight');
INSERT INTO `部件代码` VALUES ('D1010300', 'Lifts');
INSERT INTO `部件代码` VALUES ('D1010310', 'Lifts - Passenger');
INSERT INTO `部件代码` VALUES ('D1020', 'Escalators and Moving Walks');
INSERT INTO `部件代码` VALUES ('D1020100', 'Escalators');
INSERT INTO `部件代码` VALUES ('D1020110', 'Escalators');
INSERT INTO `部件代码` VALUES ('D1020200', 'Moving Walks');
INSERT INTO `部件代码` VALUES ('D1020210', 'Moving Walks');
INSERT INTO `部件代码` VALUES ('D1090', 'Other Conveying Systems');
INSERT INTO `部件代码` VALUES ('D1090100', 'Dumbwaiters');
INSERT INTO `部件代码` VALUES ('D1090200', 'Pneumatic Tube Systems');
INSERT INTO `部件代码` VALUES ('D1090300', 'Hoists & Cranes');
INSERT INTO `部件代码` VALUES ('D1090400', 'Conveyors');
INSERT INTO `部件代码` VALUES ('D1090410', 'Conveyors - Horizontal & Inclined');
INSERT INTO `部件代码` VALUES ('D1090420', 'Conveyors - Vertical');
INSERT INTO `部件代码` VALUES ('D1090500', 'Chutes');
INSERT INTO `部件代码` VALUES ('D1090510', 'Chutes - Linen & Refuse');
INSERT INTO `部件代码` VALUES ('D1090520', 'Chutes - Mail');
INSERT INTO `部件代码` VALUES ('D1090600', 'Turntables');
INSERT INTO `部件代码` VALUES ('D1090700', 'Baggage Handling & Loading Systems');
INSERT INTO `部件代码` VALUES ('D1090800', 'Transportation Systems');
INSERT INTO `部件代码` VALUES ('D20', 'Plumbing');
INSERT INTO `部件代码` VALUES ('D2010', 'Plumbing Fixtures');
INSERT INTO `部件代码` VALUES ('D2010100', 'Water Closets');
INSERT INTO `部件代码` VALUES ('D2010110', 'Water Closets - Single');
INSERT INTO `部件代码` VALUES ('D2010120', 'Water Closets - Group');
INSERT INTO `部件代码` VALUES ('D2010200', 'Urinals');
INSERT INTO `部件代码` VALUES ('D2010210', 'Urinals - Single');
INSERT INTO `部件代码` VALUES ('D2010220', 'Urinals - Battery Mount');
INSERT INTO `部件代码` VALUES ('D2010300', 'Lavatories');
INSERT INTO `部件代码` VALUES ('D2010310', 'Lavatories - Single');
INSERT INTO `部件代码` VALUES ('D2010320', 'Lavatories - Battery Mount');
INSERT INTO `部件代码` VALUES ('D2010400', 'Sinks');
INSERT INTO `部件代码` VALUES ('D2010410', 'Sinks - Kitchen');
INSERT INTO `部件代码` VALUES ('D2010420', 'Sinks - Laundry');
INSERT INTO `部件代码` VALUES ('D2010430', 'Sinks - Laboratory');
INSERT INTO `部件代码` VALUES ('D2010440', 'Sinks - Service');
INSERT INTO `部件代码` VALUES ('D2010500', 'Bathtubs');
INSERT INTO `部件代码` VALUES ('D2010510', 'Bathtubs');
INSERT INTO `部件代码` VALUES ('D2010600', 'Wash Fountains');
INSERT INTO `部件代码` VALUES ('D2010610', 'Wash Fountains - Group');
INSERT INTO `部件代码` VALUES ('D2010700', 'Showers');
INSERT INTO `部件代码` VALUES ('D2010710', 'Showers');
INSERT INTO `部件代码` VALUES ('D2010800', 'Drinking Fountains & Coolers');
INSERT INTO `部件代码` VALUES ('D2010810', 'Drinking Fountains');
INSERT INTO `部件代码` VALUES ('D2010820', 'Water Coolers');
INSERT INTO `部件代码` VALUES ('D2010900', 'Other Plumbing Fixtures');
INSERT INTO `部件代码` VALUES ('D2010910', 'Bidets');
INSERT INTO `部件代码` VALUES ('D2020', 'Domestic Water Distribution');
INSERT INTO `部件代码` VALUES ('D2020100', 'Cold Water Service');
INSERT INTO `部件代码` VALUES ('D2020200', 'Hot Water Service');
INSERT INTO `部件代码` VALUES ('D2020300', 'Domestic Water Supply Equipment');
INSERT INTO `部件代码` VALUES ('D2030', 'Sanitary Waste');
INSERT INTO `部件代码` VALUES ('D2030100', 'Waste Piping');
INSERT INTO `部件代码` VALUES ('D2030200', 'Vent Piping');
INSERT INTO `部件代码` VALUES ('D2030300', 'Floor Drains');
INSERT INTO `部件代码` VALUES ('D2030400', 'Sanitary Waste Equipment');
INSERT INTO `部件代码` VALUES ('D2030500', 'Pipe Insulation');
INSERT INTO `部件代码` VALUES ('D2040', 'Rain Water Drainage');
INSERT INTO `部件代码` VALUES ('D2040100', 'Pipe & Fittings');
INSERT INTO `部件代码` VALUES ('D2040200', 'Roof Drains');
INSERT INTO `部件代码` VALUES ('D2040300', 'Rainwater Drainage Equipment');
INSERT INTO `部件代码` VALUES ('D2040400', 'Pipe Insulation');
INSERT INTO `部件代码` VALUES ('D2090', 'Other Plumbing Systems');
INSERT INTO `部件代码` VALUES ('D2090100', 'Gas Distribution');
INSERT INTO `部件代码` VALUES ('D2090200', 'Acid Waste Systems');
INSERT INTO `部件代码` VALUES ('D2090300', 'Interceptors');
INSERT INTO `部件代码` VALUES ('D2090400', 'Pool Piping & Equipment');
INSERT INTO `部件代码` VALUES ('D2090500', 'Decorative Fountain Piping & Devices');
INSERT INTO `部件代码` VALUES ('D2090600', 'Special Water Systems');
INSERT INTO `部件代码` VALUES ('D2090800', 'Piping & Fittings');
INSERT INTO `部件代码` VALUES ('D2090900', 'Misc. Other Plumbing Systems');
INSERT INTO `部件代码` VALUES ('D30', 'HVAC');
INSERT INTO `部件代码` VALUES ('D3010', 'Energy Supply');
INSERT INTO `部件代码` VALUES ('D3010100', 'Oil Supply System');
INSERT INTO `部件代码` VALUES ('D3010200', 'Gas Supply System');
INSERT INTO `部件代码` VALUES ('D3010300', 'Coal Supply System');
INSERT INTO `部件代码` VALUES ('D3010400', 'Steam Supply System');
INSERT INTO `部件代码` VALUES ('D3010500', 'Hot Water Supply System');
INSERT INTO `部件代码` VALUES ('D3010600', 'Chilled Water Supply System');
INSERT INTO `部件代码` VALUES ('D3010700', 'Solar Energy Systems');
INSERT INTO `部件代码` VALUES ('D3010800', 'Wind Energy System');
INSERT INTO `部件代码` VALUES ('D3010900', 'Fuel Cell Systems');
INSERT INTO `部件代码` VALUES ('D3020', 'Heat Generating Systems');
INSERT INTO `部件代码` VALUES ('D3020100', 'Boilers');
INSERT INTO `部件代码` VALUES ('D3020200', 'Boiler Room Piping & Specialties');
INSERT INTO `部件代码` VALUES ('D3020300', 'Auxiliary Equipment');
INSERT INTO `部件代码` VALUES ('D3020400', 'Insulation');
INSERT INTO `部件代码` VALUES ('D3030', 'Cooling Generating Systems');
INSERT INTO `部件代码` VALUES ('D3030100', 'Chilled Water Systems');
INSERT INTO `部件代码` VALUES ('D3030200', 'Direct Expansion Systems');
INSERT INTO `部件代码` VALUES ('D3030300', 'Other Cooling System Components');
INSERT INTO `部件代码` VALUES ('D3040', 'Distribution Systems');
INSERT INTO `部件代码` VALUES ('D3040100', 'Air Distribution Systems');
INSERT INTO `部件代码` VALUES ('D3040200', 'Exhaust Ventilation Systems');
INSERT INTO `部件代码` VALUES ('D3040300', 'Steam Distribution Systems');
INSERT INTO `部件代码` VALUES ('D3040400', 'Hot Water Distribution');
INSERT INTO `部件代码` VALUES ('D3040500', 'Chilled Water Distribution');
INSERT INTO `部件代码` VALUES ('D3040600', 'Change-over Distribution Systems');
INSERT INTO `部件代码` VALUES ('D3040700', 'Glycol Distribution Systems');
INSERT INTO `部件代码` VALUES ('D3050', 'Terminal & Package Units');
INSERT INTO `部件代码` VALUES ('D3050100', 'Terminal Self-Contained Units');
INSERT INTO `部件代码` VALUES ('D3050200', 'Package Units');
INSERT INTO `部件代码` VALUES ('D3060', 'Controls & Instrumentation');
INSERT INTO `部件代码` VALUES ('D3060100', 'Heating Generating Systems');
INSERT INTO `部件代码` VALUES ('D3060200', 'Cooling Generating Systems');
INSERT INTO `部件代码` VALUES ('D3060300', 'Heating/Cooling Air Handling Units');
INSERT INTO `部件代码` VALUES ('D3060400', 'Exhaust & Ventilating Systems');
INSERT INTO `部件代码` VALUES ('D3060500', 'Hoods & Exhaust Systems');
INSERT INTO `部件代码` VALUES ('D3060600', 'Terminal Devices');
INSERT INTO `部件代码` VALUES ('D3060700', 'Energy Monitoring & Control');
INSERT INTO `部件代码` VALUES ('D3060800', 'Building Automation Systems');
INSERT INTO `部件代码` VALUES ('D3070', 'Systems Testing & Balancing');
INSERT INTO `部件代码` VALUES ('D3070100', 'Piping System Testing & Balancing');
INSERT INTO `部件代码` VALUES ('D3070200', 'Air System Testing & Balancing');
INSERT INTO `部件代码` VALUES ('D3070300', 'HVAC Commissioning');
INSERT INTO `部件代码` VALUES ('D3070900', 'Other System Testing & Balancing');
INSERT INTO `部件代码` VALUES ('D3090', 'Other HVAC Systems/Equip');
INSERT INTO `部件代码` VALUES ('D3090100', 'Special Cooling Systems & Devices');
INSERT INTO `部件代码` VALUES ('D3090200', 'Special Humidity Control');
INSERT INTO `部件代码` VALUES ('D3090300', 'Dust & Fume Collectors');
INSERT INTO `部件代码` VALUES ('D3090400', 'Air Curtains');
INSERT INTO `部件代码` VALUES ('D3090500', 'Air Purifiers');
INSERT INTO `部件代码` VALUES ('D3090600', 'Paint Spray Booth Ventilation');
INSERT INTO `部件代码` VALUES ('D3090700', 'General Construction Items (HVAC)');
INSERT INTO `部件代码` VALUES ('D3090900', 'Misc. Other HVAC Systems & Equipment');
INSERT INTO `部件代码` VALUES ('D40', 'Fire Protection');
INSERT INTO `部件代码` VALUES ('D4010', 'Sprinklers');
INSERT INTO `部件代码` VALUES ('D4010100', 'Sprinkler Water Supply');
INSERT INTO `部件代码` VALUES ('D4010200', 'Sprinkler Pumping Equipment');
INSERT INTO `部件代码` VALUES ('D4010300', 'Wet Sprinkler Systems');
INSERT INTO `部件代码` VALUES ('D4010400', 'Dry Sprinkler Systems');
INSERT INTO `部件代码` VALUES ('D4020', 'Standpipes');
INSERT INTO `部件代码` VALUES ('D4020100', 'Standpipe Water Supply');
INSERT INTO `部件代码` VALUES ('D4020200', 'Pumping Equipment');
INSERT INTO `部件代码` VALUES ('D4020300', 'Standpipe Equipment');
INSERT INTO `部件代码` VALUES ('D4020400', 'Fire Hose Equipment');
INSERT INTO `部件代码` VALUES ('D4030', 'Fire Protection Specialties');
INSERT INTO `部件代码` VALUES ('D4030100', 'Fire Extinguishers');
INSERT INTO `部件代码` VALUES ('D4030200', 'Fire Extinguisher Cabinets');
INSERT INTO `部件代码` VALUES ('D4030900', 'Other Fire Protection Specialties');
INSERT INTO `部件代码` VALUES ('D4090', 'Other Fire Protection Systems');
INSERT INTO `部件代码` VALUES ('D4090100', 'Carbon Dioxide Systems');
INSERT INTO `部件代码` VALUES ('D4090200', 'Foam Generating Equipment');
INSERT INTO `部件代码` VALUES ('D4090300', 'Clean Agent System');
INSERT INTO `部件代码` VALUES ('D4090400', 'Dry Chemical Systems');
INSERT INTO `部件代码` VALUES ('D4090500', 'Hood & Duct Fire Protection');
INSERT INTO `部件代码` VALUES ('D4090900', 'Misc. Other Fire Protection Systems');
INSERT INTO `部件代码` VALUES ('D50', 'Electrical');
INSERT INTO `部件代码` VALUES ('D5010', 'Electrical Service/Distribution');
INSERT INTO `部件代码` VALUES ('D5010100', 'High Tension Service & Distribution');
INSERT INTO `部件代码` VALUES ('D5010200', 'Low Tension Service & Distribution');
INSERT INTO `部件代码` VALUES ('D5020', 'Lighting and Branch Wiring');
INSERT INTO `部件代码` VALUES ('D5020100', 'Branch Wiring & Devices');
INSERT INTO `部件代码` VALUES ('D5020110', 'Receptacles - Wall');
INSERT INTO `部件代码` VALUES ('D5020115', 'Receptacles - Floor');
INSERT INTO `部件代码` VALUES ('D5020120', 'Switches - Wall');
INSERT INTO `部件代码` VALUES ('D5020200', 'Lighting Equipment');
INSERT INTO `部件代码` VALUES ('D5020210', 'Lighting - Fluorescent');
INSERT INTO `部件代码` VALUES ('D5020220', 'Lighting - Incandescent');
INSERT INTO `部件代码` VALUES ('D5020230', 'Lighting - High Intensity');
INSERT INTO `部件代码` VALUES ('D5020280', 'Light Poles');
INSERT INTO `部件代码` VALUES ('D5030', 'Communications and Security');
INSERT INTO `部件代码` VALUES ('D5030100', 'Public Address & Music Systems');
INSERT INTO `部件代码` VALUES ('D5030200', 'Intercommunication & Paging Systems');
INSERT INTO `部件代码` VALUES ('D5030300', 'Telephone Systems');
INSERT INTO `部件代码` VALUES ('D5030400', 'Call Systems');
INSERT INTO `部件代码` VALUES ('D5030500', 'Television Systems');
INSERT INTO `部件代码` VALUES ('D5030600', 'Data Networking');
INSERT INTO `部件代码` VALUES ('D5030700', 'Fire Alarm Systems');
INSERT INTO `部件代码` VALUES ('D5030800', 'Security & Detection Systems');
INSERT INTO `部件代码` VALUES ('D5030900', 'Other Communications & Security Systems');
INSERT INTO `部件代码` VALUES ('D5090', 'Other Electrical Systems');
INSERT INTO `部件代码` VALUES ('D5090100', 'Grounding Systems');
INSERT INTO `部件代码` VALUES ('D5090200', 'Emergency Light & Power Systems');
INSERT INTO `部件代码` VALUES ('D5090300', 'Floor Raceway Systems');
INSERT INTO `部件代码` VALUES ('D5090400', 'General Construction Items (Elect.)');
INSERT INTO `部件代码` VALUES ('D5090900', 'Misc. Other Electrical Systems');
INSERT INTO `部件代码` VALUES ('E', 'Equipment & Furnishings');
INSERT INTO `部件代码` VALUES ('E10', 'Equipment');
INSERT INTO `部件代码` VALUES ('E1010', 'Commercial Equipment');
INSERT INTO `部件代码` VALUES ('E1010100', 'Security & Vault Equipment');
INSERT INTO `部件代码` VALUES ('E1010110', 'Security Equipment');
INSERT INTO `部件代码` VALUES ('E1010120', 'Vault Equipment');
INSERT INTO `部件代码` VALUES ('E1010200', 'Teller & Service Equipment');
INSERT INTO `部件代码` VALUES ('E1010300', 'Registration Equipment');
INSERT INTO `部件代码` VALUES ('E1010400', 'Checkroom Equipment');
INSERT INTO `部件代码` VALUES ('E1010500', 'Mercantile Equipment');
INSERT INTO `部件代码` VALUES ('E1010510', 'Display Cases');
INSERT INTO `部件代码` VALUES ('E1010520', 'Checkout Counters');
INSERT INTO `部件代码` VALUES ('E1010600', 'Laundry & Dry Cleaning Equipment');
INSERT INTO `部件代码` VALUES ('E1010610', 'Laundry Equipment - Washers & Dryers');
INSERT INTO `部件代码` VALUES ('E1010620', 'Laundry Equipment - Ironers');
INSERT INTO `部件代码` VALUES ('E1010700', 'Vending Equipment');
INSERT INTO `部件代码` VALUES ('E1010800', 'Office Equipment');
INSERT INTO `部件代码` VALUES ('E1010900', 'Other Commercial Equipment');
INSERT INTO `部件代码` VALUES ('E1020', 'Institutional Equipment');
INSERT INTO `部件代码` VALUES ('E1020100', 'Ecclesiastical Equipment');
INSERT INTO `部件代码` VALUES ('E1020110', 'Ecclesiastical Equipment - Steeples & Bells');
INSERT INTO `部件代码` VALUES ('E1020120', 'Ecclesiastical Equipment - Baptismals & Fonts');
INSERT INTO `部件代码` VALUES ('E1020130', 'Ecclesiastical Equipment - Pews');
INSERT INTO `部件代码` VALUES ('E1020200', 'Library Equipment');
INSERT INTO `部件代码` VALUES ('E1020210', 'Library Equipment - Carrels');
INSERT INTO `部件代码` VALUES ('E1020230', 'Library Equipment - Shelves & Desks');
INSERT INTO `部件代码` VALUES ('E1020300', 'Theater & Stage Equipment');
INSERT INTO `部件代码` VALUES ('E1020310', 'Theater Equipment - Projection');
INSERT INTO `部件代码` VALUES ('E1020320', 'Theater Equipment - Lights & Tracks');
INSERT INTO `部件代码` VALUES ('E1020330', 'Theater Equipment - Curtains');
INSERT INTO `部件代码` VALUES ('E1020400', 'Instrumental Equipment');
INSERT INTO `部件代码` VALUES ('E1020500', 'Audio-visual Equipment');
INSERT INTO `部件代码` VALUES ('E1020600', 'Detention Equipment');
INSERT INTO `部件代码` VALUES ('E1020700', 'Laboratory Equipment');
INSERT INTO `部件代码` VALUES ('E1020710', 'Laboratory Equipment');
INSERT INTO `部件代码` VALUES ('E1020720', 'Laboratory Cabinets & Countertops');
INSERT INTO `部件代码` VALUES ('E1020730', 'Laboratory Hoods');
INSERT INTO `部件代码` VALUES ('E1020800', 'Medical Equipment');
INSERT INTO `部件代码` VALUES ('E1020810', 'Medical Furniture & Equipment');
INSERT INTO `部件代码` VALUES ('E1020820', 'X-ray Equipment');
INSERT INTO `部件代码` VALUES ('E1020900', 'Other Institutional Equipment');
INSERT INTO `部件代码` VALUES ('E1030', 'Vehicular Equipment');
INSERT INTO `部件代码` VALUES ('E1030100', 'Vehicular Service Equipment');
INSERT INTO `部件代码` VALUES ('E1030200', 'Parking Control Equipment');
INSERT INTO `部件代码` VALUES ('E1030300', 'Loading Dock Equipment');
INSERT INTO `部件代码` VALUES ('E1030900', 'Other Vehicular Equipment');
INSERT INTO `部件代码` VALUES ('E1090', 'Other Equipment');
INSERT INTO `部件代码` VALUES ('E1090100', 'Maintenance Equipment');
INSERT INTO `部件代码` VALUES ('E1090200', 'Solid Waste Handling Equipment');
INSERT INTO `部件代码` VALUES ('E1090300', 'Food Service Equipment');
INSERT INTO `部件代码` VALUES ('E1090310', 'Food Service - Cabinets & Countertops');
INSERT INTO `部件代码` VALUES ('E1090320', 'Food Service - Appliances & Equipment');
INSERT INTO `部件代码` VALUES ('E1090330', 'Food Service - Walk-in Refrigerators');
INSERT INTO `部件代码` VALUES ('E1090400', 'Residential Equipment');
INSERT INTO `部件代码` VALUES ('E1090500', 'Darkroom Equipment');
INSERT INTO `部件代码` VALUES ('E1090600', 'Window Washing Equipment');
INSERT INTO `部件代码` VALUES ('E1090900', 'Other Equipment');
INSERT INTO `部件代码` VALUES ('E20', 'Furnishings');
INSERT INTO `部件代码` VALUES ('E2010', 'Fixed Furnishings');
INSERT INTO `部件代码` VALUES ('E2010100', 'Fixed Artwork');
INSERT INTO `部件代码` VALUES ('E2010200', 'Fixed Casework');
INSERT INTO `部件代码` VALUES ('E2010300', 'Window Treatments');
INSERT INTO `部件代码` VALUES ('E2010310', 'Window Treatments - Blinds');
INSERT INTO `部件代码` VALUES ('E2010320', 'Window Treatments - Shades');
INSERT INTO `部件代码` VALUES ('E2010330', 'Window Treatments - Draperies');
INSERT INTO `部件代码` VALUES ('E2010400', 'Fixed Floor Grilles & Mats');
INSERT INTO `部件代码` VALUES ('E2010500', 'Fixed Multiple Seating');
INSERT INTO `部件代码` VALUES ('E2010600', 'Fixed Interior Landscaping');
INSERT INTO `部件代码` VALUES ('E2020', 'Moveable Furnishings');
INSERT INTO `部件代码` VALUES ('E2020100', 'Movable Artwork');
INSERT INTO `部件代码` VALUES ('E2020200', 'Furniture & Accessories');
INSERT INTO `部件代码` VALUES ('E2020300', 'Movable Rugs & Mats');
INSERT INTO `部件代码` VALUES ('E2020400', 'Movable Multiple Seating');
INSERT INTO `部件代码` VALUES ('E2020500', 'Movable Interior Landscaping');
INSERT INTO `部件代码` VALUES ('F', 'Special Construction & Demolition');
INSERT INTO `部件代码` VALUES ('F10', 'Special Construction');
INSERT INTO `部件代码` VALUES ('F1010', 'Special Structures');
INSERT INTO `部件代码` VALUES ('F1010100', 'Air Supported Structures');
INSERT INTO `部件代码` VALUES ('F1010200', 'Pre-engineered Structures');
INSERT INTO `部件代码` VALUES ('F1010300', 'Other Special Structures');
INSERT INTO `部件代码` VALUES ('F1020', 'Integrated Construction');
INSERT INTO `部件代码` VALUES ('F1020100', 'Integrated Assemblies');
INSERT INTO `部件代码` VALUES ('F1020200', 'Special Purpose Rooms');
INSERT INTO `部件代码` VALUES ('F1020300', 'Other Integrated Construction');
INSERT INTO `部件代码` VALUES ('F1030', 'Special Construction Systems');
INSERT INTO `部件代码` VALUES ('F1030100', 'Sound, Vibration & Seismic Construction');
INSERT INTO `部件代码` VALUES ('F1030200', 'Radiation Protection');
INSERT INTO `部件代码` VALUES ('F1030300', 'Special Security Systems');
INSERT INTO `部件代码` VALUES ('F1030400', 'Vaults');
INSERT INTO `部件代码` VALUES ('F1030900', 'Other Special Construction Systems');
INSERT INTO `部件代码` VALUES ('F1040', 'Special Facilities');
INSERT INTO `部件代码` VALUES ('F1040100', 'Aquatic Facilities');
INSERT INTO `部件代码` VALUES ('F1040200', 'Ice Rinks');
INSERT INTO `部件代码` VALUES ('F1040300', 'Site Constructed Incinerators');
INSERT INTO `部件代码` VALUES ('F1040400', 'Kennels & Animal Shelters');
INSERT INTO `部件代码` VALUES ('F1040500', 'Liquid & Gas Storage Tanks');
INSERT INTO `部件代码` VALUES ('F1040900', 'Other Special Facilities');
INSERT INTO `部件代码` VALUES ('F1050', 'Special Controls & Instrumentation');
INSERT INTO `部件代码` VALUES ('F1050100', 'Recording Instrumentation');
INSERT INTO `部件代码` VALUES ('F1050200', 'Building Automation Systems');
INSERT INTO `部件代码` VALUES ('F1050900', 'Other Special Control& Instrumentation');
INSERT INTO `部件代码` VALUES ('F20', 'Selective Building Demolition');
INSERT INTO `部件代码` VALUES ('F2010', 'Building Elements Demolition');
INSERT INTO `部件代码` VALUES ('F2010100', 'Building Interior Demolition');
INSERT INTO `部件代码` VALUES ('F2010200', 'Building Exterior Demolition');
INSERT INTO `部件代码` VALUES ('F2020', 'Hazardous Components Abatement');
INSERT INTO `部件代码` VALUES ('F2020100', 'Removal of Hazardous Components');
INSERT INTO `部件代码` VALUES ('F2020200', 'Encapsulation of Hazardous Components');
INSERT INTO `部件代码` VALUES ('G', 'Building Sitework');
INSERT INTO `部件代码` VALUES ('G10', 'Site Preparation');
INSERT INTO `部件代码` VALUES ('G1010', 'Site Clearing');
INSERT INTO `部件代码` VALUES ('G1010100', 'Clearing & Grubbing');
INSERT INTO `部件代码` VALUES ('G1010200', 'Tree Removal & Thinning');
INSERT INTO `部件代码` VALUES ('G1020', 'Site Demolition and Relocations');
INSERT INTO `部件代码` VALUES ('G1020100', 'Building Demolition');
INSERT INTO `部件代码` VALUES ('G1020200', 'Demolition of Site Components');
INSERT INTO `部件代码` VALUES ('G1020300', 'Relocation of Buildings');
INSERT INTO `部件代码` VALUES ('G1020400', 'Utilities Relocation');
INSERT INTO `部件代码` VALUES ('G1030', 'Site Earthwork');
INSERT INTO `部件代码` VALUES ('G1030100', 'Site Grading Excavation & Disposal');
INSERT INTO `部件代码` VALUES ('G1030200', 'Borrow Fill');
INSERT INTO `部件代码` VALUES ('G1030300', 'Soil Stabilization & Treatment');
INSERT INTO `部件代码` VALUES ('G1030400', 'Site Dewatering');
INSERT INTO `部件代码` VALUES ('G1030500', 'Site Shoring');
INSERT INTO `部件代码` VALUES ('G1030600', 'Embankments');
INSERT INTO `部件代码` VALUES ('G1030700', 'Erosion Control');
INSERT INTO `部件代码` VALUES ('G1030800', 'Utilities Trenching');
INSERT INTO `部件代码` VALUES ('G1040', 'Hazardous Waste Remediation');
INSERT INTO `部件代码` VALUES ('G1040100', 'Removal of Contaminated Soil');
INSERT INTO `部件代码` VALUES ('G1040200', 'Soil Restoration & Treatment');
INSERT INTO `部件代码` VALUES ('G1040900', 'Other Hazardous Waste Remediation');
INSERT INTO `部件代码` VALUES ('G20', 'Site Improvement');
INSERT INTO `部件代码` VALUES ('G2010', 'Roadways');
INSERT INTO `部件代码` VALUES ('G2010100', 'Roadway Bases & Sub-Bases');
INSERT INTO `部件代码` VALUES ('G2010200', 'Roadway Paving & Surfacing');
INSERT INTO `部件代码` VALUES ('G2010300', 'Curbs, Gutters & Drains');
INSERT INTO `部件代码` VALUES ('G2010400', 'Guardrails & Barriers');
INSERT INTO `部件代码` VALUES ('G2010500', 'Painted Lines & Markings');
INSERT INTO `部件代码` VALUES ('G2010600', 'Signage');
INSERT INTO `部件代码` VALUES ('G2010700', 'Vehicular Bridges');
INSERT INTO `部件代码` VALUES ('G2020', 'Parking Lots');
INSERT INTO `部件代码` VALUES ('G2020100', 'Parking Lot Bases & Sub-Bases');
INSERT INTO `部件代码` VALUES ('G2020200', 'Parking Lot Paving & Surfacing');
INSERT INTO `部件代码` VALUES ('G2020300', 'Curbs, Gutters & Drains');
INSERT INTO `部件代码` VALUES ('G2020400', 'Guardrails & Barriers');
INSERT INTO `部件代码` VALUES ('G2020500', 'Parking Booths & Equipment');
INSERT INTO `部件代码` VALUES ('G2020600', 'Painted Lines & Markings');
INSERT INTO `部件代码` VALUES ('G2020700', 'Signage');
INSERT INTO `部件代码` VALUES ('G2030', 'Pedestrian Paving');
INSERT INTO `部件代码` VALUES ('G2030100', 'Bases & Sub-Bases');
INSERT INTO `部件代码` VALUES ('G2030200', 'Sidewalks');
INSERT INTO `部件代码` VALUES ('G2030300', 'Brick & Tile Plazas');
INSERT INTO `部件代码` VALUES ('G2030400', 'Edging');
INSERT INTO `部件代码` VALUES ('G2030500', 'Exterior Steps & Ramps');
INSERT INTO `部件代码` VALUES ('G2030600', 'Pedestrian Bridges');
INSERT INTO `部件代码` VALUES ('G2040', 'Site Development');
INSERT INTO `部件代码` VALUES ('G2040100', 'Fences & Gates');
INSERT INTO `部件代码` VALUES ('G2040200', 'Retaining Walls');
INSERT INTO `部件代码` VALUES ('G2040300', 'Terracing & Perimeter Walls');
INSERT INTO `部件代码` VALUES ('G2040400', 'Signage');
INSERT INTO `部件代码` VALUES ('G2040500', 'Site Furnishings');
INSERT INTO `部件代码` VALUES ('G2040600', 'Fountains, Pools & Watercourses');
INSERT INTO `部件代码` VALUES ('G2040700', 'Playing Fields');
INSERT INTO `部件代码` VALUES ('G2040800', 'Flagpoles');
INSERT INTO `部件代码` VALUES ('G2040900', 'Other Site Development');
INSERT INTO `部件代码` VALUES ('G2050', 'Landscaping');
INSERT INTO `部件代码` VALUES ('G2050100', 'Fine Grading & Soil Preparation');
INSERT INTO `部件代码` VALUES ('G2050200', 'Erosion Control Measures');
INSERT INTO `部件代码` VALUES ('G2050300', 'Vehicular Bridges');
INSERT INTO `部件代码` VALUES ('G2050400', 'Seeding & Sodding');
INSERT INTO `部件代码` VALUES ('G2050500', 'Planting');
INSERT INTO `部件代码` VALUES ('G2050600', 'Planters');
INSERT INTO `部件代码` VALUES ('G2050700', 'Irrigation Systems');
INSERT INTO `部件代码` VALUES ('G2050900', 'Other Landscape Features');
INSERT INTO `部件代码` VALUES ('G30', 'Site Mechanical Utilities');
INSERT INTO `部件代码` VALUES ('G3010', 'Water Supply');
INSERT INTO `部件代码` VALUES ('G3010100', 'Potable Water Distribution & Storage');
INSERT INTO `部件代码` VALUES ('G3010200', 'Non Potable Water Distribution & Storage');
INSERT INTO `部件代码` VALUES ('G3010300', 'Well Systems');
INSERT INTO `部件代码` VALUES ('G3010400', 'Fire Protection Distribution & Storage');
INSERT INTO `部件代码` VALUES ('G3010500', 'Pumping Stations');
INSERT INTO `部件代码` VALUES ('G3010600', 'Package Water Treatment Plants');
INSERT INTO `部件代码` VALUES ('G3020', 'Sanitary Sewer');
INSERT INTO `部件代码` VALUES ('G3020100', 'Sewage Piping');
INSERT INTO `部件代码` VALUES ('G3020200', 'Manholes & Cleanouts');
INSERT INTO `部件代码` VALUES ('G3020300', 'Septic Disposal Systems');
INSERT INTO `部件代码` VALUES ('G3020400', 'Lift Stations');
INSERT INTO `部件代码` VALUES ('G3020500', 'Packaged Water Waste Treatment Plants');
INSERT INTO `部件代码` VALUES ('G3030', 'Storm Sewer');
INSERT INTO `部件代码` VALUES ('G3030100', 'Storm Sewer Piping');
INSERT INTO `部件代码` VALUES ('G3030200', 'Manholes');
INSERT INTO `部件代码` VALUES ('G3030300', 'Headwalls & Catch Basins');
INSERT INTO `部件代码` VALUES ('G3030400', 'Lift Stations');
INSERT INTO `部件代码` VALUES ('G3030500', 'Retention Ponds');
INSERT INTO `部件代码` VALUES ('G3030600', 'Ditches & Culverts');
INSERT INTO `部件代码` VALUES ('G3040', 'Heating Distribution');
INSERT INTO `部件代码` VALUES ('G3040100', 'Steam Supply');
INSERT INTO `部件代码` VALUES ('G3040200', 'Condensate Return');
INSERT INTO `部件代码` VALUES ('G3040300', 'Hot Water Supply System');
INSERT INTO `部件代码` VALUES ('G3040400', 'Pumping Stations');
INSERT INTO `部件代码` VALUES ('G3050', 'Cooling Distribution');
INSERT INTO `部件代码` VALUES ('G3050100', 'Chilled Water Piping');
INSERT INTO `部件代码` VALUES ('G3050200', 'Wells for Cooling/Heating');
INSERT INTO `部件代码` VALUES ('G3050300', 'Pumping Stations');
INSERT INTO `部件代码` VALUES ('G3050400', 'Cooling Towers on Site');
INSERT INTO `部件代码` VALUES ('G3060', 'Fuel Distribution');
INSERT INTO `部件代码` VALUES ('G3060100', 'Fuel Piping');
INSERT INTO `部件代码` VALUES ('G3060200', 'Fuel Equipment');
INSERT INTO `部件代码` VALUES ('G3060300', 'Fuel Storage Tanks');
INSERT INTO `部件代码` VALUES ('G3060400', 'Fuel Dispensing Stations');
INSERT INTO `部件代码` VALUES ('G3090', 'Other Site Mechanical Utilities');
INSERT INTO `部件代码` VALUES ('G3090100', 'Industrial Waste Systems');
INSERT INTO `部件代码` VALUES ('G3090200', 'POL Distribution Systems');
INSERT INTO `部件代码` VALUES ('G40', 'Site Electrical Utilities');
INSERT INTO `部件代码` VALUES ('G4010', 'Electrical Distribution');
INSERT INTO `部件代码` VALUES ('G4010100', 'Substations');
INSERT INTO `部件代码` VALUES ('G4010200', 'Overhead Power Distribution');
INSERT INTO `部件代码` VALUES ('G4010300', 'Underground Power Distribution');
INSERT INTO `部件代码` VALUES ('G4020', 'Site Lighting');
INSERT INTO `部件代码` VALUES ('G4020100', 'Site Fixtures & Transformers');
INSERT INTO `部件代码` VALUES ('G4020200', 'Site Lighting Poles');
INSERT INTO `部件代码` VALUES ('G4020300', 'Wiring Conduits & Ductbanks');
INSERT INTO `部件代码` VALUES ('G4020400', 'Site Lighting Controls');
INSERT INTO `部件代码` VALUES ('G4030', 'Site Communication and Security');
INSERT INTO `部件代码` VALUES ('G4030100', 'Site Communications Systems');
INSERT INTO `部件代码` VALUES ('G4030200', 'Site Security & Alarm Systems');
INSERT INTO `部件代码` VALUES ('G4040', 'Other Site Electrical Utilities');
INSERT INTO `部件代码` VALUES ('G4040100', 'Cathodic Protection');
INSERT INTO `部件代码` VALUES ('G4040200', 'Site Emergency Power Generation');
INSERT INTO `部件代码` VALUES ('G90', 'Other Site Construction');
INSERT INTO `部件代码` VALUES ('G9010', 'Service and Pedestrian Tunnels');
INSERT INTO `部件代码` VALUES ('G9010100', 'Service Tunnels');
INSERT INTO `部件代码` VALUES ('G9010200', 'Trench Boxes');
INSERT INTO `部件代码` VALUES ('G9010300', 'Pedestrian Tunnels');
INSERT INTO `部件代码` VALUES ('G9090', 'Other Site Systems/Equipment');
INSERT INTO `部件代码` VALUES ('G9090100', 'Snow Melting Systems');

-- ----------------------------
-- Table structure for 部件类型
-- ----------------------------
DROP TABLE IF EXISTS `部件类型`;
CREATE TABLE `部件类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK部件类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK部件类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 部件类型
-- ----------------------------

-- ----------------------------
-- Table structure for 配电盘明细表样板 - 分支配电盘
-- ----------------------------
DROP TABLE IF EXISTS `配电盘明细表样板 - 分支配电盘`;
CREATE TABLE `配电盘明细表样板 - 分支配电盘`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK配电盘明细表样板 - 分支配电盘1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK配电盘明细表样板 - 分支配电盘1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 配电盘明细表样板 - 分支配电盘
-- ----------------------------
INSERT INTO `配电盘明细表样板 - 分支配电盘` VALUES (501577, NULL);
INSERT INTO `配电盘明细表样板 - 分支配电盘` VALUES (518699, NULL);
INSERT INTO `配电盘明细表样板 - 分支配电盘` VALUES (518700, NULL);

-- ----------------------------
-- Table structure for 配电盘明细表样板 - 开关板
-- ----------------------------
DROP TABLE IF EXISTS `配电盘明细表样板 - 开关板`;
CREATE TABLE `配电盘明细表样板 - 开关板`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK配电盘明细表样板 - 开关板1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK配电盘明细表样板 - 开关板1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 配电盘明细表样板 - 开关板
-- ----------------------------
INSERT INTO `配电盘明细表样板 - 开关板` VALUES (501579, NULL);

-- ----------------------------
-- Table structure for 配电盘明细表样板 - 数据配电盘
-- ----------------------------
DROP TABLE IF EXISTS `配电盘明细表样板 - 数据配电盘`;
CREATE TABLE `配电盘明细表样板 - 数据配电盘`  (
  `ID` int NOT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK配电盘明细表样板 - 数据配电盘1`(`设计选项`) USING BTREE,
  CONSTRAINT `FK配电盘明细表样板 - 数据配电盘1` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 配电盘明细表样板 - 数据配电盘
-- ----------------------------
INSERT INTO `配电盘明细表样板 - 数据配电盘` VALUES (501578, NULL);

-- ----------------------------
-- Table structure for 配电系统
-- ----------------------------
DROP TABLE IF EXISTS `配电系统`;
CREATE TABLE `配电系统`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK配电系统1`(`类型 ID`) USING BTREE,
  INDEX `FK配电系统2`(`创建的阶段`) USING BTREE,
  INDEX `FK配电系统3`(`拆除的阶段`) USING BTREE,
  INDEX `FK配电系统4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK配电系统1` FOREIGN KEY (`类型 ID`) REFERENCES `配电系统1` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK配电系统2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK配电系统3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK配电系统4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 配电系统
-- ----------------------------

-- ----------------------------
-- Table structure for 配电系统1
-- ----------------------------
DROP TABLE IF EXISTS `配电系统1`;
CREATE TABLE `配电系统1`  (
  `ID` int NOT NULL,
  `线电压` int NULL DEFAULT NULL,
  `相电压` int NULL DEFAULT NULL,
  `相位` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `配置` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `导线` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 配电系统1
-- ----------------------------
INSERT INTO `配电系统1` VALUES (55360, 142450, 55359, '三相', '星形', '4');
INSERT INTO `配电系统1` VALUES (277809, 277806, 55359, '单相', '无', '3');
INSERT INTO `配电系统1` VALUES (277810, 277808, 277807, '三相', '星形', '4');
INSERT INTO `配电系统1` VALUES (466460, 466458, 466457, '三相', '星形', '4');
INSERT INTO `配电系统1` VALUES (466461, 466459, NULL, '三相', '三角形', '3');

-- ----------------------------
-- Table structure for 锚固件
-- ----------------------------
DROP TABLE IF EXISTS `锚固件`;
CREATE TABLE `锚固件`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `编号` int NULL DEFAULT NULL,
  `半径` double NULL DEFAULT NULL,
  `边 2 的边缘距离` double NULL DEFAULT NULL,
  `边 1 的边缘距离` double NULL DEFAULT NULL,
  `边 2 的间距` double NULL DEFAULT NULL,
  `边 1 的间距` double NULL DEFAULT NULL,
  `边 2 的长度` double NULL DEFAULT NULL,
  `边 1 的长度` double NULL DEFAULT NULL,
  `边 2 的数量` int NULL DEFAULT NULL,
  `边 1 的数量` int NULL DEFAULT NULL,
  `涂层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `直径` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `等级` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标准` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构材质` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK锚固件1`(`创建的阶段`) USING BTREE,
  INDEX `FK锚固件2`(`拆除的阶段`) USING BTREE,
  INDEX `FK锚固件3`(`设计选项`) USING BTREE,
  INDEX `FK锚固件4`(`结构材质`) USING BTREE,
  CONSTRAINT `FK锚固件1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK锚固件2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK锚固件3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK锚固件4` FOREIGN KEY (`结构材质`) REFERENCES `材质` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 锚固件
-- ----------------------------

-- ----------------------------
-- Table structure for 门
-- ----------------------------
DROP TABLE IF EXISTS `门`;
CREATE TABLE `门`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `主体 ID` int NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `顶高度` double NULL DEFAULT NULL,
  `底高度` double NULL DEFAULT NULL,
  `框架材质` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `框架类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `完成` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK门1`(`类型 ID`) USING BTREE,
  INDEX `FK门2`(`创建的阶段`) USING BTREE,
  INDEX `FK门3`(`拆除的阶段`) USING BTREE,
  INDEX `FK门4`(`设计选项`) USING BTREE,
  INDEX `FK门5`(`标高`) USING BTREE,
  CONSTRAINT `FK门1` FOREIGN KEY (`类型 ID`) REFERENCES `门类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK门2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK门3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK门4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK门5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 门
-- ----------------------------

-- ----------------------------
-- Table structure for 门类型
-- ----------------------------
DROP TABLE IF EXISTS `门类型`;
CREATE TABLE `门类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `可见光透过率` double NULL DEFAULT NULL,
  `日光得热系数` double NULL DEFAULT NULL,
  `热阻(R)` double NULL DEFAULT NULL,
  `传热系数(U)` double NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `粗略宽度` double NULL DEFAULT NULL,
  `粗略高度` double NULL DEFAULT NULL,
  `厚度` double NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `高度` double NULL DEFAULT NULL,
  `操作` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `构造类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `防火等级` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK门类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK门类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK门类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK门类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 门类型
-- ----------------------------

-- ----------------------------
-- Table structure for 阶段
-- ----------------------------
DROP TABLE IF EXISTS `阶段`;
CREATE TABLE `阶段`  (
  `ID` int NOT NULL,
  `序列号` int NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 阶段
-- ----------------------------
INSERT INTO `阶段` VALUES (12589, 1, '现有');
INSERT INTO `阶段` VALUES (86961, 2, '新构造');

-- ----------------------------
-- Table structure for 需求系数
-- ----------------------------
DROP TABLE IF EXISTS `需求系数`;
CREATE TABLE `需求系数`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK需求系数1`(`类型 ID`) USING BTREE,
  INDEX `FK需求系数2`(`创建的阶段`) USING BTREE,
  INDEX `FK需求系数3`(`拆除的阶段`) USING BTREE,
  INDEX `FK需求系数4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK需求系数1` FOREIGN KEY (`类型 ID`) REFERENCES `需求系数类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK需求系数2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK需求系数3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK需求系数4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 需求系数
-- ----------------------------

-- ----------------------------
-- Table structure for 需求系数类型
-- ----------------------------
DROP TABLE IF EXISTS `需求系数类型`;
CREATE TABLE `需求系数类型`  (
  `ID` int NOT NULL,
  `负荷分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `连接的负荷` double NULL DEFAULT NULL,
  `估计的需用负荷` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 需求系数类型
-- ----------------------------

-- ----------------------------
-- Table structure for 面积
-- ----------------------------
DROP TABLE IF EXISTS `面积`;
CREATE TABLE `面积`  (
  `ID` int NOT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `面积方案 ID` int NULL DEFAULT NULL,
  `面积类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `周长` double NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK面积1`(`面积方案 ID`) USING BTREE,
  INDEX `FK面积2`(`标高`) USING BTREE,
  CONSTRAINT `FK面积1` FOREIGN KEY (`面积方案 ID`) REFERENCES `面积方案` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK面积2` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 面积
-- ----------------------------

-- ----------------------------
-- Table structure for 面积方案
-- ----------------------------
DROP TABLE IF EXISTS `面积方案`;
CREATE TABLE `面积方案`  (
  `ID` int NOT NULL,
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 面积方案
-- ----------------------------
INSERT INTO `面积方案` VALUES (9490, '总建筑面积');
INSERT INTO `面积方案` VALUES (9494, '可出租');

-- ----------------------------
-- Table structure for 面荷载
-- ----------------------------
DROP TABLE IF EXISTS `面荷载`;
CREATE TABLE `面荷载`  (
  `ID` int NOT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `性质` int NULL DEFAULT NULL,
  `全部非 0 荷载` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `Fz 3` double NULL DEFAULT NULL,
  `Fy 3` double NULL DEFAULT NULL,
  `Fx 3` double NULL DEFAULT NULL,
  `Fz 2` double NULL DEFAULT NULL,
  `Fy 2` double NULL DEFAULT NULL,
  `Fx 2` double NULL DEFAULT NULL,
  `Fz 1` double NULL DEFAULT NULL,
  `Fy 1` double NULL DEFAULT NULL,
  `Fx 1` double NULL DEFAULT NULL,
  `为反作用力` int NULL DEFAULT NULL,
  `定向到` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `荷载工况` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK面荷载1`(`创建的阶段`) USING BTREE,
  INDEX `FK面荷载2`(`拆除的阶段`) USING BTREE,
  INDEX `FK面荷载3`(`设计选项`) USING BTREE,
  CONSTRAINT `FK面荷载1` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK面荷载2` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK面荷载3` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 面荷载
-- ----------------------------

-- ----------------------------
-- Table structure for 项目信息
-- ----------------------------
DROP TABLE IF EXISTS `项目信息`;
CREATE TABLE `项目信息`  (
  `ID` int NOT NULL,
  `IfcOrganization` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcApplicationVersion` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcApplicationName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `组织名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `组织描述` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `建筑名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `作者` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcSite GUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcBuilding GUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcProject GUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `项目发布日期` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `项目状态` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `客户姓名` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `项目地址` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `项目名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `项目编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `容积率` double NULL DEFAULT NULL,
  `绿地率` double NULL DEFAULT NULL,
  `建筑类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `框架抗震等级` int NULL DEFAULT NULL,
  `设计阶段` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `设计主持人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `项目子项` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `设计号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `设计证书号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `建筑：设计部门负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `项目经理` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `建筑：工种负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `建筑：审定` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `建筑：审核` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `建筑：设计部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `建筑：设计阶段` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构：设计阶段` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构：工种负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构：审定` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构：审核` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构：设计部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `结构：设计部门负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `暖通：设计阶段` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `暖通：工种负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `暖通：审定` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `暖通：审核` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `暖通：设计部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `暖通：设计部门负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `给排水：设计阶段` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `给排水：工种负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `给排水：审定` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `给排水：审核` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `给排水：设计部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `给排水：设计部门负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气：设计阶段` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气：工种负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气：审定` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气：审核` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气：设计部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `电气：设计部门负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `景观：设计阶段` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `景观：工种负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `景观：审定` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `景观：审核` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `景观：设计部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `景观：设计部门负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `室内：设计阶段` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `室内：工种负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `室内：审定` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `室内：审核` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `室内：设计部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `室内：设计部门负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `智能化：设计阶段` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `智能化：工种负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `智能化：审定` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `智能化：审核` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `智能化：设计部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `智能化：设计部门负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总图：设计阶段` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总图：工种负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总图：审定` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总图：审核` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总图：设计部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总图：设计部门负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `建设用地面积 (m?)` double NULL DEFAULT NULL,
  `总建筑面积 (m?)` double NULL DEFAULT NULL,
  `地上建筑面积 (m?)` double NULL DEFAULT NULL,
  `地下建筑面积 (m?)` double NULL DEFAULT NULL,
  `经济：设计阶段` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `经济：工种负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `经济：审定` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `经济：审核` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `经济：设计部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `经济：设计部门负责人` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 项目信息
-- ----------------------------
INSERT INTO `项目信息` VALUES (49504, NULL, NULL, NULL, '中国建筑设计研究院建筑设计总院', NULL, NULL, NULL, NULL, NULL, NULL, '出图日期', '项目状态', '所有者', '请在此处输入地址', '项目名称', '项目编号', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A111002193', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 风管
-- ----------------------------
DROP TABLE IF EXISTS `风管`;
CREATE TABLE `风管`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `可用大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `内衬厚度` double NULL DEFAULT NULL,
  `内衬类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `底部高程` double NULL DEFAULT NULL,
  `顶部高程` double NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `尺寸锁定` int NULL DEFAULT NULL,
  `其他流量` double NULL DEFAULT NULL,
  `水力直径` double NULL DEFAULT NULL,
  `雷诺数` double NULL DEFAULT NULL,
  `当量直径` double NULL DEFAULT NULL,
  `剖面` int NULL DEFAULT NULL,
  `损耗系数` double NULL DEFAULT NULL,
  `风压` double NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `摩擦` double NULL DEFAULT NULL,
  `压降` double NULL DEFAULT NULL,
  `速度` double NULL DEFAULT NULL,
  `直径` double NULL DEFAULT NULL,
  `高度` double NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `流量` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK风管1`(`类型 ID`) USING BTREE,
  INDEX `FK风管2`(`创建的阶段`) USING BTREE,
  INDEX `FK风管3`(`拆除的阶段`) USING BTREE,
  INDEX `FK风管4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK风管1` FOREIGN KEY (`类型 ID`) REFERENCES `风管类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 风管
-- ----------------------------
INSERT INTO `风管` VALUES (1648254, 142431, 86961, NULL, NULL, 'XF', '600 mmx250 mm', '600 mmx250 mm', 0, NULL, 0, NULL, NULL, 856859, '送风', 'XF 2', 3.0750000000000006, 3.325, '600x250', 0, 0, 0.35294117647058826, 0, 0.41366202896558674, 9, 0, 0, 2.37533844853438, 0, 0, 0, NULL, 0.25, 0.6000000000000001, NULL, 0, NULL, 1.3972579109025767, '430', NULL, NULL, NULL);
INSERT INTO `风管` VALUES (1652837, 142431, 86961, NULL, NULL, 'PF', '600 mmx300 mm', '600 mmx300 mm', 0, NULL, 0, NULL, NULL, 856864, '排风', 'PF 1', 3.1499999999999986, 3.4499999999999997, '600x300', 0, 0, 0.4, 0, 0.45701245977782906, 2, 0, 0, 5.235896534972744, 0, 0, 0, NULL, 0.30000000000000004, 0.6000000000000001, NULL, 0, NULL, 2.908831408318191, '436', NULL, NULL, NULL);
INSERT INTO `风管` VALUES (1652848, 142431, 86961, NULL, NULL, 'PF', '600 mmx300 mm', '600 mmx300 mm', 0, NULL, 0, NULL, NULL, 856864, '排风', 'PF 1', 3.1499999999999986, 3.4499999999999997, '600x300', 0, 0, 0.4, 0, 0.45701245977782906, 2, 0, 0, 3.8689203459776507, 0, 0, 0, NULL, 0.30000000000000004, 0.6000000000000001, NULL, 0, NULL, 2.149400192209806, '437', NULL, NULL, NULL);
INSERT INTO `风管` VALUES (1659295, 142431, 86961, NULL, NULL, 'XF', '600 mmx250 mm', '600 mmx250 mm', 0, NULL, 0, NULL, NULL, 856859, '送风', 'XF 2', 3.0750000000000006, 3.325000000000089, '600x250', 0, 0, 0.35294117647058826, 0, 0.41366202896558674, 9, 0, 0, 24.724800001179688, 0, 0, 0, NULL, 0.25, 0.6000000000000001, NULL, 0, NULL, 14.544000000693933, '473', NULL, NULL, NULL);
INSERT INTO `风管` VALUES (2170081, 142431, 86961, NULL, NULL, 'XF', '600 mmx250 mm', '600 mmx250 mm', 0, NULL, 0, NULL, NULL, 856859, '送风', 'XF 2', 3.0750000000000006, 3.325000000000089, '600x250', 0, 0, 0.35294117647058826, 0, 0.41366202896558674, 9, 0, 0, 16.819799999999997, 0, 0, 0, NULL, 0.25, 0.6000000000000001, NULL, 0, NULL, 9.893999999999997, NULL, NULL, NULL, NULL);
INSERT INTO `风管` VALUES (2170095, 142431, 86961, NULL, NULL, 'XF', '600 mmx250 mm', '600 mmx250 mm', 0, NULL, 0, NULL, NULL, 856859, '送风', 'XF 2', 3.0750000000000006, 3.325, '600x250', 0, 0, 0.35294117647058826, 0, 0.41366202896558674, 9, 0, 0, 20.904899999999994, 0, 0, 0, NULL, 0.25, 0.6000000000000001, NULL, 0, NULL, 12.296999999999997, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 风管占位符
-- ----------------------------
DROP TABLE IF EXISTS `风管占位符`;
CREATE TABLE `风管占位符`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `可用大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `内衬厚度` double NULL DEFAULT NULL,
  `内衬类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `底部高程` double NULL DEFAULT NULL,
  `顶部高程` double NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `尺寸锁定` int NULL DEFAULT NULL,
  `其他流量` double NULL DEFAULT NULL,
  `水力直径` double NULL DEFAULT NULL,
  `雷诺数` double NULL DEFAULT NULL,
  `当量直径` double NULL DEFAULT NULL,
  `剖面` int NULL DEFAULT NULL,
  `损耗系数` double NULL DEFAULT NULL,
  `风压` double NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `摩擦` double NULL DEFAULT NULL,
  `压降` double NULL DEFAULT NULL,
  `速度` double NULL DEFAULT NULL,
  `直径` double NULL DEFAULT NULL,
  `高度` double NULL DEFAULT NULL,
  `宽度` double NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `流量` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `长度` double NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK风管占位符1`(`类型 ID`) USING BTREE,
  INDEX `FK风管占位符2`(`创建的阶段`) USING BTREE,
  INDEX `FK风管占位符3`(`拆除的阶段`) USING BTREE,
  INDEX `FK风管占位符4`(`设计选项`) USING BTREE,
  CONSTRAINT `FK风管占位符1` FOREIGN KEY (`类型 ID`) REFERENCES `风管类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管占位符2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管占位符3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管占位符4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 风管占位符
-- ----------------------------

-- ----------------------------
-- Table structure for 风管管件
-- ----------------------------
DROP TABLE IF EXISTS `风管管件`;
CREATE TABLE `风管管件`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `可用大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `内衬厚度` double NULL DEFAULT NULL,
  `内衬类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `体积` double NULL DEFAULT NULL,
  `面积` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK风管管件1`(`类型 ID`) USING BTREE,
  INDEX `FK风管管件2`(`创建的阶段`) USING BTREE,
  INDEX `FK风管管件3`(`拆除的阶段`) USING BTREE,
  INDEX `FK风管管件4`(`设计选项`) USING BTREE,
  INDEX `FK风管管件5`(`标高`) USING BTREE,
  CONSTRAINT `FK风管管件1` FOREIGN KEY (`类型 ID`) REFERENCES `风管管件类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管管件2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管管件3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管管件4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管管件5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 风管管件
-- ----------------------------
INSERT INTO `风管管件` VALUES (1652875, 474510, 86961, NULL, NULL, 'PF', '600 mmx300 mm-600 mmx300 mm', '600 mmx300 mm-600 mmx300 mm', 0, NULL, 0, NULL, NULL, 856864, '排风', 'PF 1', '600x300-600x300', NULL, 0.16336500000000073, NULL, NULL, 1581419, '579', NULL, NULL, NULL);
INSERT INTO `风管管件` VALUES (2169235, 654371, 86961, NULL, NULL, 'XF', '600 mmx250 mm-600 mmx250 mm', '600 mmx250 mm-600 mmx250 mm', 0, NULL, 0, NULL, NULL, 856859, '送风', 'XF 2', '600x250-600x250', NULL, 0.14254066556807968, NULL, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `风管管件` VALUES (2170093, 654371, 86961, NULL, NULL, 'XF', '600 mmx250 mm-600 mmx250 mm', '600 mmx250 mm-600 mmx250 mm', 0, NULL, 0, NULL, NULL, 856859, '送风', 'XF 2', '600x250-600x250', NULL, 0.14254066556807968, NULL, NULL, 1581419, NULL, NULL, NULL, NULL);
INSERT INTO `风管管件` VALUES (2170104, 654371, 86961, NULL, NULL, 'XF', '600 mmx250 mm-600 mmx250 mm', '600 mmx250 mm-600 mmx250 mm', 0, NULL, 0, NULL, NULL, 856859, '送风', 'XF 2', '600x250-600x250', NULL, 0.14254066556807968, NULL, NULL, 1581419, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 风管管件类型
-- ----------------------------
DROP TABLE IF EXISTS `风管管件类型`;
CREATE TABLE `风管管件类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK风管管件类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK风管管件类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK风管管件类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管管件类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 风管管件类型
-- ----------------------------
INSERT INTO `风管管件类型` VALUES (467343, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形弯头 - 弧形 - 法兰', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (468629, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形 T 形三通 - 斜接 - 法兰', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (469569, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形接头 - 45 度接入 - 法兰', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (472058, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形变径管 - 角度 - 法兰', '45 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (472060, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形变径管 - 角度 - 法兰', '10 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (472062, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形变径管 - 角度 - 法兰', '15 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (472064, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形变径管 - 角度 - 法兰', '25 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (472066, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形变径管 - 角度 - 法兰', '30 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (472068, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形变径管 - 角度 - 法兰', '60 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (474510, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形弯头 - 法兰', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (475651, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形 T 形三通 - 锥形 - 斜接 - 法兰', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (476612, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形变径 - 角度 - 法兰', '10 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (476614, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形变径 - 角度 - 法兰', '20 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (476616, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形变径 - 角度 - 法兰', '25 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (476618, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形变径 - 角度 - 法兰', '30 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (476620, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形变径 - 角度 - 法兰', '45 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (476622, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形变径 - 角度 - 法兰', '60 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (477644, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '天方地圆 - 角度 - 法兰', '45 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (477646, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '天方地圆 - 角度 - 法兰', '10 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (477648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '天方地圆 - 角度 - 法兰', '15 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (477650, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '天方地圆 - 角度 - 法兰', '20 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (477652, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '天方地圆 - 角度 - 法兰', '30 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (477654, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '天方地圆 - 角度 - 法兰', '60 度', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '矩形活接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628528, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '圆形四通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628529, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '圆形活接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628530, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '圆形接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628550, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '椭圆形四通 - 直通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628551, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '椭圆形弯头 - 节', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628552, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '椭圆形弯头 - 斜接', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628553, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '椭圆形接头 - 直通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628555, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '椭圆形 T 形三通 - 直通', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '椭圆形到圆形过渡件 - 长度', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628557, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '椭圆形过渡件 - 长度', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628558, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '椭圆形活接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628559, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '矩形到椭圆形过渡件 - 长度', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (628565, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形四通 - 弧形 - 法兰', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (630160, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '椭圆形收头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (631313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '椭圆形接头 - 管托', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (633579, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '矩形堵头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (639399, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '圆形堵头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (654369, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形弯头 - 弧形 - 法兰', '1.5 W', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (654371, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形弯头 - 弧形 - 法兰', '1.0 W', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (654373, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形弯头 - 弧形 - 法兰', '2.0 W', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (1174396, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形 Y 形三通 - 弯曲 - 过渡件 - 同 心 - 法兰', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (1176263, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, '插接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (1178019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形四通 - 弧形 - 过渡件 - 底对齐 - 法兰', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (1179372, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形四通 - 弧形 - 过渡件 - 顶对齐 - 法兰', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (1458806, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-矩形T形三通-斜接-顶平-法兰', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (1475475, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.14', NULL, 'H-插接头', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (1649537, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-矩形TY形三通-弧形-同心-法兰', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管管件类型` VALUES (1650752, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-矩形Y形三通-弯曲-过渡件-同心-法兰', '标准', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 风管类型
-- ----------------------------
DROP TABLE IF EXISTS `风管类型`;
CREATE TABLE `风管类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK风管类型1`(`部件代码`) USING BTREE,
  CONSTRAINT `FK风管类型1` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 风管类型
-- ----------------------------
INSERT INTO `风管类型` VALUES (142425, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形风管', '半径弯头/接头', NULL, NULL, NULL, NULL);
INSERT INTO `风管类型` VALUES (142426, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形风管', '斜接弯头/T 形三通', NULL, NULL, NULL, NULL);
INSERT INTO `风管类型` VALUES (142427, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形风管', '斜接弯头/接头', NULL, NULL, NULL, NULL);
INSERT INTO `风管类型` VALUES (142428, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形风管', '接头/短半径', NULL, NULL, NULL, NULL);
INSERT INTO `风管类型` VALUES (142429, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形风管', 'T 形三通', NULL, NULL, NULL, NULL);
INSERT INTO `风管类型` VALUES (142430, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '圆形风管', '接头', NULL, NULL, NULL, NULL);
INSERT INTO `风管类型` VALUES (142431, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '矩形风管', '半径弯头/T 形三通', NULL, NULL, NULL, NULL);
INSERT INTO `风管类型` VALUES (603369, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '椭圆形风管', '多节弯头/T 形三通', NULL, NULL, NULL, NULL);
INSERT INTO `风管类型` VALUES (603370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '椭圆形风管', '多节弯头/接头', NULL, NULL, NULL, NULL);
INSERT INTO `风管类型` VALUES (603371, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '椭圆形风管', '斜接弯头/T 形三通', NULL, NULL, NULL, NULL);
INSERT INTO `风管类型` VALUES (603372, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '椭圆形风管', '斜接弯头/接头', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 风管系统
-- ----------------------------
DROP TABLE IF EXISTS `风管系统`;
CREATE TABLE `风管系统`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `图元数` int NULL DEFAULT NULL,
  `系统设备` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `流量` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK风管系统1`(`类型 ID`) USING BTREE,
  INDEX `FK风管系统2`(`设计选项`) USING BTREE,
  CONSTRAINT `FK风管系统1` FOREIGN KEY (`类型 ID`) REFERENCES `风管系统类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管系统2` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 风管系统
-- ----------------------------
INSERT INTO `风管系统` VALUES (1648110, 856859, NULL, 0, NULL, 'XF 2', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统` VALUES (1652838, 856864, NULL, 0, NULL, 'PF 1', NULL, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 风管系统类型
-- ----------------------------
DROP TABLE IF EXISTS `风管系统类型`;
CREATE TABLE `风管系统类型`  (
  `ID` int NOT NULL,
  `缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 风管系统类型
-- ----------------------------
INSERT INTO `风管系统类型` VALUES (585472, NULL, '送风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (585473, NULL, '回风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (585474, NULL, '排风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856857, 'SF', '送风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856858, 'XB', '送风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856859, 'XF', '送风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856860, NULL, '排风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856861, 'HF', '回风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856862, 'ZY', '送风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856863, NULL, '送风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856864, 'PF', '排风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856865, 'PY', '排风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856869, 'YY', '排风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856870, 'TF', '排风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856871, 'P(Y)', '排风', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `风管系统类型` VALUES (856872, 'S(B)', '送风', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 风管附件
-- ----------------------------
DROP TABLE IF EXISTS `风管附件`;
CREATE TABLE `风管附件`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `可用大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `总体大小` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `内衬厚度` double NULL DEFAULT NULL,
  `内衬类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `隔热层厚度` double NULL DEFAULT NULL,
  `隔热层类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK风管附件1`(`类型 ID`) USING BTREE,
  INDEX `FK风管附件2`(`创建的阶段`) USING BTREE,
  INDEX `FK风管附件3`(`拆除的阶段`) USING BTREE,
  INDEX `FK风管附件4`(`设计选项`) USING BTREE,
  INDEX `FK风管附件5`(`标高`) USING BTREE,
  CONSTRAINT `FK风管附件1` FOREIGN KEY (`类型 ID`) REFERENCES `风管附件类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管附件2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管附件3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管附件4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管附件5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 风管附件
-- ----------------------------
INSERT INTO `风管附件` VALUES (1660589, 1124885, 86961, NULL, NULL, NULL, '500 mmx1200 mm-500 mmx1200 mm', '500 mmx1200 mm-500 mmx1200 mm', 0, NULL, 0, NULL, NULL, NULL, '未定义', NULL, '500x1200-500x1200', NULL, NULL, 1581419, '51', NULL, NULL, NULL);
INSERT INTO `风管附件` VALUES (1660596, 1124885, 86961, NULL, NULL, NULL, '500 mmx1200 mm-500 mmx1200 mm', '500 mmx1200 mm-500 mmx1200 mm', 0, NULL, 0, NULL, NULL, NULL, '未定义', NULL, '500x1200-500x1200', NULL, NULL, 1581419, '53', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 风管附件类型
-- ----------------------------
DROP TABLE IF EXISTS `风管附件类型`;
CREATE TABLE `风管附件类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK风管附件类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK风管附件类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK风管附件类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风管附件类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 风管附件类型
-- ----------------------------
INSERT INTO `风管附件类型` VALUES (1115710, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FDH-280°C防火阀', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1117403, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FDSH-280°C防火阀', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1119124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FDVS-70°C防火阀', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1119126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FDVS-70°C防火阀', '320', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1119128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FDVS-70°C防火阀', '200', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1120826, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FDVS-150°C防火阀 ', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1122037, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FVD-70°C防火阀', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1123235, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FVD-150°C防火阀 ', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1124885, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'GP加压阀', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1126064, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, '风管软接短管-CA', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1127344, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, '开关型电动风阀-CA', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1128507, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, '逆止回阀-CA', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1129782, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, '手动对开对叶调节阀-CA', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1131070, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, '调节型电动风阀-CA ', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1131975, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '消声器 - 标准(交叉符号线)', '900', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1131977, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '消声器 - 标准(交叉符号线)', '1200', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1133159, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, '圆形风管软接', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1137693, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FDH-280°C防火阀-立管安装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1143167, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FDSH-280°C防火阀-立管安装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1149220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FDVS-150°C防火阀 ', '320', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1149222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FDVS-150°C防火阀 ', '200', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1151166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FDVS-150°C防火阀-立管安装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1154006, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FVD-70°C防火阀', '320', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1154008, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FVD-70°C防火阀', '200', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1155947, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FVD-70°C防火阀-立管安装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1159122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FVD-150°C防火阀 ', '320', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1159124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FVD-150°C防火阀 ', '200', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1161080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'FVD-150°C防火阀-立管安装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1164199, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'GP加压阀', '320', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1164201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'GP加压阀', '200', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1167067, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'MED-70°C防火阀', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1167069, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'MED-70°C防火阀', '320', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1167071, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'MED-70°C防火阀', '200', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1168964, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'MED-70°C防火阀-立管安装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1460596, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'H-开关型电动风阀', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1461941, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'H-风管软接头-圆形', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1465844, NULL, NULL, NULL, '靖江市奇星空调机械设备厂', NULL, NULL, NULL, NULL, NULL, 'HY_70℃常开防火阀(圆形)', '70℃常开防火阀(圆形)', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1485745, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'H-防火阀-70°C-FVD', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1929126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-消声器-矩形', '900', NULL, NULL, NULL, NULL);
INSERT INTO `风管附件类型` VALUES (1929128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-消声器-矩形', '1200', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for 风道末端
-- ----------------------------
DROP TABLE IF EXISTS `风道末端`;
CREATE TABLE `风道末端`  (
  `ID` int NOT NULL,
  `类型 ID` int NULL DEFAULT NULL,
  `创建的阶段` int NULL DEFAULT NULL,
  `拆除的阶段` int NULL DEFAULT NULL,
  `设计选项` int NULL DEFAULT NULL,
  `系统缩写` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统类型` int NULL DEFAULT NULL,
  `系统分类` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `系统名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `尺寸` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `流量` double NULL DEFAULT NULL,
  `注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `标高` int NULL DEFAULT NULL,
  `标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `备注_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_实例` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `楼层` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK风道末端1`(`类型 ID`) USING BTREE,
  INDEX `FK风道末端2`(`创建的阶段`) USING BTREE,
  INDEX `FK风道末端3`(`拆除的阶段`) USING BTREE,
  INDEX `FK风道末端4`(`设计选项`) USING BTREE,
  INDEX `FK风道末端5`(`标高`) USING BTREE,
  CONSTRAINT `FK风道末端1` FOREIGN KEY (`类型 ID`) REFERENCES `风道末端类型` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风道末端2` FOREIGN KEY (`创建的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风道末端3` FOREIGN KEY (`拆除的阶段`) REFERENCES `阶段` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风道末端4` FOREIGN KEY (`设计选项`) REFERENCES `设计选项` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风道末端5` FOREIGN KEY (`标高`) REFERENCES `标高` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 风道末端
-- ----------------------------

-- ----------------------------
-- Table structure for 风道末端类型
-- ----------------------------
DROP TABLE IF EXISTS `风道末端类型`;
CREATE TABLE `风道末端类型`  (
  `ID` int NOT NULL,
  `注释记号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `最大流量` double NULL DEFAULT NULL,
  `最小流量` double NULL DEFAULT NULL,
  `类型 IfcGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `型号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `制造商` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型注释` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OmniClass 编号` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `部件代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `族名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `类型标记` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `成本` double NULL DEFAULT NULL,
  `备注_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `过滤关键字_类型` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK风道末端类型1`(`OmniClass 编号`) USING BTREE,
  INDEX `FK风道末端类型2`(`部件代码`) USING BTREE,
  CONSTRAINT `FK风道末端类型1` FOREIGN KEY (`OmniClass 编号`) REFERENCES `omniclass 编号` (`OmniClass 编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK风道末端类型2` FOREIGN KEY (`部件代码`) REFERENCES `部件代码` (`部件代码`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 风道末端类型
-- ----------------------------
INSERT INTO `风道末端类型` VALUES (1038079, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, '板式排烟口-立装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1041843, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, '板式排烟口-平装', '600X500', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1044520, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x300', NULL, NULL, NULL, NULL, '单层百叶--侧送 ', '1000x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1046814, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '600x300', NULL, NULL, NULL, NULL, '回风格栅 - 矩形 ', '600x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1049539, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x300', NULL, NULL, NULL, NULL, '加压送风百叶--侧送', '1000x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1052835, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '600x300', NULL, NULL, NULL, NULL, '排风百叶-单层-平装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1052837, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '400x300', NULL, NULL, NULL, NULL, '排风百叶-单层-平装', '400x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1055562, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x300', NULL, NULL, NULL, NULL, '送风百叶-双层-侧送', '1000x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1057829, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x300', NULL, NULL, NULL, NULL, '送风百叶-双层-下送', '1000x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1059146, NULL, 1.0583333333333302, 0.352777777777778, NULL, NULL, NULL, '200x200', NULL, NULL, NULL, NULL, '送风散流器 - 矩形', '200x200', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1059148, NULL, 1.0583333333333302, 0.352777777777778, NULL, NULL, NULL, '200x200', NULL, NULL, NULL, NULL, '送风散流器 - 矩形', '250x250', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1059150, NULL, 1.0583333333333302, 0.352777777777778, NULL, NULL, NULL, '480x360', NULL, NULL, NULL, NULL, '送风散流器 - 矩形', '480x360', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1059152, NULL, 1.0583333333333302, 0.352777777777778, NULL, NULL, NULL, '480x300', NULL, NULL, NULL, NULL, '送风散流器 - 矩形', '480x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1059154, NULL, 0.777777777777778, 0.259722222222222, NULL, NULL, NULL, '420x300', NULL, NULL, NULL, NULL, '送风散流器 - 矩形', '420x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1059156, NULL, 0.777777777777778, 0.259722222222222, NULL, NULL, NULL, '480x240', NULL, NULL, NULL, NULL, '送风散流器 - 矩形', '480x240', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1059158, NULL, 0.540277777777778, 0.180555555555556, NULL, NULL, NULL, '420x240', NULL, NULL, NULL, NULL, '送风散流器 - 矩形', '420x240', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1059160, NULL, 0.540277777777778, 0.180555555555556, NULL, NULL, NULL, 'SS 360x240', NULL, NULL, NULL, NULL, '送风散流器 - 矩形', '360x240', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1174704, NULL, 0.540277777777778, 0.180555555555556, NULL, NULL, NULL, 'SS 300x300', NULL, NULL, NULL, NULL, '送风散流器 - 矩形', '300x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1183374, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x500', NULL, NULL, NULL, NULL, '排风百叶-单层-平装', '1000x500', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1243407, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x300', NULL, NULL, NULL, NULL, '加压送风百叶--侧送', '400x400', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1243409, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x300', NULL, NULL, NULL, NULL, '加压送风百叶--侧送', '400x1250', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1243969, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1400x1000', NULL, NULL, NULL, NULL, '排风百叶-单层-平装', '1400x1000', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1245096, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1500x500', NULL, NULL, NULL, NULL, '排风百叶-单层-平装', '1500x500', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1245402, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '450x2000', NULL, NULL, NULL, NULL, '加压送风百叶--侧送', '450x2000', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1247015, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1800x500', NULL, NULL, NULL, NULL, '排风百叶-单层-平装', '1800x500', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1248998, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '800x300', NULL, NULL, NULL, NULL, '排风百叶-单层-平装', '800x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1355642, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '300x200', NULL, NULL, NULL, NULL, '排风百叶-单层-平装', '300x200', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1361144, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '250x250', NULL, NULL, NULL, NULL, '排风百叶-单层-平装', '250x250', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1363579, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '800x300', NULL, NULL, NULL, NULL, '送风百叶-双层-下送', '800x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1372196, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x500', NULL, NULL, NULL, NULL, '排风百叶-单层-平装', '1000x800', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1372206, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '300x300', NULL, NULL, NULL, NULL, '排风百叶-单层-平装', '300x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1456824, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x300', NULL, NULL, NULL, NULL, 'H-送风百叶-双层-平装', '1000x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1456880, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '350x350', NULL, NULL, NULL, NULL, 'H-送风百叶-双层-平装', '350x350', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1457381, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1500x500', NULL, NULL, NULL, NULL, 'H-送风百叶-双层-平装', '1500x500', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1470825, NULL, 0.15, 0.7500000000000001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-排风百叶-单层-立装', '600×300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1470978, NULL, 0.15, 0.7500000000000001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-排风百叶-单层-立装', '1500×400', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1473693, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '600x300', NULL, NULL, NULL, NULL, 'H-回风格栅-平装', '600x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1473894, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1400x1000', NULL, NULL, NULL, NULL, 'H-回风格栅-平装', '1400x1000', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1477133, NULL, 1.0583333333333302, 0.352777777777778, NULL, NULL, NULL, '200x200', NULL, NULL, NULL, NULL, 'H-散流器-矩形-平装', '250x250', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1477156, NULL, 1.0583333333333302, 0.352777777777778, NULL, NULL, NULL, '300x300', NULL, NULL, NULL, NULL, 'H-散流器-矩形-平装', '300x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1491417, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x300', NULL, NULL, NULL, NULL, 'H-送风百叶-双层-立装', '1000x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1491419, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '400x400', NULL, NULL, NULL, NULL, 'H-送风百叶-双层-立装', '400x400', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1491423, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '400x1250', NULL, NULL, NULL, NULL, 'H-送风百叶-双层-立装', '400x1250', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1500338, NULL, 0.15, 0.7500000000000001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H-排风百叶-单层-立装', '250×250', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1502741, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '600x300', NULL, NULL, NULL, NULL, 'H-排风百叶-单层-平装', '600×300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1502858, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '250x250', NULL, NULL, NULL, NULL, 'H-排风百叶-单层-平装', '250×250', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1503063, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '300x300', NULL, NULL, NULL, NULL, 'H-排风百叶-单层-平装', '300×300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1503329, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '800x300', NULL, NULL, NULL, NULL, 'H-送风百叶-双层-平装', '800x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1503527, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x500', NULL, NULL, NULL, NULL, 'H-排风百叶-单层-平装', '1000×500', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1503710, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '400x300', NULL, NULL, NULL, NULL, 'H-排风百叶-单层-平装', '400×300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1503880, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '400x300', NULL, NULL, NULL, NULL, 'H-送风百叶-双层-平装', '400x300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1504185, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '300x200', NULL, NULL, NULL, NULL, 'H-排风百叶-单层-平装', '300×200', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1504335, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '800x300', NULL, NULL, NULL, NULL, 'H-排风百叶-单层-平装', '800×300', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1653349, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x300', NULL, NULL, NULL, NULL, '加压送风百叶--侧送', '400x500', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (1653351, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '1000x300', NULL, NULL, NULL, NULL, '加压送风百叶--侧送', '500x1200', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (2095472, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '350x350', NULL, NULL, NULL, NULL, 'H-回风格栅-平装', '350x350', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (2096278, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '200x200', NULL, NULL, NULL, NULL, 'H-回风格栅-平装', '200x200', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (2134983, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'H-排烟口-板式-立装', '标准', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (2136421, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23.75.70.11.14.14', NULL, 'H-排烟口-板式-平装', '600x500', NULL, NULL, NULL, NULL);
INSERT INTO `风道末端类型` VALUES (2137622, NULL, 0.7500000000000001, 0.15, NULL, NULL, NULL, '350x350', NULL, NULL, NULL, NULL, 'H-回风格栅-平装', '800x150', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
