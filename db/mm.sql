DROP DATABASE IF EXISTS mm;
CREATE DATABASE mm CHARSET=UTF8;
USE mm;

/**用户user表，用户信息**/
CREATE TABLE mm_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,	#uid 排列。。
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),		
  avatar VARCHAR(128)        #头像图片路径
);

/**用户banner表轮播广告**/
CREATE TABLE mm_banner(
	cid INT PRIMARY KEY AUTO_INCREMENT,	#广告的id
	msg VARCHAR(128),	#轮播广告地址
	title VARCHAR(64),	#轮播广告标题
	href VARCHAR(128)	
);

/**产品表的实现（这里是一个总表里可改动）**/
CREATE TABLE mm_product(
	lid INT PRIMARY KEY AUTO_INCREMENT,	#产品的id
	title VARCHAR(128),         #主标题
	subtitle VARCHAR(128),      #副标题
	price DECIMAL(10,2),        #价格
	msg VARCHAR(128),	    #图片路径
	isdel INT		    #留给后台->删除操作
);
/**产品表家族**/
CREATE TABLE mm_product_family(
	fid INT PRIMARY KEY AUTO_INCREMENT,	#id名
	name VARCHAR(32)			#品牌名称
);
/**产品表图片，用来做详情页面的**/
CREATE TABLE mm_product_pic(
	pid INT PRIMARY KEY AUTO_INCREMENT,	#每个图的具体id
	pic_id INT,              #一个具体产品的多面图，
	sm VARCHAR(128),            #小图片路径
	md VARCHAR(128),            #中图片路径
	lg VARCHAR(128)             #大图片路径
);


/****/
/**添加数据**/
/**添加轮播广告的数据**/
INSERT INTO mm_banner VALUES
(null,'img/banner/banner1.jpg','轮播商品1','#'),
(null,'img/banner/banner2.jpg','轮播商品2','#'),
(null,'img/banner/banner3.jpg','轮播商品3','#'),
(null,'img/banner/banner4.jpg','轮播商品4','#');

/**添加用户表的数据7个信息**/
INSERT INTO mm_user VALUES
(1,'dingding','123456','ding@qq.com','13501234567','img/avatar/default.png'),
(2,'dangdang','123456','dang@qq.com','13501234568','img/avatar/default.png'),
(3,'dongdong','123456','dou@qq.com','13501234569','img/avatar/default.png'),
(4,'yaozihao','123456','ya@qq.com','13501234560','img/avatar/default.png');

