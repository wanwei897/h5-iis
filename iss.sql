
/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : iss

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2021-02-06 00:19:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categoryinfo
-- ----------------------------
DROP TABLE IF EXISTS `categoryinfo`;
CREATE TABLE `categoryinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categoryinfo
-- ----------------------------
INSERT INTO `categoryinfo` VALUES ('0', '全部');
INSERT INTO `categoryinfo` VALUES ('1', '美女图片');
INSERT INTO `categoryinfo` VALUES ('2', '手机图片');
INSERT INTO `categoryinfo` VALUES ('3', '科技展示');
INSERT INTO `categoryinfo` VALUES ('4', 'NBA图片');
INSERT INTO `categoryinfo` VALUES ('5', '中华城市');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', 'cwj', '2021-01-08 19:58:07', '华为手机棒');
INSERT INTO `comment` VALUES ('1', '随风而行', '2021-01-16 19:58:26', '针不戳！！');
INSERT INTO `comment` VALUES ('1', '说得来', '2021-01-13 20:59:56', '听闻华为出新手机，我连夜把家里的iphone卖了换华为');
INSERT INTO `comment` VALUES ('1', '行行行', '2021-01-07 19:48:51', '支持国产');
INSERT INTO `comment` VALUES ('1', '就这样吧', '2021-01-09 19:49:23', '华为小米手机都不错');
INSERT INTO `comment` VALUES ('1', '阿斯达', '2021-01-09 19:49:37', '买来没用多久屏幕就摔坏了，哦哦哦');
INSERT INTO `comment` VALUES ('1', '爱美达仙女', '2021-01-01 19:50:13', '拍照好好看啊');
INSERT INTO `comment` VALUES ('1', '匿名用戶', '2021-02-05 17:48:17', '啊实打实大厦');
INSERT INTO `comment` VALUES ('1', '匿名用戶', '2021-02-05 17:48:23', '确实确实');
INSERT INTO `comment` VALUES ('1', '匿名用戶', '2021-02-05 17:48:32', '我要买要买');
INSERT INTO `comment` VALUES ('1', '匿名用戶', '2021-02-05 17:49:25', '萨达');
INSERT INTO `comment` VALUES ('1', '匿名用戶', '2021-02-05 21:34:54', '123');
INSERT INTO `comment` VALUES ('1', '匿名用戶', '2021-02-05 21:35:07', '请问');
INSERT INTO `comment` VALUES ('1', '匿名用戶', '2021-02-05 21:36:01', '是的');
INSERT INTO `comment` VALUES ('1', '匿名用戶', '2021-02-06 00:03:21', '阿斯顿撒');
INSERT INTO `comment` VALUES ('1', '匿名用戶', '2021-02-06 00:13:07', '温湿度');

-- ----------------------------
-- Table structure for goodsinfo
-- ----------------------------
DROP TABLE IF EXISTS `goodsinfo`;
CREATE TABLE `goodsinfo` (
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sell_price` decimal(10,2) DEFAULT NULL,
  `market_price` decimal(10,2) DEFAULT NULL,
  `parameters` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsinfo
-- ----------------------------
INSERT INTO `goodsinfo` VALUES ('1', '华为p40', '3499.00', '3999.00', '256G 双4G版手机', 'JD000001', '10', '2021-01-21 23:24:46');

