/*
Navicat MySQL Data Transfer

Source Server         : chen
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : nefu

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-05-25 19:36:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_account` varchar(11) DEFAULT NULL COMMENT '登录账号',
  `password` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL COMMENT '学院',
  `genre` int(11) DEFAULT NULL COMMENT '管理员类别',
  `name` varchar(255) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '12345', '827ccb0eea8a706c4c34a16891f84e7b', '', '1', 'ADMIN', null);
INSERT INTO `admin` VALUES ('12', '20141111', '827ccb0eea8a706c4c34a16891f84e7b', '9', null, '杨书', '2014');
INSERT INTO `admin` VALUES ('13', '20151122', '202cb962ac59075b964b07152d234b70', '1', null, '臧三', '2015');
INSERT INTO `admin` VALUES ('14', '20142211', '202cb962ac59075b964b07152d234b70', '2', null, '欧阳', '2014');
INSERT INTO `admin` VALUES ('15', '20152222', '202cb962ac59075b964b07152d234b70', '2', null, '向前东', '2015');
INSERT INTO `admin` VALUES ('16', '20162233', '202cb962ac59075b964b07152d234b70', '2', null, '阿斯蒂芬', '2016');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL COMMENT '班级名称',
  `p_id` int(11) DEFAULT NULL COMMENT '专业ID',
  `grade` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL COMMENT '学院id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('30', '2班', '11', '2016', '9');
INSERT INTO `class` VALUES ('31', '1班', '11', '2017', '9');
INSERT INTO `class` VALUES ('37', '2班', '11', '2017', '9');
INSERT INTO `class` VALUES ('38', '3班', '11', '2017', '9');
INSERT INTO `class` VALUES ('39', '4班', '11', '2017', '9');
INSERT INTO `class` VALUES ('40', '5班', '11', '2017', '9');
INSERT INTO `class` VALUES ('41', '3班', '12', '2017', '9');
INSERT INTO `class` VALUES ('45', '1班', '12', '2017', '9');
INSERT INTO `class` VALUES ('46', '2班', '12', '2017', '9');
INSERT INTO `class` VALUES ('47', '8班', '11', '2018', '9');
INSERT INTO `class` VALUES ('48', '1班', '11', '2014', '9');
INSERT INTO `class` VALUES ('49', '4班', '11', '2014', '9');
INSERT INTO `class` VALUES ('50', '1班', '13', '2018', '10');
INSERT INTO `class` VALUES ('51', '1班', '11', '2016', '9');
INSERT INTO `class` VALUES ('52', '12', '21', '2018', '20');

-- ----------------------------
-- Table structure for `college`
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('9', '0', '计算机学院');
INSERT INTO `college` VALUES ('10', '0', '机电学院');
INSERT INTO `college` VALUES ('11', '9', '计算机专业');
INSERT INTO `college` VALUES ('12', '9', '软件工程专业');
INSERT INTO `college` VALUES ('13', '10', '机电1');
INSERT INTO `college` VALUES ('14', '10', '机电2');
INSERT INTO `college` VALUES ('15', '0', '生命学院');
INSERT INTO `college` VALUES ('16', '0', '外国语学院');
INSERT INTO `college` VALUES ('17', '16', '俄语');
INSERT INTO `college` VALUES ('18', '0', '文法学院');
INSERT INTO `college` VALUES ('19', '18', '社会工作');
INSERT INTO `college` VALUES ('20', '0', '动资学院');
INSERT INTO `college` VALUES ('21', '20', '生物专业');

-- ----------------------------
-- Table structure for `deyu`
-- ----------------------------
DROP TABLE IF EXISTS `deyu`;
CREATE TABLE `deyu` (
  `s_num` int(11) NOT NULL,
  `get_term` varchar(100) NOT NULL,
  `month` int(2) NOT NULL,
  `d_num` int(11) NOT NULL,
  `d_content` varchar(255) DEFAULT NULL,
  `d_why` varchar(255) NOT NULL,
  `d_self` int(11) NOT NULL,
  `d_cfm` int(11) DEFAULT NULL,
  `d_pic` varchar(255) DEFAULT NULL,
  `d_tag` int(11) NOT NULL,
  `d_sta` int(3) DEFAULT '0',
  `d_who` varchar(255) DEFAULT NULL,
  `d_base` int(11) DEFAULT '60',
  PRIMARY KEY (`s_num`,`get_term`,`d_num`,`month`,`d_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deyu
-- ----------------------------
INSERT INTO `deyu` VALUES ('0', '', '0', '0', null, '', '0', null, null, '0', '0', null, '403');
INSERT INTO `deyu` VALUES ('95', '2017年秋期', '10', '10', null, 'emm', '3', '3', null, '1', '0', 'ee', '60');
INSERT INTO `deyu` VALUES ('95', '2018年春期', '2', '3', null, '学习进步', '9', '4', null, '1', '0', 'ee', '60');
INSERT INTO `deyu` VALUES ('98', '2018年春期', '6', '2', null, 'aaa', '8', '1', null, '1', '0', 'ee', '60');
INSERT INTO `deyu` VALUES ('98', '2018年秋期', '11', '9', null, 'QQ', '4', '4', null, '1', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('99', '2018年秋期', '10', '3', null, '3岁发v', '2', '2', null, '1', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('402', '2017年秋期', '11', '7', null, '讲卫生', '2', '2', null, '1', '2', null, '60');
INSERT INTO `deyu` VALUES ('402', '2017年秋期', '12', '9', null, '优秀', '3', '2', null, '1', '2', 'yy', '60');
INSERT INTO `deyu` VALUES ('402', '2018年春期\r\n', '3', '1', null, '学习进步', '2', '2', null, '1', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('402', '2018年春期', '2', '3', null, '学习进步', '1', '1', null, '1', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('402', '2018年春期', '5', '12', null, '344', '-3', '-3', null, '2', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('402', '2018年春期', '4', '13', null, '优秀部员', '5', '5', null, '1', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('403', '2016年秋期', '9', '5', null, '555', '1', '1', null, '1', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('403', '2016年秋期', '11', '5', null, 'yyy', '2', '1', null, '1', '2', null, '60');
INSERT INTO `deyu` VALUES ('403', '2016年秋期', '9', '6', null, '讲卫生', '1', '1', null, '1', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('403', '2016年秋期', '10', '8', null, 'BBB', '1', '1', null, '1', '2', null, '60');
INSERT INTO `deyu` VALUES ('403', '2016年秋期', '12', '8', null, '容忍让', '5', '5', null, '1', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('403', '2017年春期', '3', '4', null, '乱', '-3', '-3', null, '2', '2', null, '60');
INSERT INTO `deyu` VALUES ('403', '2017年春期', '4', '4', null, '见义勇为', '1', '1', null, '1', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('403', '2017年春期', '4', '5', null, '吃东西', '-3', '-3', null, '2', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('403', '2017年秋期', '10', '1', null, '学习进步', '9', '9', null, '1', '2', null, '60');
INSERT INTO `deyu` VALUES ('403', '2017年秋期', '10', '14', null, '迟到', '-2', '-2', null, '2', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '3', '0', '在学校组织的各种政治学习、党团组织生活和其他活动中无故缺席一次减3分；迟到、早退一次减2分；事假累计三次减1分', '二', '34', '70', null, '1', '2', 'oppo', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '5', '0', '政治上要求进步，以实际行动积极向党组织靠拢，加1分；获得党校培训《结业证书》并积极参加相关活动者，加2分 ', 'fwefwgfwg', '3', null, null, '1', '1', null, '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '7', '0', '政治上要求进步，以实际行动积极向党组织靠拢，加1分；获得党校培训《结业证书》并积极参加相关活动者，加2分 ', '沃尔沃若', '4', null, null, '1', '1', null, '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '3', '1', '政治上要求进步，以实际行动积极向党组织靠拢，加1分；获得党校培训《结业证书》并积极参加相关活动者，加2分', '学习进步', '9', '5', null, '1', '2', 'sgrtwet', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '4', '1', '敢于同不良行为作斗争，凭相关有效证明每次加10-20分', '作斗争', '20', '0', null, '1', '2', '啊啊啊啊', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '6', '1', '敢于同不良行为作斗争，凭相关有效证明每次加10-20分', '23333', '10', '0', null, '1', '2', '组组长', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '6', '2', '捐献造血干细胞者，凭相关有效证明在捐献所在学期一次性加15分', '干细胞', '15', '15', null, '1', '2', '组组长', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '7', '2', '捐献造血干细胞者，凭相关有效证明在捐献所在学期一次性加15分', '献血啦', '3', null, null, '1', '1', null, '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '3', '3', '捐献造血干细胞者，凭相关有效证明在捐献所在学期一次性加15分', '学习进步', '9', '6', null, '1', '2', '1134', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '4', '3', '第三方', '学习进步', '9', '9', null, '1', '2', 'eeee', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '5', '3', '宣扬不良思想，参与违规违纪活动，尚未造成严重后果减5分', '旷课', '-3', '0', null, '1', '2', '00', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '3', '4', '无偿献血者，凭相关有效证明在献血所在学期一次性加5分', '学习进步', '9', '3', null, '1', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '3', '4', '凡违反校规校级，每次学院点名批评减2分，每次学院通报批评减3分；每次学校点名批评减3分，每次学校通报批评减5分，警告减20分，严重警告减30分', '3432432', '-1', '-1', null, '2', '2', null, '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '4', '4', '好人好事在社会上影响较大者，受到省级以上（含省级）部门书面表扬，或在国家级主流媒体给予充分报道加5分 ', '表扬', '5', '1', null, '1', '2', '3434', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '4', '4', '离校未履行请假手续，没有造成不良后果减5分；请假回校后未履行销假手续减1分', '私自离校', '-5', null, null, '2', '1', null, '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '3', '6', 're', '分扰乱', '4', null, null, '1', '2', null, '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '4', '7', '问问她', '学习进步', '9', '9', null, '1', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '4', '9', '因个人床铺卫生不合格而影响寝室卫生减2——3分。卫生不合格的寝室，寝室成员每人减1分，寝室长减2分，值日生减2分', '寝室不卫生', '-3', '-3', null, '2', '2', '陈可', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '4', '10', '无故不按时交纳学费，每次减10分；恶意欠交学费，每次减20分', '没交学费', '-10', '-10', null, '2', '2', '陈可', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '3', '13', '二', '学习不进步', '-4', '-4', null, '2', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('403', '2018年春期', '3', '14', '上课迟到早退一次减3分，无故旷课一次减5分', '圆通皮', '-3', '-3', null, '2', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('403', '2018年秋期', '2', '0', null, '是是是', '0', '4', null, '2', '2', null, '60');
INSERT INTO `deyu` VALUES ('403', '2018年秋期', '2', '1', null, '达到', '0', '4', null, '1', '2', null, '60');
INSERT INTO `deyu` VALUES ('403', '2018年秋期', '2', '1', null, '二恶', '0', '4', null, '2', '2', null, '60');
INSERT INTO `deyu` VALUES ('403', '2018年秋期', '9', '1', null, '见义勇为', '10', null, null, '1', '1', null, '60');
INSERT INTO `deyu` VALUES ('403', '2019年春期', '5', '2', '捐献造血干细胞者，凭相关有效证明在捐献所在学期一次性加15分', '造血干细胞', '15', null, null, '1', '1', null, '60');
INSERT INTO `deyu` VALUES ('403', '2019年春期', '5', '4', '好人好事在社会上影响较大者，受到省级以上（含省级）部门书面表扬，或在国家级主流媒体给予充分报道加5分 ', '好人好事', '4', null, null, '1', '1', null, '60');
INSERT INTO `deyu` VALUES ('403', '2019年春期', '5', '6', '不遵守作息时间，无正当理由晚归减5分', '作息不规律', '-5', null, null, '2', '1', null, '60');
INSERT INTO `deyu` VALUES ('403', '2019年春期', '5', '7', '不遵守校园公共场所秩序，造成不良影响视情节减3——5分', '大声喧哗', '-4', null, null, '2', '1', null, '60');
INSERT INTO `deyu` VALUES ('404', '2017年秋期', '10', '5', null, '迟到', '-2', '-2', null, '2', '2', 'ee', '60');
INSERT INTO `deyu` VALUES ('404', '2018年春期', '5', '4', '凡违反校规校级，每次学院点名批评减2分，每次学院通报批评减3分；每次学校点名批评减3分，每次学校通报批评减5分，警告减20分，严重警告减30分', '说话', '-2', '-3', null, '2', '2', 'e', '60');
INSERT INTO `deyu` VALUES ('2018', '2018年春期', '4', '0', '政治上要求进步，以实际行动积极向党组织靠拢，加1分；获得党校培训《结业证书》并积极参加相关活动者，加2分 ', 'rfergerg', '5', null, null, '1', '1', null, '60');
INSERT INTO `deyu` VALUES ('2018', '2018年春期', '4', '0', '在学校组织的各种政治学习、党团组织生活和其他活动中无故缺席一次减3分；迟到、早退一次减2分；事假累计三次减1分', 'rrthrty', '-2', null, null, '2', '1', null, '60');
INSERT INTO `deyu` VALUES ('2018', '2018年春期', '4', '1', '敢于同不良行为作斗争，凭相关有效证明每次加10-20分', '434', '2', null, null, '1', '1', null, '60');
INSERT INTO `deyu` VALUES ('2018', '2018年春期', '4', '1', '在网络等媒体、公开场合发表不当言论，视情节轻重减5——10分', 'regtr', '-5', null, null, '2', '1', null, '60');
INSERT INTO `deyu` VALUES ('354252', '2018年春期', '3', '0', '政治上要求进步，以实际行动积极向党组织靠拢，加1分；获得党校培训《结业证书》并积极参加相关活动者，加2分 ', '礼盒', '3', '66', null, '1', '2', '222', '60');
INSERT INTO `deyu` VALUES ('354252', '2018年春期', '4', '0', '在学校组织的各种政治学习、党团组织生活和其他活动中无故缺席一次减3分；迟到、早退一次减2分；事假累计三次减1分', '扔扔扔', '-3', '34', null, '2', '2', 'yy', '60');

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '奖项名称',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', '0', '政治思想评价子项目');
INSERT INTO `items` VALUES ('2', '0', '智能素质评价子项目');
INSERT INTO `items` VALUES ('3', '0', '能力发展评价子项目');
INSERT INTO `items` VALUES ('4', '1', '价值观');
INSERT INTO `items` VALUES ('5', '1', '为人处事态度');
INSERT INTO `items` VALUES ('6', '1', '学风表现');
INSERT INTO `items` VALUES ('8', '1', '遵纪守法');
INSERT INTO `items` VALUES ('9', '2', '智育成绩');
INSERT INTO `items` VALUES ('11', '2', '学科竞赛');
INSERT INTO `items` VALUES ('12', '2', '科研项目');
INSERT INTO `items` VALUES ('13', '2', '技能考试');
INSERT INTO `items` VALUES ('14', '3', '学生工作');
INSERT INTO `items` VALUES ('15', '3', '文体活动');
INSERT INTO `items` VALUES ('16', '3', '能力竞赛');
INSERT INTO `items` VALUES ('18', '4', '参加积极分子党课并结业');
INSERT INTO `items` VALUES ('19', '4', '积极分子党课获得优秀学员');
INSERT INTO `items` VALUES ('20', '4', '参加预备党员党课并结业');
INSERT INTO `items` VALUES ('21', '4', '预备党员党课优秀学员');
INSERT INTO `items` VALUES ('22', '4', '党支部委员');
INSERT INTO `items` VALUES ('23', '4', '积极参与党团活动');
INSERT INTO `items` VALUES ('24', '5', '团结同学');
INSERT INTO `items` VALUES ('25', '5', '尊敬师长');
INSERT INTO `items` VALUES ('26', '5', '助人为乐');
INSERT INTO `items` VALUES ('27', '5', '热心班级建设，积极为同学服务，有着良好口碑');
INSERT INTO `items` VALUES ('28', '6', '学期内无旷课，迟到，早退现象');
INSERT INTO `items` VALUES ('29', '6', '主动帮助学习有困难的同学');
INSERT INTO `items` VALUES ('30', '6', '单一学期智育成绩提高xx分以上');
INSERT INTO `items` VALUES ('31', '6', '为班级学风建设做出突出贡献');
INSERT INTO `items` VALUES ('32', '6', '其他在学分建设上变现突出的行为');
INSERT INTO `items` VALUES ('33', '8', '学期内无学院点名批评以上处分');
INSERT INTO `items` VALUES ('34', '8', '为受到行政处分以及刑事处罚');
INSERT INTO `items` VALUES ('35', '9', '智育成绩95分以上');
INSERT INTO `items` VALUES ('36', '9', '90-95分');
INSERT INTO `items` VALUES ('37', '9', '85-90分');
INSERT INTO `items` VALUES ('38', '9', '80-85分');
INSERT INTO `items` VALUES ('39', '9', '75-80分');
INSERT INTO `items` VALUES ('40', '9', '70-75分');
INSERT INTO `items` VALUES ('41', '9', '65-70分');
INSERT INTO `items` VALUES ('42', '9', '60-65分');
INSERT INTO `items` VALUES ('43', '9', '60分以下');
INSERT INTO `items` VALUES ('50', '11', '国际级竞赛一等奖');
INSERT INTO `items` VALUES ('51', '11', '国际级竞赛二等奖');
INSERT INTO `items` VALUES ('52', '11', '国际级竞赛三等奖');
INSERT INTO `items` VALUES ('53', '11', '国家级竞赛一等奖');
INSERT INTO `items` VALUES ('54', '11', '国家级竞赛二等奖');
INSERT INTO `items` VALUES ('55', '11', '国家级竞赛三等奖');
INSERT INTO `items` VALUES ('56', '11', '校级以上竞赛一等奖');
INSERT INTO `items` VALUES ('57', '11', '校级以上竞赛二等奖');
INSERT INTO `items` VALUES ('58', '11', '校级以上竞赛三等奖');
INSERT INTO `items` VALUES ('59', '11', '校级竞赛一等奖');
INSERT INTO `items` VALUES ('60', '11', '校级竞赛二等奖');
INSERT INTO `items` VALUES ('61', '11', '校级竞赛三等奖');
INSERT INTO `items` VALUES ('62', '12', '发明专利第一申请人');
INSERT INTO `items` VALUES ('63', '12', '发明专利申请团队成员');
INSERT INTO `items` VALUES ('64', '12', '实用新型专利第一申请人');
INSERT INTO `items` VALUES ('65', '12', '实用新型专利申请团队成员');
INSERT INTO `items` VALUES ('66', '12', '外观设计专利第一申请人');
INSERT INTO `items` VALUES ('67', '12', '外观设计专利申请团队成员');
INSERT INTO `items` VALUES ('68', '12', '软件著作权第一申请人');
INSERT INTO `items` VALUES ('69', '12', '省，市，部级项目负责人');
INSERT INTO `items` VALUES ('70', '12', '校级项目负责人');
INSERT INTO `items` VALUES ('71', '12', '校级项目参与人');
INSERT INTO `items` VALUES ('72', '13', '六级优秀');
INSERT INTO `items` VALUES ('73', '13', '六级通过，四级优秀');
INSERT INTO `items` VALUES ('74', '13', '四级通过');
INSERT INTO `items` VALUES ('75', '13', '托福');
INSERT INTO `items` VALUES ('76', '13', '雅思');
INSERT INTO `items` VALUES ('77', '13', 'GRE');
INSERT INTO `items` VALUES ('78', '14', '组织或策划校级以上活动');
INSERT INTO `items` VALUES ('79', '14', '组织或策划校级活动');
INSERT INTO `items` VALUES ('80', '14', '组织或策划学院级活动');
INSERT INTO `items` VALUES ('81', '15', '积极主动参加各类讲座，报告，仪式等活动');
INSERT INTO `items` VALUES ('82', '15', '有人数要求的讲座，报告，仪式等活动');
INSERT INTO `items` VALUES ('83', '16', '获校（省）级以上奖励');
INSERT INTO `items` VALUES ('84', '16', '获校（省）级一等奖或第一名');
INSERT INTO `items` VALUES ('85', '16', '获校（省）级二等奖或第2,3名');
INSERT INTO `items` VALUES ('86', '16', '获校（省）级三等奖或第4,5,6名');
INSERT INTO `items` VALUES ('87', '16', '获院（校）级一等奖或第一名');
INSERT INTO `items` VALUES ('88', '16', '获院（校）级二等奖或第2,3名');
INSERT INTO `items` VALUES ('89', '16', '获院（校）级三等奖或第4,5,6名');
INSERT INTO `items` VALUES ('90', '16', '积极参与者（其余名次）');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `do` varchar(255) DEFAULT NULL COMMENT '操作',
  `genre` int(11) DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=555 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('92', '2017-08-24 17:17:50', '54', '登录', '0');
INSERT INTO `log` VALUES ('93', '2017-08-24 17:19:32', '55', '登录', '0');
INSERT INTO `log` VALUES ('94', '2017-08-24 17:19:58', '54', '登录', '0');
INSERT INTO `log` VALUES ('95', '2017-08-24 17:23:07', '54', '修改密码', '0');
INSERT INTO `log` VALUES ('96', '2017-08-24 17:23:21', '54', '登录', '0');
INSERT INTO `log` VALUES ('97', '2017-08-25 05:29:23', '54', '登录', '0');
INSERT INTO `log` VALUES ('98', '2017-08-25 06:22:59', '73', '登录', '0');
INSERT INTO `log` VALUES ('99', '2017-08-25 13:34:32', '75', '登录', '0');
INSERT INTO `log` VALUES ('100', '2017-08-25 14:56:22', '54', '登录', '0');
INSERT INTO `log` VALUES ('101', '2017-08-25 15:08:23', '54', '登录', '0');
INSERT INTO `log` VALUES ('102', '2017-08-25 23:18:26', '55', '登录', '0');
INSERT INTO `log` VALUES ('103', '2017-08-25 23:20:44', '1', '登录', '1');
INSERT INTO `log` VALUES ('104', '2017-08-25 23:42:08', '1', '登录', '1');
INSERT INTO `log` VALUES ('105', '2017-08-25 23:52:29', '12', '登录', '1');
INSERT INTO `log` VALUES ('106', '2017-08-25 23:56:40', '1', '登录', '1');
INSERT INTO `log` VALUES ('107', '2017-08-26 00:03:54', '54', '登录', '0');
INSERT INTO `log` VALUES ('108', '2017-08-26 00:25:14', '55', '登录', '0');
INSERT INTO `log` VALUES ('109', '2017-08-26 00:36:06', '12', '登录', '1');
INSERT INTO `log` VALUES ('110', '2017-08-26 00:41:05', '55', '登录', '0');
INSERT INTO `log` VALUES ('111', '2017-08-26 00:41:43', '55', '登录', '0');
INSERT INTO `log` VALUES ('112', '2017-08-26 09:13:25', '55', '登录', '0');
INSERT INTO `log` VALUES ('113', '2017-08-26 09:13:26', '55', '登录', '0');
INSERT INTO `log` VALUES ('114', '2017-08-26 09:18:56', '54', '登录', '0');
INSERT INTO `log` VALUES ('115', '2017-08-26 09:30:31', '54', '登录', '0');
INSERT INTO `log` VALUES ('116', '2017-08-26 09:30:52', '12', '登录', '1');
INSERT INTO `log` VALUES ('117', '2017-08-26 09:36:07', '54', '登录', '0');
INSERT INTO `log` VALUES ('118', '2017-08-26 09:37:04', '12', '登录', '1');
INSERT INTO `log` VALUES ('119', '2017-08-26 09:46:03', '54', '登录', '0');
INSERT INTO `log` VALUES ('120', '2017-08-26 09:48:05', '12', '登录', '1');
INSERT INTO `log` VALUES ('121', '2017-08-26 09:48:29', '54', '登录', '0');
INSERT INTO `log` VALUES ('122', '2017-08-26 09:48:57', '55', '登录', '0');
INSERT INTO `log` VALUES ('123', '2017-08-26 10:46:39', '56', '登录', '0');
INSERT INTO `log` VALUES ('124', '2017-08-26 11:43:47', '54', '登录', '0');
INSERT INTO `log` VALUES ('125', '2017-08-26 11:47:38', '56', '登录', '0');
INSERT INTO `log` VALUES ('126', '2017-08-26 11:48:46', '54', '登录', '0');
INSERT INTO `log` VALUES ('127', '2017-08-26 11:58:16', '1', '登录', '1');
INSERT INTO `log` VALUES ('128', '2017-08-26 12:02:49', '54', '登录', '0');
INSERT INTO `log` VALUES ('129', '2017-08-26 12:03:16', '1', '登录', '1');
INSERT INTO `log` VALUES ('130', '2017-08-26 12:03:43', '12', '登录', '1');
INSERT INTO `log` VALUES ('131', '2017-08-26 12:04:21', '14', '登录', '1');
INSERT INTO `log` VALUES ('132', '2017-08-26 13:24:36', '12', '登录', '1');
INSERT INTO `log` VALUES ('133', '2017-08-26 14:32:04', '12', '登录', '1');
INSERT INTO `log` VALUES ('134', '2017-08-26 15:24:37', '54', '登录', '0');
INSERT INTO `log` VALUES ('135', '2017-08-27 10:27:00', '54', '登录', '0');
INSERT INTO `log` VALUES ('136', '2017-08-27 10:28:48', '12', '登录', '1');
INSERT INTO `log` VALUES ('137', '2017-08-27 11:03:57', '56', '登录', '0');
INSERT INTO `log` VALUES ('138', '2017-08-27 11:05:11', '54', '登录', '0');
INSERT INTO `log` VALUES ('139', '2017-08-27 11:06:52', '64', '登录', '0');
INSERT INTO `log` VALUES ('140', '2017-08-27 11:07:23', '64', '登录', '0');
INSERT INTO `log` VALUES ('141', '2017-08-27 11:08:47', '66', '登录', '0');
INSERT INTO `log` VALUES ('142', '2017-08-27 11:12:05', '12', '登录', '1');
INSERT INTO `log` VALUES ('143', '2017-08-27 11:25:26', '64', '登录', '0');
INSERT INTO `log` VALUES ('144', '2017-08-27 11:45:46', '54', '登录', '0');
INSERT INTO `log` VALUES ('145', '2017-08-27 11:46:03', '55', '登录', '0');
INSERT INTO `log` VALUES ('146', '2017-08-27 11:46:22', '54', '登录', '0');
INSERT INTO `log` VALUES ('147', '2017-08-27 12:19:13', '60', '登录', '0');
INSERT INTO `log` VALUES ('148', '2017-08-27 16:08:56', '54', '登录', '0');
INSERT INTO `log` VALUES ('149', '2017-08-27 16:33:38', '55', '登录', '0');
INSERT INTO `log` VALUES ('150', '2017-08-27 16:34:01', '54', '登录', '0');
INSERT INTO `log` VALUES ('151', '2017-08-27 16:37:28', '58', '登录', '0');
INSERT INTO `log` VALUES ('152', '2017-08-27 16:37:53', '58', '登录', '0');
INSERT INTO `log` VALUES ('153', '2017-08-27 16:38:45', '59', '登录', '0');
INSERT INTO `log` VALUES ('154', '2017-08-27 16:39:13', '58', '登录', '0');
INSERT INTO `log` VALUES ('155', '2017-08-27 17:08:36', '59', '登录', '0');
INSERT INTO `log` VALUES ('156', '2017-08-27 17:09:14', '58', '登录', '0');
INSERT INTO `log` VALUES ('157', '2017-08-27 17:52:10', '12', '登录', '1');
INSERT INTO `log` VALUES ('158', '2017-08-27 17:52:57', '12', '登录', '1');
INSERT INTO `log` VALUES ('159', '2017-08-27 18:05:09', '1', '登录', '1');
INSERT INTO `log` VALUES ('160', '2017-08-27 18:10:20', '16', '登录', '1');
INSERT INTO `log` VALUES ('161', '2017-08-27 18:12:25', '12', '登录', '1');
INSERT INTO `log` VALUES ('162', '2017-08-27 18:13:39', '1', '登录', '1');
INSERT INTO `log` VALUES ('163', '2017-08-27 18:15:15', '54', '登录', '0');
INSERT INTO `log` VALUES ('164', '2017-08-27 18:26:04', '54', '登录', '0');
INSERT INTO `log` VALUES ('165', '2017-08-27 18:27:37', '54', '登录', '0');
INSERT INTO `log` VALUES ('166', '2017-08-27 18:38:47', '54', '修改密码', '0');
INSERT INTO `log` VALUES ('167', '2017-08-27 18:39:10', '54', '登录', '0');
INSERT INTO `log` VALUES ('168', '2017-08-27 20:15:13', '1', '登录', '1');
INSERT INTO `log` VALUES ('169', '2017-08-28 08:59:43', '54', '登录', '0');
INSERT INTO `log` VALUES ('170', '2017-08-28 11:02:35', '54', '登录', '0');
INSERT INTO `log` VALUES ('171', '2017-08-28 12:50:28', '12', '登录', '1');
INSERT INTO `log` VALUES ('172', '2017-08-28 12:51:15', '54', '登录', '0');
INSERT INTO `log` VALUES ('173', '2017-08-28 15:38:48', '1', '登录', '1');
INSERT INTO `log` VALUES ('174', '2017-08-28 15:50:38', '1', '登录', '1');
INSERT INTO `log` VALUES ('175', '2017-08-28 16:25:44', '12', '登录', '1');
INSERT INTO `log` VALUES ('176', '2017-08-28 16:59:01', '54', '登录', '0');
INSERT INTO `log` VALUES ('177', '2017-08-28 17:38:39', '1', '登录', '1');
INSERT INTO `log` VALUES ('178', '2017-08-28 23:37:01', '54', '登录', '0');
INSERT INTO `log` VALUES ('179', '2017-08-28 23:48:28', '12', '登录', '1');
INSERT INTO `log` VALUES ('180', '2017-08-28 23:50:40', '54', '登录', '0');
INSERT INTO `log` VALUES ('181', '2017-08-28 23:51:15', '12', '登录', '1');
INSERT INTO `log` VALUES ('182', '2017-08-28 23:55:10', '1', '登录', '1');
INSERT INTO `log` VALUES ('183', '2017-08-29 10:12:56', '1', '登录', '1');
INSERT INTO `log` VALUES ('184', '2017-08-29 10:51:41', '54', '登录', '0');
INSERT INTO `log` VALUES ('185', '2017-08-29 11:48:52', '54', '登录', '0');
INSERT INTO `log` VALUES ('186', '2017-08-29 15:21:47', '12', '登录', '1');
INSERT INTO `log` VALUES ('187', '2017-08-29 19:41:07', '54', '登录', '0');
INSERT INTO `log` VALUES ('188', '2017-08-29 21:01:12', '60', '登录', '0');
INSERT INTO `log` VALUES ('189', '2017-08-29 22:27:30', '12', '登录', '1');
INSERT INTO `log` VALUES ('190', '2017-08-29 22:31:23', '55', '登录', '0');
INSERT INTO `log` VALUES ('191', '2017-08-29 22:31:50', '54', '登录', '0');
INSERT INTO `log` VALUES ('192', '2017-08-29 22:32:53', '55', '登录', '0');
INSERT INTO `log` VALUES ('193', '2017-08-29 22:33:24', '86', '登录', '0');
INSERT INTO `log` VALUES ('194', '2017-08-29 22:34:02', '54', '登录', '0');
INSERT INTO `log` VALUES ('195', '2017-08-30 10:11:22', '54', '登录', '0');
INSERT INTO `log` VALUES ('196', '2017-08-30 11:38:07', '12', '登录', '1');
INSERT INTO `log` VALUES ('197', '2017-08-30 15:08:48', '1', '登录', '1');
INSERT INTO `log` VALUES ('198', '2017-08-30 15:40:35', '12', '登录', '1');
INSERT INTO `log` VALUES ('199', '2017-08-30 16:52:26', '87', '登录', '0');
INSERT INTO `log` VALUES ('200', '2017-08-30 16:52:53', '87', '登录', '0');
INSERT INTO `log` VALUES ('201', '2017-08-30 22:42:28', '54', '登录', '0');
INSERT INTO `log` VALUES ('202', '2017-08-30 22:47:08', '12', '登录', '1');
INSERT INTO `log` VALUES ('203', '2017-08-31 09:21:40', '12', '登录', '1');
INSERT INTO `log` VALUES ('204', '2017-08-31 10:40:54', '54', '登录', '0');
INSERT INTO `log` VALUES ('205', '2017-08-31 10:41:21', '54', '登录', '0');
INSERT INTO `log` VALUES ('206', '2017-08-31 10:41:42', '55', '登录', '0');
INSERT INTO `log` VALUES ('207', '2017-08-31 11:42:04', '1', '登录', '1');
INSERT INTO `log` VALUES ('211', '2017-08-31 11:57:15', '1', '登录', '1');
INSERT INTO `log` VALUES ('212', '2017-08-31 12:01:48', '54', '登录', '0');
INSERT INTO `log` VALUES ('213', '2017-08-31 12:02:13', '54', '修改密码', '0');
INSERT INTO `log` VALUES ('214', '2017-08-31 12:05:04', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('215', '2017-08-31 12:06:00', '12', '登录', '1');
INSERT INTO `log` VALUES ('216', '2017-08-31 12:06:20', '55', '登录', '0');
INSERT INTO `log` VALUES ('217', '2017-08-31 13:54:25', '54', '登录', '0');
INSERT INTO `log` VALUES ('218', '2017-08-31 13:54:37', '55', '登录', '0');
INSERT INTO `log` VALUES ('219', '2017-08-31 14:06:12', '54', '登录', '0');
INSERT INTO `log` VALUES ('220', '2017-08-31 14:06:21', '55', '登录', '0');
INSERT INTO `log` VALUES ('221', '2017-08-31 14:10:23', '1', '登录', '1');
INSERT INTO `log` VALUES ('222', '2017-08-31 14:33:15', '1', '登录', '1');
INSERT INTO `log` VALUES ('223', '2017-08-31 15:34:25', '55', '登录', '0');
INSERT INTO `log` VALUES ('224', '2017-08-31 15:36:33', '12', '登录', '1');
INSERT INTO `log` VALUES ('225', '2017-08-31 15:45:53', '54', '登录', '0');
INSERT INTO `log` VALUES ('226', '2017-08-31 15:46:28', '86', '登录', '0');
INSERT INTO `log` VALUES ('227', '2017-08-31 15:46:43', '55', '登录', '0');
INSERT INTO `log` VALUES ('228', '2017-08-31 17:26:47', '1', '登录', '1');
INSERT INTO `log` VALUES ('229', '2017-08-31 17:28:31', '54', '登录', '0');
INSERT INTO `log` VALUES ('230', '2017-08-31 23:00:10', '54', '登录', '0');
INSERT INTO `log` VALUES ('231', '2017-09-01 09:37:17', '54', '登录', '0');
INSERT INTO `log` VALUES ('232', '2017-09-01 09:37:36', '55', '登录', '0');
INSERT INTO `log` VALUES ('233', '2017-09-01 10:30:21', '1', '登录', '1');
INSERT INTO `log` VALUES ('234', '2017-09-01 12:19:45', '12', '登录', '1');
INSERT INTO `log` VALUES ('235', '2017-09-01 12:57:42', '54', '登录', '0');
INSERT INTO `log` VALUES ('236', '2017-09-01 14:10:02', '55', '登录', '0');
INSERT INTO `log` VALUES ('237', '2017-09-01 14:17:28', '86', '登录', '0');
INSERT INTO `log` VALUES ('238', '2017-09-01 14:17:47', '87', '登录', '0');
INSERT INTO `log` VALUES ('239', '2017-09-01 14:18:37', '56', '登录', '0');
INSERT INTO `log` VALUES ('240', '2017-09-01 14:19:03', '54', '登录', '0');
INSERT INTO `log` VALUES ('241', '2017-09-01 14:20:49', '55', '登录', '0');
INSERT INTO `log` VALUES ('242', '2017-09-01 14:24:06', '1', '登录', '1');
INSERT INTO `log` VALUES ('243', '2017-09-01 14:24:25', '12', '登录', '1');
INSERT INTO `log` VALUES ('244', '2017-09-01 15:03:13', '1', '登录', '1');
INSERT INTO `log` VALUES ('245', '2017-09-01 15:15:17', '12', '登录', '1');
INSERT INTO `log` VALUES ('246', '2017-09-01 15:20:28', '12', '登录', '1');
INSERT INTO `log` VALUES ('247', '2017-09-01 15:39:15', '54', '登录', '0');
INSERT INTO `log` VALUES ('248', '2017-09-01 15:39:31', '12', '登录', '1');
INSERT INTO `log` VALUES ('249', '2017-09-01 16:04:21', '12', '登录', '1');
INSERT INTO `log` VALUES ('250', '2017-09-01 16:09:00', '1', '登录', '1');
INSERT INTO `log` VALUES ('251', '2017-09-01 16:16:26', '12', '登录', '1');
INSERT INTO `log` VALUES ('252', '2017-09-01 16:18:14', '1', '登录', '1');
INSERT INTO `log` VALUES ('253', '2017-09-01 16:47:11', '12', '登录', '1');
INSERT INTO `log` VALUES ('254', '2017-09-01 16:47:39', '54', '登录', '0');
INSERT INTO `log` VALUES ('255', '2017-09-01 16:47:53', '55', '登录', '0');
INSERT INTO `log` VALUES ('256', '2017-09-01 16:50:25', '1', '登录', '1');
INSERT INTO `log` VALUES ('257', '2017-09-01 16:51:46', '1', '登录', '1');
INSERT INTO `log` VALUES ('258', '2017-09-01 16:55:13', '1', '登录', '1');
INSERT INTO `log` VALUES ('259', '2017-09-01 21:54:46', '54', '登录', '0');
INSERT INTO `log` VALUES ('260', '2017-09-01 21:59:13', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('261', '2017-09-01 22:01:38', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('262', '2017-09-01 22:09:09', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('263', '2017-09-01 22:09:21', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('264', '2017-09-01 22:10:10', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('265', '2017-09-01 22:10:14', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('266', '2017-09-01 22:10:35', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('267', '2017-09-01 22:12:03', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('268', '2017-09-01 22:12:44', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('269', '2017-09-01 22:14:28', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('270', '2017-09-01 22:15:47', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('271', '2017-09-01 22:15:50', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('272', '2017-09-01 22:15:54', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('273', '2017-09-01 22:17:52', '55', '登录', '0');
INSERT INTO `log` VALUES ('274', '2017-09-01 22:22:28', '55', '登录', '0');
INSERT INTO `log` VALUES ('275', '2017-09-01 22:24:30', '1', '登录', '1');
INSERT INTO `log` VALUES ('276', '2017-09-01 22:25:47', '1', '登录', '1');
INSERT INTO `log` VALUES ('277', '2017-09-01 23:09:51', '55', '登录', '0');
INSERT INTO `log` VALUES ('278', '2017-09-01 23:58:55', '12', '登录', '1');
INSERT INTO `log` VALUES ('279', '2017-09-02 00:04:11', '54', '登录', '0');
INSERT INTO `log` VALUES ('280', '2017-09-02 00:04:22', '55', '登录', '0');
INSERT INTO `log` VALUES ('281', '2017-09-02 00:11:26', '12', '登录', '1');
INSERT INTO `log` VALUES ('282', '2017-09-02 00:11:41', '1', '登录', '1');
INSERT INTO `log` VALUES ('283', '2017-09-02 09:58:08', '54', '登录', '0');
INSERT INTO `log` VALUES ('284', '2017-09-02 09:58:50', '54', '修改密码', '0');
INSERT INTO `log` VALUES ('285', '2017-09-02 09:59:55', '55', '登录', '0');
INSERT INTO `log` VALUES ('286', '2017-09-02 10:14:41', '55', '登录', '0');
INSERT INTO `log` VALUES ('287', '2017-09-02 10:24:07', '55', '上传头像', '0');
INSERT INTO `log` VALUES ('288', '2017-09-02 10:24:49', '12', '登录', '1');
INSERT INTO `log` VALUES ('289', '2017-09-02 10:33:32', '1', '登录', '1');
INSERT INTO `log` VALUES ('290', '2017-09-02 10:55:52', '54', '登录', '0');
INSERT INTO `log` VALUES ('291', '2017-09-02 10:56:08', '54', '登录', '0');
INSERT INTO `log` VALUES ('292', '2017-09-02 11:01:50', '55', '登录', '0');
INSERT INTO `log` VALUES ('293', '2017-09-02 11:02:16', '12', '登录', '1');
INSERT INTO `log` VALUES ('294', '2017-09-02 11:03:10', '54', '登录', '0');
INSERT INTO `log` VALUES ('295', '2017-09-02 11:22:55', '1', '登录', '1');
INSERT INTO `log` VALUES ('296', '2017-09-02 14:55:22', '91', '登录', '0');
INSERT INTO `log` VALUES ('297', '2017-09-02 14:59:12', '92', '登录', '0');
INSERT INTO `log` VALUES ('298', '2017-09-02 15:01:03', '55', '登录', '0');
INSERT INTO `log` VALUES ('299', '2017-09-02 15:20:03', '12', '登录', '1');
INSERT INTO `log` VALUES ('300', '2017-09-02 15:34:03', '54', '登录', '0');
INSERT INTO `log` VALUES ('301', '2017-09-02 15:34:26', '54', '登录', '0');
INSERT INTO `log` VALUES ('302', '2017-09-02 15:34:42', '55', '登录', '0');
INSERT INTO `log` VALUES ('303', '2017-09-02 15:35:02', '54', '登录', '0');
INSERT INTO `log` VALUES ('304', '2017-09-02 15:36:48', '55', '登录', '0');
INSERT INTO `log` VALUES ('305', '2017-09-02 16:38:19', '1', '登录', '1');
INSERT INTO `log` VALUES ('306', '2017-09-02 16:40:31', '55', '登录', '0');
INSERT INTO `log` VALUES ('307', '2017-09-02 16:40:49', '54', '登录', '0');
INSERT INTO `log` VALUES ('308', '2017-09-02 16:41:02', '92', '登录', '0');
INSERT INTO `log` VALUES ('309', '2017-09-02 16:42:27', '54', '登录', '0');
INSERT INTO `log` VALUES ('310', '2017-09-02 16:43:14', '1', '登录', '1');
INSERT INTO `log` VALUES ('311', '2017-09-02 16:43:25', '1', '登录', '1');
INSERT INTO `log` VALUES ('312', '2017-09-02 16:46:55', '54', '登录', '0');
INSERT INTO `log` VALUES ('313', '2017-09-02 16:47:20', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('314', '2017-09-02 16:48:21', '54', '登录', '0');
INSERT INTO `log` VALUES ('315', '2017-09-02 16:48:46', '55', '登录', '0');
INSERT INTO `log` VALUES ('316', '2017-09-02 16:50:06', '12', '登录', '1');
INSERT INTO `log` VALUES ('317', '2017-09-02 16:50:21', '12', '登录', '1');
INSERT INTO `log` VALUES ('318', '2017-09-03 14:54:00', '1', '登录', '1');
INSERT INTO `log` VALUES ('319', '2017-09-03 15:34:04', '12', '登录', '1');
INSERT INTO `log` VALUES ('320', '2017-09-03 15:38:21', '55', '登录', '0');
INSERT INTO `log` VALUES ('321', '2017-09-03 15:43:24', '54', '登录', '0');
INSERT INTO `log` VALUES ('322', '2017-09-03 15:46:22', '54', '上传头像', '0');
INSERT INTO `log` VALUES ('323', '2017-09-03 15:51:56', '54', '登录', '0');
INSERT INTO `log` VALUES ('324', '2017-09-03 15:52:51', '54', '登录', '0');
INSERT INTO `log` VALUES ('325', '2017-09-03 16:00:12', '86', '登录', '0');
INSERT INTO `log` VALUES ('326', '2017-09-03 16:02:59', '54', '登录', '0');
INSERT INTO `log` VALUES ('327', '2017-09-04 03:40:16', '1', '登录', '1');
INSERT INTO `log` VALUES ('328', '2017-09-04 03:45:09', '55', '登录', '0');
INSERT INTO `log` VALUES ('329', '2017-09-04 03:47:05', '54', '登录', '0');
INSERT INTO `log` VALUES ('330', '2017-09-04 03:57:36', '12', '登录', '1');
INSERT INTO `log` VALUES ('331', '2017-09-16 08:32:03', '55', '登录', '0');
INSERT INTO `log` VALUES ('332', '2017-10-11 06:14:49', '54', '登录', '0');
INSERT INTO `log` VALUES ('333', '2017-10-11 06:15:22', '55', '登录', '0');
INSERT INTO `log` VALUES ('334', '2017-10-11 06:18:51', '12', '登录', '1');
INSERT INTO `log` VALUES ('335', '2017-10-11 06:39:49', '1', '登录', '1');
INSERT INTO `log` VALUES ('336', '2017-11-01 09:32:45', '55', '登录', '0');
INSERT INTO `log` VALUES ('337', '2017-11-01 09:33:02', '55', '登录', '0');
INSERT INTO `log` VALUES ('338', '2017-11-01 10:10:36', '55', '登录', '0');
INSERT INTO `log` VALUES ('339', '2017-11-01 10:41:24', '55', '登录', '0');
INSERT INTO `log` VALUES ('340', '2017-11-01 10:56:30', '12', '登录', '1');
INSERT INTO `log` VALUES ('341', '2017-11-01 11:29:59', '55', '登录', '0');
INSERT INTO `log` VALUES ('342', '2017-11-01 13:14:51', '55', '登录', '0');
INSERT INTO `log` VALUES ('343', '2017-11-22 06:44:32', '54', '登录', '0');
INSERT INTO `log` VALUES ('344', '2017-11-22 06:45:09', '55', '登录', '0');
INSERT INTO `log` VALUES ('345', '2017-11-22 07:08:02', '55', '登录', '0');
INSERT INTO `log` VALUES ('346', '2017-11-22 07:08:13', '55', '登录', '0');
INSERT INTO `log` VALUES ('347', '2017-11-22 07:27:36', '55', '登录', '0');
INSERT INTO `log` VALUES ('348', '2017-11-22 07:27:58', '55', '登录', '0');
INSERT INTO `log` VALUES ('349', '2017-11-22 08:00:51', '55', '登录', '0');
INSERT INTO `log` VALUES ('350', '2017-11-22 09:46:01', '55', '登录', '0');
INSERT INTO `log` VALUES ('351', '2017-11-22 14:18:41', '55', '登录', '0');
INSERT INTO `log` VALUES ('352', '2017-11-24 03:50:06', '55', '登录', '0');
INSERT INTO `log` VALUES ('353', '2017-11-24 03:50:20', '55', '登录', '0');
INSERT INTO `log` VALUES ('354', '2018-01-08 04:27:16', '54', '登录', '0');
INSERT INTO `log` VALUES ('355', '2018-01-08 04:29:10', '12', '登录', '1');
INSERT INTO `log` VALUES ('356', '2018-01-08 04:29:40', '54', '登录', '0');
INSERT INTO `log` VALUES ('357', '2018-01-08 08:22:22', '12', '登录', '1');
INSERT INTO `log` VALUES ('358', '2018-01-08 09:24:31', '1', '登录', '1');
INSERT INTO `log` VALUES ('359', '2018-01-08 09:26:29', '12', '登录', '1');
INSERT INTO `log` VALUES ('360', '2018-01-09 02:19:19', '1', '登录', '1');
INSERT INTO `log` VALUES ('361', '2018-01-09 07:43:33', '1', '登录', '1');
INSERT INTO `log` VALUES ('362', '2018-01-09 09:00:48', '1', '登录', '1');
INSERT INTO `log` VALUES ('363', '2018-01-15 10:08:59', '1', '登录', '1');
INSERT INTO `log` VALUES ('364', '2018-03-03 12:07:21', '1', '登录', '1');
INSERT INTO `log` VALUES ('365', '2018-03-03 12:41:25', '1', '登录', '1');
INSERT INTO `log` VALUES ('366', '2018-03-03 12:48:09', '1', '登录', '1');
INSERT INTO `log` VALUES ('367', '2018-03-12 03:20:58', '1', '登录', '1');
INSERT INTO `log` VALUES ('368', '2018-03-13 03:00:37', '1', '登录', '1');
INSERT INTO `log` VALUES ('369', '2018-03-25 03:38:43', '1', '登录', '1');
INSERT INTO `log` VALUES ('370', '2018-03-31 04:20:08', '1', '登录', '1');
INSERT INTO `log` VALUES ('371', '2018-03-31 04:20:57', '1', '登录', '1');
INSERT INTO `log` VALUES ('372', '2018-03-31 04:22:11', '110', '登录', '0');
INSERT INTO `log` VALUES ('373', '2018-03-31 04:25:39', '1', '登录', '1');
INSERT INTO `log` VALUES ('374', '2018-03-31 04:40:10', '110', '登录', '0');
INSERT INTO `log` VALUES ('375', '2018-03-31 04:45:36', '1', '登录', '1');
INSERT INTO `log` VALUES ('376', '2018-03-31 06:56:05', '1', '登录', '1');
INSERT INTO `log` VALUES ('377', '2018-03-31 07:17:30', '110', '登录', '0');
INSERT INTO `log` VALUES ('378', '2018-03-31 07:20:33', '1', '登录', '1');
INSERT INTO `log` VALUES ('379', '2018-03-31 07:26:58', '110', '登录', '0');
INSERT INTO `log` VALUES ('380', '2018-04-02 15:06:44', '110', '登录', '0');
INSERT INTO `log` VALUES ('381', '2018-04-02 15:12:27', '1', '登录', '1');
INSERT INTO `log` VALUES ('382', '2018-04-08 09:40:01', '110', '登录', '0');
INSERT INTO `log` VALUES ('383', '2018-04-08 09:41:04', '1', '登录', '1');
INSERT INTO `log` VALUES ('384', '2018-04-08 11:48:33', '110', '登录', '0');
INSERT INTO `log` VALUES ('385', '2018-04-08 11:57:29', '109', '登录', '0');
INSERT INTO `log` VALUES ('386', '2018-04-08 11:58:49', '110', '登录', '0');
INSERT INTO `log` VALUES ('387', '2018-04-08 11:59:53', '109', '登录', '0');
INSERT INTO `log` VALUES ('388', '2018-04-08 14:12:11', '1', '登录', '1');
INSERT INTO `log` VALUES ('389', '2018-04-08 14:12:39', '109', '登录', '0');
INSERT INTO `log` VALUES ('390', '2018-04-08 14:12:49', '110', '登录', '0');
INSERT INTO `log` VALUES ('391', '2018-04-09 09:45:52', '110', '登录', '0');
INSERT INTO `log` VALUES ('392', '2018-04-12 07:41:50', '110', '登录', '0');
INSERT INTO `log` VALUES ('393', '2018-04-12 13:57:51', '1', '登录', '1');
INSERT INTO `log` VALUES ('394', '2018-04-12 14:04:02', '109', '登录', '0');
INSERT INTO `log` VALUES ('395', '2018-04-16 02:17:16', '12', '登录', '1');
INSERT INTO `log` VALUES ('396', '2018-04-16 02:43:44', '12', '登录', '1');
INSERT INTO `log` VALUES ('397', '2018-04-17 15:58:18', '12', '登录', '1');
INSERT INTO `log` VALUES ('398', '2018-04-17 15:58:51', null, '登录', '0');
INSERT INTO `log` VALUES ('399', '2018-04-17 16:00:26', null, '登录', '0');
INSERT INTO `log` VALUES ('400', '2018-04-19 14:32:39', null, '登录', '0');
INSERT INTO `log` VALUES ('401', '2018-04-19 14:33:06', '2', '登录', '0');
INSERT INTO `log` VALUES ('402', '2018-04-20 12:54:51', '12', '登录', '1');
INSERT INTO `log` VALUES ('403', '2018-04-22 18:05:28', '1', '登录', '1');
INSERT INTO `log` VALUES ('404', '2018-04-23 02:20:18', '1', '登录', '1');
INSERT INTO `log` VALUES ('405', '2018-04-23 14:35:52', '1', '登录', '1');
INSERT INTO `log` VALUES ('406', '2018-04-23 16:24:51', '1', '登录', '1');
INSERT INTO `log` VALUES ('407', '2018-04-23 16:38:39', '2', '登录', '0');
INSERT INTO `log` VALUES ('408', '2018-04-23 16:40:52', '1', '登录', '1');
INSERT INTO `log` VALUES ('409', '2018-04-24 12:47:02', '2', '登录', '0');
INSERT INTO `log` VALUES ('410', '2018-04-24 15:31:42', '1', '登录', '1');
INSERT INTO `log` VALUES ('411', '2018-04-24 16:25:14', '12', '登录', '1');
INSERT INTO `log` VALUES ('412', '2018-04-24 16:57:08', '1', '登录', '1');
INSERT INTO `log` VALUES ('413', '2018-04-24 17:04:54', '12', '登录', '1');
INSERT INTO `log` VALUES ('414', '2018-04-24 17:05:29', '1', '登录', '1');
INSERT INTO `log` VALUES ('415', '2018-04-24 17:06:19', '12', '登录', '1');
INSERT INTO `log` VALUES ('416', '2018-04-24 17:07:48', '2', '登录', '0');
INSERT INTO `log` VALUES ('417', '2018-04-24 18:26:03', '1', '登录', '1');
INSERT INTO `log` VALUES ('418', '2018-04-24 18:26:20', '12', '登录', '1');
INSERT INTO `log` VALUES ('419', '2018-04-24 18:27:59', '1', '登录', '1');
INSERT INTO `log` VALUES ('420', '2018-04-24 18:28:37', '12', '登录', '1');
INSERT INTO `log` VALUES ('421', '2018-04-24 18:31:18', '1', '登录', '1');
INSERT INTO `log` VALUES ('422', '2018-04-24 18:35:57', '2', '登录', '0');
INSERT INTO `log` VALUES ('423', '2018-04-24 18:45:39', '1', '登录', '1');
INSERT INTO `log` VALUES ('424', '2018-04-24 18:47:51', '2', '登录', '0');
INSERT INTO `log` VALUES ('425', '2018-04-24 18:48:10', '1', '登录', '1');
INSERT INTO `log` VALUES ('426', '2018-04-24 18:53:52', '2', '登录', '0');
INSERT INTO `log` VALUES ('427', '2018-04-24 18:59:31', '1', '登录', '1');
INSERT INTO `log` VALUES ('428', '2018-04-24 19:03:29', '1', '登录', '1');
INSERT INTO `log` VALUES ('429', '2018-04-25 06:41:37', '1', '登录', '1');
INSERT INTO `log` VALUES ('430', '2018-04-25 07:01:28', '2', '登录', '0');
INSERT INTO `log` VALUES ('431', '2018-04-25 07:04:24', '1', '登录', '1');
INSERT INTO `log` VALUES ('432', '2018-04-25 07:09:18', '12', '登录', '1');
INSERT INTO `log` VALUES ('433', '2018-04-25 07:09:49', '1', '登录', '1');
INSERT INTO `log` VALUES ('434', '2018-04-25 12:32:52', '2', '登录', '0');
INSERT INTO `log` VALUES ('435', '2018-04-25 12:33:12', '1', '登录', '1');
INSERT INTO `log` VALUES ('436', '2018-04-25 13:42:12', '12', '登录', '1');
INSERT INTO `log` VALUES ('437', '2018-04-25 13:59:39', '1', '登录', '1');
INSERT INTO `log` VALUES ('438', '2018-04-25 14:00:22', '12', '登录', '1');
INSERT INTO `log` VALUES ('439', '2018-04-25 14:04:04', '1', '登录', '1');
INSERT INTO `log` VALUES ('440', '2018-04-25 14:49:27', '2', '登录', '0');
INSERT INTO `log` VALUES ('441', '2018-04-25 17:15:32', '2', '登录', '0');
INSERT INTO `log` VALUES ('442', '2018-04-25 17:17:23', '1', '登录', '1');
INSERT INTO `log` VALUES ('443', '2018-04-25 17:19:08', '2', '登录', '0');
INSERT INTO `log` VALUES ('444', '2018-04-25 18:15:14', '1', '登录', '1');
INSERT INTO `log` VALUES ('445', '2018-04-25 18:38:59', '2', '登录', '0');
INSERT INTO `log` VALUES ('446', '2018-04-26 07:02:59', '2', '登录', '0');
INSERT INTO `log` VALUES ('447', '2018-04-26 09:05:12', '2', '登录', '0');
INSERT INTO `log` VALUES ('448', '2018-04-26 09:10:15', '1', '登录', '1');
INSERT INTO `log` VALUES ('449', '2018-04-26 09:20:27', '1', '登录', '1');
INSERT INTO `log` VALUES ('450', '2018-04-26 09:38:56', '2', '登录', '0');
INSERT INTO `log` VALUES ('451', '2018-04-26 09:40:35', '1', '登录', '1');
INSERT INTO `log` VALUES ('452', '2018-04-26 09:45:14', '2', '登录', '0');
INSERT INTO `log` VALUES ('453', '2018-04-26 09:58:01', '2', '登录', '0');
INSERT INTO `log` VALUES ('454', '2018-04-26 10:13:29', '2', '登录', '0');
INSERT INTO `log` VALUES ('455', '2018-04-26 10:14:21', '1', '登录', '1');
INSERT INTO `log` VALUES ('456', '2018-04-26 10:16:33', '1', '登录', '1');
INSERT INTO `log` VALUES ('457', '2018-04-26 10:16:51', '2', '登录', '0');
INSERT INTO `log` VALUES ('458', '2018-04-26 10:52:48', '2', '登录', '0');
INSERT INTO `log` VALUES ('459', '2018-04-26 11:04:52', '2', '登录', '0');
INSERT INTO `log` VALUES ('460', '2018-04-26 13:55:48', '2', '登录', '0');
INSERT INTO `log` VALUES ('461', '2018-04-26 14:44:34', '2', '登录', '0');
INSERT INTO `log` VALUES ('462', '2018-04-26 18:18:01', '1', '登录', '1');
INSERT INTO `log` VALUES ('463', '2018-04-26 18:21:36', '2', '登录', '0');
INSERT INTO `log` VALUES ('464', '2018-04-26 18:35:32', '2', '登录', '0');
INSERT INTO `log` VALUES ('465', '2018-04-26 18:40:33', '1', '登录', '1');
INSERT INTO `log` VALUES ('466', '2018-04-26 18:45:39', '2', '登录', '0');
INSERT INTO `log` VALUES ('467', '2018-04-26 20:05:57', '1', '登录', '1');
INSERT INTO `log` VALUES ('468', '2018-04-26 20:09:04', '2', '登录', '0');
INSERT INTO `log` VALUES ('469', '2018-04-26 20:09:27', '3', '登录', '0');
INSERT INTO `log` VALUES ('470', '2018-04-27 01:20:40', '2', '登录', '0');
INSERT INTO `log` VALUES ('471', '2018-04-27 15:20:23', '1', '登录', '1');
INSERT INTO `log` VALUES ('472', '2018-04-28 02:30:15', '2', '登录', '0');
INSERT INTO `log` VALUES ('473', '2018-04-28 03:22:14', '1', '登录', '1');
INSERT INTO `log` VALUES ('474', '2018-04-28 14:20:32', '2', '登录', '0');
INSERT INTO `log` VALUES ('475', '2018-04-28 14:30:47', '1', '登录', '1');
INSERT INTO `log` VALUES ('476', '2018-04-28 14:49:38', '2', '登录', '0');
INSERT INTO `log` VALUES ('477', '2018-04-28 14:51:57', '1', '登录', '1');
INSERT INTO `log` VALUES ('478', '2018-04-29 09:09:45', '2', '登录', '0');
INSERT INTO `log` VALUES ('479', '2018-04-29 09:21:08', '1', '登录', '1');
INSERT INTO `log` VALUES ('480', '2018-04-29 09:46:49', '2', '登录', '0');
INSERT INTO `log` VALUES ('481', '2018-04-29 10:25:24', '2', '登录', '0');
INSERT INTO `log` VALUES ('482', '2018-04-29 15:14:39', '1', '登录', '1');
INSERT INTO `log` VALUES ('483', '2018-04-30 03:02:24', '1', '登录', '1');
INSERT INTO `log` VALUES ('484', '2018-04-30 09:05:27', '1', '登录', '1');
INSERT INTO `log` VALUES ('485', '2018-04-30 12:45:53', '1', '登录', '1');
INSERT INTO `log` VALUES ('486', '2018-04-30 12:50:23', '1', '登录', '1');
INSERT INTO `log` VALUES ('487', '2018-04-30 12:56:16', '1', '登录', '1');
INSERT INTO `log` VALUES ('488', '2018-04-30 14:26:04', '2', '登录', '0');
INSERT INTO `log` VALUES ('489', '2018-04-30 14:27:24', '1', '登录', '1');
INSERT INTO `log` VALUES ('490', '2018-04-30 14:27:42', '12', '登录', '1');
INSERT INTO `log` VALUES ('491', '2018-04-30 14:31:37', '1', '登录', '1');
INSERT INTO `log` VALUES ('492', '2018-04-30 14:48:44', '2', '登录', '0');
INSERT INTO `log` VALUES ('493', '2018-04-30 14:59:19', '1', '登录', '1');
INSERT INTO `log` VALUES ('494', '2018-05-03 08:55:32', '1', '登录', '1');
INSERT INTO `log` VALUES ('495', '2018-05-03 08:57:56', '1', '登录', '1');
INSERT INTO `log` VALUES ('496', '2018-05-03 09:04:36', '2', '登录', '0');
INSERT INTO `log` VALUES ('497', '2018-05-03 09:05:56', '1', '登录', '1');
INSERT INTO `log` VALUES ('498', '2018-05-14 04:57:30', '1', '登录', '1');
INSERT INTO `log` VALUES ('499', '2018-05-15 15:51:27', '2', '登录', '0');
INSERT INTO `log` VALUES ('500', '2018-05-15 15:54:30', '1', '登录', '1');
INSERT INTO `log` VALUES ('501', '2018-05-15 16:14:01', '2', '登录', '0');
INSERT INTO `log` VALUES ('502', '2018-05-16 02:15:21', '1', '登录', '1');
INSERT INTO `log` VALUES ('503', '2018-05-16 03:28:38', '1', '登录', '1');
INSERT INTO `log` VALUES ('504', '2018-05-16 07:55:39', '2', '登录', '0');
INSERT INTO `log` VALUES ('505', '2018-05-16 08:20:55', '1', '登录', '1');
INSERT INTO `log` VALUES ('506', '2018-05-16 09:47:44', '1', '登录', '1');
INSERT INTO `log` VALUES ('507', '2018-05-16 09:56:45', '2', '登录', '0');
INSERT INTO `log` VALUES ('508', '2018-05-16 10:04:11', '1', '登录', '1');
INSERT INTO `log` VALUES ('509', '2018-05-16 11:48:35', '2', '登录', '0');
INSERT INTO `log` VALUES ('510', '2018-05-16 11:50:03', '1', '登录', '1');
INSERT INTO `log` VALUES ('511', '2018-05-16 11:52:56', '1', '登录', '1');
INSERT INTO `log` VALUES ('512', '2018-05-16 11:59:46', '19', '登录', '0');
INSERT INTO `log` VALUES ('513', '2018-05-16 12:06:43', '1', '登录', '1');
INSERT INTO `log` VALUES ('514', '2018-05-16 12:18:21', '1', '登录', '1');
INSERT INTO `log` VALUES ('515', '2018-05-16 12:46:23', '1', '登录', '1');
INSERT INTO `log` VALUES ('516', '2018-05-16 15:16:30', '2', '登录', '0');
INSERT INTO `log` VALUES ('517', '2018-05-16 15:28:11', '1', '登录', '1');
INSERT INTO `log` VALUES ('518', '2018-05-16 16:20:37', '19', '登录', '0');
INSERT INTO `log` VALUES ('519', '2018-05-16 16:21:33', '17', '登录', '0');
INSERT INTO `log` VALUES ('520', '2018-05-16 16:22:01', '16', '登录', '0');
INSERT INTO `log` VALUES ('521', '2018-05-16 16:22:40', '3', '登录', '0');
INSERT INTO `log` VALUES ('522', '2018-05-16 16:26:36', '1', '登录', '1');
INSERT INTO `log` VALUES ('523', '2018-05-16 16:27:50', '12', '登录', '1');
INSERT INTO `log` VALUES ('524', '2018-05-17 10:35:05', '2', '登录', '0');
INSERT INTO `log` VALUES ('525', '2018-05-17 10:36:44', '2', '登录', '0');
INSERT INTO `log` VALUES ('526', '2018-05-17 10:37:24', '19', '登录', '0');
INSERT INTO `log` VALUES ('527', '2018-05-17 10:43:07', '2', '登录', '0');
INSERT INTO `log` VALUES ('528', '2018-05-17 10:43:58', '19', '登录', '0');
INSERT INTO `log` VALUES ('529', '2018-05-17 10:49:06', '1', '登录', '1');
INSERT INTO `log` VALUES ('530', '2018-05-17 10:51:51', '12', '登录', '1');
INSERT INTO `log` VALUES ('531', '2018-05-17 10:53:06', '12', '登录', '1');
INSERT INTO `log` VALUES ('532', '2018-05-17 10:54:48', '1', '登录', '1');
INSERT INTO `log` VALUES ('533', '2018-05-17 15:31:42', '1', '登录', '1');
INSERT INTO `log` VALUES ('534', '2018-05-17 16:28:02', '2', '登录', '0');
INSERT INTO `log` VALUES ('535', '2018-05-17 16:28:59', '1', '登录', '1');
INSERT INTO `log` VALUES ('536', '2018-05-22 11:32:55', '2', '登录', '0');
INSERT INTO `log` VALUES ('537', '2018-05-22 11:33:53', '1', '登录', '1');
INSERT INTO `log` VALUES ('538', '2018-05-24 14:30:44', '12', '登录', '1');
INSERT INTO `log` VALUES ('539', '2018-05-24 14:33:17', '1', '登录', '1');
INSERT INTO `log` VALUES ('540', '2018-05-24 14:34:33', '12', '登录', '1');
INSERT INTO `log` VALUES ('541', '2018-05-24 14:37:42', '12', '登录', '1');
INSERT INTO `log` VALUES ('542', '2018-05-24 14:54:09', '1', '登录', '1');
INSERT INTO `log` VALUES ('543', '2018-05-24 14:57:33', '12', '登录', '1');
INSERT INTO `log` VALUES ('544', '2018-05-24 14:58:32', '1', '登录', '1');
INSERT INTO `log` VALUES ('545', '2018-05-24 15:02:05', '12', '登录', '1');
INSERT INTO `log` VALUES ('546', '2018-05-24 15:03:17', '19', '登录', '0');
INSERT INTO `log` VALUES ('547', '2018-05-24 15:03:36', '1', '登录', '1');
INSERT INTO `log` VALUES ('548', '2018-05-24 15:03:37', '1', '登录', '1');
INSERT INTO `log` VALUES ('549', '2018-05-24 15:04:30', '1', '登录', '1');
INSERT INTO `log` VALUES ('550', '2018-05-25 04:23:35', '1', '登录', '1');
INSERT INTO `log` VALUES ('551', '2018-05-25 04:24:01', '12', '登录', '1');
INSERT INTO `log` VALUES ('552', '2018-05-25 04:26:36', '1', '登录', '1');
INSERT INTO `log` VALUES ('553', '2018-05-25 05:46:41', '2', '登录', '0');
INSERT INTO `log` VALUES ('554', '2018-05-25 05:47:01', '1', '登录', '1');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL COMMENT '留言者ID',
  `u_name` varchar(255) DEFAULT NULL COMMENT '留言者姓名',
  `m_content` text COMMENT '留言内容',
  `m_time` datetime DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL COMMENT '给哪个管理员的留言',
  `reply` int(11) DEFAULT '0',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('8', '73', '赵二', '新的留言', '2017-08-25 06:23:11', '14', '0');
INSERT INTO `message` VALUES ('9', '73', '赵二', '时间好了', '2017-08-25 13:33:44', '14', '0');
INSERT INTO `message` VALUES ('10', '75', '彭二', '我也来留言', '2017-08-25 13:34:42', '14', '0');
INSERT INTO `message` VALUES ('15', '73', '赵二', '回复一下', '2017-08-25 16:50:02', '14', '0');
INSERT INTO `message` VALUES ('16', '75', '彭二', '统一回复', '2017-08-25 16:50:48', '14', '1');
INSERT INTO `message` VALUES ('19', '73', '赵二', '哈哈哈', '2017-08-25 16:52:42', '14', '1');
INSERT INTO `message` VALUES ('21', '54', '张大', '哈哈', '2017-08-26 15:29:31', '12', '0');
INSERT INTO `message` VALUES ('22', '54', '张大', '回复下', '2017-08-26 15:30:14', '12', '1');
INSERT INTO `message` VALUES ('24', '54', '张大', '123', '2017-08-29 11:29:28', null, '0');
INSERT INTO `message` VALUES ('27', '54', '张大', 'asd', '2017-08-29 12:03:05', '12', '0');
INSERT INTO `message` VALUES ('28', '86', '张三', '我是张三 来留言啦', '2017-08-29 22:33:48', '12', '0');
INSERT INTO `message` VALUES ('29', '55', '张二', '123', '2017-08-31 15:25:14', '12', '0');
INSERT INTO `message` VALUES ('30', '55', '张二', '123', '2017-08-31 15:26:56', '12', '0');
INSERT INTO `message` VALUES ('32', '54', '张大', '234', '2017-08-31 17:02:14', '12', '1');
INSERT INTO `message` VALUES ('33', '55', '张二', 'asdasd', '2017-09-01 11:47:16', '12', '0');
INSERT INTO `message` VALUES ('34', '54', '张大', 'hahha ', '2017-09-01 15:50:16', '12', '1');
INSERT INTO `message` VALUES ('36', '55', '张二', '123', '2017-09-02 15:58:49', '12', '0');
INSERT INTO `message` VALUES ('37', '55', '张二', '123按时打算了as沃尔沃额vdfcvasdapsd请问去爱上邓丽君普洱区委宣传，地方asdasmx.c按时吃', '2017-09-02 16:00:45', '12', '0');
INSERT INTO `message` VALUES ('38', '55', '张二', 'test111', '2017-09-03 16:07:54', '12', '0');
INSERT INTO `message` VALUES ('39', '55', '张二', 'hehe', '2017-09-03 16:11:42', '12', '1');
INSERT INTO `message` VALUES ('40', '110', 'aaa', '页面不美观', '2018-04-08 11:50:00', null, '0');

-- ----------------------------
-- Table structure for `prize_back`
-- ----------------------------
DROP TABLE IF EXISTS `prize_back`;
CREATE TABLE `prize_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL COMMENT '反馈的时间',
  `b_content` varchar(255) DEFAULT NULL COMMENT '奖项回馈的内容（录入奖项有误时的反馈）',
  `u_id` int(11) DEFAULT NULL COMMENT '反馈者ID',
  `u_name` varchar(255) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `seen` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prize_back
-- ----------------------------
INSERT INTO `prize_back` VALUES ('1', '2017-08-28 17:11:11', '123', '54', '张大', '231', '1');
INSERT INTO `prize_back` VALUES ('2', '2017-08-29 20:48:50', 'hhaha ', '54', '张大', '309', '1');
INSERT INTO `prize_back` VALUES ('3', '2017-08-29 21:03:15', '有问题啊', '60', '信管21', '329', '1');
INSERT INTO `prize_back` VALUES ('4', '2017-08-29 21:15:07', 'hello', '60', '信管21', '330', '1');
INSERT INTO `prize_back` VALUES ('5', '2017-08-29 22:07:33', '123123', '60', '信管21', '329', '1');
INSERT INTO `prize_back` VALUES ('6', '2017-08-29 22:07:36', '123123123123', '60', '信管21', '330', '1');
INSERT INTO `prize_back` VALUES ('7', '2017-08-29 22:22:00', 'haha ', '60', '信管21', '329', '1');
INSERT INTO `prize_back` VALUES ('8', '2017-08-29 22:33:01', '123123', '55', '张二', '335', '1');
INSERT INTO `prize_back` VALUES ('9', '2017-08-29 22:33:07', 'ASDA ', '55', '张二', '337', '1');
INSERT INTO `prize_back` VALUES ('14', '2017-08-30 13:45:01', '阿斯蒂芬', '54', '杨书', '0', '1');
INSERT INTO `prize_back` VALUES ('15', '2017-08-30 13:47:28', '有问题', '54', '杨书', '0', '1');
INSERT INTO `prize_back` VALUES ('16', '2017-08-30 13:48:53', '还有问题', '54', '杨书', '0', '1');
INSERT INTO `prize_back` VALUES ('17', '2017-08-30 16:53:43', '就是不好', '54', '杨书', '0', '1');
INSERT INTO `prize_back` VALUES ('18', '2017-08-31 16:20:12', '去', '54', '杨书', '0', '1');
INSERT INTO `prize_back` VALUES ('19', '2017-08-31 16:25:54', '123', '54', '杨书', '0', '1');
INSERT INTO `prize_back` VALUES ('20', '2017-08-31 16:26:20', '', '54', '杨书', '0', '1');
INSERT INTO `prize_back` VALUES ('21', '2017-08-31 16:34:43', '已驳回，没有说明原因', '54', '杨书', '0', '1');
INSERT INTO `prize_back` VALUES ('22', '2017-08-31 16:35:50', '已驳回，没有说明原因', '54', '杨书', '0', '1');
INSERT INTO `prize_back` VALUES ('23', '2017-08-31 16:37:33', '驳回提交，没有说明原因', '54', '杨书', '0', '1');
INSERT INTO `prize_back` VALUES ('24', '2017-09-02 00:00:20', '123', '55', '杨书', '0', '1');
INSERT INTO `prize_back` VALUES ('25', '2017-09-02 10:20:54', '123123', '55', '张二', '12', '1');

-- ----------------------------
-- Table structure for `prize_confirm`
-- ----------------------------
DROP TABLE IF EXISTS `prize_confirm`;
CREATE TABLE `prize_confirm` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL COMMENT '获奖者ID',
  `i_id` int(11) DEFAULT NULL COMMENT '奖项ID',
  `u_name` varchar(255) DEFAULT NULL,
  `i_name` varchar(255) DEFAULT NULL,
  `i_status` varchar(255) DEFAULT NULL COMMENT '确认状态',
  `add_time` varchar(100) DEFAULT NULL COMMENT '录入时间',
  `is_submit` int(11) DEFAULT '0',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prize_confirm
-- ----------------------------
INSERT INTO `prize_confirm` VALUES ('62', '54', '66', '张大', '外观设计专利第一申请人', '已确定', '2016年春期', '1');
INSERT INTO `prize_confirm` VALUES ('63', '55', '66', '张二', '外观设计专利第一申请人', '已确定', '2016年春期', '1');
INSERT INTO `prize_confirm` VALUES ('65', '54', '69', '张大', '省，市，部级项目负责人', '已确定', '2016年春期', '1');
INSERT INTO `prize_confirm` VALUES ('66', '55', '34', '张二', '为受到行政处分以及刑事处罚', '待确定', '2017年秋期', '0');
INSERT INTO `prize_confirm` VALUES ('67', '86', '34', '张三', '为受到行政处分以及刑事处罚', '待确定', '2017年秋期', '0');
INSERT INTO `prize_confirm` VALUES ('68', '55', '79', '张二', '组织或策划校级活动', '待确定', '2017年秋期', '0');

-- ----------------------------
-- Table structure for `prize_get`
-- ----------------------------
DROP TABLE IF EXISTS `prize_get`;
CREATE TABLE `prize_get` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL COMMENT '获奖者ID',
  `i_name` varchar(255) DEFAULT NULL COMMENT '奖项名称',
  `get_time` varchar(100) DEFAULT NULL COMMENT '获得时间',
  `i_id` int(11) DEFAULT NULL COMMENT '奖项ID',
  `u_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prize_get
-- ----------------------------
INSERT INTO `prize_get` VALUES ('89', '55', '参加积极分子党课并结业', '2017年秋期', '18', '张二');
INSERT INTO `prize_get` VALUES ('90', '55', '积极分子党课获得优秀学员', '2017年秋期', '19', '张二');
INSERT INTO `prize_get` VALUES ('91', '55', '预备党员党课优秀学员', '2017年秋期', '21', '张二');
INSERT INTO `prize_get` VALUES ('92', '55', '90-95分', '2017年秋期', '36', '张二');
INSERT INTO `prize_get` VALUES ('93', '55', '85-90分', '2017年秋期', '37', '张二');
INSERT INTO `prize_get` VALUES ('94', '55', '国家级竞赛一等奖', '2017年秋期', '53', '张二');
INSERT INTO `prize_get` VALUES ('95', '55', '国家级竞赛二等奖', '2017年秋期', '54', '张二');
INSERT INTO `prize_get` VALUES ('96', '55', '国家级竞赛三等奖', '2017年秋期', '55', '张二');
INSERT INTO `prize_get` VALUES ('97', '55', '组织或策划校级以上活动', '2017年秋期', '78', '张二');
INSERT INTO `prize_get` VALUES ('98', '55', '组织或策划校级活动', '2017年秋期', '79', '张二');
INSERT INTO `prize_get` VALUES ('99', '55', '有人数要求的讲座，报告，仪式等活动', '2017年秋期', '82', '张二');
INSERT INTO `prize_get` VALUES ('100', '54', '积极分子党课获得优秀学员', '2016年春期', '19', '张大');
INSERT INTO `prize_get` VALUES ('101', '54', '参加预备党员党课并结业', '2016年春期', '20', '张大');
INSERT INTO `prize_get` VALUES ('102', '54', '党支部委员', '2016年春期', '22', '张大');
INSERT INTO `prize_get` VALUES ('103', '54', '积极参与党团活动', '2016年春期', '23', '张大');
INSERT INTO `prize_get` VALUES ('104', '54', '90-95分', '2016年春期', '36', '张大');
INSERT INTO `prize_get` VALUES ('105', '54', '85-90分', '2017年春期', '37', '张大');
INSERT INTO `prize_get` VALUES ('106', '54', '外观设计专利第一申请人', '2016年春期', '66', '张大');
INSERT INTO `prize_get` VALUES ('107', '54', '外观设计专利申请团队成员', '2016年春期', '67', '张大');
INSERT INTO `prize_get` VALUES ('108', '54', '软件著作权第一申请人', '2016年春期', '68', '张大');
INSERT INTO `prize_get` VALUES ('109', '54', '积极主动参加各类讲座，报告，仪式等活动', '2016年春期', '81', '张大');
INSERT INTO `prize_get` VALUES ('110', '54', '有人数要求的讲座，报告，仪式等活动', '2016年春期', '82', '张大');
INSERT INTO `prize_get` VALUES ('111', '54', '团结同学', '2016年秋期', '24', '张大');
INSERT INTO `prize_get` VALUES ('112', '54', '尊敬师长', '2017年秋期', '25', '张大');
INSERT INTO `prize_get` VALUES ('113', '55', '预备党员党课优秀学员', '2017年秋期', '21', '张二');
INSERT INTO `prize_get` VALUES ('114', '55', '积极参与党团活动', '2016年秋期', '23', '张二');
INSERT INTO `prize_get` VALUES ('115', '55', '发明专利第一申请人', '2017年秋期', '62', '张二');
INSERT INTO `prize_get` VALUES ('116', '86', '预备党员党课优秀学员', '2017年秋期', '21', '张三');
INSERT INTO `prize_get` VALUES ('117', '86', '为班级学风建设做出突出贡献', '2017年秋期', '31', '张三');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `s_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) DEFAULT NULL,
  `s_num` int(11) NOT NULL,
  `s_pass` varchar(255) NOT NULL,
  `class_id` int(11) DEFAULT NULL COMMENT '级班ID',
  `is_monitor` int(11) DEFAULT '0' COMMENT '班长标示',
  `img` varchar(255) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL COMMENT '学院id',
  `sex` varchar(255) DEFAULT NULL,
  `personas_img` varchar(255) DEFAULT NULL,
  `is_del` int(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`s_id`),
  KEY `s_num` (`s_num`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '计机1', '402', '25d55ad283aa400af464c76d713c07ad', '31', '0', 'http://127.0.0.1/nefu/uploads/s4.png', '2017', '9', '女', 'http://127.0.0.1/nefu/uploads/girl.png', '1');
INSERT INTO `student` VALUES ('2', 'aaa（班长）', '403', '827ccb0eea8a706c4c34a16891f84e7b', '31', '1', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('3', '张三', '404', '827ccb0eea8a706c4c34a16891f84e7b', '31', '0', 'http://127.0.0.1/nefu/uploads/s4.png', '2017', '9', '女', 'http://127.0.0.1/nefu/uploads/girl.png', '0');
INSERT INTO `student` VALUES ('4', '郑', '98', '827ccb0eea8a706c4c34a16891f84e7b', '32', '1', null, '2016', '9', '男', null, '0');
INSERT INTO `student` VALUES ('5', '王', '95', '827ccb0eea8a706c4c34a16891f84e7b', '32', '0', null, '2016', '9', '男', null, '0');
INSERT INTO `student` VALUES ('6', '111', '674543', '25d55ad283aa400af464c76d713c07ad', '31', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('7', '333', '124235436', 'e807f1fcf82d132f9bb018ca6738a19f', '37', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('8', '35', '1242', '25d55ad283aa400af464c76d713c07ad', '37', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('9', '23', '124234', '25d55ad283aa400af464c76d713c07ad', '31', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '1');
INSERT INTO `student` VALUES ('10', '23', '45345', '25d55ad283aa400af464c76d713c07ad', '31', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('11', '李立三', '354252', '25d55ad283aa400af464c76d713c07ad', '31', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('12', '23', '3542523', '25d55ad283aa400af464c76d713c07ad', '40', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('13', '342', '334', '25d55ad283aa400af464c76d713c07ad', '37', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('14', '往问', '33434', '25d55ad283aa400af464c76d713c07ad', '37', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('15', '234324', '334334', '25d55ad283aa400af464c76d713c07ad', '31', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('16', '34535', '145435', '25d55ad283aa400af464c76d713c07ad', '31', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('17', '24', '4564', '25d55ad283aa400af464c76d713c07ad', '37', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2017', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('18', '245235', '234234141', '25d55ad283aa400af464c76d713c07ad', '51', '0', 'http://127.0.0.1/nefu/uploads/s4.png', '2016', '9', '女', 'http://127.0.0.1/nefu/uploads/girl.png', '1');
INSERT INTO `student` VALUES ('19', '2018', '2018', '25d55ad283aa400af464c76d713c07ad', '48', '1', 'http://127.0.0.1/nefu/uploads/s1.png', '2018', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('20', '12', '12', '25d55ad283aa400af464c76d713c07ad', '30', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2016', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('21', '12', '122', '25d55ad283aa400af464c76d713c07ad', '30', '0', 'http://127.0.0.1/nefu/uploads/s1.png', '2016', '9', '男', 'http://127.0.0.1/nefu/uploads/boy.png', '0');
INSERT INTO `student` VALUES ('22', '急急急', '9898', '827ccb0eea8a706c4c34a16891f84e7b', '48', '0', null, '2014', '9', null, null, '0');

-- ----------------------------
-- Table structure for `wenti`
-- ----------------------------
DROP TABLE IF EXISTS `wenti`;
CREATE TABLE `wenti` (
  `w_id` int(255) NOT NULL AUTO_INCREMENT,
  `s_num` int(11) NOT NULL,
  `get_term` varchar(255) NOT NULL,
  `month` int(11) NOT NULL,
  `w_why` varchar(255) NOT NULL,
  `w_type` varchar(255) NOT NULL,
  `w_self` int(11) NOT NULL,
  `w_cfm` int(11) DEFAULT NULL,
  `w_sta` int(3) DEFAULT '0',
  `w_who` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wenti
-- ----------------------------
INSERT INTO `wenti` VALUES ('1', '402', '2017年秋期', '4', '33', ' 二', '2', '4', '2', '虽然');
INSERT INTO `wenti` VALUES ('2', '402', '2018年春期', '3', 'rr', 'ddd', '3', '2', '2', '33');
INSERT INTO `wenti` VALUES ('3', '403', '2017年秋期', '10', 'vf', '院点表', '2', '2', '2', '33');
INSERT INTO `wenti` VALUES ('4', '403', '2018年春期', '2', '运动会', '院点表', '3', '3', '2', '45');
INSERT INTO `wenti` VALUES ('5', '403', '2018年春期', '2', '运动会', '院点表', '3', '3', '2', 'aa');
INSERT INTO `wenti` VALUES ('6', '403', '2018年春期', '2', '运动会', '院点表', '3', '3', '2', 'aa');
INSERT INTO `wenti` VALUES ('7', '403', '2018年春期', '3', '运动会', '院通表', '3', '3', '2', 'aa');
INSERT INTO `wenti` VALUES ('8', '403', '2018年春期', '3', '运动会', '院点表', '3', '3', '2', 'aa');
INSERT INTO `wenti` VALUES ('9', '403', '2018年春期', '3', '运动会', '院点表', '3', '3', '2', 'aa');
INSERT INTO `wenti` VALUES ('10', '402', '2017年秋期', '9', '文艺晚会', '院点表', '2', '3', '2', 'aa');
INSERT INTO `wenti` VALUES ('11', '403', '2017年秋期', '11', '参加活动', '院点表', '3', '3', '2', 'aa');
INSERT INTO `wenti` VALUES ('12', '404', '2018年春期', '3', '积极活动', '院通表', '2', '3', '2', 'aa');
INSERT INTO `wenti` VALUES ('13', '403', '2018年春期', '3', '排球赛', '院通表', '3', '3', '2', 'aa');
INSERT INTO `wenti` VALUES ('14', '402', '2018年春期', '3', '参加运动会', '院点表', '2', '2', '2', 'aa');
INSERT INTO `wenti` VALUES ('15', '403', '2019年春期', '4', '排球赛', '院通表', '4', null, '1', null);
INSERT INTO `wenti` VALUES ('16', '2018', '2018年春期', '4', 'dwereee', '院点表', '3', null, '1', null);
