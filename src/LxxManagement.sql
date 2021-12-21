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

