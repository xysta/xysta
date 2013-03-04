/*
Navicat MySQL Data Transfer

Source Server         : nano
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : xysta

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2013-03-04 16:38:20
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `xysta_blog`
-- ----------------------------
DROP TABLE IF EXISTS `xysta_blog`;
CREATE TABLE `xysta_blog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(256) NOT NULL,
  `author` varchar(256) NOT NULL,
  `original` varchar(256) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `imagepath` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xysta_blog
-- ----------------------------
INSERT INTO `xysta_blog` VALUES ('1', '子对你够熬过弄可多发福建哦案发覅法能够爱的奇偶电脑', '1', '1', '2013-02-04 12:21:12', null);
INSERT INTO `xysta_blog` VALUES ('2', '防泼水能够动漫片丹佛分公司的进入发的搜集搜覅间被搜桌子说覅把你发的', '1', '1', '2013-02-04 12:21:12', null);
INSERT INTO `xysta_blog` VALUES ('3', '分局欧盟法律的三年和疯狂了虚拟', '10', null, '2013-02-04 12:21:12', null);
INSERT INTO `xysta_blog` VALUES ('4', '的分散开几句话案件胸襟和反对法国固定价格挥金如土一会见头发多少人根据', '10', null, '2013-02-04 16:16:44', null);
INSERT INTO `xysta_blog` VALUES ('5', '所的疯狂进攻萨芬你电话', '10', null, '2013-02-04 16:48:56', null);
INSERT INTO `xysta_blog` VALUES ('6', '发生破门是某个的浪费法国是国防和痛苦同法国的发生的法国人说法破门时配合就发生地和噢噢幸福福田和', '10', null, '2013-02-04 16:49:09', null);
INSERT INTO `xysta_blog` VALUES ('7', '法第四偶然了浓厚爱你个人热爱哦后如果奶哦会改变爱uhd', '10', null, '2013-02-04 16:51:17', null);
INSERT INTO `xysta_blog` VALUES ('8', '热哦滴那个片佛门了帕尔马爱哦软件功能哦二娃非法放哈文化部', '10', null, '2013-02-04 16:52:50', null);
INSERT INTO `xysta_blog` VALUES ('9', '偶发的厚爱发挥你和你说的键盘搜让你明天爱哦如果急啊人得分赛格和热阿狗IFF', '10', null, '2013-02-04 16:56:09', null);
INSERT INTO `xysta_blog` VALUES ('10', '卡来自南京话咯爱今年刚ihds发偶就会', '10', null, '2013-02-04 17:07:15', null);
INSERT INTO `xysta_blog` VALUES ('11', '发欧诺和到哪个孩子热闹和熬得弄个号自动能够的上课看', '10', null, '2013-02-04 17:38:29', null);
INSERT INTO `xysta_blog` VALUES ('12', '在哦平淡美好东坡的那种懂的总和你安兰花点', '10', null, '2013-02-05 09:25:15', null);
INSERT INTO `xysta_blog` VALUES ('13', '欧普在内的两个弄破侦破的能够欧洲年底耦合在内地各', '10', null, '2013-02-05 09:25:20', null);
INSERT INTO `xysta_blog` VALUES ('14', '子哦那都是个走得弄个', '10', null, '2013-02-05 09:25:24', null);
INSERT INTO `xysta_blog` VALUES ('15', '疾走的浓厚懊恼的哦死啊很难偶的萨尼轰然奥德化工ir带哦变化', '12', null, '2013-02-26 13:58:23', null);
INSERT INTO `xysta_blog` VALUES ('16', '的萨拉门路口东方女人后德斯欧冠农大', '1', '1', '2013-02-28 16:17:34', null);
INSERT INTO `xysta_blog` VALUES ('17', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '10', null, '2013-02-19 16:18:31', null);
INSERT INTO `xysta_blog` VALUES ('18', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-05 22:19:15', null);
INSERT INTO `xysta_blog` VALUES ('19', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-28 16:20:57', null);
INSERT INTO `xysta_blog` VALUES ('20', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-28 16:21:00', null);
INSERT INTO `xysta_blog` VALUES ('21', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-28 16:21:03', null);
INSERT INTO `xysta_blog` VALUES ('22', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-28 16:21:05', null);
INSERT INTO `xysta_blog` VALUES ('23', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-05 16:21:07', null);
INSERT INTO `xysta_blog` VALUES ('24', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-03 16:21:11', null);
INSERT INTO `xysta_blog` VALUES ('25', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-01-28 16:21:14', null);
INSERT INTO `xysta_blog` VALUES ('26', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-19 16:21:18', null);
INSERT INTO `xysta_blog` VALUES ('27', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-04 16:21:24', null);
INSERT INTO `xysta_blog` VALUES ('28', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-11 16:21:28', null);
INSERT INTO `xysta_blog` VALUES ('29', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-11 16:21:31', null);
INSERT INTO `xysta_blog` VALUES ('30', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-18 16:21:34', null);
INSERT INTO `xysta_blog` VALUES ('31', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-03 16:23:38', null);
INSERT INTO `xysta_blog` VALUES ('32', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-01-14 16:23:35', null);
INSERT INTO `xysta_blog` VALUES ('33', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-01-28 16:23:29', null);
INSERT INTO `xysta_blog` VALUES ('34', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-03 16:23:26', null);
INSERT INTO `xysta_blog` VALUES ('35', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-04 16:23:22', null);
INSERT INTO `xysta_blog` VALUES ('36', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-05 16:23:19', null);
INSERT INTO `xysta_blog` VALUES ('37', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-06 16:23:15', null);
INSERT INTO `xysta_blog` VALUES ('38', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-07 16:23:12', null);
INSERT INTO `xysta_blog` VALUES ('39', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-10 16:23:09', null);
INSERT INTO `xysta_blog` VALUES ('40', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-18 16:23:05', null);
INSERT INTO `xysta_blog` VALUES ('41', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-18 16:23:02', null);
INSERT INTO `xysta_blog` VALUES ('42', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-12 16:22:59', null);
INSERT INTO `xysta_blog` VALUES ('43', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '11', null, '2013-02-03 16:22:53', null);
INSERT INTO `xysta_blog` VALUES ('44', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2012-12-28 16:22:48', null);
INSERT INTO `xysta_blog` VALUES ('45', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-19 16:22:45', null);
INSERT INTO `xysta_blog` VALUES ('46', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-18 16:22:41', null);
INSERT INTO `xysta_blog` VALUES ('47', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-11 16:22:36', null);
INSERT INTO `xysta_blog` VALUES ('48', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-11 16:22:33', null);
INSERT INTO `xysta_blog` VALUES ('49', '【盘锦19岁边防战士拾得109万归还失主，称“举手之劳”】近日，边防战士杨讲在鲅鱼圈客运站拾得109万元巨款，为了归还失主，他在寒风中等了15分钟。见无人认领，杨讲找到了民警，后经民警帮助，巨款成功归还失主。当有人问到小杨当时的想法时，小伙子只说了四个字：“举手之劳”。', '1', null, '2013-02-19 16:22:29', null);
INSERT INTO `xysta_blog` VALUES ('61', '哥们儿来发一条微薄试试先！啊哈哈哈！', 'nanojava', null, '2013-02-28 22:58:23', null);
INSERT INTO `xysta_blog` VALUES ('62', '再来整一条，你说呢？', 'nanojava', null, '2013-02-28 23:04:37', null);
INSERT INTO `xysta_blog` VALUES ('63', '123455.哥哥我今天再发一条微薄的干活，哈哈哈！', 'nanojava', null, '2013-02-28 23:06:03', null);
INSERT INTO `xysta_blog` VALUES ('64', '哈哈哈，这么成功啊，真高兴啊 。，真的', 'nanojava', null, '2013-02-28 23:07:02', null);
INSERT INTO `xysta_blog` VALUES ('65', '一啊呀哟，我看好你哦，亲哎的人了！', 'nanojava', null, '2013-02-28 23:07:59', null);
INSERT INTO `xysta_blog` VALUES ('66', '对方答复对方答复', 'nanojava', null, '2013-02-28 23:09:18', null);
INSERT INTO `xysta_blog` VALUES ('67', '我再来一发，少年啊！', 'nanojava', null, '2013-02-28 23:10:00', null);
INSERT INTO `xysta_blog` VALUES ('68', '再来整一条！', 'nanojava', null, '2013-03-01 11:54:52', null);
INSERT INTO `xysta_blog` VALUES ('69', '说好的爱情了', 'nanojava', null, '2013-03-01 12:02:03', null);
INSERT INTO `xysta_blog` VALUES ('70', '真的不理我了吗？', 'nanojava', null, '2013-03-01 12:02:17', null);
INSERT INTO `xysta_blog` VALUES ('71', '我很伤心啊', 'nanojava', null, '2013-03-01 12:02:25', null);
INSERT INTO `xysta_blog` VALUES ('72', '来测试ixia算了', 'nanojava', null, '2013-03-01 12:05:06', null);
INSERT INTO `xysta_blog` VALUES ('73', '又来了', 'nanojava', null, '2013-03-01 12:05:34', null);
INSERT INTO `xysta_blog` VALUES ('74', '再来', 'nanojava', null, '2013-03-01 12:06:21', null);
INSERT INTO `xysta_blog` VALUES ('75', 'fdfd', 'nanojava', null, '2013-03-01 14:14:04', null);
INSERT INTO `xysta_blog` VALUES ('76', 'dgfdfgdfdfdf', 'nanojava', null, '2013-03-01 14:14:39', null);
INSERT INTO `xysta_blog` VALUES ('77', '来发一条试试', 'nanojava', null, '2013-03-01 15:22:33', null);
INSERT INTO `xysta_blog` VALUES ('78', '再来一发啊 ，邵亮', 'nanojava', null, '2013-03-01 15:23:04', null);
INSERT INTO `xysta_blog` VALUES ('79', 'jjejeje', 'nanojava', null, '2013-03-01 15:41:31', null);
INSERT INTO `xysta_blog` VALUES ('80', 'jjshdhsdhshd', 'nanojava', null, '2013-03-01 15:41:45', null);
INSERT INTO `xysta_blog` VALUES ('81', 'jj', 'nanojava', null, '2013-03-01 15:41:54', null);
INSERT INTO `xysta_blog` VALUES ('82', 'llkk', 'nanojava', null, '2013-03-01 15:41:58', null);
INSERT INTO `xysta_blog` VALUES ('83', 'dfedf', 'nanojava', null, '2013-03-01 15:55:37', null);
INSERT INTO `xysta_blog` VALUES ('84', 'dfdfd', 'nanojava', null, '2013-03-01 15:55:42', null);
INSERT INTO `xysta_blog` VALUES ('85', 'xcvvgdxfd', 'nanojava', null, '2013-03-01 16:03:07', null);
INSERT INTO `xysta_blog` VALUES ('86', 'efef', 'nanojava', null, '2013-03-01 16:13:07', null);
INSERT INTO `xysta_blog` VALUES ('87', 'cdxcxc', 'nanojava', null, '2013-03-01 16:13:11', null);
INSERT INTO `xysta_blog` VALUES ('88', 'dfdfds', 'nanojava', null, '2013-03-01 19:07:20', null);
INSERT INTO `xysta_blog` VALUES ('89', '肥肥嘟嘟！', 'nanojava', null, '2013-03-01 19:07:32', null);
INSERT INTO `xysta_blog` VALUES ('90', 'jsdjshdh', 'nanojava', null, '2013-03-01 19:08:19', null);
INSERT INTO `xysta_blog` VALUES ('91', 'sdsdsd', 'nanojava', null, '2013-03-01 19:08:30', null);
INSERT INTO `xysta_blog` VALUES ('108', '大城市的、 ', 'nanojava', null, '2013-03-04 11:06:43', null);
INSERT INTO `xysta_blog` VALUES ('113', 'sdsd', 'nanojava', null, '2013-03-04 15:09:06', null);
INSERT INTO `xysta_blog` VALUES ('114', 'asds', '小小', null, '2013-03-04 15:18:13', null);
INSERT INTO `xysta_blog` VALUES ('115', '123', '小小', null, '2013-03-04 15:32:24', null);
INSERT INTO `xysta_blog` VALUES ('116', 'ceshi', '小小', null, '2013-03-04 15:41:59', null);
INSERT INTO `xysta_blog` VALUES ('117', '哈的山东省 sb啊', '小小', null, '2013-03-04 15:47:22', null);
INSERT INTO `xysta_blog` VALUES ('118', '哥哥', '小小', null, '2013-03-04 15:47:29', null);
INSERT INTO `xysta_blog` VALUES ('119', 'dgdf', '小小', null, '2013-03-04 16:12:11', null);
INSERT INTO `xysta_blog` VALUES ('120', '', '小小', null, '2013-03-04 16:12:13', null);
INSERT INTO `xysta_blog` VALUES ('121', 'dvfdcv', '小小', null, '2013-03-04 16:12:17', null);
INSERT INTO `xysta_blog` VALUES ('122', 'k', '小小', null, '2013-03-04 16:18:13', null);

-- ----------------------------
-- Table structure for `xysta_comment`
-- ----------------------------
DROP TABLE IF EXISTS `xysta_comment`;
CREATE TABLE `xysta_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `review_time` varchar(255) NOT NULL,
  `reviewer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xysta_comment
-- ----------------------------
INSERT INTO `xysta_comment` VALUES ('1', '2', 'good', '2013-03-04 13:20:22', 'nanojava');
INSERT INTO `xysta_comment` VALUES ('2', '2', 'good', '2013-03-04 13:38:23', 'nanojava');
INSERT INTO `xysta_comment` VALUES ('3', '2', 'pool', 'sds', 'sdsdsds');
INSERT INTO `xysta_comment` VALUES ('4', '2', 'good', '2013-03-04 16:02:51', null);
INSERT INTO `xysta_comment` VALUES ('5', '2', 'good', '2013-03-04 16:03:13', 'sb');
INSERT INTO `xysta_comment` VALUES ('6', '2', 'good', '2013-03-04 16:03:58', null);
INSERT INTO `xysta_comment` VALUES ('7', '2', 'good', '2013-03-04 16:04:01', null);
INSERT INTO `xysta_comment` VALUES ('8', '2', 'goodjjj', '2013-03-04 16:23:16', 'io');
INSERT INTO `xysta_comment` VALUES ('9', '2', 'goodjjj', '2013-03-04 16:24:33', null);

-- ----------------------------
-- Table structure for `xysta_user`
-- ----------------------------
DROP TABLE IF EXISTS `xysta_user`;
CREATE TABLE `xysta_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xysta_user
-- ----------------------------
INSERT INTO `xysta_user` VALUES ('18', 'tany', '123456', '小小', '山岭巨人', 'man', '山西省', '2013-02-25 14:17:15');
INSERT INTO `xysta_user` VALUES ('19', 'nano_xinxin@yahoo.cn', '123', 'nanojava', '余欣欣', 'man', '湖北省', '2013-02-25 14:21:40');
INSERT INTO `xysta_user` VALUES ('20', 'yxx250503265@qq.com', '123', 'xiao新', '余欣欣', 'man', '湖北省', '2013-02-25 14:23:30');
INSERT INTO `xysta_user` VALUES ('21', '小ll', '12222', 'yuxx', '余欣欣', 'male', 'wuhan', '2013-02-25 14:25:33');
INSERT INTO `xysta_user` VALUES ('22', 'qq', 'qq', 'xiao新', '余欣欣', 'man', '湖北省', '2013-02-25 14:25:59');
INSERT INTO `xysta_user` VALUES ('23', 'dsds', 'sdsds', 'xiao新sss', '余欣欣', 'man', '湖北省', '2013-02-25 14:27:46');
INSERT INTO `xysta_user` VALUES ('24', 'juj', 'jj', 'xiao新ssjjj', 'jj', 'woman', '湖北省', '2013-02-25 14:31:22');
INSERT INTO `xysta_user` VALUES ('25', 'jujdfdfdfd', 'dfgdf', 'dfdsf', 'jj', 'woman', '湖北省', '2013-02-25 14:33:15');
INSERT INTO `xysta_user` VALUES ('26', 'sdsdsd', 'sdsd', 'sdsdsd', 'sdsd', 'man', '湖北省', '2013-02-25 14:37:52');
INSERT INTO `xysta_user` VALUES ('27', '123121sd', 'df1', '11', '11', 'man', '湖南省', '2013-02-25 14:38:39');
INSERT INTO `xysta_user` VALUES ('28', 'jk', '111', '111', '11', 'man', '湖南省', '2013-02-25 14:41:28');
INSERT INTO `xysta_user` VALUES ('29', 'sb', '12', '11', '11', 'man', '天津市', '2013-02-25 14:41:57');

-- ----------------------------
-- Table structure for `xysta_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `xysta_user_info`;
CREATE TABLE `xysta_user_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(15) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `occupation` varchar(15) DEFAULT NULL,
  `qqnum` int(15) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `hobby` varchar(300) NOT NULL,
  `headpicture` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xysta_user_info
-- ----------------------------