-- ----------------------------
-- Table structure for goodslist
-- ----------------------------
DROP TABLE IF EXISTS `goodslist`;
CREATE TABLE `goodslist` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `zhaiyao` varchar(255) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `sell_price` decimal(10,2) DEFAULT NULL,
  `market_price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `page` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodslist
-- ----------------------------
INSERT INTO `goodslist` VALUES ('1', '华为p40', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '10', '1');
INSERT INTO `goodslist` VALUES ('2', '小米note20 双卡版', '2021-01-14 11:28:13', '小米note20 双卡版正式开售啦', '123412', 'http://127.0.0.1:8887/goods/xiaomi.jpg', '3499.00', '3999.00', '150000', '1');
INSERT INTO `goodslist` VALUES ('3', '多少分加快速度被罚款还得上班说的话你付款今年圣诞节', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/xiaomi.jpg', '3499.00', '3999.00', '150000', '1');
INSERT INTO `goodslist` VALUES ('4', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '150000', '1');
INSERT INTO `goodslist` VALUES ('5', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '150000', '1');
INSERT INTO `goodslist` VALUES ('6', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '150000', '1');
INSERT INTO `goodslist` VALUES ('7', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '150000', '1');
INSERT INTO `goodslist` VALUES ('8', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '150000', '1');
INSERT INTO `goodslist` VALUES ('9', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '150000', '2');
INSERT INTO `goodslist` VALUES ('10', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '150000', '2');
INSERT INTO `goodslist` VALUES ('11', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '10', '2');
INSERT INTO `goodslist` VALUES ('12', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '10', '2');
INSERT INTO `goodslist` VALUES ('13', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '10', '2');
INSERT INTO `goodslist` VALUES ('14', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '10', '2');
INSERT INTO `goodslist` VALUES ('15', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '10', '2');
INSERT INTO `goodslist` VALUES ('16', '华为p40宇宙大战纪念版', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '10', '2');
INSERT INTO `goodslist` VALUES ('17', '第三页', '2021-01-14 11:28:13', '华为p40正式开售拉！', '123412', 'http://127.0.0.1:8887/goods/huawei.jpg', '3499.00', '3999.00', '10', '3');

-- ----------------------------
-- Table structure for goodsswipe
-- ----------------------------
DROP TABLE IF EXISTS `goodsswipe`;
CREATE TABLE `goodsswipe` (
  `id` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsswipe
-- ----------------------------
INSERT INTO `goodsswipe` VALUES ('1', 'http://127.0.0.1:8887/goods/huawei.jpg');
INSERT INTO `goodsswipe` VALUES ('1', 'http://127.0.0.1:8887/goods/huawei.jpg');
INSERT INTO `goodsswipe` VALUES ('1', 'http://127.0.0.1:8887/goods/huawei.jpg');
INSERT INTO `goodsswipe` VALUES ('1', 'http://127.0.0.1:8887/goods/huawei.jpg');

-- ----------------------------
-- Table structure for home_swipe
-- ----------------------------
DROP TABLE IF EXISTS `home_swipe`;
CREATE TABLE `home_swipe` (
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of home_swipe
-- ----------------------------
INSERT INTO `home_swipe` VALUES ('http://127.0.0.1:8887/swipe/2.jpg');
INSERT INTO `home_swipe` VALUES ('http://127.0.0.1:8887/swipe/3.jpg');
INSERT INTO `home_swipe` VALUES ('http://127.0.0.1:8887/swipe/4.jpg');
INSERT INTO `home_swipe` VALUES ('http://127.0.0.1:8887/swipe/1.jpg');

-- ----------------------------
-- Table structure for newlist
-- ----------------------------
DROP TABLE IF EXISTS `newlist`;
CREATE TABLE `newlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newlist
-- ----------------------------
INSERT INTO `newlist` VALUES ('1', '华为p40', '2021-01-19 14:43:42', '1927', 'http://127.0.0.1:8887/new/huawei.jpg', '1季度华为手机销售量突破1000w速度速度,这是不小的突破\r\n					<h2>这是一个h2标签</h2>', '手机');
INSERT INTO `newlist` VALUES ('2', '小米noto20 双卡版', '2021-01-21 14:45:44', '1234', 'http://127.0.0.1:8887/new/xiaomi.jpg', '1季度小米手机销售量突破1000w速度速度,这是不小的突破\r\n					<h2>这是一个h2标签</h2>', '手机');
INSERT INTO `newlist` VALUES ('3', '1季度锤子手机销售量突破1000w是对方不是低保费is的', '2021-01-07 14:55:19', '12431', 'http://127.0.0.1:8887/new/chuizi.jpg', '1季度华为手机销售量突破1000w速度速度,这是不小的突破\r\n					<h2>这是一个h2标签</h2>', '手机');

-- ----------------------------
-- Table structure for photodetail
-- ----------------------------
DROP TABLE IF EXISTS `photodetail`;
CREATE TABLE `photodetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `img_url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photodetail
-- ----------------------------
INSERT INTO `photodetail` VALUES ('1', '有气质且带可爱的美女组图', '1234', '2021-01-05 18:22:33', '有气质且带可爱的美女组图有气质且带可爱的美女组图有气质且带可爱的美女组图有气质且带可爱的美女组图', '../../../static/img/photoList/beauti/meinv1.jpg,../../../static/img/photoList/beauti/meinv2.jpg,../../../static/img/photoList/beauti/meinv3.jpg');
INSERT INTO `photodetail` VALUES ('2', '超甜美的韩国美女美图欣赏', '1232', '2020-12-30 16:57:58', '超甜美的韩国美女美图欣赏,超甜美的韩国美女美图欣赏,超甜美的韩国美女美图欣赏,超甜美的韩国美女美图欣赏', '../../../static/img/photoList/beauti/koreaBeauti1.jpg');

