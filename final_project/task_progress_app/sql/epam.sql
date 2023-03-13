/*
 Navicat Premium Data Transfer

 Source Server         : MySQL_local
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : epam

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 13/03/2023 21:41:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for actions
-- ----------------------------
DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions`  (
  `Action ID` int NOT NULL,
  `Task ID` int NOT NULL,
  `Creation Date` date NULL DEFAULT NULL,
  `Action Type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Team` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Percent` int NULL DEFAULT NULL,
  PRIMARY KEY (`Action ID`) USING BTREE,
  UNIQUE INDEX `action_id_indx`(`Action ID`) USING BTREE,
  INDEX `task_id_foreign`(`Task ID`) USING BTREE,
  INDEX `team`(`Team`) USING BTREE,
  CONSTRAINT `task_id_foreign` FOREIGN KEY (`Task ID`) REFERENCES `tasks` (`Task ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of actions
-- ----------------------------
INSERT INTO `actions` VALUES (1, 1456, '2023-02-22', 'Preparation', 'Team1', 10);
INSERT INTO `actions` VALUES (2, 1457, '2023-02-23', 'Cleaning', 'Team2', 6);

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `Task ID` int NOT NULL,
  `Creation Date` date NOT NULL,
  `Preparation` int NULL DEFAULT NULL,
  `Cleaning` int NULL DEFAULT NULL,
  PRIMARY KEY (`Task ID`) USING BTREE,
  UNIQUE INDEX `task_id_indx`(`Task ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (1456, '2023-02-22', 10, 0);
INSERT INTO `tasks` VALUES (1457, '2023-02-23', 0, 6);

-- ----------------------------
-- Table structure for teams
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams`  (
  `Team Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Team Type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Team Name`) USING BTREE,
  UNIQUE INDEX `team_name_indx`(`Team Name`) USING BTREE,
  CONSTRAINT `team_name_foreign` FOREIGN KEY (`Team Name`) REFERENCES `actions` (`Team`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teams
-- ----------------------------
INSERT INTO `teams` VALUES ('Team1', 'Manual');
INSERT INTO `teams` VALUES ('Team2', 'Mechanical');

SET FOREIGN_KEY_CHECKS = 1;
