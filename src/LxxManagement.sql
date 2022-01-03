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



insert into expressages(expressage_code, expressage_company, expressage_time, expressage_yes_time, expressage_owner_tel) values
('14-2-5680','中通快递&../img/Expressage_img/ztkd.png','2021-12-23 15:29','2021-12-24 11:55','13279505680');

insert into expressages(expressage_code, expressage_company, expressage_time, expressage_yes_time, expressage_owner_tel,expressage_status) values
('A-2-8966','圆通速递&../img/Expressage_img/ytsd.png','2021-12-22 13:17','2021-12-24 15:31','13279505680',1);



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
-- Table structure for cpmment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
                            `comment_id` INT(11) NOT NULL AUTO_INCREMENT,
                            `blog_id`INT(10) DEFAULT NULL,
                            `comment_owner` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                            `comment_image` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                            `comment_text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                            `comment_time` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                            `comment_likes` INT(10) DEFAULT NULL,
                            PRIMARY KEY (`comment_id`) USING BTREE

) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = COMPACT;

INSERT INTO COMMENT(blog_id,comment_owner, comment_image,comment_text,comment_time, comment_likes) VALUES
(1,'刘璇','../img/user_img.jpg','中秋节应该和家人一起过','2021年11月6日',100);
INSERT INTO COMMENT(blog_id,comment_owner, comment_image,comment_text,comment_time, comment_likes) VALUES
(2,'刘宇阳','../img/user_img.jpg','学到了','2021年11月7日',100);
INSERT INTO COMMENT(blog_id,comment_owner, comment_image,comment_text,comment_time, comment_likes) VALUES
(3,'徐卓龙','../img/user_img.jpg','种植鲜花小技巧','2021年11月8日',100);
INSERT INTO COMMENT(blog_id,comment_owner, comment_image,comment_text,comment_time, comment_likes) VALUES
(4,'范佳伟','../img/user_img.jpg','这没想到有这么多的鲜花品种','2021年11月6日',100);
INSERT INTO COMMENT(blog_id,comment_owner, comment_image,comment_text,comment_time, comment_likes) VALUES
(5,'苗欢欢','../img/user_img.jpg','教师节可以送康乃馨','2021年11月1日',100);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_commodity_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_commodity_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_owner_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_owner_tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_address` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_pay` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin default NULL,

  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;
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





INSERT INTO `order`(order_time, order_commodity_name, order_commodity_img, order_owner_name, order_owner_tel, order_address, order_pay,order_status) values
('2021-11-4 15:00','卡罗拉','../img/花/玫瑰类/1.卡罗拉图集/卡罗拉1.jpg','刘宇阳','13279505680','西安邮电大学长安校区东区','19.9','运输中');
INSERT INTO `order`(order_time, order_commodity_name, order_commodity_img, order_owner_name, order_owner_tel, order_address, order_pay,order_status) values
('2021-10-4 15:00','白牡丹','../img/花/菊花类/2.白牡丹图集/白牡丹1.jpg','刘璇','15929068966','西安邮电大学长安校区东区安美公寓','19.9','已签收');
INSERT INTO `order`(order_time, order_commodity_name, order_commodity_img, order_owner_name, order_owner_tel, order_address, order_pay,order_status) values
('2021-11-26 15:00','郁金香','../img/花/百合类/2.郁金香图集/郁金香1.png','苗欢','13279505680','西安邮电大学长安校区东区','19.9','运输中');
INSERT INTO `order`(order_time, order_commodity_name, order_commodity_img, order_owner_name, order_owner_tel, order_address, order_pay,order_status) values
('2021-11-4 15:00','向日葵','../img/花/向日葵/1.向日葵(未包装)图集/向日葵2.jpg','范佳伟','15830599166','西安邮电大学长安校区东区','19.9','未发货');
INSERT INTO `order`(order_time, order_commodity_name, order_commodity_img, order_owner_name, order_owner_tel, order_address, order_pay,order_status) values
('2021-11-4 15:00','玫瑰','../img/花/玫瑰类/1.卡罗拉图集/卡罗拉1.jpg','刘宇阳','13279505680','西安邮电大学长安校区东区','19.9','运输中');

