use docflower;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_telnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '../img/用户.png',
  `cus_img_bg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_pwd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登陆密码',
  `cus_paypwd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付密码',
  `cus_address` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_orders` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_friends` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,

  PRIMARY KEY (`cus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for managers
-- ----------------------------
DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers`  (
     `man_id` int(11) NOT NULL AUTO_INCREMENT,
     `man_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
     `man_pwd`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登陆密码',
     PRIMARY KEY (`man_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

insert into managers(man_name, man_pwd) values ('liuyuyang','liuyuyang');
insert into managers(man_name, man_pwd) values ('liuxuan','liuxuan');
insert into managers(man_name, man_pwd) values ('miaohuan','miaohuan');
insert into managers(man_name, man_pwd) values ('xuzhuolong','xuzhuolong');
insert into managers(man_name, man_pwd) values ('fanjiawei','fanjiawei');

-- ----------------------------
-- Table structure for flowers
-- ----------------------------
DROP TABLE IF EXISTS `flowers`;
DROP TABLE IF EXISTS `flowers`;
CREATE TABLE `flowers`  (
  `flower_id` int(11) NOT NULL AUTO_INCREMENT,
  `flower_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `flower_kind` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `flower_introduction` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `flower_image1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `flower_image2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `flower_image3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `flower_image4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `flower_price` int(5) DEFAULT NULL,
  `flower_sale` int (5) DEFAULT 0,
  `flower_stock` int (5) DEFAULT 1000,
  PRIMARY KEY (`flower_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('墨牡丹','菊花类','别名：富贵花、木芍药.介绍：通常为红色，有着牡丹般的大气，说是墨，其实是颜色深的意思。','../img/花/菊花类/1.墨牡丹图集/墨牡丹1.jpg','../img/花/菊花类/1.墨牡丹图集/墨牡丹2.jpg','../img/花/菊花类/1.墨牡丹图集/墨牡丹1.jpg','../img/花/菊花类/1.墨牡丹图集/墨牡丹2.jpg',25,'195','805');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('白牡丹','菊花类','介绍：纯白的颜色，精致的花形，就好像不存于世间的仙子一样，下方花瓣肆意分离开放，中间花瓣抱成团，花期在10月份。相关作品描述：《白牡丹菊》是明代诗人罗颀：东篱谁识旧花王，自别唐宫处处霜。犹似沈香亭北见，美人凝睡倚新妆。','../img/花/菊花类/2.白牡丹图集/白牡丹1.jpg','../img/花/菊花类/2.白牡丹图集/白牡丹2.jpg','../img/花/菊花类/2.白牡丹图集/白牡丹1.jpg','../img/花/菊花类/2.白牡丹图集/白牡丹2.jpg',25,'874','126');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('瑶台玉凤','菊花类','介绍：花色为白色，花期为10月下旬，花型为匙莲型。花瓣上有深浅的凹槽。 它的开花期处于中后期。花开美丽动人高雅清心，像玉凤凰一样飞翔，美丽多彩。推荐理由：喜欢菊花，不如养盆“瑶台玉凤”，乳白似玉，似水晶纯洁无暇。','../img/花/菊花类/3.瑶台玉凤图集/瑶台玉凤1.jpg','../img/花/菊花类/3.瑶台玉凤图集/瑶台玉凤2.jpg','../img/花/菊花类/3.瑶台玉凤图集/瑶台玉凤1.jpg','../img/花/菊花类/3.瑶台玉凤图集/瑶台玉凤2.jpg',25,'298','702');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('仙灵芝','菊花类','介绍：仙灵芝是菊花的多色品种之一，它的花瓣细长，顶端的颜色是淡黄色，底部的颜色是淡紫色;仙灵芝比较珍贵，并且对生长条件也比较苛刻。推荐理由：它开出来的花朵花瓣形态和其它品种不同，具有着独特的观赏价值，通常仙灵芝菊花在每年的秋季时开花，可用于装饰环境。','../img/花/菊花类/4.仙灵芝图集/仙灵芝1.jpg','../img/花/菊花类/4.仙灵芝图集/仙灵芝2.jpg','../img/花/菊花类/4.仙灵芝图集/仙灵芝1.jpg','../img/花/菊花类/4.仙灵芝图集/仙灵芝2.jpg',25,'814','186');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('天鹅舞','菊花类','介绍：是我国传统名菊。1960年我国邮电部发行的菊花特种邮票，其中第18枚即为天鹅舞。花中细管匙瓣，飞舞型，外围瓣长，瓣端呈匙钩状，基部瓣短密集内卷呈桂瓣状；翠绿色。推荐理由：它在开花时候类似一位翩翩起舞的少女一样，又似天鹅翩翩起舞。','../img/花/菊花类/5.天鹅舞图集/天鹅舞1.jpg','../img/花/菊花类/5.天鹅舞图集/天鹅舞2.jpg','../img/花/菊花类/5.天鹅舞图集/天鹅舞1.jpg','../img/花/菊花类/5.天鹅舞图集/天鹅舞2.jpg',25,'429','571');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('黄睡莲','睡莲类','花语：洁净，纯真。介绍：为多年生草本宿根性水生花卉。叶近圆形，宽12-19厘米，具不明显的波状缘。上面深绿色，有褐色斑纹，下面红褐色，有黑色小斑点。推荐理由：物种是极具观赏价值的莲花种类，常用作观赏植物。','../img/花/睡莲类/1.黄睡莲图集/黄睡莲1.jpg','../img/花/睡莲类/1.黄睡莲图集/黄睡莲2.jpg','../img/花/睡莲类/1.黄睡莲图集/黄睡莲3.jpg','../img/花/睡莲类/1.黄睡莲图集/黄睡莲1.jpg',25,'326','674');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('印度蓝睡莲','睡莲类','别名：星形睡莲。介绍：花瓣在16-20片之间，颜色多为深蓝色，中下部可现淡蓝色，叶茎比较长，会在傍晚时开花，并散发出淡淡的香味。','../img/花/睡莲类/2.印度蓝睡莲图集/印度蓝睡莲1.jpg','../img/花/睡莲类/2.印度蓝睡莲图集/印度蓝睡莲2.jpg','../img/花/睡莲类/2.印度蓝睡莲图集/印度蓝睡莲3.jpg','../img/花/睡莲类/2.印度蓝睡莲图集/印度蓝睡莲1.jpg',25,'60','940');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('白睡莲','睡莲类','花语：洁净、纯真、 妖艳。介绍：叶近圆形、纸质，基部有深弯缺、裂片尖锐、近平行或开展，全缘或波状。茎为匍匐根茎。花梗与叶柄长度相近；萼片披针形脱落或在花期后腐烂。花瓣20至25片，白色、卵状矩圆形，外轮略长于萼片。推荐理由：以各自的形态安然着的睡莲。有着自己的莞尔一笑。有着独有的矜持超脱，有着芳华四溢的意境。宛然，待定眼细凝，看迎风弄襟，颔首俯眉。','../img/花/睡莲类/3.白睡莲图集/白睡莲1.jpg','../img/花/睡莲类/3.白睡莲图集/白睡莲2.jpg','../img/花/睡莲类/3.白睡莲图集/白睡莲3.jpg','../img/花/睡莲类/3.白睡莲图集/白睡莲1.jpg',25,'564','436');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('红睡莲','睡莲类','介绍：叶圆形或近圆形，基部深裂，幼叶紫红色。老时上面转为墨绿色，有光泽。花大，直径30-34厘米，玫瑰红色。','../img/花/睡莲类/4.红睡莲图集/红睡莲1.jpg','../img/花/睡莲类/4.红睡莲图集/红睡莲2.jpg','../img/花/睡莲类/4.红睡莲图集/红睡莲3.jpg','../img/花/睡莲类/4.红睡莲图集/红睡莲1.jpg',25,'300','700');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('香睡莲','睡莲类','介绍：根茎平卧，叶圆形，直径8-25厘米，稍厚，全缘，表面暗绿色，背面常为紫色；花香，白色，花径8-5厘米，推荐理由：香睡莲开花端庄清丽，叶片散浮水面，是园林水体中常见的花卉。亦可缸植观赏。','../img/花/睡莲类/5.香睡莲图集/香睡莲1.jpg','../img/花/睡莲类/5.香睡莲图集/香睡莲2.jpg','../img/花/睡莲类/5.香睡莲图集/香睡莲3.jpg','../img/花/睡莲类/5.香睡莲图集/香睡莲1.jpg',25,'784','216');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('延药睡莲','睡莲类','介绍：根状茎肥厚。叶二型：浮水叶圆形或卵形，基部具弯缺，心形或箭形，常无出水叶；沉水叶薄膜质，脆弱。花形美丽，浮在或高出水面。','../img/花/睡莲类/6延药睡莲图集/延药睡莲1.jpg','../img/花/睡莲类/6延药睡莲图集/延药睡莲2.jpg','../img/花/睡莲类/6延药睡莲图集/延药睡莲3.jpg','../img/花/睡莲类/6延药睡莲图集/延药睡莲1.jpg',25,'149','851');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('百合花','百合类','别名：“山丹、中庭、中逢花“和”夜合花”。介绍：百合花长于茎的顶端，单生和簇生均有，有花冠大和花筒长的特点，总体呈漏斗的形状。花色大多为白色。因其鳞茎由许多白色鳞片层环抱而成，状如莲花，因而取 “ 百年好合”之意命名。推荐理由：百合具有百年好合美好家庭、伟大的爱之含意，有深深祝福的意义。','../img/花/百合类/1.百合花图集/百合花1.jpg','../img/花/百合类/1.百合花图集/百合花2.jpg','../img/花/百合类/1.百合花图集/百合花3.jpg','../img/花/百合类/1.百合花图集/百合花1.jpg',25,'428','572');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('郁金香','百合类','花语：博爱、体贴、高雅、富贵、能干、聪颖。介绍：英文名为“Didier''s tulip”或“Garden tulip”。叶3-5枚，条状披针形至卵状披针状，花单朵顶生，大型而艳丽，花被片红色或杂有白色和黄色，有时为白色或黄色，长5-7厘米，宽2-4厘米，6枚雄蕊等长，花丝无毛，无花柱，柱头增大呈鸡冠状，花期4-5月。相关故事：从前有位美丽的少女，在一个阳光明媚的早上，少女提着装满种子的花篮，到处播撒种子，希望能为春天增加美丽的色彩。美丽的少女走累了，就在一个河边坐下来休息，结果被风神布鲁斯无意间发现了，风神对少女产生了爱慕之心，于是便不断地追求少女。少女被风神穷追不舍，只好求助于女性的守护神洁安娜。洁安娜为了救助女孩而将她变成了一株鲜花，后来人们就给这朵花起了一个美丽的名字——郁金香。','../img/花/百合类/2.郁金香图集/郁金香1.png','../img/花/百合类/2.郁金香图集/郁金香2.png','../img/花/百合类/2.郁金香图集/郁金香3.png','../img/花/百合类/2.郁金香图集/郁金香1.png',25,'565','435');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('六出花','百合类','介绍：多年生宿根草本植物，高约1米，根肥厚肉质，平卧土中延长，须根多；茎自根茎上不定芽萌发，直立而细长，叶片多数，互生状散生，披针形，光滑，长7.5-10厘米，叶柄短而狭，叶片常自叶柄处外倾，叶面有数条平行脉。花序下为一轮生叶，总花梗5，各具花2-3朵，极少超过3朵或仅1朵者。伞形花序，单花直径8-10厘米，花瓣2轮，无花被管，花被片不整齐，内轮花被片具深褐色斑点。推荐理由：花色绮丽，花形优美，其低矮品种是优良的盆栽材料自。用它点缀窗台、客厅、橱窗、宾馆等地方。','../img/花/百合类/3.六出花图集/六出花1.jpg','../img/花/百合类/3.六出花图集/六出花2.jpg','../img/花/百合类/3.六出花图集/六出花3.jpg','../img/花/百合类/3.六出花图集/六出花1.jpg',25,'435','565');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('萱草','百合类','花语：1、遗忘的爱，萱草又名忘忧草，代表“忘却一切不愉快的事”。2、放下他（她）放下忧愁。3、隐藏起来的心情。4、萱草的花语是爱的忘却。5、同时又是中国的母亲花。别名：“金针”、“忘忧草”、“宜男草”、“疗愁”、“鹿箭”。介绍：其叶形为扁平状的长线型，花形则是于开花期会长出细长绿色的开花枝，花色橙黄、花柄很长、呈为像百合花一样的筒状。结出来的果子有翅。','../img/花/百合类/4.萱草图集/萱草1.jpg','../img/花/百合类/4.萱草图集/萱草2.jpg','../img/花/百合类/4.萱草图集/萱草3.jpg','../img/花/百合类/4.萱草图集/萱草1.jpg',25,'667','333');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('玉簪花','百合类','花语：脱俗、冰清玉洁。别名：白萼、白鹤仙。介绍：叶基生，成簇，卵状心形、卵形或卵圆形。花葶高40-80cm，具几朵至十几朵花；花单生或2-3朵簇生，长10-13cm，白色，芳香。蒴果圆柱状，有三棱。花果期8-10月。','../img/花/百合类/5.玉簪花图集/玉簪花1.jpg','../img/花/百合类/5.玉簪花图集/玉簪花2.jpg','../img/花/百合类/5.玉簪花图集/玉簪花3.jpg','../img/花/百合类/5.玉簪花图集/玉簪花1.jpg',25,'502','498');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('嘉兰','百合类','花语：荣光。介绍：是津巴布韦的国花；其花瓣向后反卷是重要的特征，瓣缘呈波状的花瓣。花名来源于拉丁的“惊叹”“美丽”之意。瓣缘呈波状的花瓣，表现出超越现实的美丽。推荐理由：北方多作盆栽，用于布置庭院、阳台、居室等处，也可将花朵制作胸花或者搭配其他花卉做成花束。','../img/花/百合类/6.嘉兰图集/嘉兰1.jpg','../img/花/百合类/6.嘉兰图集/嘉兰2.jpg','../img/花/百合类/6.嘉兰图集/嘉兰3.jpg','../img/花/百合类/6.嘉兰图集/嘉兰1.jpg',25,'428','572');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('卡罗拉','玫瑰类','花语：幸福而浪漫的爱情。介绍：卡罗拉（Carola），切花月季的一个品种，具有鲜红色，高芯卷边大花型等特点。赠送理由：卡罗拉玫瑰是属于玫瑰中的精品，它的花色十分经典，花朵饱满丰富，并且盛开之后明艳动人。因此，将卡罗拉玫瑰赠送给心爱的人，寓意十分美好，可以表达一种真挚之情。','../img/花/玫瑰类/1.卡罗拉图集/卡罗拉1.jpg','../img/花/玫瑰类/1.卡罗拉图集/卡罗拉2.jpg','../img/花/玫瑰类/1.卡罗拉图集/卡罗拉3.jpg','../img/花/玫瑰类/1.卡罗拉图集/卡罗拉4.jpg',25,'848','152');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('白玫瑰','玫瑰类','花语：纯洁、高贵、天真和纯纯的爱。介绍：切花白玫瑰（实为白色杂交茶香月季），白色大花，高心卷边，花形优美，花梗、枝条硬挺、多刺。其分级标准为：一级，45cm以上，花苞饱满，枝条粗壮，叶片浓绿。赠送理由：白玫瑰代表达纯纯的爱，表示你是圣洁的，甘心为你付出所有；送给一直爱慕、暗恋的女孩，最好送对方白玫瑰，以免对方有过强的抵触心理；','../img/花/玫瑰类/2.白玫瑰图集/白玫瑰1.jpg','../img/花/玫瑰类/2.白玫瑰图集/白玫瑰2.jpg','../img/花/玫瑰类/2.白玫瑰图集/白玫瑰1.jpg','../img/花/玫瑰类/2.白玫瑰图集/白玫瑰2.jpg',25,'435','565');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('法兰西','玫瑰类','花语：能言善道介绍：落叶灌木，枝茎密生直刺，小叶5－9片，叶子较月季更窄，质地较厚，花一至数朵生于枝端，花直径较小5—8厘米，紫红色。赠送理由：接受这种花祝福而生的人，口才非常的好，属于辨才无碍型。','../img/花/玫瑰类/3.法兰西图集/法兰西1.jpg','../img/花/玫瑰类/3.法兰西图集/法兰西2.jpg','../img/花/玫瑰类/3.法兰西图集/法兰西3.jpg','../img/花/玫瑰类/3.法兰西图集/法兰西1.jpg',25,'161','839');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('冷美人','玫瑰类','花语：浪漫真情，珍贵独特。介绍：冷美人又称冷香玫瑰，是中科院生态所多年培育开发的新一代玫瑰新品种，花期长，花朵大，枝条红色美观。赠送理由：它象征意义是深深的爱情，永恒爱情的守护花朵。','../img/花/玫瑰类/4.冷美人图集/冷美人1.jpg','../img/花/玫瑰类/4.冷美人图集/冷美人2.jpg','../img/花/玫瑰类/4.冷美人图集/冷美人3.jpg','../img/花/玫瑰类/4.冷美人图集/冷美人1.jpg',25,'62','938');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('金香玉','玫瑰类','花语：对于爱情：热情真爱，还代表为爱道歉。对于友情，黄玫瑰代表纯洁的友谊和美好的祝福，介绍：切花月季Rosa hybrida中的黄色品种。以其优雅的姿态，明亮的颜色，成为人们喜爱的花卉。赠送理由：娇羞花解语，温柔玉生香，代表纯洁的友谊和美好的祝福，所以送给好朋友会是一份不错的礼物。','../img/花/玫瑰类/5.金香玉图集/金香玉1.jpg','../img/花/玫瑰类/5.金香玉图集/金香玉2.jpg','../img/花/玫瑰类/5.金香玉图集/金香玉3.jpg','../img/花/玫瑰类/5.金香玉图集/金香玉1.jpg',25,'267','733');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('假日公主','玫瑰类','花语：快乐、笑容、美好的心情、愿你开怀每一天。介绍：Queen''s day，花头大、枝条长，香槟色。故事：在中世纪，这种玫瑰的颜色充满活力, 以能够让人微笑而闻名，特别是在寒冷、艰难的冬天。一天，女王注意到市场上的这种玫瑰，于是要求每天都把一支玫瑰放在床边，这样她每天起床后都能够看到美丽的东西，尽管外面天气灰暗沉闷，尽管她的臣民心情不太好。从此以后，女王每天醒来后，都心情舒畅，心中郁闷都远离而去。这个习惯一直坚持到她去世。以后，人们把这种玫瑰命名为“Queen''sDay”,一直沿用至今，中文名字叫做假日公主。赠送理由：它不仅充满活力，同时能够让人微笑而闻名。 ','../img/花/玫瑰类/6.假日公主图集/假日公主1.jpg','../img/花/玫瑰类/6.假日公主图集/假日公主2.jpg','../img/花/玫瑰类/6.假日公主图集/假日公主3.jpg','../img/花/玫瑰类/6.假日公主图集/假日公主1.jpg',25,'782','218');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('康乃馨','康乃馨类','花语：康乃馨的含义包括迷恋，与众不同和爱。红色：深爱与钦佩白：纯洁的爱情和好运粉红：母爱黄色：失望或拒绝紫色：反复无常条纹：拒绝或遗憾介绍：是石竹科、石竹属多年生草本植物，是多种石竹属园艺品种的通称。为多年生草本植物，株高70-100厘米，基部半木质化。整个植株被有白粉，呈灰绿色。花冠半球形，花萼长筒状，花蕾橡子状，花瓣扇形，花朵内瓣多呈皱缩状，花色有大红、粉红、鹅黄、白、深红等，还有玛瑙等复色及镶边等，有香气。推荐理由：康乃馨是优异的切花品种。矮生品种还可用于盆栽观赏。花朵还可提香精。这种体态玲珑、斑谰雅洁、端庄大方、芳香清幽的鲜花，随着母亲节的兴起，成为全球销量最大的花卉。中国广泛栽培供观赏，有很多园艺品种，耐瓶插，常用作切花，温室培养可四季开花。','../img/花/康乃馨/1.康乃馨(未包装)图集/康乃馨3.jpg','../img/花/康乃馨/1.康乃馨(未包装)图集/康乃馨4.jpg','../img/花/康乃馨/2.康乃馨(包装)图集/康乃馨2.jpg','../img/花/康乃馨/2.康乃馨(包装)图集/康乃馨7.jpg',25,'14','986');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('满天星','满天星类类','花语：清纯、关怀、思恋、配角、真爱以及纯洁的心灵。别名：锥花霞草、宿根满天星、锥花丝石竹、圆锥花丝石竹、丝石竹。介绍：多年生宿根花卉，株高90厘米以上。肉质根，外观似粗大“人参”，米黄色，略带须根。花小，白色、淡粉红色。推荐理由：满天星用途广泛，集观赏、药用于一体。由于它花型小、浅色、花姿蓬松具立体感，气质高雅清秀，给人以朦胧感，花序群体效果极佳，是重要的陪衬花材。','../img/花/满天星/1.满天星(未包装)图集/满天星1.jpg','../img/花/满天星/1.满天星(未包装)图集/满天星2.jpg','../img/花/满天星/2.满天星(包装)图集/满天星1.jpg','../img/花/满天星/2.满天星(包装)图集/满天星5.jpg',25,'609','391');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('向日葵','向日葵类','花语：信念、光辉、高傲、忠诚、爱慕，寓意是沉默的爱，代表着勇敢地去追求自己想要的幸福介绍：是桔梗目、菊科、向日葵属的植物。因花序随太阳转动而得名。头状花序，直径10-30厘米，单生于茎顶或枝端。推荐理由：向日葵花盘形似太阳，花色亮丽，纯朴自然，充满生机。一般成片种植，开花时金黄耀眼，极为壮观，深受大家喜爱。','../img/花/向日葵/1.向日葵(未包装)图集/向日葵2.jpg','../img/花/向日葵/1.向日葵(未包装)图集/向日葵6.jpg','../img/花/向日葵/2.向日葵(包装)图集/向日葵4.jpg','../img/花/向日葵/2.向日葵(包装)图集/向日葵5.jpg',25,'227','773');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('紫罗兰','紫罗兰类','花语：永恒的美与爱；质朴，美德，盛夏的清凉。介绍：全株密被灰白色具柄的分枝柔毛。茎直立，多分枝，基部稍木质化。叶片长圆形至倒披针形或匙形。推荐理由：紫罗兰花朵茂盛，花色鲜艳，香气浓郁，花期长，花序也长，为众多爱花者所喜爱，适宜于盆栽观赏，适宜于布置花坛、台阶、花径，整株花朵可作为花束。','../img/花/紫罗兰/1.紫罗兰(未包装)图集/紫罗兰1.jpg','../img/花/紫罗兰/1.紫罗兰(未包装)图集/紫罗兰4.jpg','../img/花/紫罗兰/2.紫罗兰(包装)图集/紫罗兰1.jpg','../img/花/紫罗兰/2.紫罗兰(包装)图集/紫罗兰2.jpg',25,'488','512');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('山荷叶','稀有花类','花语：亲情。别名：金魁莲、旱八角、八角莲、佛爷伞、大叶子、大脖梗子。拉丁学名：Diphylleia grayi F. Schm.介绍：多年生草本，植株高40-150厘米。根状茎粗状，横生，多须根；茎直立，不分枝，无毛，淡绿色。花深红色，5-8朵簇生于离叶基部不远处。变身秘诀：为什么花瓣是透明的？因为水分容易侵入花瓣内的细胞间隙，由于水和细胞液折射率接近，消除了反射界面，透射部分增强，花瓣就显得透明了。','../img/花/稀有花类/1.山荷叶图集/山荷叶1.jpg','../img/花/稀有花类/1.山荷叶图集/山荷叶2.jpg','../img/花/稀有花类/1.山荷叶图集/山荷叶1.jpg','../img/花/稀有花类/1.山荷叶图集/山荷叶2.jpg',25,'26','974');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('天堂鸟','稀有花类','花语：1、无论何时，无论何地，永远不要忘记你爱的人在等你2、能飞向天堂的鸟，能把各种情感、思恋带到天堂介绍：叶片长圆状披针形，长25-45cm，宽10cm。叶片顶端急尖；叶柄细长。花数朵生于总花梗上，下托一佛焰苞；佛焰苞绿色，边紫红，萼片橙黄色，花瓣暗蓝色；雄蕊与花瓣等长；花药狭线形，花柱突出，柱头3。','../img/花/稀有花类/2.天堂鸟图集/天堂鸟1.jpg','../img/花/稀有花类/2.天堂鸟图集/天堂鸟2.jpg','../img/花/稀有花类/2.天堂鸟图集/天堂鸟1.jpg','../img/花/稀有花类/2.天堂鸟图集/天堂鸟2.jpg',25,'408','592');
INSERT INTO flowers(flower_name,flower_kind,flower_introduction,flower_image1,flower_image2,flower_image3,flower_image4,flower_price,flower_sale,flower_stock)VALUES
('荷包牡丹','稀有花类','介绍：荷包牡丹，（拉丁学名：Lamprocapnos spectabilis (L.) Fukuhara [2] ），为罂粟科、荷包牡丹属多年生草本植物，株高30～60cm。地上茎直立，圆柱形，带紫红色，根状茎肉质，小裂片通常全缘，表面绿色，背面具白粉，两面叶脉明显；叶柄长约10厘米，形似当归。','../img/花/稀有花类/5.荷包牡丹图集/荷包牡丹1.jpg','../img/花/稀有花类/5.荷包牡丹图集/荷包牡丹2.jpg','../img/花/稀有花类/5.荷包牡丹图集/荷包牡丹1.jpg','../img/花/稀有花类/5.荷包牡丹图集/荷包牡丹1.jpg',25,'244','756');

-- ----------------------------
-- Table structure for plants
-- ----------------------------
DROP TABLE IF EXISTS `plants`;
CREATE TABLE `plants`  (
       `plant_id` int(11) NOT NULL AUTO_INCREMENT,
       `plant_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
       `plant_introduction` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
       `plant_image1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
       `plant_image2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
       `plant_price` int(5) DEFAULT NULL,
       `plant_sale` int (5) DEFAULT 0,
       `plant_stock` int (5) DEFAULT 1000,
       PRIMARY KEY (`plant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;


insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('人参榕','生长温度18-33度,冬季不能低于10度,低于6度极易受到冻害 。性喜温暖湿润的环境,春秋季节可以放置与有适当光照的地方，夏季放于无阳光直射的地方 。人参榕浇水要见干见湿，盆土宜经常保持湿润 。 [1] 人参榕喜温暖湿润和阳光充足的环境，不耐寒，耐半阴，生长适温为20℃至30℃，冬季棚室温度应维持不低于5℃。栽培土壤要自求为疏松肥沃、排水良好、富含有机质、呈酸性反应的沙质壤土，碱性土易导致其叶片黄化、生长不良。','../img/绿植/人参榕/img/人参榕1.jpg','../img/绿植/人参榕/img/人参榕1.jpg','39.9','768','232');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('光瓜栗','主要价值光瓜栗株型美观，耐荫性强，为优良的室内盆栽观叶植物。生长环境光瓜栗喜高温高湿气候，耐寒力差，幼苗忌霜冻。喜肥沃疏松、透气保水的沙壤土，喜酸性土，忌碱性土或黏重土壤，较耐水湿，也稍耐旱。生长适温为20-30℃。忌冷湿，在过于潮湿的环境下，叶片很容易出现渍状冻斑','../img/绿植/光瓜栗/img/发财树1.jpg','../img/绿植/光瓜栗/img/发财树2.jpg','69.9','209','791');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('合果芋','合果芋属天南星科的植物，大部分天南星科的植物都是有一定毒性的，合果芋的毒性主要是表现在合果芋的根茎还有汁液中。但是毒性不强，一般误食合果芋之后，会导致身体中喉咙有灼热感，还会导致口舌发麻，口腔黏膜溃疡感，严重的还会水肿，流口水，嘴巴不易张开','../img/绿植/合果芋/img/合果芋1.jpg','../img/绿植/合果芋/img/合果芋2.jpg','69.9','603','397');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('吊兰','观赏：吊兰是多年生草本植物，枝条细长下垂，夏季或其他季节温度高时开小白花，花集中于垂下来的枝条的末端，花蕊呈黄色，内部小嫩叶有时呈紫色，可供盆栽观赏。净化环境：吊兰养殖容易，适应性强，最为传统的居室垂挂植物之一。它叶片细长柔软，从叶腋中抽生出小植株，由盆沿向下垂，舒展散垂，似花朵，四季常绿。植物文化：吊兰的花语是“无奈而又给人希望”。','../img/绿植/吊兰/img/吊兰1.jpg','../img/绿植/吊兰/img/吊兰2.jpg','69.9','246','754');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('君子兰','君子兰为石蒜科，其植株文雅俊秀，有君子风姿，花如兰，而得名。君子兰是一种高品味的名贵花卉。它的拉丁文名字含有富贵、高尚、美好、壮丽的意思。《辞源》称“有才徳的人为君子”。君子兰的命名，其寓意有着人的君子般的品格和风采。中国君子兰是一种品格高尚、伫立含蓄的花卉。中国君子兰具有团结奋斗、勇于创新的精神，具有格调高雅的姿容，具有幽静、素雅的品格。 [5]','../img/绿植/君子兰/img/君子兰1.jpg','../img/绿植/君子兰/img/君子兰2.jpg','69.9','571','429');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('富贵竹','富贵竹象征着花开富贵、竹报平安、大吉大利、富贵一生，名字也是因此而出，富贵竹的美与它的吉祥名字分不开。它具有细长潇洒的叶子，翠绿的叶色，其茎节表现出貌似竹节的特征，却不是真正的竹。中国有“花开富贵，竹报平安”的祝辞，由于富贵竹茎叶纤秀，柔美优雅，极富竹韵，故而很得人们喜爱。','../img/绿植/富贵竹/img/富贵竹1.jpg','../img/绿植/富贵竹/img/富贵竹2.jpg','69.9','581','419');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('常春藤','英国在十六世纪采用忽布花以前，都是用常春藤来酿啤酒，因为把它混在麦子里，会使麦子化成啤酒。所以，常春藤的花语就是－感化。凡是受到这种花祝福而生的人，具有了不起的感化力，能够影响其他人，对恋人也有莫大的影响力，能把对方潜移默化成自己喜欢的类型。','../img/绿植/常春藤/img/常春藤1.jpg','../img/绿植/常春藤/img/常春藤2.jpg','69.9','237','763');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('散尾葵','散尾葵是小型的棕榈植物，耐阴性强。在家居中摆放散尾葵，能够有效去除空气中的苯、三氯乙烯、甲醛等有挥发性的有害物质。散尾葵与滴水观音一样，具有蒸发水气的功能，如果在家居种植一棵散尾葵，能够将室内的湿度保持在40%-60%，特别是冬季，室内湿度较低时，能有效提高室内湿度。在热带地区的庭院中，多作观赏树栽种于草地、树荫、宅旁；北方地区主要用于盆栽，是布置客厅、餐厅、会议室、家庭居室、书房、卧室或阳台的高档盆栽观叶植物。在明亮的室内可以较长时间摆放观赏；在较阴暗的房间也可连续观赏4-6周。散尾葵生长很慢，一般多作中、小盆栽植','../img/绿植/散尾葵/img/散尾葵1.jpg','../img/绿植/散尾葵/img/散尾葵2.jpg','69.9','745','255');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('棕竹','棕竹为典型的室内观叶植物。因为耐阴、耐湿、喜散射光，可长期在室内光线明亮的地方摆放，即使连续3个月在暗处见不到阳光，也能正常生长，并能保持其浓绿的叶色。棕竹丛生挺拔，枝叶繁茂，姿态潇洒，叶形秀丽，四季青翠，似竹非竹，美观清雅，富有热带风光，为家庭栽培最广泛的室内观叶植物。南部地区口丛植于庭院内大树下或假山旁，构成一幅热带山林的自然景观。北方地区可盆栽，大丛林可摆放在会议室、宾馆门口两侧，颇为雅观。如果家里客厅摆放高低错落有致、疏密协调的浅盆棕竹盆景，旁边再配几块山石，更显得玲珑秀丽。 [8]','../img/绿植/棕竹/img/棕竹1.jpg','../img/绿植/棕竹/img/棕竹2.jpg','69.9','191','809');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('橡皮树','橡皮树叶片肥厚而绮丽，叶片宽大美观且有光泽，红色的顶芽状似伏云，托叶裂开后恰似红缨倒垂，颇具风韵。它观赏价值较高，是著名的盆栽观叶植物。橡皮树叶大光亮，四季常青，是大型的耐阴观叶植物。盆栽是点缀宾馆堂和家庭居室的好材料，南方常配置于建筑物前、花坛中心和道路两侧等处。盆栽的中小型植株常用来美化客厅、书房、大型建筑物的门厅两侧及大堂中央，显得雄伟壮观，可体现热带风光','../img/绿植/橡皮树/img/橡皮树1.jpg','../img/绿植/橡皮树/img/橡皮树2.jpg','69.9','142','858');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('白掌','植物文化：花语：一帆风顺。白掌物语：美好、高洁、贤德、热烈、友谊、自信、自傲。寓意：白掌酷似鹤翘首，亭亭玉立，洁白无瑕，给人“纯洁平静、祥和安泰”美感，被称为“清白之花”。民间觉得白鹤芋有一种吉祥的寓意，按花的形象得名“一帆风顺”。白鹤芋花叶美，轻盈多姿，生长旺盛，且又耐阴，深受人们的青睐，常用于室内美化装饰','../img/绿植/白掌/img/白掌1.jpg','../img/绿植/白掌/img/白掌2.jpg','69.9','93','907');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('空气凤梨','空气凤梨可黏附于枯木上，岩石上，或放置于贝壳上，盆器上，只要根部不积水均能生长。不少外国室内设计杂志，都有空气凤梨作为室内植物点缀家居，十分时尚。更多人大量种植空气凤梨，就用金属线或鱼线挂起来，造型生动奇特。空气凤梨的根部以附着植株于固定处的功能为主，所以即使没有根部亦可生存，折断或弄伤的枝干也能独立存活一段日子，若环境合适也能长出子株延命。','../img/绿植/空气凤梨/img/空气凤梨1.jpg','../img/绿植/空气凤梨/img/空气凤梨2.jpg','69.9','322','678');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('艾草','人们还经常把艾草、菖蒲、雄黄、檀香等装在小布袋内做成香囊用五彩线系着，挂在身上，以得健康。民间认为艾草还有招百福的作用，有些地方在端午节贴“午时联”，曾这样写道： “手执艾旗招百福，门悬蒲剑斩千邪。”寄托着人们向往幸福生活，痛恨贪官污吏的美好愿望。艾是一种普通的植物和一味普通的中药，但是在中国文化的元素中却蕴含着丰富的知识和内涵。人们不仅用它祈福生活的美满和平安，又运用其为自己解除病痛，同时又以艾的温馨，让人们赏心悦目地细细品尝着它的滋味' ,'../img/绿植/艾草/img/艾草1.jpg','../img/绿植/艾草/img/艾草2.jpg','69.9','719','281');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('芦荟','早在1918年，美国食品与药物管理局就确认芦荟（Aloe vera，即库拉索芦荟）可食用。如今，库拉索芦荟凝胶制品已经被广泛应用于饮料、果冻、酸奶、罐头等食品的制作中。 [3] ','../img/绿植/芦荟/img/芦荟1.jpg','../img/绿植/芦荟/img/芦荟2.jpg','69.9','120','880');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('荷兰铁','荷兰铁原产中美洲的墨西哥、危地马拉的温暖地区。其生性强健，喜温暖，耐干旱，喜阳也耐阴，耐瘠薄，但要求土壤排水良好。生长适宜温度为15-25℃，越冬温度为0℃荷兰铁生长速度一般，对温度的要求范围较宽，生长最佳温度为15-30℃之间，冬季要保持在2℃之上最适，不耐严寒。在生长季节中，需要保持一定的空气湿度，如气温为20℃时，湿度在50%左右即可，气温为30℃左右时，湿度需要调整至70%左右，才可保持较好的生长势头。','../img/绿植/荷兰铁/img/荷兰铁1.jpg','../img/绿植/荷兰铁/img/荷兰铁2.jpg','69.9','741','259');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('蓝宝石','春秋是生长期，喜欢全日照。夏天会休眠，通风遮阳，每周可以在表土喷上少量的水，防止根死亡。冬天温度要逐渐断水，保持盆土干燥，提高植株抗寒能力。主要价值：摆放在房间内，有很高的观赏价值。','../img/绿植/蓝宝石/img/蓝宝石1.jpg','../img/绿植/蓝宝石/img/蓝宝石2.jpg','69.9','93','907');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('虎尾兰','虎尾兰用来净化空气起到良好的作用。研究表明，虎尾兰可吸收室内部分有害气体，并能有效地清除二氧化硫、氯、乙醚、乙烯、一氧化碳、过氧化氮等有害物。虎尾兰堪称卧室植物，即便是在夜间它也可以吸收二氧化碳，放出氧气。六棵齐腰高的虎尾兰就可以满足一个人的吸氧量。在室内养殖虎尾兰配合使用椰维炭，不仅可以提高人们的工作效率，还能在夏季减少开窗换气。','../img/绿植/虎尾兰/img/虎尾兰1.jpg','../img/绿植/虎尾兰/img/虎尾兰2.jpg','69.9','521','479');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('袖珍椰子','袖珍椰原产于墨西哥和危地马拉。袖珍椰喜温暖、湿润和半阴的环境，生长适宜的温度是20-30℃，13℃时进入休眠期，冬季最低气5261温为3℃。适生环境以排水良好、湿润、肥沃壤土为佳。','../img/绿植/袖珍椰子/img/袖珍椰子1.jpg','../img/绿植/袖珍椰子/img/袖珍椰子2.jpg','69.9','517','483');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('豆瓣绿','豆瓣绿养在家里面，对房间内的空气还能很好的起到净化作用。尤其是刚刚装修好的新房子，更适合养上一盆豆瓣绿，它可以很好的分解空气中的有毒气体，给我们营造一个健康的环境。豆瓣绿还是防辐射最好的植物。对于一些电脑和手机上面的辐射，可以很快将它们吸收，让我们的身体变得健康。另外它的植株是绿色的，所以我们在眼睛比较疲劳的时候，看上它一眼，可以很快的缓解我们的疲劳，保护了我们的视力。 [6] ' ,'../img/绿植/豆瓣绿/img/豆瓣绿1.jpg','../img/绿植/豆瓣绿/img/豆瓣绿2.jpg','69.9','410','590');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('铜钱草','人的一生离不开绿色环境，因为绿色植物光合作用制造氧气、释放的气味等生理功能与人息息相关，所以高质量的绿色环境在风水学上起着重要作用，植物构成的“生物场”对人类的事业、身体健康、爱情等都有十分重要的影响。根据对铜钱草的了解，我们都知道，铜钱草对水质要求不严，可在硬度较低的淡水中进行栽培。在温暖地区可露地盆栽，适於水盘、水族箱、水池、湿地中，室内水体绿化，能够净化水质，而且铜钱草的绿叶能够净化室内空气，因此对室内环境是有好处的，从这方面来说，铜钱草是能带来好风水的。再者，根据在中国的文化中，讲究寓意、谐音等，铜钱草，叶子圆圆的，象迷你型的荷叶，挺可爱，像古代的铜钱，寓意团团圆圆，好运连连，而且名字沾上了“铜”“钱”二字，寓意自然不同：家有铜钱，滚滚财源，因此被认为是财富的象征，所以，从寓意这方面来说，同钱财也是寓意着好的风水。','../img/绿植/铜钱草/img/铜钱草1.jpg','../img/绿植/铜钱草/img/铜钱草2.jpg','69.9','607','393');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('银皇后','银皇后以它独特的空气净化能力著称，可有效吸收空气中的甲醛和尼古丁，最适合放在新装修、购置新家具的房间中，如果家中有人抽烟，也可摆放一盆银皇后避免家人遭受二手烟的危害。而且，空气中污染物的浓度越高，它越能发挥其净化能力，非常适合通风条件不佳阴暗房间，是不可多得的健康植物。','../img/绿植/银皇后/img/银皇后1.jpg','../img/绿植/银皇后/img/银皇后2.jpg','69.9','395','605');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('雪铁芋','雪铁芋可以通过光合作用吸收毒气释放氧气，带来新鲜的空气。在白天的时候，它可以吸收房间的二氧化碳，同时放出氧气，让室内的空气中负离子浓度增加，甚至可以吸纳连吸尘器也难以吸到的灰尘。而更重要的是，它还可以吸收甲醛、苯系物等有害气体，杀灭空气中的细菌。在这个过程中有效地净化空气，增加空间中的绿色气氛，让人心旷神怡','../img/绿植/雪铁芋/img/雪铁芋1.jpg','../img/绿植/雪铁芋/img/雪铁芋2.jpg','69.9','343','657');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('青苹果竹芋','观赏价值青苹果竹芋，叶形浑圆、叶质丰腴、叶色青翠，其上排列有整齐的条纹，具有极高的观赏价值，更兼之比较喜阴，适于较长时间在室内作盆栽观赏。由于其叶片硕大、株形旺盛，将其栽植于大型广口花盆中，可用于布置商场、宾馆、会议室、会客厅等大型公共场所。用中小型精致陶瓷盆栽种，则适于作一般居家的客厅、书房、卧室摆设。植物文化：花语：优雅标致、清新宜人。诗韵：翠叶青枝根饰链，和露带雨惹人怜。不慕颜色不争春，只留青气在人间','../img/绿植/青苹果竹芋/img/青苹果竹芋1.jpg','../img/绿植/青苹果竹芋/img/青苹果竹芋2.jpg','69.9','24','976');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('香龙血树','植物文化，坚贞不屈，坚定不移，长寿富贵，吉祥如意，夜满秋深花带露，望月楼中，燕雨桥头，芳尘万里愁且住。此生料定多空度？巨木无边，亭亭玉树，龙血暗香销魂处。西双版纳热带植物园龙血树园的香龙血树意为，芳香，芬芳馥郁，沁人心脾，夜间香味尤其浓烈。','../img/绿植/香龙血树/img/香龙血树1.jpg','../img/绿植/香龙血树/img/香龙血树2.jpg','69.9','723','277');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('高大肾蕨','高大肾蕨生命力强，栽培容易，奇特的叶形叶姿和青翠碧绿的色彩，使人赏2113心悦目，适宜家居栽培，常以盆栽或吊篮置于阳台或居室的窗边','../img/绿植/高大肾蕨/img/高大肾蕨1.jpg','../img/绿植/高大肾蕨/img/高大肾蕨2.jpg','69.9','490','510');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('鹅掌柴','鹅掌柴大型盆栽植物，适用于宾馆大厅、图书馆的阅览室和博物馆展厅摆放，呈现自然和谐的绿色环境。春、夏、秋也可放在庭院蔽荫处和楼房阳台上观赏。可庭院孤植，是南方冬季的蜜源植物。盆栽布置客室、书房和卧室，具有浓厚的时代气息。能给吸烟家庭带来新鲜的空气。叶片可以从烟雾弥漫的空气中吸收尼古丁和其他有害物质，并通过光合作用将之转换为无害的植物自有的物质。另外，它每小时能把甲醛浓度降低大约9毫克。','../img/绿植/鹅掌柴/img/鹅掌柴1.jpg','../img/绿植/鹅掌柴/img/鹅掌柴2.jpg','69.9','412','588');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('黑美人','性喜高温多湿，生育适温约22~30℃。寒流侵袭低于15℃以下，需注意预防寒害，避免叶片因滞水隔夜而冻伤。','../img/绿植/黑美人/img/黑美人1.jpg','../img/绿植/黑美人/img/黑美人2.jpg','69.9','247','753');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('龙血树','主要价值 观赏：龙血树植株挺拔、素雅、朴实、雄伟，富有热带风情，大型植株可布置于庭院、大堂、客厅，小型植株和水养植株适于装饰书房、卧室等。药用：从龙血树的木质部提取出来的血竭为名贵中药材品种，深红色。具有活血祛瘀、消肿止痛、收敛止血之效','../img/绿植/龙血树/img/龙血树1.jpg','../img/绿植/龙血树/img/龙血树2.jpg','69.9','714','286');
insert into plants(plant_name, plant_introduction, plant_image1, plant_image2, plant_price,plant_sale,plant_stock) VALUES
    ('绿萝','形态特征：高大藤本，茎攀援，节间具纵槽；多分枝，枝悬垂。幼枝鞭状，细长，粗3-4毫米，节间长15-20厘米。生长习性：绿萝是阴性植物，喜散射光，较耐阴。它遇水即活，因顽强的生命力，被称为“生命之花”。蔓延下来的绿色枝叶，非常容易满足。室内养植时，不管是盆栽或是折几枝茎秆水培，都可以良好的生长。既可让其攀附于用棕扎成的圆柱上，也可培养成悬垂状置于书房、窗台，抑或直接盆栽摆放，是一种非常适合室内种植的优美花卉植物文化：绿萝遇水即活，因顽强的生命力，被称为“生命之花”。蔓延下来的绿色枝叶，非常容易满足，就连喝水也觉得自己是幸福的。 [2]绿萝的花语是“守望幸福”，大家可以在家中摆上一两盆绿萝，色彩明快、极富生机，既可以装点居室，又能够净化空气，给生活平添幸福的情趣！','../img/绿植/绿萝/img/绿萝1.jpg','../img/绿植/绿萝/img/绿萝2.jpg','49.9','271','729');


-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops`  (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `shop_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `shop_tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `shop_text` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,

  PRIMARY KEY (`shop_id`) USING BTREE

) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;



-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs`  (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_owner` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `blog_owner_id` int(11) DEFAULT NULL,
  `blog_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `blog_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `blog_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `blog_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `blog_views` int(10) DEFAULT 1314,
  `blog_likes` int(10) DEFAULT 520,
  PRIMARY KEY (`blog_id`) USING BTREE

) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

insert into blogs(blog_name, blog_owner,blog_owner_id,blog_text, blog_time) VALUES
    ('中秋节适合送什么花给家人或者另一半呢？','刘宇阳',1,'<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;中秋节 是我们当今中国比较传统的团圆节日之一，在每年的农历八月十五。中秋当天，人们都会赏月亮、吃月饼。当然很多人都会选择在中秋佳节的时候与朋友、与情人团聚。那么，大家知不知道中秋节送什么花比较合适呢？<br>　　<strong>接下来，就让我们一起来寻找答案吧！</strong><br>　　自古以来，中秋佳节同饮桂花酒，共吃各种秋月饼，水果瓜子，谈论美好的未来；因此它是离散亲属、海外游子、思亲念乡、喜具团聚地千古不变的佳节，一直流传到现在，而且是经久不衰。亲朋好友在中秋佳节时，不仅漫游在自家庭院或社区或公园或野外的花海中，也有的采摘或购买上百合、萱草、石榴、莲花等插瓶装饰，为节日更增添了一番团结欢乐的情趣。<br>　　走亲访友的们，此时此刻如能带上束鲜花，或送去一个满带祝福的花篮，那比携带任何糕点礼品都更显友情珍贵、品位高雅。<br>　　同样，远渡重洋、身居异国他乡的海外游子们，或旅居不自禁地“举头望明月，低头思故乡”，思念故乡的亲人们。<br>　　这些人常用电传邮购方式，为父母或亲朋好友一个个蕴满深情的礼仪花篮中花束，以表达他们思亲念乡情。在国内与父母身居两地儿女们，在中秋佳节到来之际，首先是打电话问候祝福。也可以送礼送祝福，对亲人的思恋。<br>　　<strong>鲜花／感激</strong><br>　　29枝红色康乃馨＋2枝多头粉香水百合＋水晶草＋黄莺<br>　　每一个人，都会有想要“感激”的人。中秋节来了，正好把最美好的祝福送给对方。<br>　　花语：常怀感恩之心的人是最幸福的，常怀感激之情的生活是最甜美的。<br>　　学会感激——感激我的父母，因为他们给了我宝贵的生命；<br>　　学会感激——感激我的老师，因为他们给了我无穷的知识；<br>　　学会感激——感激我的朋友，因为他们给了我克服困难的力量；<br>　　学会感激——感激我周围的一切，因为他们给了我和谐健康的成长空间。<br>　　<strong>鲜花／想着你</strong><br>　　16枝香槟玫瑰＋2枝白香水百合＋红色小康乃馨＋黄莺<br>　　因为各种原因，在中秋这个团圆的节日，有的人不能和家人团聚，不能陪着最亲密的人。一定要把那份盼团圆的心思传达给对方：“想着你”！<br>　　花语：想着你，空气里满是花的蜜香！<br>　　想着你，透过厚厚的玻璃，看到了太阳柔和的光芒！<br>　　想着你，就象水波荡漾，就象花儿绽放满是自由和幸福的晕光！<br>　　想着你，数着时钟的嘀哒，仿佛聆听快乐的音符！<br>　　想着你，想对所有人说在想你中快乐闯进了我的心房！<br>　　<strong>水果花篮／温馨祝福</strong><br>　　粉香水百合＋粉玫瑰＋康乃馨＋巴西叶＋绿叶<br>　　橙子＋苹果＋红提<br>　　特别的日子，要有所表示；特别美好的节日，要送上祝福。把寓意美好的鲜花和水果满满的装起来送给对方，就是最“温馨的祝福”。<br>　　花语：满满的水果、盛开的花朵，带来温馨的祝福。让微笑，在这一刻绽放。欣喜的心情，如花儿般盛开！</p>','2021-9-24 14:29');
insert into blogs(blog_name, blog_owner,blog_owner_id,blog_text, blog_time) VALUES
    ('使用鲜花打扮自己的卧室？','刘璇',2,'<p>植物会在白天进行光合作用释放出氧气，在夜间进行呼吸作用吸收氧气释放二氧化碳，所以卧室中不宜摆放太多花卉，不过有些花卉也能够在夜间释放氧气，所以也会比较适合摆放到卧室中养护。</p><p><strong>1.长寿花</strong></p><p>首先要说的就是长寿花了，它非常好养而且寓意也非常好，长寿花体内进行景天酸代谢物质，在夜间打开气孔，吸收空气中的二氧化碳，能够增加室内负离子浓度，让空气更加清新。</p><p><strong>2.芦荟</strong></p><p>芦荟的气孔白天关闭晚上打开，能够将夜晚呼吸出来的二氧化碳吸收掉，养护起来也非常简单，非常适合在卧室中养护，芦荟本身的净化能力也非常出众，而且芦荟还有检测空气质量的能力，如果污染比较重，它的叶片会出现斑点，不过不用担心只需要多养几盆芦荟，很快就能恢复正常。</p><p><strong>3.虎皮兰</strong></p><p>虎皮兰叶片肥厚有光泽，晚上能够吸收二氧化碳，同时还能够吸收甲醛、苯等有毒物质，从而让家里的空气更加清新，虎皮兰比较喜阳又耐阴，生命力顽强不需要太多的关照就能够生长得很好。想要虎皮兰迅速爆盆，我们可以沿盆沿挖几个洞，将煮熟的黄豆埋进去，或者埋点复合肥进去，这样就能够为虎皮兰补充养分。虎皮兰的繁殖也比较简单，将叶片剪成小段，扦插到疏松透气的土壤中就能够成活。</p><p><strong>4.蟹爪兰</strong></p><p>蟹爪兰叶片油亮有光泽，开花的时候红彤彤一片，非常的好看，它是属于叶片和花都能够观赏的植物，蟹爪兰也含有景天酸代谢，所以它也能够在夜晚吸收二氧化碳，所以也比较适合摆放到卧室中养护。</p><p><strong>5.景天科多肉</strong></p><p>上面说的景天代谢，就是从景天科多肉里得来的，所以对于那些景天科多肉来说它们夜晚都能够吸收二氧化碳，所以也可以摆放到卧室中养护，不过多肉植株小巧，所以也不要指望它能够吸收太多的二氧化碳</p>','2020-9-24 14:29');
insert into blogs(blog_name, blog_owner,blog_owner_id,blog_text, blog_time) VALUES
    ('实用小技巧:如何为家中的鲜花或者绿植松土？','苗欢欢',3,'<p><strong>给盆栽花松土的正确方法：</strong></p><p>&nbsp; &nbsp; 1、用小竹签小铁铲（耙）沿着花盆内壁边缘开始撬松土壤，插入竹签的深度以刚好看见植株的最上层根系为宜，但不可大量伤害或弄断根系。而操作过程中难免会弄伤少量上层根系，大家也不要过于担心，因为上层根系受损不严重的话，一般不会影响植株的正常生长，而且适当地剪除少量上层更细，也更利于植株萌发新的根系，提高植株的生长活力。</p><p>&nbsp; &nbsp; 2、在将上层土壤都松了一个遍之后，双手捧着花盆外壁，轻轻拍打几下花盆的外壁，注意用力要均匀，直到让花盆中的表层土壤出现松弛、均匀为宜，同时通过拍打花盆外壁，也能让盆土与盆内壁保持一定的间隙。</p><p>&nbsp; &nbsp; 3、接下来使用花卉植物专用松土工具沿着盆壁进行更为深层的松土。也可以使用坚硬的木棍、木棒沿着花盆内壁插入到盆底，然后谨慎松土。但需要注意的是，此阶段的松土需要尽可能避免弄伤甚至弄断深层的根系，否则容易对植株的正常生长造成影响。</p><p>&nbsp; &nbsp; 4、在将浅层和深层的土壤都松好之后，可以浇少量水。等到盆土再次变干之后，继续重复以上几个步骤，连续进行2-3次之后，基本上就能达到松土的目的了。短期内，不仅是盆土的透气透水性还是浇水的渗入效果，都会得到很大的提高。当然，平时松土过程中，我们也可以适当埋入少许腐烂的烂树皮、烂树叶、泥炭土、煤炭渣等，这往往能让松土效果更提高一步，同时也能减轻土壤发生板结的程度，避免短期内再发生板结现象。</p>','2021-8-24 14:29');
insert into blogs(blog_name, blog_owner,blog_owner_id,blog_text, blog_time) VALUES
    ('花的品种和养育技巧？','范佳伟',4,'<p>&nbsp; &nbsp; 现在喜欢养花的人是越来越多了，下面花帮主就给大家分享5种养花的小技巧，就算是新手也不用担心会把花养死了，一起来看看吧。<br><strong>一、浇水</strong><br>&nbsp; &nbsp; 给花浇水时要根据花卉的品种和花土的状态来判断是否要浇水，掌握“不干不浇，浇则浇透”的基本原则，这个口诀适用于大多数的花卉。“不干不浇”是因为大部分的花卉都不能承受长时间的水涝，否则很容易导致其烂根。“干则浇透”是因为一旦盆土变干了，花就会缺水，影响花卉的正常生长，浇透是为了避免花土半干半湿，对花儿的根系造成损伤。<br>给花卉浇水时也需要选择适当的时间。按季节来说，春天浇水的时候可以在早晚进行补充，而夏天浇水的时候最好不要在中午进行。秋季天气比较干燥，所以浇水可以在早晚进行，冬季气温比较低最好在中午进行为宜。<br><strong>二、施肥</strong><br>&nbsp; &nbsp; 在给花卉施肥的时候，要掌握“薄肥勤施”的原则。大多数的花卉都不喜欢浓肥，应该给它们施加一些薄肥。且施肥的时候量要少一些，可少量多次的施加。植株处于不同的生长阶段，施加的肥料也不同，在生长期可多施加氮肥，花前和花后则是施磷钾肥，在花期和休眠期时一般都要停止施肥。<br><strong>三、光照</strong><br>&nbsp; &nbsp; 俗话说万物生长靠太阳，但很多花友在日常养花的过程中很容易犯一些错误。比如很多花友在给花卉晒太阳时，只是将花盆放置到光照适合的位置就不与理睬了，殊不知植物有趋光性，这样对花卉的生长是有很大的坏处的。<br>大家最好要每隔一段时间转动一下花盆，让植物能够均匀地接受光照，这样花卉才能长得更加自然挺拔，至于转动花盆的时间间隔，花帮主建议一个星期转动一次就行了。<br>除此之外，不同品种的花卉也拥有不同的生长习性，有些花卉喜阴，而有的花喜阳。很多人认为喜阳的花卉就应多进行光照，其实这是一种误区，长期接受阳光的暴晒，很可能会导致花卉的叶片干枯、掉叶，更别提那些耐阴的花卉了。大家最好是让它们接受适量的光照，夏季光照强烈的时候，注意给植物进行遮阴，避开阳光直射。<br><strong>四、温度</strong><br>&nbsp; &nbsp; 要想把花卉养得很好，有一个合适的温度也是很重要的，大多数的花卉喜欢15～25℃左右的生长环境。但是每一种植物的适应能力不同，在养护期间需要根据花卉的习性来调整。<br><strong>五、土壤</strong><br>&nbsp; &nbsp; 想让花长得好，土壤也是很重要的，不同的花喜欢的土质不同，养殖时要清楚它具体适宜哪种土质中生长。通常，养花可以使用泥炭土、腐叶土、松针土和椰糠。泥炭土营养丰富，透气性也非常好，不易板结。腐叶土、松针土的排水透气也很好，但是处理不当就会有细菌和虫卵，所以要消毒后才能使用。椰糠一般和其它土壤配制使用。<br>&nbsp; &nbsp; 这5个养花小技巧，既简单又实用。花友们都学会了没？</p>','2021-5-24 14:29');
insert into blogs(blog_name, blog_owner,blog_owner_id,blog_text, blog_time) VALUES
    ('教师节该送什么花给老师？','徐卓龙',5,'<p>&nbsp; &nbsp; 教师节可以送老师郁金香、百合花、康乃馨、向日葵、文竹等。送郁金香代表着神圣、祝福、永恒；百合花象征着女性之美，代表了伟大的爱；康乃馨是表达爱和尊敬；送向日葵象征着老师用爱心温暖着每个学生；文竹代表着老师文气十足，师爱永恒。<br>&nbsp; &nbsp; 9月10日是教师节，师恩不忘，不管老师在岗也好，退休也罢，他们永远是我们最尊敬的老师，让我们在节日这一天送上我们最真挚的祝福吧！</p><p><strong>教师节适合送的鲜花：</strong><br><strong>郁金香</strong><br>&nbsp; &nbsp; 郁金香这个花比较好看，做成花束就更为漂亮了。郁金香代表了神圣、祝福、永恒，可以送给老师一支，也可以是一束，或者是做成花篮送也是可以的。红色郁金香代表热烈的爱意、粉色郁金香代表永远的爱、黄色郁金香代表开朗、白色郁金香代表纯洁清高的恋情，我建议送粉色和黄色搭配表答对老师的爱，希望老师开朗快乐每一天。<br><strong>百合花</strong><br>&nbsp; &nbsp; 百合花送给老师是不错的选择，百合花代表了纯洁，也有很多人把百合花和甜蜜联系到了一起，都说明了百合花的寓意是非常好的。百合花颜色丰富，并且被认为是圣母之花。所以说百合花非常适合送给老师，特别是送给女老师。<br><strong>康乃馨</strong><br>&nbsp; &nbsp; 对于送长辈来的鲜花来说，康乃馨是万能的。可以送给父母、也可以送给身边的朋友。康乃馨的花语有热情、魅力、真情、温馨的祝福、热爱着你、慈祥、不求代价、宽容、伟大，神圣，慰问，所以说教师节送给老师是再合适不过的。不过康乃馨的颜色多种多样，有红色、粉色。个人建议粉色主要送给女性，而红色康乃馨可以送给男性和女性。<br><strong>向日葵</strong><br>&nbsp; &nbsp; 这个花是送给老师最合适的花卉了。受到这种花祝福的人，必定是像太阳一样伟大或者受人尊敬。她必定有着一颗明朗和快乐的心。近年来赠送给老师这个花的时候并不流行用花束了，而是搭配个漂亮且文艺的花盆，直接栽种在里面送给老师。其实这样也好，可以让花开更长时间。<br><strong>微型玫瑰</strong><br>&nbsp; &nbsp; 在古希腊神话中，玫瑰是集爱与美于一身，既是美神的化身，也是爱神的象征。虽然玫瑰常用来表达爱情，但也表达了对人的尊敬。教师节送给老师这个花，也是非常应景的。 不过更流行的是微型玫瑰盆栽了。<br><strong>剑兰</strong><br>&nbsp; &nbsp; “剑兰”花它代表的意思是“怀念、用心、长寿、福禄、节节上升和坚固”。这也代表着祝愿我们敬爱的老师永远健康快乐，师生间的友谊永久长存。<br><strong>文竹</strong><br>&nbsp; &nbsp; 寓意老师文气十足，师爱永恒。文竹容易抽出新枝，学生的新知不断而来。摆在老师办公室的桌上挺有生命力的，而且可让老师长期把你的心意留下。</p>','2021-9-8 14:29');

-- ----------------------------
-- Table structure for story
-- ----------------------------
DROP TABLE IF EXISTS `story`;
CREATE TABLE `story`  (
                          `story_id` int(11) NOT NULL AUTO_INCREMENT,
                          `story_owner` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                          `story_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                          `story_introduction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                          `story_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                          `story_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                          `story_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,

                          PRIMARY KEY (`story_id`) USING BTREE

) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

INSERT INTO  story(story_owner,story_title,story_introduction,story_text,story_image,story_time) VALUES
('听故事，赏鲜花','Queen''s day ——假日公主','在中世纪，这种玫瑰的颜色充满活力, 以能够让人微笑而闻名，特别是在寒冷、艰难的冬天。一天,女王注意到市场上的这种玫瑰...','  <p>花语：快乐、笑容、美好的心情、愿你开怀每一天。介绍：Queen''s day，花头大、枝条长，香槟色。</p><div class="s_img clearfix"><div class="pic"><img src=".././img/花/玫瑰类/6.假日公主图集/假日公主1.jpg" alt="" class="vcenter" style="width: 463px;height: 347px;"/><i></i></div><div class="pic"><img src=".././img/花/玫瑰类/6.假日公主图集/假日公主2.jpg" alt="" class="vcenter" style="width: 463px;height: 347px;"/><i></i></div></div><p>在中世纪，这种玫瑰的颜色充满活力, 以能够让人微笑而闻名，特别是在寒冷、艰难的冬天。一天，女王注意到市场上的这种玫瑰，于是要求每天都把一支玫瑰放在床边，</p><p>这样她每天起床后都能够看到 美丽的东西，尽管外面天气灰暗沉闷，尽管她的臣民心情不太好。从此以后，女王每天醒来后，都心 情舒畅，心中郁闷都远离而去。</p><p>这个习惯一直坚持到她去世。以后，人们把这种玫瑰命名为“Queen''s Day”,一直沿用至今，中文名字叫做假日公主。</p>','.././img/花/玫瑰类/6.假日公主图集/假日公主1.jpg','2021-09-30');
INSERT INTO  story(story_owner,story_title,story_introduction,story_text,story_image,story_time) VALUES
('Love Live','Didier''s tulip ——郁金香','从前有位美丽的少女，在一个阳光明媚的早上，少女提着装满种子的花篮，到处播撒种子，希望能为春天增加美丽的...','<p>花语：博爱、体贴、高雅、富贵、能干、聪颖，这些无不是郁金香的代名词。介绍：英文名为“Didier''s tulip”或“Garden tulip”。叶3-5枚，条状披针形至卵状披针状，花单朵顶生，大型而艳丽，花被片红色或杂有白色和黄色，有时为白色或黄色，长5-7厘米，宽2-4厘米，6枚雄蕊等长，花丝无毛，无花柱，柱头增大呈鸡冠状，花期4-5月。</p><div class="s_img clearfix"><div class="pic"><img src=".././img/花/百合类/2.郁金香图集/郁金香1.png" alt="" class="vcenter" style="width: 463px;height: 347px;"/><i></i></div><div class="pic"><img src=".././img/花/百合类/2.郁金香图集/郁金香3.png" alt="" class="vcenter" style="width: 463px;height: 347px;"/><i></i></div></div><p>郁金香的故事我们慢慢道来：从前有位美丽的少女，在一个阳光明媚的早上，少女提着装满种子的花篮，到处播撒种子，希望能为春天增加美丽的色彩。美丽的少女走累了，就在一个河边坐下来休息。</p><p>结果被风神布鲁斯无意间发现了，风神对少女产生了爱慕之心，于是便不断地追求少女。少女被风神穷追不舍，只好求助于女性的守护神洁安娜。洁安娜为了救助女孩而将她</p><p>变成了一株鲜花，后来人们就给这朵花 起了一个美丽的名字——郁金香。</p>','.././img/花/百合类/2.郁金香图集/郁金香2.jpg','2021-10-01');
INSERT INTO  story(story_owner,story_title,story_introduction,story_text,story_image,story_time) VALUES
('随遇而安','Diphylleia grayi F. Schm. ——山荷叶','为什么花瓣是透明的？因为水分容易侵入花瓣内的细胞间隙，由于水和细胞液折射率接近，消除了反射界面，透射部分增强，花瓣就显得透明了。',' <p>花语：亲情。别名：金魁莲、旱八角、八角莲、佛爷伞、大叶子、大脖梗子。拉丁学名：Diphylleia grayi F. Schm.</p><div class="s_img clearfix"><div class="pic"><img src=".././img/花/稀有花类/1.山荷叶图集/山荷叶1.jpg" alt="" class="vcenter" style="width: 463px;height: 347px;"/><i></i></div><div class="pic"><img src=".././img/花/稀有花类/1.山荷叶图集/山荷叶2.jpg" alt="" class="vcenter" style="width: 463px;height: 347px;"/><i></i></div></div><p>介绍：多年生草本，植株高40-150厘米。根状茎粗状，横生，多须根；茎直立，不分枝，无毛，淡绿色。 花深红色，5-8朵簇生于离叶基部不远处。</p><p>变身秘诀：为什么花瓣是透明的？</p><p>因为水分容易侵入花瓣内的细胞间隙，由于水和细胞液折射率接近，消除了反射界面，透射部分增强，花瓣就显得透明了。</p>','.././img/花/稀有花类/1.山荷叶图集/山荷叶1.jpg','2021-11-13');
INSERT INTO  story(story_owner,story_title,story_introduction,story_text,story_image,story_time) VALUES
('悬浮的枸杞','Rose ——卡罗拉','印度神话称玫瑰花蕾里诞生了拉克什米女神，是保护神吡瑟孥吻她而把她唤醒的，从此，它就成了吡瑟孥的妻子...','<p>花语：幸福而浪漫的爱情。</p><div class="s_img clearfix"><div class="pic"><img src=".././img/花/玫瑰类/1.卡罗拉图集/卡罗拉1.jpg" alt="" class="vcenter" style="width: 463px;height: 347px;"/><i></i></div><div class="pic"><img src=".././img/花/玫瑰类/1.卡罗拉图集/卡罗拉2.jpg" alt="" class="vcenter" style="width: 463px;height: 347px;"/><i></i></div></div><p>介绍：卡罗拉（Carola），切花月季的一个品种，具有鲜红色，高芯卷边大花型等特点。</p> <p>赠送理由：卡罗拉玫瑰是属于玫瑰中的精品，它的花色十分经典，花朵饱满丰富，并且 盛开之后明艳动人。</p><p>因此，将卡罗拉玫瑰赠送给心爱的人，寓意十分美好，可以表达一种真挚之情。</p>','.././img/花/玫瑰类/1.卡罗拉图集/卡罗拉1.jpg','2021-11-18');

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
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
      `message_id` int(11) NOT NULL AUTO_INCREMENT,
      `message_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
      `message_user_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '../img/用户.png',
      `message_title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
      `message_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
      `message_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
      `message_text` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
      PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;



SET FOREIGN_KEY_CHECKS = 1;



INSERT INTO shops(shop_id,shop_name,shop_address,shop_tel,shop_text) VALUES
('001','范佳伟的店铺','西安邮电大学1517-1',15830599166,'备注1');
INSERT INTO shops(shop_id,shop_name,shop_address,shop_tel,shop_text) VALUES
('002','徐卓龙的店铺','西安邮电大学1517-5',17792379816,'备注2');
INSERT INTO shops(shop_id,shop_name,shop_address,shop_tel,shop_text) VALUES
('003','刘璇的店铺','西安邮电大学3518-3',15929068966,'备注3');
INSERT INTO shops(shop_id,shop_name,shop_address,shop_tel,shop_text) VALUES
('004','刘宇阳的店铺','西安邮电大学1517-4',13279505680,'备注4');
INSERT INTO shops(shop_id,shop_name,shop_address,shop_tel,shop_text) VALUES
('005','张嘉祺的店铺','西安邮电大学1517-2',17792379816,'备注5');
INSERT INTO shops(shop_id,shop_name,shop_address,shop_tel,shop_text) VALUES
('006','张若鹏的店铺','西安邮电大学1517-3',17792379816,'备注6');
INSERT INTO shops(shop_id,shop_name,shop_address,shop_tel,shop_text) VALUES
('007','钱璞玉的店铺','西安邮电大学1517-6',17792379816,'备注7');




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


INSERT INTO messages(message_name,message_title,message_email,message_time,message_text) VALUES
('文文','这家花城里面花种类真多，赞赞赞！！！', '2193560021@qq.com','2021-10-24 14:12','这家花城里面花种类真多，赞赞赞！！！');
INSERT INTO messages(message_name,message_title,message_email,message_time,message_text) VALUES
('刘小阳','女朋友可喜欢了，赞赞赞！！！', '2193560021@qq.com','2021-9-24 14:12','这家花城里面花种类真多，赞赞赞！！！');
INSERT INTO messages(message_name,message_title,message_email,message_time,message_text) VALUES
('刘小璇','男朋友可喜欢了，赞赞赞！！！', '2193560021@qq.com','2021-8-24 14:12','这家花城里面花种类真多，赞赞赞！！！');
INSERT INTO messages(message_name,message_title,message_email,message_time,message_text) VALUES
('润迎','苗总可喜欢了，赞赞赞！！！', '2193560021@qq.com','2021-7-24 14:12','这家花城里面花种类真多，赞赞赞！！！');
INSERT INTO messages(message_name,message_title,message_email,message_time,message_text) VALUES
('徐卓龙','隔壁润迎可喜欢了，赞赞赞！！！', '2193560021@qq.com','2021-6-24 14:12','这家花城里面花种类真多，赞赞赞！！！');
