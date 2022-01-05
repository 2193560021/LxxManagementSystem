use lxxmanagement;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`(
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '../img/user_img/用户.png',
  `cus_img_bg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_pwd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登陆密码',

  PRIMARY KEY (`cus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for expressages
-- ----------------------------
DROP TABLE IF EXISTS `expressages`;
DROP TABLE IF EXISTS `expressages`;
CREATE TABLE `expressages`  (
  `expressage_id` int(11) NOT NULL AUTO_INCREMENT,
  `expressage_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `expressage_company` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `expressage_time` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `expressage_yes_time` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `expressage_owner_tel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `expressage_status` int (5) DEFAULT 0,
  PRIMARY KEY (`expressage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;




-- ----------------------------
-- Table structure for imgWall
-- ----------------------------
DROP TABLE IF EXISTS `imgWall`;
CREATE TABLE `imgWall`  (
  `imgWall_id` int(11) NOT NULL AUTO_INCREMENT,
  `imgWall_title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `imgWall_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `imgWall_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `imgWall_owner_tel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,

  PRIMARY KEY (`imgWall_id`) USING BTREE

) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

insert into imgWall(imgWall_title, imgWall_name, imgWall_time, imgWall_owner_tel) VALUES
('灯光下的宝宝','bg.jpg','2021-12-27 11:59','13279505680');
insert into imgWall(imgWall_title, imgWall_name, imgWall_time, imgWall_owner_tel) VALUES
('宝宝头像','LiuXiaoXuan.jpg','2021-11-27 11:59','13279505680');
insert into imgWall(imgWall_title, imgWall_name, imgWall_time, imgWall_owner_tel) VALUES
('刘小阳头像','LiuXiaoYang.jpg','2021-10-27 11:59','13279505680');
insert into imgWall(imgWall_title, imgWall_name, imgWall_time, imgWall_owner_tel) VALUES
('大活的背影','lxlyy.jpg','2021-12-17 11:59','13279505680');
insert into imgWall(imgWall_title, imgWall_name, imgWall_time, imgWall_owner_tel) VALUES
('拼图','lyylxx.jpg','2021-12-07 11:59','13279505680');


-- ----------------------------
-- Table structure for lspace
-- ----------------------------
DROP TABLE IF EXISTS `LSpace`;
CREATE TABLE `LSpace`  (
  `LSpace_id` int(11) NOT NULL AUTO_INCREMENT,
  `LSpace_lovers` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LSpace_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`lspace_id`) USING BTREE

) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

insert into LSpace(LSpace_lovers, LSpace_time) VALUES
('13279505680-15929068966','2021-07-03');

-- ----------------------------
-- Table structure for LSpace_countdowns
-- ----------------------------
DROP TABLE IF EXISTS `LSpace_countdowns`;
CREATE TABLE `LSpace_countdowns`  (
      `LSpace_countdown_id` int(11) NOT NULL AUTO_INCREMENT,
      `LSpace_countdown_owners_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
      `LSpace_countdown_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
      `LSpace_countdown_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
      `LSpace_countdown_bg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
      PRIMARY KEY (`LSpace_countdown_id`) USING BTREE

) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

insert into LSpace_countdowns(LSpace_countdown_owners_id, LSpace_countdown_title, LSpace_countdown_time, LSpace_countdown_bg) values
('1','考研倒计时','2022-12-24','#11101d');


-- ----------------------------
-- Table structure for lspace_imgWall
-- ----------------------------
DROP TABLE IF EXISTS `LSpace_imgWall`;
CREATE TABLE `LSpace_imgWall`  (
    `LSpace_imgWall_id` int(11) NOT NULL AUTO_INCREMENT,
    `LSpace_imgWall_owners_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `LSpace_imgWall_title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `LSpace_imgWall_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `LSpace_imgWall_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,

    PRIMARY KEY (`LSpace_imgWall_id`) USING BTREE

) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

insert into LSpace_imgWall(LSpace_imgWall_owners_id,LSpace_imgWall_title, LSpace_imgWall_name, LSpace_imgWall_time) values
('1','合照','../img/LSpace_imgWall/1.jpg','2022-01-03 11:36');
insert into LSpace_imgWall(LSpace_imgWall_owners_id,LSpace_imgWall_title, LSpace_imgWall_name, LSpace_imgWall_time) values
('1','合照','../img/LSpace_imgWall/2.jpg','2022-01-01 11:36');
insert into LSpace_imgWall(LSpace_imgWall_owners_id,LSpace_imgWall_title, LSpace_imgWall_name, LSpace_imgWall_time) values
('1','合照','../img/LSpace_imgWall/3.jpg','2022-01-02 11:36');
insert into LSpace_imgWall(LSpace_imgWall_owners_id,LSpace_imgWall_title, LSpace_imgWall_name, LSpace_imgWall_time) values
('1','合照','../img/LSpace_imgWall/4.jpg','2022-01-04 11:36');
insert into LSpace_imgWall(LSpace_imgWall_owners_id,LSpace_imgWall_title, LSpace_imgWall_name, LSpace_imgWall_time) values
('1','合照','../img/LSpace_imgWall/5.jpg','2022-01-03 11:36');


-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (

   order_id       int(11) NOT NULL AUTO_INCREMENT,
   order_text       varchar(200)    null,
   order_kind       int(5)          null comment '0为支出，1为收入',
   order_amount     float           null,
   order_amount_sum float default 0 null,
   order_owner_tel  varchar(100)    null,
   order_time       varchar(100)    null,

   PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
    `message_id` int(11) NOT NULL AUTO_INCREMENT,
    `message_send_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `message_send_tel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `message_accept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `message_accept_tel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `message_send_user_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '../img/用户.png',
    `message_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `message_text` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;



insert into messages (message_send_name, message_send_tel, message_accept_name, message_accept_tel, message_send_user_img, message_time, message_text) values
('刘宇阳','13279505680','刘小璇','15929068966','../img/user_img/profile.jpg','2021-12-20 23:07','刘小璇我爱你呀~');


insert into messages (message_send_name, message_send_tel, message_accept_name, message_accept_tel, message_send_user_img, message_time, message_text) values
('隔壁润迎','13279505680','刘小璇','15929068966','../img/user_img/用户.png','2021-12-21 10:07','我是隔壁润迎');