/**添加商品信息有编号，主标题，副标题，价格，图片路径，isdel**/    /*总表*/
INSERT INTO mm_product VALUES
(1,'royal牌宠物食品，猫猫爱吃的。适合室内成年猫，营养充足，让猫咪吃得饱吃，净重量10kg','猫粮',124,'img/product/royal_1_1.jpg',0),
(2,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(3,'royal牌宠物食品，猫猫爱吃的。去毛球，营养充足，易消化吸收，净重量2kg','猫粮',34,'img/product/royal_3_1.jpg',0),
(4,'royal牌宠物食品，猫猫爱吃的。美毛呵护猫粮，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2kg','猫粮',35,'img/product/royal_4_1.jpg',0),
(5,'royal牌宠物食品，猫猫爱吃的。大袋，适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量200kg','猫粮',240,'img/product/royal_5_1.jpg',0),
(6,'royal牌宠物食品，猫猫爱吃的。适合绝育后的猫猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2kg','猫粮',125,'img/product/royal_6_1.jpg',0),
(7,'royal牌宠物食品，猫猫爱吃的。营养成猫猫粮，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2kg','猫粮',30,'img/product/royal_7_1.jpg',0),
(8,'royal牌宠物食品，猫猫爱吃的。适合英短类的猫粮，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',127,'img/product/royal_8_1.jpg',0),
(9,'royal牌宠物食品，猫猫爱吃的。适合室内成猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2kg','猫粮',37,'img/product/royal_9_1.jpg',0),	
(10,'伟嘉牌宠物食品，猫猫爱吃的海洋鱼味猫粮，适合室内幼猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量1.2kg','猫粮',23,'img/product/wikas_1_1.jpg',0),
(11,'伟嘉牌宠物食品，猫猫爱吃的金枪鱼味猫粮，适合一岁以上成猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量12*8.5g','猫粮',20,'img/product/wikas_2_1.jpg',0),
(12,'伟嘉牌宠物食品，猫猫爱吃的小黄鱼味猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量12*8.5g','猫粮',20,'img/product/wikas_3_1.jpg',0),
(13,'伟嘉牌宠物食品，猫猫爱吃的牛肉味猫粮，适合幼猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量12*8.5g','猫粮',20,'img/product/wikas_4_1.jpg',0),
(14,'伟嘉牌宠物食品，猫猫爱吃的精选鸡肉味猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量12*8.5g','猫粮',20,'img/product/wikas_5_1.jpg',0),	
(15,'metz牌宠物食品，猫猫爱吃的无谷物味猫粮，适合猫猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量1.36kg','猫粮',41,'img/product/metz_1_1.jpg',0),
(16,'metz牌宠物食品，猫猫爱吃的牛肉味猫粮，适合猫猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量1.36kg','猫粮',45,'img/product/metz_2_1.jpg',0),
(17,'metz牌宠物食品，猫猫爱吃的鸡胸肉味加金枪鱼味猫粮，适合猫猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量1.36kg','猫粮',45,'img/product/metz_3_1.jpg',0),
(18,'metz牌宠物食品，猫猫爱吃的小黄鱼味猫粮，适合猫猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量1.36kg','猫粮',41,'img/product/metz_4_1.jpg',0),
(19,'metz牌宠物食品，猫猫爱吃的鸡肉味猫粮，适合猫猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量1.36kg','猫粮',45,'img/product/metz_5_1.jpg',0),
(20,'喜多鱼牌宠物食品，猫猫爱吃的营养综合猫粮，适合猫猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',140,'img/product/wisfish_1_1.jpg',0),
(21,'喜多鱼牌宠物食品，猫猫爱吃的海洋味营养综合猫粮，适合猫猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',142,'img/product/wisfish_2_1.jpg',0),	
(22,'比瑞吉牌宠物食品，猫猫爱吃的海洋味营养综合猫粮，适合幼猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，试用','猫粮',3,'img/product/brg_1_1.jpg',0),
(23,'比瑞吉牌宠物食品，猫猫爱吃的营养综合猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2kg','猫粮',55,'img/product/brg_2_1.jpg',0),
(24,'比瑞吉牌宠物食品，猫猫爱吃的均衡营养综合猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2kg','猫粮',55,'img/product/brg_3_1.jpg',0),
(25,'比瑞吉牌宠物食品，猫猫爱吃的营养综合猫粮，适合幼猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2kg','猫粮',56,'img/product/brg_4_1.jpg',0),	
(26,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',73,'img/product/purina_1_1.jpg',0),
(27,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'冠能牌宠物食品，猫猫爱吃的室内成猫猫粮，适合成猫食用，营养充足，让猫咪吃得饱吃，易消化吸收，净重量2.5kg','猫粮',75,'img/product/purina_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0),
(null,'royal牌宠物食品，猫猫爱吃的。适合室内幼年猫，营养充足，让猫咪吃得饱吃，易消化吸收，净重量10kg','猫粮',126,'img/product/royal_2_1.jpg',0);



/**各个产品品牌mm_product_family**/
INSERT INTO mm_product_family VALUES
(null,'royal'),
(null,'伟嘉'),
(null,'metz'),
(null,'喜多鱼'),
(null,'比瑞吉'),
(null,'冠能');

/**产品的具体图片，小》中》大图**/
INSERT INTO mm_product_pic VALUES
(null,1,'img/...待补充','img/...待补充','img/product/royal_1_1.jpg'),
(null,1,'img/...待补充','img/...待补充','img/product/royal_1_2.jpg'),
(null,1,'img/...待补充','img/...待补充','img/product/royal_1_3.jpg'),
(null,1,'img/...待补充','img/...待补充','img/product/royal_1_4.jpg'),
(null,1,'img/...待补充','img/...待补充','img/product/royal_1_5.jpg'),
(null,2,'img/...待补充','img/...待补充','img/product/royal_2_1.jpg'),
(null,2,'img/...待补充','img/...待补充','img/product/royal_2_2.jpg'),
(null,2,'img/...待补充','img/...待补充','img/product/royal_2_3.jpg'),
(null,2,'img/...待补充','img/...待补充','img/product/royal_2_4.jpg'),
(null,2,'img/...待补充','img/...待补充','img/product/royal_2_5.jpg'),
(null,2,'img/...待补充','img/...待补充','img/product/royal_2_6.jpg'),
(null,2,'img/...待补充','img/...待补充','img/product/royal_2_7.jpg'),
(null,3,'img/...待补充','img/...待补充','img/product/royal_3_1.jpg'),
(null,3,'img/...待补充','img/...待补充','img/product/royal_3_2.jpg'),
(null,3,'img/...待补充','img/...待补充','img/product/royal_3_3.jpg'),
(null,3,'img/...待补充','img/...待补充','img/product/royal_3_4.jpg'),
(null,3,'img/...待补充','img/...待补充','img/product/royal_3_5.jpg'),
(null,4,'img/...待补充','img/...待补充','img/product/royal_4_1.jpg'),
(null,4,'img/...待补充','img/...待补充','img/product/royal_4_2.jpg'),
(null,4,'img/...待补充','img/...待补充','img/product/royal_4_3.jpg'),
(null,4,'img/...待补充','img/...待补充','img/product/royal_4_4.jpg'),
(null,4,'img/...待补充','img/...待补充','img/product/royal_4_5.jpg'),
(null,5,'img/...待补充','img/...待补充','img/product/royal_5_1.jpg'),
(null,5,'img/...待补充','img/...待补充','img/product/royal_5_2.jpg'),
(null,5,'img/...待补充','img/...待补充','img/product/royal_5_3.jpg'),
(null,5,'img/...待补充','img/...待补充','img/product/royal_5_4.jpg'),
(null,5,'img/...待补充','img/...待补充','img/product/royal_5_5.jpg'),
(null,5,'img/...待补充','img/...待补充','img/product/royal_5_6.jpg'),
(null,6,'img/...待补充','img/...待补充','img/product/royal_6_1.jpg'),
(null,6,'img/...待补充','img/...待补充','img/product/royal_6_2.jpg'),
(null,6,'img/...待补充','img/...待补充','img/product/royal_6_3.jpg'),
(null,6,'img/...待补充','img/...待补充','img/product/royal_6_4.jpg'),
(null,6,'img/...待补充','img/...待补充','img/product/royal_6_5.jpg'),
(null,7,'img/...待补充','img/...待补充','img/product/royal_7_1.jpg'),
(null,7,'img/...待补充','img/...待补充','img/product/royal_7_2.jpg'),
(null,7,'img/...待补充','img/...待补充','img/product/royal_7_3.jpg'),
(null,7,'img/...待补充','img/...待补充','img/product/royal_7_4.jpg'),
(null,7,'img/...待补充','img/...待补充','img/product/royal_7_5.jpg'),
(null,7,'img/...待补充','img/...待补充','img/product/royal_7_6.jpg'),
(null,8,'img/...待补充','img/...待补充','img/product/royal_8_1.jpg'),
(null,8,'img/...待补充','img/...待补充','img/product/royal_8_2.jpg'),
(null,8,'img/...待补充','img/...待补充','img/product/royal_8_3.jpg'),
(null,8,'img/...待补充','img/...待补充','img/product/royal_8_4.jpg'),
(null,8,'img/...待补充','img/...待补充','img/product/royal_8_5.jpg'),
(null,8,'img/...待补充','img/...待补充','img/product/royal_8_6.jpg'),
(null,9,'img/...待补充','img/...待补充','img/product/royal_9_1.jpg'),
(null,9,'img/...待补充','img/...待补充','img/product/royal_9_2.jpg'),
(null,9,'img/...待补充','img/...待补充','img/product/royal_9_3.jpg'),
(null,9,'img/...待补充','img/...待补充','img/product/royal_9_4.jpg'),
(null,9,'img/...待补充','img/...待补充','img/product/royal_9_5.jpg'),


(null,10,'img/...待补充','img/...待补充','img/product/wikas_1_1.jpg'),
(null,10,'img/...待补充','img/...待补充','img/product/wikas_1_2.jpg'),
(null,10,'img/...待补充','img/...待补充','img/product/wikas_1_3.jpg'),
(null,11,'img/...待补充','img/...待补充','img/product/wikas_2_1.jpg'),
(null,11,'img/...待补充','img/...待补充','img/product/wikas_2_2.jpg'),
(null,11,'img/...待补充','img/...待补充','img/product/wikas_2_3.jpg'),
(null,12,'img/...待补充','img/...待补充','img/product/wikas_3_1.jpg'),
(null,12,'img/...待补充','img/...待补充','img/product/wikas_3_2.jpg'),
(null,12,'img/...待补充','img/...待补充','img/product/wikas_3_3.jpg'),
(null,13,'img/...待补充','img/...待补充','img/product/wikas_4_1.jpg'),
(null,13,'img/...待补充','img/...待补充','img/product/wikas_4_2.jpg'),
(null,13,'img/...待补充','img/...待补充','img/product/wikas_4_3.jpg'),
(null,14,'img/...待补充','img/...待补充','img/product/wikas_5_1.jpg'),
(null,14,'img/...待补充','img/...待补充','img/product/wikas_5_2.jpg'),
(null,14,'img/...待补充','img/...待补充','img/product/wikas_5_3.jpg'),


(null,15,'img/...待补充','img/...待补充','img/product/metz_1_1.jpg'),
(null,15,'img/...待补充','img/...待补充','img/product/metz_1_2.jpg'),
(null,15,'img/...待补充','img/...待补充','img/product/metz_1_3.jpg'),
(null,15,'img/...待补充','img/...待补充','img/product/metz_1_4.jpg'),
(null,15,'img/...待补充','img/...待补充','img/product/metz_1_5.jpg'),
(null,15,'img/...待补充','img/...待补充','img/product/metz_1_6.jpg'),
(null,15,'img/...待补充','img/...待补充','img/product/metz_1_7.jpg'),
(null,15,'img/...待补充','img/...待补充','img/product/metz_1_8.jpg'),
(null,15,'img/...待补充','img/...待补充','img/product/metz_1_9.jpg'),
(null,16,'img/...待补充','img/...待补充','img/product/metz_2_1.jpg'),
(null,16,'img/...待补充','img/...待补充','img/product/metz_2_2.jpg'),
(null,16,'img/...待补充','img/...待补充','img/product/metz_2_3.jpg'),
(null,16,'img/...待补充','img/...待补充','img/product/metz_2_4.jpg'),
(null,16,'img/...待补充','img/...待补充','img/product/metz_2_5.jpg'),
(null,16,'img/...待补充','img/...待补充','img/product/metz_2_6.jpg'),
(null,17,'img/...待补充','img/...待补充','img/product/metz_3_1.jpg'),
(null,17,'img/...待补充','img/...待补充','img/product/metz_3_2.jpg'),
(null,17,'img/...待补充','img/...待补充','img/product/metz_3_3.jpg'),
(null,17,'img/...待补充','img/...待补充','img/product/metz_3_4.jpg'),
(null,17,'img/...待补充','img/...待补充','img/product/metz_3_5.jpg'),
(null,17,'img/...待补充','img/...待补充','img/product/metz_3_6.jpg'),
(null,18,'img/...待补充','img/...待补充','img/product/metz_4_1.jpg'),
(null,18,'img/...待补充','img/...待补充','img/product/metz_4_2.jpg'),
(null,18,'img/...待补充','img/...待补充','img/product/metz_4_3.jpg'),
(null,18,'img/...待补充','img/...待补充','img/product/metz_4_4.jpg'),
(null,18,'img/...待补充','img/...待补充','img/product/metz_4_5.jpg'),
(null,18,'img/...待补充','img/...待补充','img/product/metz_4_6.jpg'),
(null,19,'img/...待补充','img/...待补充','img/product/metz_5_1.jpg'),
(null,19,'img/...待补充','img/...待补充','img/product/metz_5_2.jpg'),
(null,19,'img/...待补充','img/...待补充','img/product/metz_5_3.jpg'),
(null,19,'img/...待补充','img/...待补充','img/product/metz_5_4.jpg'),
(null,19,'img/...待补充','img/...待补充','img/product/metz_5_5.jpg'),
(null,19,'img/...待补充','img/...待补充','img/product/metz_5_6.jpg'),

(null,20,'img/...待补充','img/...待补充','img/product/wisfish_1_1.jpg'),
(null,20,'img/...待补充','img/...待补充','img/product/wisfish_1_2.jpg'),
(null,20,'img/...待补充','img/...待补充','img/product/wisfish_1_3.jpg'),
(null,20,'img/...待补充','img/...待补充','img/product/wisfish_1_4.jpg'),
(null,21,'img/...待补充','img/...待补充','img/product/wisfish_2_1.jpg'),
(null,21,'img/...待补充','img/...待补充','img/product/wisfish_2_2.jpg'),
(null,21,'img/...待补充','img/...待补充','img/product/wisfish_2_3.jpg'),

(null,22,'img/...待补充','img/...待补充','img/product/brg_1_1.jpg'),
(null,22,'img/...待补充','img/...待补充','img/product/brg_1_2.jpg'),
(null,22,'img/...待补充','img/...待补充','img/product/brg_1_3.jpg'),
(null,22,'img/...待补充','img/...待补充','img/product/brg_1_4.jpg'),
(null,22,'img/...待补充','img/...待补充','img/product/brg_1_5.jpg'),
(null,22,'img/...待补充','img/...待补充','img/product/brg_1_6.jpg'),
(null,22,'img/...待补充','img/...待补充','img/product/brg_1_7.jpg'),
(null,22,'img/...待补充','img/...待补充','img/product/brg_1_7.jpg'),
(null,23,'img/...待补充','img/...待补充','img/product/brg_2_1.jpg'),
(null,23,'img/...待补充','img/...待补充','img/product/brg_2_2.jpg'),
(null,23,'img/...待补充','img/...待补充','img/product/brg_2_3.jpg'),
(null,23,'img/...待补充','img/...待补充','img/product/brg_2_4.jpg'),
(null,24,'img/...待补充','img/...待补充','img/product/brg_3_1.jpg'),
(null,24,'img/...待补充','img/...待补充','img/product/brg_3_2.jpg'),
(null,24,'img/...待补充','img/...待补充','img/product/brg_3_3.jpg'),
(null,24,'img/...待补充','img/...待补充','img/product/brg_3_4.jpg'),
(null,25,'img/...待补充','img/...待补充','img/product/brg_4_1.jpg'),
(null,25,'img/...待补充','img/...待补充','img/product/brg_4_2.jpg'),
(null,25,'img/...待补充','img/...待补充','img/product/brg_4_3.jpg'),
(null,25,'img/...待补充','img/...待补充','img/product/brg_4_4.jpg'),


(null,26,'img/...待补充','img/...待补充','img/product/purina_1_1.jpg'),
(null,26,'img/...待补充','img/...待补充','img/product/purina_1_2.jpg'),
(null,26,'img/...待补充','img/...待补充','img/product/purina_1_3.jpg'),
(null,26,'img/...待补充','img/...待补充','img/product/purina_1_4.jpg'),
(null,26,'img/...待补充','img/...待补充','img/product/purina_1_5.jpg'),
(null,27,'img/...待补充','img/...待补充','img/product/purina_2_1.jpg'),
(null,27,'img/...待补充','img/...待补充','img/product/purina_2_2.jpg');