-- ----------------------------
-- Table structure for photolist
-- ----------------------------
DROP TABLE IF EXISTS `photolist`;
CREATE TABLE `photolist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `zhaiyao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photolist
-- ----------------------------
INSERT INTO `photolist` VALUES ('1', '1', '有气质且带可爱的美女组图', 'http://127.0.0.1:8887/photoList/beauti/meinv1.jpg', '有气质且带可爱的美女组图');
INSERT INTO `photolist` VALUES ('2', '1', '超甜美的韩国美女美图欣赏', 'http://127.0.0.1:8887/photoList/beauti/koreaBeauti1.jpg', '超甜美的韩国美女美图欣赏，哟哟哟,啥的话说,\r\n				暗杀大声道大脚啊话都不会是打算是的开放鸡蛋阿斯蒂芬加快速度华发商都比方说的\r\n				士大夫士大夫可接受的不耐烦会计师不能代付是的佛isjdfoiu时代峰峻逆剑狂神DNF\r\n				撒旦法士大夫');
INSERT INTO `photolist` VALUES ('3', '2', '小米手机', 'http://127.0.0.1:8887/photoList/cellphone/xiaomi.jpg', '超甜美的韩国美女美图欣赏，哟哟哟,啥的话说,\r\n				暗杀大声道大脚啊');
INSERT INTO `photolist` VALUES ('4', '2', '华为手机', 'http://127.0.0.1:8887/photoList/cellphone/huawei.jpg', '有气质且带可爱的美女组图，哟哟哟');
INSERT INTO `photolist` VALUES ('5', '2', '锤子手机', 'http://127.0.0.1:8887/photoList/cellphone/chuizi.jpg', '超甜美的韩国美女美图欣赏，哟哟哟,啥的话说,\r\n				暗杀大声道大脚');
INSERT INTO `photolist` VALUES ('6', '3', '食品料理机', 'http://127.0.0.1:8887/photoList/technology/p1.jpg', 'Ultrason® 应用于食品料理机的透明视窗。Ultrason® 让使用者在操作中可以自由观察密闭料理机内的食材。\r\nUltrason® 耐受温度高达220度，耐油脂、耐化学性良好，同时具有很好的机械强度。\r\nUltrason®不含BPA，符合FDA标准。');
INSERT INTO `photolist` VALUES ('7', '3', '哑铃型健身器材', 'http://127.0.0.1:8887/photoList/technology/p2.jpg', ' 采用巴斯夫全球首款发泡性热塑性聚氨酯 Infinergy® 制造的哑铃型健身器材可以在俯卧撑时使用。得益于材料卓越的韧性、拉伸强度和弹性，避免了地板的损坏风险。');
INSERT INTO `photolist` VALUES ('8', '3', '透水路面', 'http://127.0.0.1:8887/photoList/technology/p3.jpg', 'Elastopave®透水路面能实现高达50%以上透水性。\r\n它可灵活设计满足多种多样的路面要求。\r\n通过选用不同颜色、材质、大小的石料，Elastopave®路面不仅有透水功能，还可以包括不同颜色任何LOGO、图案、花型、文字等设计。\r\n施工效率高, 维修简便。');
INSERT INTO `photolist` VALUES ('9', '4', '斯蒂芬·库里', 'http://127.0.0.1:8887/photoList/nba/curry.jpg', '斯蒂芬·库里（Stephen Curry、Wardell Stephen Curry II [1]  ），1988年3月14日出生于美国俄亥俄州阿克伦（Akron,Ohio），美国职业篮球运动员，司职控球后卫，效力于NBA金州勇士队。');
INSERT INTO `photolist` VALUES ('10', '4', '勒布朗·詹姆斯', 'http://127.0.0.1:8887/photoList/nba/james.jpg', '勒布朗·詹姆斯（LeBron James），全名勒布朗·雷蒙·詹姆斯（LeBron Raymone James），1984年12月30日出生于美国俄亥俄州阿克伦，美国职业篮球运动员，司职小前锋，绰号“小皇帝”，效力于NBA洛杉矶湖人队。 [1] ');
INSERT INTO `photolist` VALUES ('11', '4', '凯文·杜兰特', 'http://127.0.0.1:8887/photoList/nba/durant.jpg', '凯文·杜兰特（Kevin Durant），1988年9月29日出生于美国华盛顿哥伦比亚特区（Washington, District of Columbia），美国职业篮球运动员，司职小前锋/大前锋，效力于NBA布鲁克林篮网队。 [1] ');

-- ----------------------------
-- Table structure for photos
-- ----------------------------
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` int(11) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `msrc` varchar(255) DEFAULT NULL,
  `w` int(11) DEFAULT NULL,
  `h` int(11) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photos
-- ----------------------------
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv1.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv1.jpg', '330', '330', '', '这是标题！！');
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv2.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv2.jpg', '330', '500', null, null);
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv3.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv3.jpg', '330', '495', null, null);
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv4.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv4.jpg', '330', '495', null, '');
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv5.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv5.jpg', '330', '495', '', '');
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv6.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv6.jpg', '330', '495', '', '');
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv7.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv7.jpg', '330', '495', '', '');
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv8.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv8.jpg', '330', '495', '', '');
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv9.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv9.jpg', '330', '495', '', '');
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv10.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv10.jpg', '330', '495', '', '');
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv11.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv11.jpg', '330', '495', '', '');
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv12.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv12.jpg', '330', '495', '', '');
INSERT INTO `photos` VALUES ('1', 'http://127.0.0.1:8887/photoList/beauti/meinv13.jpg', 'http://127.0.0.1:8887/photoList/beauti/meinv13.jpg', '330', '495', '  ', '');
INSERT INTO `photos` VALUES ('2', 'http://127.0.0.1:8887/photoList/beauti/koreaBeauti1.jpg', 'http://127.0.0.1:8887/photoList/beauti/koreaBeauti1.jpg', '330', '330', '', '');
