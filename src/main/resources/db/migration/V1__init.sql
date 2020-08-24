CREATE TABLE `role` (
`id` int NOT NULL AUTO_INCREMENT,
`name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`nameZh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
PRIMARY KEY (`id`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 21
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `menu` (
`id` int NOT NULL AUTO_INCREMENT,
`url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`iconCls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`keepAlive` tinyint(1) NULL DEFAULT NULL,
`requireAuth` tinyint(1) NULL DEFAULT NULL,
`parentId` int NULL DEFAULT NULL,
`enabled` tinyint(1) NULL DEFAULT 1,
PRIMARY KEY (`id`) ,
INDEX `parentId` (`parentId` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 28
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `menu_role` (
`id` int NOT NULL AUTO_INCREMENT,
`mid` int NULL DEFAULT NULL,
`rid` int NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `mid` (`mid` ASC) USING BTREE,
INDEX `rid` (`rid` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 282
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `hr` (
`id` int NOT NULL AUTO_INCREMENT COMMENT 'hrID',
`name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
`phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
`telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住宅电话',
`address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
`enabled` tinyint(1) NULL DEFAULT 1,
`username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
`password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
`userface` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 12
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `hr_role` (
`id` int NOT NULL AUTO_INCREMENT,
`hrid` int NULL DEFAULT NULL,
`rid` int NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `rid` (`rid` ASC) USING BTREE,
INDEX `hr_role_ibfk_1` (`hrid` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 74
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `employee` (
`id` int NOT NULL AUTO_INCREMENT COMMENT '员工编号',
`name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
`gender` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
`birthday` date NULL DEFAULT NULL COMMENT '出生日期',
`idCard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
`wedlock` enum('已婚','未婚','离异') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
`nationId` int NULL DEFAULT NULL COMMENT '民族',
`nativePlace` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
`politicId` int NULL DEFAULT NULL COMMENT '政治面貌',
`email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
`phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
`address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
`departmentId` int NULL DEFAULT NULL COMMENT '所属部门',
`jobLevelId` int NULL DEFAULT NULL COMMENT '职称ID',
`posId` int NULL DEFAULT NULL COMMENT '职位ID',
`engageForm` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聘用形式',
`tiptopDegree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最高学历',
`specialty` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属专业',
`school` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
`beginDate` date NULL DEFAULT NULL COMMENT '入职日期',
`workState` enum('在职','离职') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '在职' COMMENT '在职状态',
`workID` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
`contractTerm` double NULL DEFAULT NULL COMMENT '合同期限',
`conversionTime` date NULL DEFAULT NULL COMMENT '转正日期',
`notWorkDate` date NULL DEFAULT NULL COMMENT '离职日期',
`beginContract` date NULL DEFAULT NULL COMMENT '合同起始日期',
`endContract` date NULL DEFAULT NULL COMMENT '合同终止日期',
`workAge` int NULL DEFAULT NULL COMMENT '工龄',
PRIMARY KEY (`id`) ,
INDEX `departmentId` (`departmentId` ASC) USING BTREE,
INDEX `jobId` (`jobLevelId` ASC) USING BTREE,
INDEX `dutyId` (`posId` ASC) USING BTREE,
INDEX `nationId` (`nationId` ASC) USING BTREE,
INDEX `politicId` (`politicId` ASC) USING BTREE,
INDEX `workID_key` (`workID` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1941
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `customer` (
`id` int NOT NULL AUTO_INCREMENT COMMENT '客户编号',
`name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
`gender` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
`birthday` date NULL DEFAULT NULL COMMENT '出生日期',
`idCard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
`wedlock` enum('已婚','未婚','离异') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
`nationId` int NULL DEFAULT NULL COMMENT '民族',
`nativePlace` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
`politicId` int NULL DEFAULT NULL COMMENT '政治面貌',
`email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
`phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
`address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
PRIMARY KEY (`id`) ,
INDEX `nationId` (`nationId` ASC) USING BTREE,
INDEX `politicId` (`politicId` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1941
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `customer_body_info` (
`id` int NOT NULL,
`cid` int NULL,
`height` int NULL,
`weight` double NULL,
PRIMARY KEY (`id`)
);

ALTER TABLE `menu` ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `menu_role` ADD CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `menu_role` ADD CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `hr_role` ADD CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE `hr_role` ADD CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `customer_body_info` ADD CONSTRAINT `fk_customer_body_info_customer_body_info_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

