-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 �?08 �?13 �?15:31
-- 服务器版本: 5.5.47
-- PHP 版本: 5.5.30

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `meng`
--

-- --------------------------------------------------------

--
-- 表的结构 `o_action`
--

CREATE TABLE IF NOT EXISTS `o_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `o_action`
--

INSERT INTO `o_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `o_action_log`
--

CREATE TABLE IF NOT EXISTS `o_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=298 ;

--
-- 转存表中的数据 `o_action_log`
--

INSERT INTO `o_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 1, 1, 2130706433, 'member', 1, 'admin在2017-07-24 16:48登录了后台', 1, 1500886113),
(2, 7, 1, 2130706433, 'model', 4, '操作url：/index.php?s=/admin/model/update.html', 1, 1500886209),
(3, 8, 1, 2130706433, 'attribute', 33, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1500886291),
(4, 11, 1, 2130706433, 'category', 2, '操作url：/index.php?s=/admin/category/remove/id/2.html', 1, 1500886371),
(5, 11, 1, 2130706433, 'category', 1, '操作url：/index.php?s=/admin/category/remove/id/1.html', 1, 1500886375),
(6, 11, 1, 2130706433, 'category', 39, '操作url：/index.php?s=/admin/category/add.html', 1, 1500886407),
(7, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/admin/category/add.html', 1, 1500886429),
(8, 1, 1, 2130706433, 'member', 1, 'admin在2017-07-24 16:58登录了后台', 1, 1500886709),
(9, 9, 1, 2130706433, 'channel', 0, '操作url：/index.php?s=/Admin/Channel/del/id/1.html', 1, 1500888114),
(10, 9, 1, 2130706433, 'channel', 2, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1500888179),
(11, 9, 1, 2130706433, 'channel', 3, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1500888192),
(12, 11, 1, 2130706433, 'category', 41, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888363),
(13, 11, 1, 2130706433, 'category', 42, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888395),
(14, 11, 1, 2130706433, 'category', 43, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888412),
(15, 11, 1, 2130706433, 'category', 44, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888426),
(16, 11, 1, 2130706433, 'category', 45, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888445),
(17, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888462),
(18, 11, 1, 2130706433, 'category', 47, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888507),
(19, 11, 1, 2130706433, 'category', 48, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888522),
(20, 11, 1, 2130706433, 'category', 49, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888539),
(21, 11, 1, 2130706433, 'category', 50, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888560),
(22, 11, 1, 2130706433, 'category', 51, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888574),
(23, 11, 1, 2130706433, 'category', 52, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888586),
(24, 11, 1, 2130706433, 'category', 53, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888601),
(25, 11, 1, 2130706433, 'category', 54, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888615),
(26, 11, 1, 2130706433, 'category', 49, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500888724),
(27, 11, 1, 2130706433, 'category', 50, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500888730),
(28, 11, 1, 2130706433, 'category', 51, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500888741),
(29, 11, 1, 2130706433, 'category', 52, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500888748),
(30, 11, 1, 2130706433, 'category', 53, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500888754),
(31, 11, 1, 2130706433, 'category', 54, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500888759),
(32, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888814),
(33, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888835),
(34, 11, 1, 2130706433, 'category', 57, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888884),
(35, 11, 1, 2130706433, 'category', 58, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888901),
(36, 11, 1, 2130706433, 'category', 59, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888922),
(37, 11, 1, 2130706433, 'category', 60, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888935),
(38, 11, 1, 2130706433, 'category', 61, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888951),
(39, 11, 1, 2130706433, 'category', 62, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888967),
(40, 11, 1, 2130706433, 'category', 63, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888980),
(41, 11, 1, 2130706433, 'category', 64, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500888994),
(42, 11, 1, 2130706433, 'category', 65, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500889007),
(43, 11, 1, 2130706433, 'category', 66, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500889023),
(44, 11, 1, 2130706433, 'category', 67, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500889060),
(45, 11, 1, 2130706433, 'category', 68, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500889073),
(46, 11, 1, 2130706433, 'category', 69, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500889091),
(47, 11, 1, 2130706433, 'category', 70, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500889113),
(48, 1, 1, 2130706433, 'member', 1, 'admin在2017-07-25 08:59登录了后台', 1, 1500944344),
(49, 11, 1, 2130706433, 'category', 48, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500945923),
(50, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500946116),
(51, 8, 1, 2130706433, 'attribute', 34, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1500946422),
(52, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500946729),
(53, 11, 1, 2130706433, 'category', 57, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500946758),
(54, 11, 1, 2130706433, 'category', 58, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500946769),
(55, 11, 1, 2130706433, 'category', 59, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500946781),
(56, 11, 1, 2130706433, 'category', 60, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500946791),
(57, 11, 1, 2130706433, 'category', 61, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500946800),
(58, 11, 1, 2130706433, 'category', 62, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500946810),
(59, 11, 1, 2130706433, 'category', 63, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500946844),
(60, 11, 1, 2130706433, 'category', 64, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500946856),
(61, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500949772),
(62, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500949794),
(63, 11, 1, 2130706433, 'category', 57, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500949830),
(64, 11, 1, 2130706433, 'category', 58, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500949949),
(65, 11, 1, 2130706433, 'category', 59, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500949961),
(66, 11, 1, 2130706433, 'category', 60, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500949973),
(67, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500950126),
(68, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500950151),
(69, 8, 1, 2130706433, 'attribute', 34, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1500950338),
(70, 8, 1, 2130706433, 'attribute', 34, '操作url：/index.php?s=/Admin/Attribute/remove/id/34.html', 1, 1500950416),
(71, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500950489),
(72, 11, 1, 2130706433, 'category', 57, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500951523),
(73, 11, 1, 2130706433, 'category', 58, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500951532),
(74, 11, 1, 2130706433, 'category', 59, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500951544),
(75, 11, 1, 2130706433, 'category', 60, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500951557),
(76, 11, 1, 2130706433, 'category', 61, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500951584),
(77, 1, 1, 2130706433, 'member', 1, 'admin在2017-07-25 11:27登录了后台', 1, 1500953251),
(78, 11, 1, 2130706433, 'category', 65, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500954257),
(79, 11, 1, 2130706433, 'category', 64, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500954259),
(80, 11, 1, 2130706433, 'category', 63, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500954264),
(81, 11, 1, 2130706433, 'category', 66, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500954275),
(82, 11, 1, 2130706433, 'category', 65, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500954284),
(83, 11, 1, 2130706433, 'category', 64, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500954302),
(84, 11, 1, 2130706433, 'category', 63, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500954312),
(85, 11, 1, 2130706433, 'category', 67, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500954326),
(86, 11, 1, 2130706433, 'category', 68, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500954337),
(87, 11, 1, 2130706433, 'category', 69, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500954347),
(88, 11, 1, 2130706433, 'category', 70, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500954355),
(89, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500955933),
(90, 11, 1, 2130706433, 'category', 72, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500956104),
(91, 8, 1, 2130706433, 'attribute', 35, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1500956786),
(92, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500956822),
(93, 8, 1, 2130706433, 'attribute', 35, '操作url：/index.php?s=/Admin/Attribute/remove/id/35.html', 1, 1500961096),
(94, 8, 1, 2130706433, 'attribute', 36, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1500961158),
(95, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500961934),
(96, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500968118),
(97, 11, 1, 2130706433, 'category', 72, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500968132),
(98, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500968140),
(99, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500968151),
(100, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500968541),
(101, 11, 1, 2130706433, 'category', 72, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500968548),
(102, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500968556),
(103, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500968910),
(104, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500969877),
(105, 11, 1, 2130706433, 'category', 72, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500969889),
(106, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500970000),
(107, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500970266),
(108, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500970485),
(109, 11, 1, 2130706433, 'category', 72, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500971218),
(110, 11, 1, 2130706433, 'category', 72, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500971288),
(111, 11, 1, 2130706433, 'category', 74, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500974262),
(112, 11, 1, 2130706433, 'category', 72, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500974273),
(113, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500974280),
(114, 11, 1, 2130706433, 'category', 74, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500974441),
(115, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1500974581),
(116, 8, 1, 2130706433, 'attribute', 37, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1500974608),
(117, 8, 1, 2130706433, 'attribute', 38, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1500974663),
(118, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1500974812),
(119, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1500974852),
(120, 11, 1, 2130706433, 'category', 74, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500974867),
(121, 8, 1, 2130706433, 'attribute', 39, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1500974977),
(122, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1500974999),
(123, 11, 1, 2130706433, 'category', 74, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500975195),
(124, 11, 1, 2130706433, 'category', 74, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500975207),
(125, 11, 1, 2130706433, 'category', 74, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500975774),
(126, 11, 1, 2130706433, 'category', 74, '操作url：/index.php?s=/Admin/Category/remove/id/74.html', 1, 1500977939),
(127, 11, 1, 2130706433, 'category', 75, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1500977971),
(128, 11, 1, 2130706433, 'category', 75, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1500978212),
(129, 1, 1, 2130706433, 'member', 1, 'admin在2017-07-26 08:53登录了后台', 1, 1501030392),
(130, 8, 1, 2130706433, 'attribute', 39, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1501030721),
(131, 8, 1, 2130706433, 'attribute', 39, '操作url：/index.php?s=/Admin/Attribute/remove/id/39.html', 1, 1501030919),
(132, 8, 1, 2130706433, 'attribute', 40, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1501030937),
(133, 8, 1, 2130706433, 'attribute', 38, '操作url：/index.php?s=/Admin/Attribute/remove/id/38.html', 1, 1501031136),
(134, 8, 1, 2130706433, 'attribute', 41, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1501031208),
(135, 11, 1, 2130706433, 'category', 42, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501033070),
(136, 9, 1, 2130706433, 'channel', 2, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501033223),
(137, 9, 1, 2130706433, 'channel', 2, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501033310),
(138, 11, 1, 2130706433, 'category', 42, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501033346),
(139, 11, 1, 2130706433, 'category', 43, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501034337),
(140, 11, 1, 2130706433, 'category', 43, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501034365),
(141, 9, 1, 2130706433, 'channel', 3, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501034456),
(142, 9, 1, 2130706433, 'channel', 3, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501034562),
(143, 11, 1, 2130706433, 'category', 44, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501036035),
(144, 11, 1, 2130706433, 'category', 44, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501036192),
(145, 9, 1, 2130706433, 'channel', 4, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501036218),
(146, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501037298),
(147, 9, 1, 2130706433, 'channel', 6, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501037347),
(148, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501037837),
(149, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501037856),
(150, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501038336),
(151, 8, 1, 2130706433, 'attribute', 42, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1501039410),
(152, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501039616),
(153, 11, 1, 2130706433, 'category', 57, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501039726),
(154, 11, 1, 2130706433, 'category', 58, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501039737),
(155, 11, 1, 2130706433, 'category', 59, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501039747),
(156, 11, 1, 2130706433, 'category', 60, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501039757),
(157, 11, 1, 2130706433, 'category', 61, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501039776),
(158, 11, 1, 2130706433, 'category', 62, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501039786),
(159, 11, 1, 2130706433, 'category', 66, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501039805),
(160, 11, 1, 2130706433, 'category', 65, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501039818),
(161, 11, 1, 2130706433, 'category', 64, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501039828),
(162, 11, 1, 2130706433, 'category', 63, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501039838),
(163, 11, 1, 2130706433, 'category', 76, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501040830),
(164, 11, 1, 2130706433, 'category', 76, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501040918),
(165, 7, 1, 2130706433, 'model', 2, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1501041183),
(166, 7, 1, 2130706433, 'model', 2, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1501041233),
(167, 11, 1, 2130706433, 'category', 47, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501041975),
(168, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501041978),
(169, 11, 1, 2130706433, 'category', 39, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501041980),
(170, 11, 1, 2130706433, 'category', 77, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501042022),
(171, 11, 1, 2130706433, 'category', 78, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501042083),
(172, 11, 1, 2130706433, 'category', 79, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501042142),
(173, 11, 1, 2130706433, 'category', 80, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501042183),
(174, 11, 1, 2130706433, 'category', 80, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501042194),
(175, 11, 1, 2130706433, 'category', 81, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501042220),
(176, 11, 1, 2130706433, 'category', 82, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501042300),
(177, 11, 1, 2130706433, 'category', 83, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501042383),
(178, 11, 1, 2130706433, 'category', 84, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501042455),
(179, 11, 1, 2130706433, 'category', 85, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501042476),
(180, 11, 1, 2130706433, 'category', 84, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501042504),
(181, 11, 1, 2130706433, 'category', 85, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501042506),
(182, 11, 1, 2130706433, 'category', 81, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501042525),
(183, 11, 1, 2130706433, 'category', 83, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501043470),
(184, 11, 1, 2130706433, 'category', 84, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501043482),
(185, 11, 1, 2130706433, 'category', 85, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501043492),
(186, 11, 1, 2130706433, 'category', 83, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501046687),
(187, 11, 1, 2130706433, 'category', 84, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501046699),
(188, 11, 1, 2130706433, 'category', 85, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501046708),
(189, 11, 1, 2130706433, 'category', 86, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501046989),
(190, 11, 1, 2130706433, 'category', 87, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501047044),
(191, 11, 1, 2130706433, 'category', 88, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501047069),
(192, 11, 1, 2130706433, 'category', 89, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501047093),
(193, 11, 1, 2130706433, 'category', 88, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501047103),
(194, 11, 1, 2130706433, 'category', 89, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501047105),
(195, 11, 1, 2130706433, 'category', 89, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501047145),
(196, 11, 1, 2130706433, 'category', 87, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501047330),
(197, 11, 1, 2130706433, 'category', 88, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501047354),
(198, 11, 1, 2130706433, 'category', 89, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501047379),
(199, 11, 1, 2130706433, 'category', 90, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501048894),
(200, 11, 1, 2130706433, 'category', 90, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501049151),
(201, 11, 1, 2130706433, 'category', 90, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501049186),
(202, 11, 1, 2130706433, 'category', 90, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501049260),
(203, 11, 1, 2130706433, 'category', 90, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501049291),
(204, 8, 1, 2130706433, 'attribute', 43, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1501049644),
(205, 8, 1, 2130706433, 'attribute', 44, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1501049671),
(206, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501051460),
(207, 11, 1, 2130706433, 'category', 75, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501051461),
(208, 11, 1, 2130706433, 'category', 76, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501051463),
(209, 11, 1, 2130706433, 'category', 91, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501051507),
(210, 11, 1, 2130706433, 'category', 91, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501052551),
(211, 11, 1, 2130706433, 'category', 91, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501052875),
(212, 11, 1, 2130706433, 'category', 91, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501053017),
(213, 11, 1, 2130706433, 'category', 91, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501053318),
(214, 11, 1, 2130706433, 'category', 92, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501053369),
(215, 11, 1, 2130706433, 'category', 92, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501053440),
(216, 11, 1, 2130706433, 'category', 93, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501053471),
(217, 11, 1, 2130706433, 'category', 93, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501053486),
(218, 11, 1, 2130706433, 'category', 94, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501053505),
(219, 11, 1, 2130706433, 'category', 95, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501053528),
(220, 11, 1, 2130706433, 'category', 96, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1501053547),
(221, 11, 1, 2130706433, 'category', 94, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501053573),
(222, 11, 1, 2130706433, 'category', 95, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501053584),
(223, 11, 1, 2130706433, 'category', 96, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501053589),
(224, 8, 1, 2130706433, 'attribute', 41, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1501054236),
(225, 11, 1, 2130706433, 'category', 68, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501064551),
(226, 11, 1, 2130706433, 'category', 67, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501064563),
(227, 11, 1, 2130706433, 'category', 69, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501064600),
(228, 11, 1, 2130706433, 'category', 70, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501064612),
(229, 1, 1, 2130706433, 'member', 1, 'admin在2017-07-27 08:46登录了后台', 1, 1501116362),
(230, 9, 1, 2130706433, 'channel', 2, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501116652),
(231, 9, 1, 2130706433, 'channel', 3, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501116718),
(232, 9, 1, 2130706433, 'channel', 4, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501116732),
(233, 9, 1, 2130706433, 'channel', 6, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501116750),
(234, 9, 1, 2130706433, 'channel', 7, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501116762),
(235, 11, 1, 2130706433, 'category', 45, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501117157),
(236, 9, 1, 2130706433, 'channel', 5, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501117287),
(237, 9, 1, 2130706433, 'channel', 5, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501117339),
(238, 9, 1, 2130706433, 'channel', 5, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1501117375),
(239, 11, 1, 2130706433, 'category', 75, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501118547),
(240, 11, 1, 2130706433, 'category', 76, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501118583),
(241, 8, 1, 2130706433, 'attribute', 41, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1501119655),
(242, 8, 1, 2130706433, 'attribute', 45, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1501119727),
(243, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1501119877),
(244, 11, 1, 2130706433, 'category', 75, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501120388),
(245, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1501120635),
(246, 11, 1, 2130706433, 'category', 68, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501120915),
(247, 11, 1, 2130706433, 'category', 67, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501120928),
(248, 11, 1, 2130706433, 'category', 69, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501120939),
(249, 11, 1, 2130706433, 'category', 70, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501120952),
(250, 11, 1, 2130706433, 'category', 68, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501121256),
(251, 11, 1, 2130706433, 'category', 67, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501121270),
(252, 11, 1, 2130706433, 'category', 69, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501121280),
(253, 11, 1, 2130706433, 'category', 70, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1501121291),
(254, 1, 1, 2130706433, 'member', 1, 'admin在2017-07-27 12:28登录了后台', 1, 1501129730),
(255, 1, 1, 2130706433, 'member', 1, 'admin在2017-07-27 13:19登录了后台', 1, 1501132784),
(256, 1, 1, 1928984373, 'member', 1, 'admin在2017-07-28 11:31登录了后台', 1, 1501212696),
(257, 1, 1, 1928984373, 'member', 1, 'admin在2017-07-28 11:37登录了后台', 1, 1501213078),
(258, 9, 1, 1928984373, 'channel', 2, '操作url：/Admin/Channel/edit.html', 1, 1501214487),
(259, 9, 1, 1928984373, 'channel', 3, '操作url：/Admin/Channel/edit.html', 1, 1501214494),
(260, 9, 1, 1928984373, 'channel', 4, '操作url：/Admin/Channel/edit.html', 1, 1501214501),
(261, 9, 1, 1928984373, 'channel', 5, '操作url：/Admin/Channel/edit.html', 1, 1501214509),
(262, 9, 1, 1928984373, 'channel', 6, '操作url：/Admin/Channel/edit.html', 1, 1501214516),
(263, 1, 1, 1928984373, 'member', 1, 'admin在2017-07-28 15:03登录了后台', 1, 1501225417),
(264, 1, 1, 1928982798, 'member', 1, 'admin在2017-07-31 16:25登录了后台', 1, 1501489507),
(265, 11, 1, 1928982798, 'category', 97, '操作url：/Admin/Category/add.html', 1, 1501489569),
(266, 11, 1, 1928982798, 'category', 98, '操作url：/Admin/Category/add.html', 1, 1501489615),
(267, 11, 1, 1928982798, 'category', 97, '操作url：/Admin/Category/edit.html', 1, 1501489675),
(268, 11, 1, 1928982798, 'category', 98, '操作url：/Admin/Category/edit.html', 1, 1501489691),
(269, 11, 1, 1928982798, 'category', 42, '操作url：/Admin/Category/edit.html', 1, 1501490432),
(270, 11, 1, 1928982798, 'category', 42, '操作url：/Admin/Category/edit.html', 1, 1501491515),
(271, 11, 1, 1928982798, 'category', 97, '操作url：/Admin/Category/edit.html', 1, 1501491604),
(272, 11, 1, 1928982798, 'category', 98, '操作url：/Admin/Category/edit.html', 1, 1501491617),
(273, 8, 1, 1928982798, 'attribute', 45, '操作url：/Admin/Attribute/update.html', 1, 1501491739),
(274, 8, 1, 1928982798, 'attribute', 46, '操作url：/Admin/Attribute/update.html', 1, 1501492092),
(275, 1, 1, 1928982798, 'member', 1, 'admin在2017-07-31 17:10登录了后台', 1, 1501492234),
(276, 8, 1, 1928982798, 'attribute', 46, '操作url：/Admin/Attribute/remove/id/46.html', 1, 1501492338),
(277, 1, 1, 2071386604, 'member', 1, 'admin在2017-08-01 08:48登录了后台', 1, 1501548530),
(278, 1, 1, 2071386604, 'member', 1, 'admin在2017-08-01 08:54登录了后台', 1, 1501548858),
(279, 8, 1, 2071386604, 'attribute', 45, '操作url：/Admin/Attribute/update.html', 1, 1501549062),
(280, 11, 1, 2071386604, 'category', 97, '操作url：/Admin/Category/edit.html', 1, 1501549101),
(281, 11, 1, 2071386604, 'category', 98, '操作url：/Admin/Category/edit.html', 1, 1501549110),
(282, 1, 1, -561957896, 'member', 1, 'admin在2017-08-04 08:55登录了后台', 1, 1501808145),
(283, 1, 1, 1033225958, 'member', 1, 'admin在2017-08-08 10:22登录了后台', 1, 1502158978),
(284, 1, 1, 1033225958, 'member', 1, 'admin在2017-08-08 10:28登录了后台', 1, 1502159300),
(285, 11, 1, 1033225958, 'category', 75, '操作url：/Admin/Category/edit.html', 1, 1502160528),
(286, 11, 1, 1033225958, 'category', 76, '操作url：/Admin/Category/edit.html', 1, 1502160542),
(287, 1, 1, 1928984692, 'member', 1, 'admin在2017-08-09 17:43登录了后台', 1, 1502271831),
(288, 1, 1, -561958355, 'member', 1, 'admin在2017-08-10 10:39登录了后台', 1, 1502332762),
(289, 1, 1, -561958355, 'member', 1, 'admin在2017-08-10 12:24登录了后台', 1, 1502339051),
(290, 11, 1, -561958355, 'category', 75, '操作url：/Admin/Category/edit.html', 1, 1502355486),
(291, 11, 1, -561958355, 'category', 76, '操作url：/Admin/Category/edit.html', 1, 1502355516),
(292, 1, 1, -561961493, 'member', 1, 'admin在2017-08-11 16:41登录了后台', 1, 1502440885),
(293, 8, 1, -561961493, 'attribute', 37, '操作url：/Admin/Attribute/remove/id/37.html', 1, 1502441251),
(294, 8, 1, -561961493, 'attribute', 47, '操作url：/Admin/Attribute/update.html', 1, 1502441286),
(295, 1, 1, -561961493, 'member', 1, 'admin在2017-08-11 17:02登录了后台', 1, 1502442176),
(296, 1, 1, 1885209894, 'member', 1, 'admin在2017-08-11 17:05登录了后台', 1, 1502442311),
(297, 9, 1, -561961493, 'channel', 4, '操作url：/Admin/Channel/edit.html', 1, 1502443679);

-- --------------------------------------------------------

--
-- 表的结构 `o_addons`
--

CREATE TABLE IF NOT EXISTS `o_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `o_addons`
--

INSERT INTO `o_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(3, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512022, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0);

-- --------------------------------------------------------

--
-- 表的结构 `o_attachment`
--

CREATE TABLE IF NOT EXISTS `o_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o_attribute`
--

CREATE TABLE IF NOT EXISTS `o_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `o_attribute`
--

INSERT INTO `o_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, ''),
(33, 'title_en', '英文名', 'text NOT NULL', 'textarea', '', '', 1, '', 4, 0, 1, 1500886291, 1500886291, '', 3, '', 'regex', '', 3, 'function'),
(36, 'biaoqian', '标签', 'varchar(255)', 'string', '', '', 1, '', 1, 0, 1, 1500961158, 1500961158, '', 3, '', 'regex', '', 3, 'function'),
(47, 'price', '价格', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1502441286, 1502441286, '', 3, '', 'regex', '', 3, 'function'),
(41, 'content', '产品概述', 'text NOT NULL', 'textarea', '', '', 1, '', 5, 0, 1, 1501119655, 1501031209, '', 3, '', 'regex', '', 3, 'function'),
(40, 'introduction', '产品简介', 'text NOT NULL', 'editor', '', '', 1, '', 5, 0, 1, 1501030937, 1501030937, '', 3, '', 'regex', '', 3, 'function'),
(42, 'product', '产品图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 2, 0, 1, 1501039410, 1501039410, '', 3, '', 'regex', '', 3, 'function'),
(43, 'ljxg', '立即选购', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1501049644, 1501049644, '', 3, '', 'regex', '', 3, 'function'),
(44, 'xptj', '选配推荐', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1501049671, 1501049671, '', 3, '', 'regex', '', 3, 'function'),
(45, 'pimage', '产品图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 5, 0, 1, 1501549062, 1501119728, '', 3, '', 'regex', '', 3, 'function');

-- --------------------------------------------------------

--
-- 表的结构 `o_auth_extend`
--

CREATE TABLE IF NOT EXISTS `o_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `o_auth_extend`
--

INSERT INTO `o_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `o_auth_group`
--

CREATE TABLE IF NOT EXISTS `o_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `o_auth_group`
--

INSERT INTO `o_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- --------------------------------------------------------

--
-- 表的结构 `o_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `o_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `o_auth_rule`
--

CREATE TABLE IF NOT EXISTS `o_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=217 ;

--
-- 转存表中的数据 `o_auth_rule`
--

INSERT INTO `o_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `o_category`
--

CREATE TABLE IF NOT EXISTS `o_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_page` varchar(100) DEFAULT NULL,
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `is_page` int(11) NOT NULL DEFAULT '0',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `content` text,
  `urll` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=99 ;

--
-- 转存表中的数据 `o_category`
--

INSERT INTO `o_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_page`, `template_lists`, `template_detail`, `template_edit`, `is_page`, `model`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `content`, `urll`) VALUES
(39, 'banner', 'banner管理', 0, 3, 10, '', '', '', '', NULL, '', '', '', 0, '4', '2', 0, 1, 1, 1, 0, '', '', 1500886407, 1501041980, 1, 0, NULL, NULL),
(40, 'indexb', '首页banner', 39, 0, 10, '', '', '', '', NULL, '', '', '', 0, '4', '2', 0, 1, 1, 1, 0, '', '', 1500886429, 1500886429, 1, 0, NULL, NULL),
(41, 'nav', '导航栏目', 0, 0, 10, '', '', '', '', NULL, '', '', '', 0, '', '', 0, 0, 1, 1, 0, '', '', 1500888363, 1500888363, 1, 0, NULL, NULL),
(42, 'youhui', '优惠活动', 41, 0, 10, '', '', '', 'list_you', '', 'list_you', 'product', '', 0, '2', '2', 0, 1, 1, 1, 0, '', '', 1500888395, 1501491515, 1, 0, '', ''),
(43, 'jiameng', '加盟合作', 41, 0, 10, '', '', '', '', 'jiameng', '', '', '', 1, '', '2', 0, 0, 1, 1, 0, '', '', 1500888412, 1501034365, 1, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', NULL),
(44, 'shangpin', '商品资讯', 41, 0, 10, '', '', '', 'lists', '', 'lists', 'show_gonggao', '', 0, '2', '2', 0, 1, 1, 1, 0, '', '', 1500888426, 1501036192, 1, 0, '', NULL),
(45, 'shumeng', '数梦学院', 41, 0, 10, '', '', '', '', '', '', '', '', 0, '2', '2', 0, 1, 1, 1, 0, '', '', 1500888445, 1501117157, 1, 0, '', ''),
(46, 'dingjia', '定价方案', 41, 0, 10, '', '', '', '', '', '', '', '', 1, '', '2', 0, 0, 1, 1, 0, '', '', 1500888462, 1501037298, 1, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<br />\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费<br />', NULL),
(47, 'pronav', '产品分类', 0, 1, 10, '', '', '', '', NULL, '', '', '', 0, '', '', 0, 1, 1, 1, 0, '', '', 1500888507, 1501041975, 1, 0, NULL, NULL),
(48, 'tanxing', '弹性计算', 47, 0, 10, '', '', '', '', NULL, '', '', '', 0, '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1500888522, 1500945923, 1, 0, NULL, NULL),
(49, 'wangluo', '网络产品', 47, 1, 10, '', '', '', '', NULL, '', '', '', 0, '', '', 0, 1, 1, 1, 0, '', '', 1500888539, 1500888724, 1, 0, NULL, NULL),
(50, 'cunchu', '存储产品', 47, 2, 10, '', '', '', '', NULL, '', '', '', 0, '', '', 0, 1, 1, 1, 0, '', '', 1500888560, 1500888730, 1, 0, NULL, NULL),
(51, 'shujuku', '数据库产品', 47, 3, 10, '', '', '', '', NULL, '', '', '', 0, '', '', 0, 1, 1, 1, 0, '', '', 1500888574, 1500888741, 1, 0, NULL, NULL),
(52, 'anquan', '安全产品', 47, 4, 10, '', '', '', '', NULL, '', '', '', 0, '', '', 0, 1, 1, 1, 0, '', '', 1500888586, 1500888748, 1, 0, NULL, NULL),
(53, 'peixun', '培训课程', 47, 5, 10, '', '', '', '', NULL, '', '', '', 0, '', '', 0, 1, 1, 1, 0, '', '', 1500888601, 1500888754, 1, 0, NULL, NULL),
(54, 'renzheng', '认证考试', 47, 6, 10, '', '', '', '', NULL, '', '', '', 0, '', '', 0, 1, 1, 1, 0, '', '', 1500888615, 1500888759, 1, 0, NULL, NULL),
(55, 'ESC', '阿里云服务ESC', 48, 0, 10, '', '', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', '', '', '', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1500888814, 1501039616, 1, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', NULL),
(56, 'huoesc', '活云服务ECS ', 48, 0, 10, '', '', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', '', '', '', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1500888835, 1501038336, 1, 4, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', NULL),
(57, 'zhuanyou', '专有网络VPC', 49, 0, 10, '', '', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', '', '', '', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1500888884, 1501039726, 1, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', NULL),
(58, 'fuzai', '负载均衡SLB', 49, 0, 10, '', '', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘云服务器Elastic Compute Service(ECS)是阿里云提供的一种基', '', '', '', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1500888901, 1501039737, 1, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', NULL),
(59, 'tanxingip', '弹性公网IP', 49, 0, 10, '', '', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', '', '', '', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1500888922, 1501039747, 1, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', NULL),
(60, 'CDN', 'CDN', 49, 0, 10, '', '', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', '', '', '', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1500888935, 1501039757, 1, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', NULL),
(61, 'duixiang', '对象存储OSS', 50, 0, 10, '', '', '', '', '', '', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1500888951, 1501039776, 1, 0, '', NULL),
(62, 'guanxirds', '关系型数据库RDS', 51, 0, 10, '', '', '', '', '', '', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1500888967, 1501039786, 1, 0, '', NULL),
(63, 'ddos', 'DDoS高防IP', 52, 3, 10, '', '', '', '', '', '', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1500888980, 1501039838, 1, 0, '', NULL),
(64, 'web', 'web应用防火墙', 52, 2, 10, '', '', '', '', '', '', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1500888994, 1501039828, 1, 0, '', NULL),
(65, 'anqishi', '安骑士', 52, 1, 10, '', '', '', '', '', '', 'product', '', 0, '2', '2', 0, 1, 1, 1, 0, '', '', 1500889007, 1501039818, 1, 0, '', NULL),
(66, 'taishiganzhi', '态势感知', 52, 0, 10, '', '', '', '', '', '', 'product', '', 0, '2', '2', 0, 1, 1, 1, 0, '', '', 1500889023, 1501039805, 1, 0, '', NULL),
(67, 'yunjisuan', '云计算课程', 53, 0, 10, '', '', '', 'list_ke', '', 'list_ke', 'show_ke', '', 0, '5', '2', 0, 1, 1, 1, 0, '', '', 1500889060, 1501121270, 1, 0, '', ''),
(68, 'dashuju', '大数据课程', 53, 0, 10, '', '', '', 'list_ke', '', 'list_ke', 'show_ke', '', 0, '5', '2', 0, 1, 1, 1, 0, '', '', 1500889073, 1501121256, 1, 0, '', ''),
(69, 'aliyun', '阿里云弹性计算产品解析与实战', 54, 0, 10, '', '', '', 'list_ke', '', 'list_ke', 'show_ke', '', 0, '5', '2', 0, 1, 1, 1, 0, '', '', 1500889091, 1501121280, 1, 0, '', ''),
(70, 'shizhan', '阿里云产品解决方案基础解析与实战', 54, 0, 10, '', '', '', 'list_ke', '', 'list_ke', 'show_ke', '', 0, '5', '2', 0, 1, 1, 1, 0, '', '', 1500889113, 1501121291, 1, 0, '', ''),
(71, 'shouyebankuan', '首页板块', 0, 2, 10, '', '', '', '', '', '', '', '', 0, '2', '2', 0, 0, 1, 0, 0, '', '', 1500955933, 1501041978, 1, 0, '', NULL),
(72, 'toutiao', '头条', 71, 0, 10, '', '', '', 'lists', '', 'lists', 'show_gonggao', '', 0, '2', '2,1,3', 0, 1, 1, 0, 0, '', '', 1500956104, 1500974273, 1, 0, '', NULL),
(73, 'gonggao', '公告', 71, 1, 10, '', '', '', 'list_gonggao', '', 'list_gonggao', 'show_gonggao', '', 0, '2', '2,1,3', 0, 1, 1, 0, 0, '', '', 1500956822, 1501051460, 1, 0, '', NULL),
(75, 'kaifazhe', '开发者课堂', 71, 2, 10, '', '', '', 'kaifazhe', '', 'kaifazhe', 'kaifazhe_show', '', 0, '5', '2,1,3', 0, 1, 1, 0, 0, '', '', 1500977971, 1502355486, 1, 26, '', ''),
(76, 'mengji', '数梦工场案例集', 71, 3, 10, '', '', '', 'lists', '', 'lists', 'show_gonggao', '', 0, '2', '2', 0, 1, 1, 0, 0, '', '', 1501040830, 1502355516, 1, 27, '', ''),
(77, 'dnav', '底部导航', 0, 5, 10, '', '', '', '', '', '', '', '', 0, '', '', 0, 0, 1, 0, 0, '', '', 1501042022, 1501042022, 1, 0, '', NULL),
(78, 'jiejue', '解决方案', 77, 0, 10, '', '', '', '', '', '', '', '', 0, '', '', 0, 0, 1, 0, 0, '', '', 1501042083, 1501042083, 1, 0, '', NULL),
(79, 'hangye', '行业解决方案', 78, 0, 10, '', '', '', '', '', '', '', '', 1, '', '', 0, 0, 1, 0, 0, '', '', 1501042142, 1501042142, 1, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />', NULL),
(80, 'hunheyun', '混合云解决方案', 78, 1, 10, '', '', '', '', '', '', '', '', 1, '', '', 0, 0, 1, 0, 0, '', '', 1501042183, 1501042194, 1, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />', NULL),
(81, 'yunanquan', '云安全解决方案', 78, 2, 10, '', '', '', '', '', '', '', '', 1, '', '', 0, 0, 1, 0, 0, '', '', 1501042220, 1501042525, 1, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n<p>\r\n	云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n</p>\r\n<p>\r\n	云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n</p>\r\n<p>\r\n	云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<br />\r\n</p>', NULL),
(82, 'fuwu', '服务支持', 77, 0, 10, '', '', '', '', '', '', '', '', 0, '', '', 0, 0, 1, 0, 0, '', '', 1501042300, 1501042300, 1, 0, '', NULL),
(83, 'cjwt', '常见问题', 82, 0, 10, '', '', '', 'list_api', '', 'list_api', 'show_api', '', 0, '2', '2', 0, 1, 1, 0, 0, '', '', 1501042383, 1501046687, 1, 0, '', NULL),
(84, 'bzwd', '帮助文档', 82, 1, 10, '', '', '', 'list_api', '', 'list_api', 'show_api', '', 0, '2', '2', 0, 1, 1, 0, 0, '', '', 1501042455, 1501046699, 1, 0, '', NULL),
(85, 'api', 'API', 82, 2, 10, '', '', '', 'list_api', '', 'list_api', 'show_api', '', 0, '2', '2', 0, 1, 1, 0, 0, '', '', 1501042476, 1501046708, 1, 0, '', NULL),
(86, 'xwdt', '新闻动态', 77, 0, 10, '', '', '', '', '', '', '', '', 0, '', '', 0, 0, 1, 0, 0, '', '', 1501046989, 1501046989, 1, 0, '', NULL),
(87, 'gsxw', '公司新闻', 86, 0, 10, '', '', '', 'news_list', '', 'news_list', 'news_show', '', 0, '2', '2', 0, 1, 1, 0, 0, '', '', 1501047044, 1501047330, 1, 0, '', NULL),
(88, 'hyxw', '行业新闻', 86, 1, 10, '', '', '', 'news_list', '', 'news_list', 'news_show', '', 0, '2', '2', 0, 1, 1, 0, 0, '', '', 1501047069, 1501047354, 1, 0, '', NULL),
(89, 'zczy', '政策指引', 86, 3, 10, '', '', '', 'news_list', '', 'news_list', 'news_show', '', 0, '2', '2', 0, 1, 1, 0, 0, '', '', 1501047093, 1501047379, 1, 0, '', NULL),
(90, 'lxwm', '联系我们', 77, 0, 10, '', '', '', '', '', '', '', '', 1, '', '2', 0, 0, 1, 0, 0, '', '', 1501048894, 1501049291, 1, 0, '<ul class="contact clearBoth" style="color:#666666;font-family:微软雅黑;font-size:14px;">\r\n	<li style="font-size:13px;color:#707070;">\r\n		<div class="title" style="margin:0px 0px 12px;padding:0px;font-size:25px;color:#00ADE7;">\r\n			市场部\r\n		</div>\r\n		<p>\r\n			联系电话：010-64828803<br />\r\n公司传真：010-684828803<br />\r\n联系邮箱：myhz@mingyang100.com<br />\r\n联 系 人：李经理\r\n		</p>\r\n	</li>\r\n	<li style="font-size:13px;color:#707070;">\r\n		<div class="title" style="margin:0px 0px 12px;padding:0px;font-size:25px;color:#00ADE7;">\r\n			市场部\r\n		</div>\r\n		<p>\r\n			联系电话：010-64828803<br />\r\n公司传真：010-684828803<br />\r\n联系邮箱：myhz@mingyang100.com<br />\r\n联 系 人：李经理\r\n		</p>\r\n	</li>\r\n	<li style="font-size:13px;color:#707070;">\r\n		<div class="title" style="margin:0px 0px 12px;padding:0px;font-size:25px;color:#00ADE7;">\r\n			市场部\r\n		</div>\r\n		<p>\r\n			联系电话：010-64828803<br />\r\n公司传真：010-684828803<br />\r\n联系邮箱：myhz@mingyang100.com<br />\r\n联 系 人：李经理\r\n		</p>\r\n	</li>\r\n</ul>\r\n<br/>\r\n<br/>\r\n<img src="/Uploads/Editor/2017-07-26/5978313b06855.jpg" alt="" />', NULL),
(91, 'wddd', '我的订单', 71, 4, 10, '', '', '', '', '', '', '', '', 2, '', '2', 0, 0, 1, 0, 0, '', '', 1501051507, 1501053318, 1, 0, '', 'http://www.baidu.com'),
(92, 'wdsm', '我的数梦', 71, 5, 10, '', '', '', '', '', '', '', '', 2, '', '', 0, 0, 1, 0, 0, '', '', 1501053369, 1501053440, 1, 0, '', 'http://www.sina.com.cn'),
(93, 'kfzx', '客服中心', 71, 6, 10, '', '', '', '', '', '', '', '', 1, '', '', 0, 0, 1, 0, 0, '', '', 1501053471, 1501053486, 1, 0, '客服中心简介', ''),
(94, 'hzfw', '合作服务', 71, 7, 10, '', '', '', '', '', '', '', '', 1, '', '', 0, 0, 1, 0, 0, '', '', 1501053505, 1501053573, 1, 0, '合作服务简介', ''),
(95, 'ghzx', '规划中心', 71, 8, 10, '', '', '', '', '', '', '', '', 1, '', '', 0, 0, 1, 0, 0, '', '', 1501053528, 1501053584, 1, 0, '规划中心简介', ''),
(96, 'gywm', '关于我们', 71, 9, 10, '', '', '', '', '', '', '', '', 1, '', '', 0, 0, 1, 0, 0, '', '', 1501053547, 1501053589, 1, 0, '关于我们简介', ''),
(97, 'peiren', '培训课程和认证考试', 42, 0, 10, '', '', '', 'list_you', '', 'list_you', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 0, 0, '', '', 1501489569, 1501549101, 1, 0, '', ''),
(98, 'yunchanpin', '云产品', 42, 0, 10, '', '', '', 'list_you', '', 'list_you', 'product', '', 0, '2', '2,1,3', 0, 1, 1, 0, 0, '', '', 1501489615, 1501549110, 1, 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `o_channel`
--

CREATE TABLE IF NOT EXISTS `o_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `o_channel`
--

INSERT INTO `o_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(4, 0, '商品资讯', '/Home/Article/index/category/shangpin/catid/44/ccid/4.html', 4, 1500888208, 1502443679, 1, 0),
(2, 0, '优惠活动', '/Home/Article/index/category/youhui/catid/42/ccid/2.html', 2, 1379475131, 1501214487, 1, 0),
(3, 0, '加盟合作', '/Home/Article/index/category/jiameng/catid/43/ccid/3.html', 3, 1379475154, 1501214494, 1, 0),
(5, 0, '数梦学院', '/Home/Article/index/category/yunjisuan/catid/67/ccid/5.html', 5, 1500888228, 1501214509, 1, 0),
(6, 0, '定价方案', '/Home/Article/index/category/jiameng/catid/46/ccid/6.html', 6, 1500888248, 1501214516, 1, 0),
(7, 0, '控制台', 'http://qq.com', 7, 1500888264, 1501116762, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `o_config`
--

CREATE TABLE IF NOT EXISTS `o_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `o_config`
--

INSERT INTO `o_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '数梦工场', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '数梦工场', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '云服务器,数梦工场', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '京ICP备17078888号', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'default_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1),
(38, 'WEB_REGISTER', 1, '注册接口', 0, '', '', 1502271968, 1502271968, 1, 'http://47.93.225.150/manage/control/public/users/sendRegisterEmail', 0);

-- --------------------------------------------------------

--
-- 表的结构 `o_document`
--

CREATE TABLE IF NOT EXISTS `o_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `biaoqian` varchar(255) DEFAULT NULL COMMENT '标签',
  `ljxg` varchar(255) NOT NULL COMMENT '立即选购',
  `xptj` varchar(255) NOT NULL COMMENT '选配推荐',
  `price` varchar(255) NOT NULL COMMENT '价格',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=121 ;

--
-- 转存表中的数据 `o_document`
--

INSERT INTO `o_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`, `biaoqian`, `ljxg`, `xptj`, `price`) VALUES
(3, 1, 'banner2', 'banner2', 40, '', 0, 0, 4, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1500886825, 1502159555, -1, NULL, '', '', ''),
(4, 1, 'banner3', 'banner3', 40, '', 0, 0, 4, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1500886855, 1502159555, -1, NULL, '', '', ''),
(5, 1, 'banner4', 'banner4', 40, '', 0, 0, 4, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1500886872, 1502159555, -1, NULL, '', '', ''),
(43, 1, '', '大讲堂开讲啦', 75, '以中心地区带动发展已经成为我国目前培育经济新动能的主要方向。《经济参考报》记者从多个部门了解到，以北京、上海等大城市为主，我国部署了多批国家大数据中心、国家科学中心、国家制造业创新中心，今后几年有望陆续', 0, 0, 5, 2, 0, 0, 2, 1, 0, 0, 2, 0, 0, 0, 1500978120, 1501031479, 1, '', '', '', ''),
(10, 1, '', '阿里云服务器是什么样的', 56, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 16, 0, 0, 0, 1500950640, 1501123433, 1, '', '', '', ''),
(11, 1, '', '阿里云对云服务器进行扩容磁', 55, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 106, 0, 0, 0, 1500950760, 1502441567, 1, '', 'http://www.baidu.com', 'http://www.qq.com', '8587'),
(12, 1, '', 'ECS提供给每个用户的操作实体', 57, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 12, 0, 0, 0, 1500951720, 1501123486, 1, '', '', '', ''),
(13, 1, '', '云服务器ECS就像使用水', 58, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，\r\n', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 6, 0, 0, 0, 1500951780, 1501123517, 1, '', '', '', ''),
(14, 1, '', '阿里云来啦', 59, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1500953340, 1501040270, 1, '', '', '', ''),
(15, 1, '', '阿里云来吧哈哈', 60, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 3, 0, 0, 0, 1500953940, 1501040246, 1, '', '', '', ''),
(16, 1, '', '阿里云', 61, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 5, 0, 0, 0, 1500954000, 1501040328, 1, '', '', '', ''),
(17, 1, '', '关系型数据库', 62, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 16, 0, 0, 0, 1500954180, 1502442746, 1, '', '', '', '5967'),
(18, 1, '', '感知产品', 66, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1500954360, 1501040357, 1, '', '', '', ''),
(19, 1, '', '安全其实', 65, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1500954420, 1501040378, 1, '', '', '', ''),
(20, 1, '', 'web应用防火墙', 64, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 2, 0, 0, 0, 1500954420, 1501040396, 1, '', '', '', ''),
(21, 1, '', 'ddos', 63, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 6, 0, 0, 0, 1500954480, 1501040412, 1, '', '', '', ''),
(22, 1, '', '云计算课程', 67, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1500954720, 1501121375, -1, NULL, '', '', ''),
(23, 1, '', '大数据课程', 68, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每境', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1500954720, 1501121360, -1, NULL, '', '', ''),
(24, 1, '', '云计算课程2', 67, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务\r\n', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1500954960, 1501121375, -1, NULL, '', '', ''),
(25, 1, '', '大讲堂三个', 67, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 2, 0, 0, 0, 1500955200, 1501121375, -1, NULL, '', '', ''),
(26, 1, '', '大数据讲堂', 68, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1500955320, 1501121360, -1, NULL, '', '', ''),
(27, 1, '', '计算产品解析课堂一', 69, '服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是E', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1500955620, 1501121383, -1, NULL, '', '', ''),
(28, 1, '', '算产品解析课堂二', 69, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1500955620, 1501121383, -1, NULL, '', '', ''),
(29, 1, '', '解决方案实战一', 70, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、。', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1500955680, 1501121398, -1, NULL, '', '', ''),
(30, 1, '', '解决方案实战二', 70, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体', 0, 0, 2, 2, 4, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1500955740, 1501121398, -1, NULL, '', '', ''),
(31, 1, '', '怎样通过网上营销月入百万？', 72, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、', 0, 0, 2, 2, 4, 0, 3, 1, 0, 0, 30, 0, 0, 0, 1500956220, 1500956274, 1, NULL, '', '', ''),
(32, 1, '', '迎娶白富美需要什么？', 72, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、', 0, 0, 2, 2, 4, 0, 3, 1, 0, 0, 10, 0, 0, 0, 1500956220, 1500956268, 1, NULL, '', '', ''),
(33, 1, '', '如何成为马云这样的恶人', 72, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、', 0, 0, 2, 2, 4, 0, 3, 1, 0, 0, 5, 0, 0, 0, 1500956280, 1500956312, 1, NULL, '', '', ''),
(34, 1, '', '少打一局王者荣耀就能上手Spring Cloud?', 73, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体', 0, 0, 2, 2, 4, 0, 0, 1, 0, 0, 5, 0, 0, 0, 1500956880, 1500961205, 1, '说吧', '', '', ''),
(35, 1, '', '少打一局王者荣耀会出现什么后果？', 73, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体', 0, 0, 2, 2, 4, 0, 0, 1, 0, 0, 6, 0, 0, 0, 1500956940, 1500961196, 1, '阿里云', '', '', ''),
(36, 1, '', '最近投资什么产品比较好？', 73, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体', 0, 0, 2, 2, 4, 0, 0, 1, 0, 0, 9, 0, 0, 0, 1500957000, 1500961179, 1, '王者归来', '', '', ''),
(37, 1, '', '新的标题', 73, '发生', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 1500970020, 1500970069, 1, '', '', '', ''),
(42, 1, '', '开发者大讲堂', 75, '以中心地区带动发展已经成为我国目前培育经济新动能的主要方向。《经济参考报》记者从多个部门了解到，以北京、上海等大城市为\r\n', 0, 0, 5, 2, 0, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1500978060, 1501031090, 1, '', '', '', ''),
(45, 1, '', '开发者大讲堂', 75, '云服务器 ECS是一种弹性可伸缩的计 算服务，助您降低 IT 成本，提升运维 效率，使您更专注于核心业务创新', 0, 0, 5, 2, 0, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1500978720, 1501030479, 1, '', '', '', ''),
(46, 1, '', '阿里云eSc来', 75, '云服务器 ECS是一种弹性可伸缩的计 算服务，助您降低 IT 成本，提升运维 效率，使您更专注于核心业务创新', 0, 0, 5, 2, 0, 0, 2, 1, 0, 0, 3, 0, 0, 0, 1501030740, 1501119918, 1, '', '', '', ''),
(47, 1, '', '再次测试', 75, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例', 0, 0, 5, 2, 0, 0, 2, 1, 0, 0, 2, 0, 0, 0, 1501030920, 1501119445, -1, '', '', '', ''),
(48, 1, '', '如果成为北大才子', 72, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 1501032060, 1501032129, 1, '', '', '', ''),
(49, 1, '', '最近有什么优惠活动呢？', 42, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 10, 0, 0, 0, 1501033380, 1501489739, -1, '', '', '', ''),
(50, 1, '', '最近有什么优惠活动呢？', 42, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 1, 0, 0, 0, 1501033642, 1501489739, -1, '', '', '', ''),
(51, 1, '', '云服务器ECS实例是一个虚拟的计算环', 42, '云服务器ECS实例是一个虚拟的计算环云服务器ECS实例是一个虚拟的计算环云服务器ECS实例是一个虚拟的计算环云服务器ECS实例是一个虚拟的计算环', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 3, 0, 0, 0, 1501033738, 1501489739, -1, '', '', '', ''),
(52, 1, '', '云服务器ECS实例是一个虚拟的计算环', 42, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备。', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 15, 0, 0, 0, 1501033786, 1501489739, -1, '', '', '', ''),
(53, 1, '', '云服务器ECS实例是一个虚拟的计算环', 44, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 8, 0, 0, 100, 1501036260, 1501036588, 1, '', '', '', ''),
(54, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 44, '云服务器ECS实例是一个虚拟的计算环境云服务器ECS实例是一个虚拟的计算环境云服务器ECS实例是一个虚拟的计算环境云服务器ECS实例是一个虚拟的计算环境', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 7, 0, 0, 0, 1501036320, 1501036422, 1, '', '', '', ''),
(55, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 44, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中\r\n', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 4, 0, 0, 0, 1501036401, 1501036401, 1, '', '', '', ''),
(56, 1, '', '如挂载磁盘、创建快照、创建镜像，部署环境', 44, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 1501036967, 1501036967, 1, '', '', '', ''),
(57, 1, '', '服务器Elastic Compute Service(ECS)是阿里云', 76, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 1501041300, 1501041300, 1, '', '', '', ''),
(58, 1, '', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服', 76, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 2, 0, 0, 0, 1501041352, 1501041352, 1, '', '', '', ''),
(59, 1, '', '您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等', 76, '', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 4, 0, 0, 0, 1501041396, 1501041396, 1, '', '', '', ''),
(60, 1, '', '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存', 76, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 8, 0, 0, 0, 1501041422, 1501041422, 1, '', '', '', ''),
(61, 1, '', '腾讯帝国梦是个什么梦', 83, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1501046086, 1501046086, 1, '', '', '', ''),
(62, 1, '', '百度无人机是个什么概念', 83, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 4, 0, 0, 0, 1501046267, 1501046267, 1, '', '', '', ''),
(63, 1, '', '作为一家服务型公司最重要的是什么？', 83, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 4, 0, 0, 0, 1501046308, 1501046308, 1, '', '', '', ''),
(64, 1, '', '作为一家服务型公司最重要的是什么？', 84, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1501046368, 1501046368, 1, '', '', '', ''),
(65, 1, '', '百度无人机是个什么概念', 84, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1501046368, 1501046368, 1, '', '', '', ''),
(66, 1, '', '腾讯帝国梦是个什么梦', 84, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1501046368, 1501046368, 1, '', '', '', ''),
(67, 1, '', '腾讯帝国梦是个什么梦', 85, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1501046392, 1501046392, 1, '', '', '', ''),
(68, 1, '', '百度无人机是个什么概念', 85, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1501046392, 1501046392, 1, '', '', '', ''),
(69, 1, '', '作为一家服务型公司最重要的是什么？', 85, '云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1501046392, 1501046392, 1, '', '', '', ''),
(70, 1, '', '如果成为北大才子', 87, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 1501048045, 1501048045, 1, '', '', '', ''),
(71, 1, '', '如何成为马云这样的恶人', 87, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、', 0, 0, 2, 2, 4, 0, 3, 1, 0, 0, 6, 0, 0, 0, 1501048045, 1501048045, 1, NULL, '', '', ''),
(72, 1, '', '迎娶白富美需要什么？', 87, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、', 0, 0, 2, 2, 4, 0, 3, 1, 0, 0, 7, 0, 0, 0, 1501048045, 1501048045, 1, NULL, '', '', ''),
(73, 1, '', '怎样通过网上营销月入百万？', 87, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、', 0, 0, 2, 2, 4, 0, 3, 1, 0, 0, 22, 0, 0, 0, 1501048045, 1501048045, 1, NULL, '', '', ''),
(74, 1, '', '怎样通过网上营销月入百万？扯', 88, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、', 0, 0, 2, 2, 4, 0, 3, 1, 0, 0, 19, 0, 0, 0, 1501048020, 1501048115, 1, '', '', '', ''),
(75, 1, '', '迎娶白富美需要什么？金钱？气魄？', 88, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、', 0, 0, 2, 2, 4, 0, 3, 1, 0, 0, 6, 0, 0, 0, 1501048020, 1501048106, 1, '', '', '', ''),
(76, 1, '', '如何成为马云这样的恶人还是好人', 88, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、', 0, 0, 2, 2, 4, 0, 3, 1, 0, 0, 6, 0, 0, 0, 1501048020, 1501048094, 1, '', '', '', ''),
(77, 1, '', '如果成为北大才子的头条', 88, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力', 0, 0, 2, 2, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 1501048020, 1501048084, 1, '', '', '', ''),
(78, 1, '', '开发法这个', 75, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例', 0, 0, 5, 2, 0, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1501054260, 1501119445, -1, '', '', '', ''),
(79, 1, '', 'ceshi', 75, '1586', 0, 0, 5, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1501119393, 1501119438, -1, '', '', '', ''),
(80, 1, '', '4569', 75, 'cc', 0, 0, 5, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1501119426, 1501119438, -1, '', '', '', ''),
(81, 1, '', '【上云须知】全面了解阿里云能为你做什么', 75, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 0, 0, 2, 1, 0, 0, 18, 0, 0, 0, 1501120020, 1501120669, 1, '', 'http://www.baidu.com', '', ''),
(82, 1, '', '阿里云服务器 ECS讲课啦', 68, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 0, 0, 4, 0, 0, 0, 1501121460, 1501121754, 1, '', 'http://www.sina.com.cn', '', ''),
(83, 1, '', '您可以在实例上进行基本操作', 68, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 0, 0, 9, 0, 0, 0, 1501121580, 1501121623, 1, '', 'http://www.sina.com.cn', '', ''),
(84, 1, '', '开心大讲堂', 67, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 0, 0, 12, 0, 0, 0, 1501121700, 1502441430, 1, '', '', '', '569'),
(85, 1, '', '好好学习天天向上', 67, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 0, 0, 11, 0, 0, 0, 1501121760, 1502441413, 1, '', '', '', '587'),
(86, 1, '', '学习是成长的原动力', 69, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1501121940, 1501121952, 1, '', '', '', ''),
(87, 1, '', '您对所创建的实例拥有管理员权限', 69, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 0, 0, 7, 0, 0, 0, 1501122000, 1501122009, 1, '', '', '', ''),
(88, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 70, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1501122060, 1501122096, 1, '', '', '', ''),
(89, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 70, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1501122120, 1501122154, 1, '', '', '', ''),
(90, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 67, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 0, 0, 13, 0, 0, 0, 1501122240, 1502441400, 1, '', '', '', '5896'),
(91, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 98, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1501489762, 1501548619, -1, '', '', '', ''),
(92, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 98, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 0, 0, 1, 0, 0, 0, 1501489762, 1501548619, -1, '', '', '', ''),
(93, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 97, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 1501632000, 0, 1, 0, 0, 0, 1501489800, 1501548692, -1, '', '', '', ''),
(94, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 97, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 1501718400, 0, 2, 0, 0, 0, 1501489800, 1501548692, -1, '', '', '', ''),
(95, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 98, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 1501632000, 0, 1, 0, 0, 0, 1501489800, 1501548619, -1, '', '', '', ''),
(96, 1, '', '云服务器ECS', 98, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 1501632000, 0, 5, 0, 0, 0, 1501489800, 1501549337, -1, '', '', '', ''),
(97, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 97, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 1501545600, 0, 1, 0, 0, 0, 1501489800, 1501548692, -1, '', '', '', ''),
(98, 1, '', '云服务器ECS实例是一个虚拟的计算环境', 97, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 4, 0, 2, 1, 1501545600, 0, 2, 0, 0, 0, 1501489800, 1501548692, -1, '', '', '', ''),
(99, 1, '', '2云服务器ECS实例是一个虚拟的计算环境', 97, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 0, 0, 2, 1, 1501632000, 0, 7, 0, 0, 0, 1501489800, 1501549346, -1, '', '', '', ''),
(100, 1, '', '1云服务器ECS实例是一个虚拟的计算环境', 97, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 5, 2, 0, 0, 2, 1, 1501545600, 0, 6, 0, 0, 0, 1501489800, 1501548811, -1, '', '', '', ''),
(101, 1, '', '数梦工场服务器', 98, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩', 0, 0, 2, 2, 0, 0, 8, 1, 1501891200, 0, 1, 0, 0, 0, 1501549440, 1502443749, -1, '', 'http://www.sina.com.cn', 'http://www.baidu.com', ''),
(102, 1, '', '数梦工场云', 97, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中', 0, 0, 2, 2, 0, 0, 8, 1, 1501718400, 0, 1, 0, 0, 0, 1501549560, 1502443803, -1, '', 'http://www.sina.com.cn', 'http://qq.com', ''),
(103, 1, '', '数梦工场云服务', 97, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中', 0, 0, 2, 2, 0, 0, 8, 1, 1501636020, 0, 0, 0, 0, 0, 1501549620, 1502443803, -1, '', '', '', ''),
(104, 1, '', '1', 39, '', 0, 0, 4, 2, 0, 0, 9, 1, 0, 0, 0, 0, 0, 0, 1502159096, 1502159566, -1, '', '', '', ''),
(105, 1, '', '2', 39, '', 0, 0, 4, 2, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 1502159109, 1502159566, -1, '', '', '', ''),
(106, 1, '', '3', 39, '', 0, 0, 4, 2, 0, 0, 11, 1, 0, 0, 0, 0, 0, 0, 1502159125, 1502159566, -1, '', '', '', ''),
(107, 1, '', '4', 39, '', 0, 0, 4, 2, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 1502159139, 1502159566, -1, '', '', '', ''),
(108, 1, '', '5', 39, '', 0, 0, 4, 2, 0, 0, 13, 1, 0, 0, 0, 0, 0, 0, 1502159156, 1502159566, -1, '', '', '', ''),
(109, 1, '', '1', 40, '', 0, 0, 4, 2, 0, 0, 14, 1, 0, 0, 0, 0, 0, 0, 1502159460, 1502339069, -1, '', '', '', ''),
(110, 1, '', '2', 40, '', 0, 0, 4, 2, 0, 0, 15, 1, 0, 0, 0, 0, 0, 0, 1502159460, 1502339069, -1, '', '', '', ''),
(111, 1, '', '3', 40, '', 0, 0, 4, 2, 0, 0, 16, 1, 0, 0, 0, 0, 0, 0, 1502159460, 1502339069, -1, '', '', '', ''),
(112, 1, '', '4', 40, '', 0, 0, 4, 2, 0, 0, 17, 1, 0, 0, 0, 0, 0, 0, 1502159520, 1502339069, -1, '', '', '', ''),
(113, 1, '', '5', 40, '', 0, 0, 4, 2, 0, 0, 21, 1, 0, 0, 0, 0, 0, 118, 1502159520, 1502354789, 1, '', '', '', ''),
(114, 1, '', '2', 40, '', 0, 0, 4, 2, 0, 0, 22, 1, 0, 0, 0, 0, 0, 117, 1502350500, 1502354805, 1, '', '', '', ''),
(115, 1, '', '3', 40, '', 0, 0, 4, 2, 0, 0, 23, 1, 0, 0, 0, 0, 0, 115, 1502350500, 1502354820, 1, '', '', '', ''),
(116, 1, '', '4', 40, '', 0, 0, 4, 2, 0, 0, 24, 1, 0, 0, 0, 0, 0, 114, 1502354700, 1502354829, 1, '', '', '', ''),
(117, 1, '', '5', 40, '', 0, 0, 4, 2, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 1502354764, 1502354764, 1, '', '', '', ''),
(118, 1, 'ssss', 'ceshi', 98, 'sssss', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1502443780, 1502443789, -1, 'ss', '', '', ''),
(119, 1, 'fdfs', 'cesff', 97, 'fsfs', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1502443816, 1502443830, -1, 'fds', '', '', ''),
(120, 1, '', '测试云产品', 98, '描述', 0, 0, 2, 2, 0, 0, 2, 1, 1504224000, 0, 3, 0, 0, 0, 1502444700, 1502444999, 1, '', '', '', '520');

-- --------------------------------------------------------

--
-- 表的结构 `o_document_article`
--

CREATE TABLE IF NOT EXISTS `o_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `product` int(10) unsigned NOT NULL COMMENT '产品图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `o_document_article`
--

INSERT INTO `o_document_article` (`id`, `parse`, `content`, `template`, `bookmark`, `product`) VALUES
(48, 0, '<span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span>', '', 0, 0),
(49, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '', 0, 0),
(10, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', '', 0, 4),
(11, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘', '', 0, 4),
(12, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />', '', 0, 4),
(13, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />', '', 0, 4),
(14, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<br />', '', 0, 4),
(15, 0, '<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境</span>', '', 0, 4),
(16, 0, '<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境</span>', '', 0, 4),
(17, 0, '<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境</span>', '', 0, 4),
(18, 0, '<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境</span>', '', 0, 4),
(19, 0, '<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境</span>', '', 0, 4),
(20, 0, '<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境</span>', '', 0, 4),
(21, 0, '<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境</span>', '', 0, 4),
(22, 0, '<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境</span>', '', 0, 0),
(23, 0, '大数据课程<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境</span>', '', 0, 0),
(24, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />', '', 0, 0),
(25, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />', '', 0, 0),
(26, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />', '', 0, 0),
(27, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />', '', 0, 0),
(28, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />', '', 0, 0),
(29, 0, '<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。</span>', '', 0, 0),
(30, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />', '', 0, 0),
(31, 0, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、信任力和行动力、符合目标客户人群的喜好等特点。营销型企业网站是指可以为企业带来大量的意向客户，最终通营销型网站<br />', '', 0, 0),
(32, 0, '<span>营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎</span><span>良好为表现、用户良好体验为标准，具备理解力、信任力和行动力、符合目标客户</span><span>人群的喜好等特点。营销型企业网站是指可以为企业带来大量的意向客户，最终通</span><span>营销型网站</span>', '', 0, 0),
(33, 0, '<span>营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎</span><span>良好为表现、用户良好体验为标准，具备理解力、信任力和行动力、符合目标客户</span><span>人群的喜好等特点。营销型企业网站是指可以为企业带来大量的意向客户，最终通</span><span>营销型网站</span>', '', 0, 0),
(34, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />', '', 0, 0),
(35, 0, '<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体</span>', '', 0, 0),
(36, 0, '<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体</span>', '', 0, 0),
(37, 0, '舒服撒发顺丰', '', 0, 0),
(50, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '', 0, 0),
(51, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '', 0, 0),
(52, 0, '<span>云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n</span>', '', 0, 0),
(53, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '', 0, 0),
(54, 0, '<p>\r\n	<span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span> \r\n</p>\r\n<p>\r\n	<span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span></span> \r\n</p>\r\n<p>\r\n	<span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span></span> \r\n</p>\r\n<p>\r\n	<span><span>云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限</span><br />\r\n</span> \r\n</p>', '', 0, 0),
(55, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '', 0, 0),
(56, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '', 0, 0),
(57, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n<p>\r\n	云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n</p>\r\n<p>\r\n	云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n</p>', '', 0, 0),
(58, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n<p>\r\n	云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n</p>\r\n<p>\r\n	云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n</p>', '', 0, 0),
(59, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n<p>\r\n	云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n</p>\r\n<p>\r\n	云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n</p>', '', 0, 0),
(60, 0, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n<p>\r\n	云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n</p>\r\n<p>\r\n	云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n</p>', '', 0, 0);
INSERT INTO `o_document_article` (`id`, `parse`, `content`, `template`, `bookmark`, `product`) VALUES
(61, 0, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />', '', 0, 0),
(62, 0, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />', '', 0, 0),
(63, 0, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />', '', 0, 0),
(64, 0, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />', '', 0, 0),
(65, 0, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />', '', 0, 0),
(66, 0, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />', '', 0, 0),
(67, 0, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />', '', 0, 0),
(68, 0, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />', '', 0, 0),
(69, 0, '服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />\r\n服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等<br />', '', 0, 0),
(70, 0, '<span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span>', '', 0, 0),
(71, 0, '<span>营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎</span><span>良好为表现、用户良好体验为标准，具备理解力、信任力和行动力、符合目标客户</span><span>人群的喜好等特点。营销型企业网站是指可以为企业带来大量的意向客户，最终通</span><span>营销型网站</span>', '', 0, 0),
(72, 0, '<span>营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎</span><span>良好为表现、用户良好体验为标准，具备理解力、信任力和行动力、符合目标客户</span><span>人群的喜好等特点。营销型企业网站是指可以为企业带来大量的意向客户，最终通</span><span>营销型网站</span>', '', 0, 0),
(73, 0, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、信任力和行动力、符合目标客户人群的喜好等特点。营销型企业网站是指可以为企业带来大量的意向客户，最终通营销型网站<br />', '', 0, 0),
(74, 0, '营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力、信任力和行动力、符合目标客户人群的喜好等特点。营销型企业网站是指可以为企业带来大量的意向客户，最终通营销型网站<br />', '', 0, 0),
(75, 0, '<span>营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎</span><span>良好为表现、用户良好体验为标准，具备理解力、信任力和行动力、符合目标客户</span><span>人群的喜好等特点。营销型企业网站是指可以为企业带来大量的意向客户，最终通</span><span>营销型网站</span>', '', 0, 0),
(76, 0, '<span>营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎</span><span>良好为表现、用户良好体验为标准，具备理解力、信任力和行动力、符合目标客户</span><span>人群的喜好等特点。营销型企业网站是指可以为企业带来大量的意向客户，最终通</span><span>营销型网站</span>', '', 0, 0),
(77, 0, '<span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span><span style="color:#707070;font-family:微软雅黑;font-size:14px;">营销型网站并不局限于商场类的网站，它拥有订单、成交、购买等性质，搜索引擎良好为表现、用户良好体验为标准，具备理解力</span>', '', 0, 0),
(101, 0, '<span style="color:#666666;font-family:微软雅黑;font-size:14px;">云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。 云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等</span>', '', 0, 4),
(102, 0, '<span style="color:#666666;font-family:微软雅黑;font-size:14px;">云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。 云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等</span>', '', 0, 4),
(103, 0, '<span style="color:#666666;font-family:微软雅黑;font-size:14px;">云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中</span><span style="color:#666666;font-family:微软雅黑;font-size:14px;">云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中</span>', '', 0, 4),
(118, 0, '2222', '', 0, 0),
(119, 0, 'fsf', '', 0, 0),
(120, 0, '测试内容', '', 0, 7);

-- --------------------------------------------------------

--
-- 表的结构 `o_document_banner`
--

CREATE TABLE IF NOT EXISTS `o_document_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title_en` text NOT NULL COMMENT '英文名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=118 ;

--
-- 转存表中的数据 `o_document_banner`
--

INSERT INTO `o_document_banner` (`id`, `title_en`) VALUES
(3, ''),
(4, ''),
(5, ''),
(104, ''),
(105, ''),
(106, ''),
(107, ''),
(108, ''),
(109, ''),
(110, ''),
(111, ''),
(112, ''),
(113, ''),
(114, ''),
(115, ''),
(116, ''),
(117, '');

-- --------------------------------------------------------

--
-- 表的结构 `o_document_download`
--

CREATE TABLE IF NOT EXISTS `o_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `o_document_ketang`
--

CREATE TABLE IF NOT EXISTS `o_document_ketang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `introduction` text NOT NULL COMMENT '产品简介',
  `content` text NOT NULL COMMENT '产品概述',
  `pimage` int(10) unsigned NOT NULL COMMENT '产品图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=101 ;

--
-- 转存表中的数据 `o_document_ketang`
--

INSERT INTO `o_document_ketang` (`id`, `introduction`, `content`, `pimage`) VALUES
(45, '', '', 0),
(46, '简介', '产品概述', 0),
(42, '3344', '', 0),
(43, '册', '', 0),
(47, '册', '', 0),
(78, '222', '', 0),
(79, '123', '', 0),
(80, '12', '', 0),
(81, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘', 7),
(82, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(83, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(84, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(85, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(86, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(87, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(88, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(89, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(90, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(91, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(92, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(93, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(94, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(95, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7);
INSERT INTO `o_document_ketang` (`id`, `introduction`, `content`, `pimage`) VALUES
(96, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(97, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(98, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(99, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7),
(100, '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>\r\n云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。<br />\r\n<br />\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。<br />\r\n<div>\r\n	<br />\r\n</div>', '云服务器Elastic Compute Service(ECS)是阿里云提供的一种基础云计算服务。使用云服务器ECS就像使用水、电、煤气等资源一样便捷、高效。您无需提前采购硬件设备，而是根据业务需要，随时创建所需数量的云服务器实例，并在使用过程中，随着业务的扩展，对云服务器进行扩容磁盘、增加宽带。如果不再需要云服务器，也可以方便的释放资源，节省费用。\r\n\r\n云服务器ECS实例是一个虚拟的计算环境，包含了CPU、内存、操作系统、磁盘、带宽等最基础的服务器组件，是ECS提供给每个用户的操作实体。一个实例就等同于一台虚拟机，您对所创建的实例拥有管理员权限，可以随时登录进行使用和管理。您可以在实例上进行基本操作，如挂载磁盘、创建快照、创建镜像，部署环境等。\r\n', 7);

-- --------------------------------------------------------

--
-- 表的结构 `o_file`
--

CREATE TABLE IF NOT EXISTS `o_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o_hooks`
--

CREATE TABLE IF NOT EXISTS `o_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `o_hooks`
--

INSERT INTO `o_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, ''),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop'),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment'),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment'),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, ''),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment'),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor'),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam'),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor'),
(16, 'app_begin', '应用开始', 2, 1384481614, '');

-- --------------------------------------------------------

--
-- 表的结构 `o_member`
--

CREATE TABLE IF NOT EXISTS `o_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `o_member`
--

INSERT INTO `o_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', 0, '0000-00-00', '', 60, 25, 0, 1500886090, 1885209894, 1502442311, 1);

-- --------------------------------------------------------

--
-- 表的结构 `o_menu`
--

CREATE TABLE IF NOT EXISTS `o_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=122 ;

--
-- 转存表中的数据 `o_menu`
--

INSERT INTO `o_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0),
(2, '内容', 0, 2, 'Article/mydocument', 0, '', '', 0),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0),
(16, '用户', 0, 3, 'User/index', 0, '', '', 0),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0),
(43, '扩展', 0, 7, 'Addons/index', 1, '', '', 0),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0),
(93, '其他', 0, 5, 'other', 1, '', '', 0),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0),
(104, '下载管理', 102, 0, 'Think/lists?model=download', 0, '', '', 0),
(105, '配置管理', 102, 0, 'Think/lists?model=config', 0, '', '', 0),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `o_model`
--

CREATE TABLE IF NOT EXISTS `o_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `o_model`
--

INSERT INTO `o_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","5","12","42","2","36"],"2":["9","13","19","10","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', 0, '', '', 1383891243, 1501041233, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM'),
(4, 'banner', 'banner', 1, '', 1, '', '1:基础', '', '', '', '', '', 10, '', '', 1500886209, 1500886209, 1, 'MyISAM'),
(5, 'ketang', '课堂', 1, '', 1, '{"1":["3","37","12","45","5","41","40","43","20","19"],"2":["11","2","9","10","16","13","14","17","36","44"]}', '1:基础;2:扩展', '', '', '', '', 'id:编号\r\nlevel:排序ID\r\ntitle:标题:[EDIT]', 10, '', '', 1500974581, 1501120635, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `o_picture`
--

CREATE TABLE IF NOT EXISTS `o_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `o_picture`
--

INSERT INTO `o_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2017-07-24/5975b725e2f8c.jpg', '', 'd6b411c20d4f9a7575f4d95eefc8dd27', '14dd0409373d6ca833aa0ed6a4c7a818654a8c76', 1, 1500886821),
(2, '/Uploads/Picture/2017-07-25/5976bab5f372a.png', '', 'e7ac80c3d7258b0cb796c3e1d79ce524', 'af79038aef2d40f57077766c901f60cff8e33b9b', 1, 1500953269),
(3, '/Uploads/Picture/2017-07-25/5976c642e6185.jpg', '', '38ad85a5fc75b2d2c1a96d324917a11c', '89dbca322d5775aaebab71bc2f3cd18beab845e8', 1, 1500956226),
(4, '/Uploads/Picture/2017-07-26/597806fd58881.jpg', '', '468a2080bbb180776ba570a17b87654b', 'b7e64a8d92eaac70b31a957a6aee358abfac97e1', 1, 1501038333),
(5, '/Uploads/Picture/2017-07-27/5979405017e7a.jpg', '', '71dcbcb3e16745ffdb478b065095e8b3', '3b23c0d02b1364f11cc1eefae8a09bcdfb7bc04e', 1, 1501118543),
(6, '/Uploads/Picture/2017-07-27/597940749c01c.jpg', '', '27d499446263d3cf42fd0f0890fbc16b', '65af7b86821a1d6594516d5bd2316b74f7ebba8f', 1, 1501118580),
(7, '/Uploads/Picture/2017-07-27/597945f63e571.jpg', '', '8f7baeea268db0ab58c8dc9b4c26af8a', '4efe2b9300a5ad5492ddfce184c67e8ca3c72189', 1, 1501119990),
(8, '/Uploads/Picture/2017-08-01/597fd37432a16.jpg', '', 'b1d2dd14594d405a33f457dece00b017', '33bde6279525689d3f18184c94f830f1d2e79a73', 1, 1501549428),
(9, '/Uploads/Picture/2017-08-08/598920ed87dca.jpg', '', 'c076cbd7ad91007eb8f15009549e939b', '616ea21269d9c6f35fed5d712e39da88057ec0c9', 1, 1502159085),
(10, '/Uploads/Picture/2017-08-08/598921035cfee.jpg', '', 'a1e3fc5a14a84a5bda8665e2b16c01ca', 'bf0f5ac7b09c482a83a617ced915e2cf17a13eee', 1, 1502159107),
(11, '/Uploads/Picture/2017-08-08/598921129f609.jpg', '', '9cf3c383b13710f078b9d5ed3d0cbed3', '4b02dd25805e4f868a43a4db39e0468d56fb963b', 1, 1502159122),
(12, '/Uploads/Picture/2017-08-08/598921201457e.jpg', '', '23340506897d3ee1ba1b4f7ddf4d6160', '3aaba8385948873ce4e289841d4ae70bf9aec58d', 1, 1502159135),
(13, '/Uploads/Picture/2017-08-08/598921313fd3b.jpg', '', 'cf5937ff659fa041b2968584959b98e2', 'b3ccff4d63510c9ac3fcbb5c9aa139e8e1273fbf', 1, 1502159153),
(14, '/Uploads/Picture/2017-08-08/598925e5087db.jpg', '', 'b1c3bbea1d9f20554a9e630dbdad6504', '95bcfb3a6bfb4b06d455fda3669ab052150bd203', 1, 1502160356),
(15, '/Uploads/Picture/2017-08-08/598925f141ad0.jpg', '', 'c5099d9e6b7daecb5a05e20d391ec3d0', '7f56b54b33255d3af70f2781a687bea65e1873dc', 1, 1502160369),
(16, '/Uploads/Picture/2017-08-08/598925fd51074.jpg', '', '1e9a402005b4dec339e4d3cf3c1f8869', 'a06442c5e090689eaae459fd4997e4ae7768c8a4', 1, 1502160381),
(17, '/Uploads/Picture/2017-08-08/5989260bc26d7.jpg', '', 'ce2c79ebb1319e023179df43a61d5cf1', '9ad4ceb1232356a5f54bf83e982019eeb096698c', 1, 1502160395),
(18, '/Uploads/Picture/2017-08-08/59892619cda0e.jpg', '', '0fe42d8e7081f74dc28806ecd86e73e1', 'fb12b7fbfd6c9622932af9afbc0bb36fe7f0164f', 1, 1502160409),
(19, '/Uploads/Picture/2017-08-08/598926886aac9.jpg', '', '7220a07003017173551b4ffa0a21e36a', '518510c551887a6e5caf473279811886f5334f46', 1, 1502160520),
(20, '/Uploads/Picture/2017-08-08/5989269caee16.jpg', '', 'd9b034c2caa3d9dcc9b78f768e614270', 'e1b8fea9b6db9b42bfa58c68c618e287caffb2de', 1, 1502160540),
(21, '/Uploads/Picture/2017-08-10/598be01f20123.jpg', '', '3af342e4e4b887b7eddca78a05ae93a6', 'd9dce00b879f148b5e05bd28363eccc1745f4a53', 1, 1502339102),
(22, '/Uploads/Picture/2017-08-10/598c0c9de5b51.jpg', '', 'eab16b40eeecb284bce4f6c4b6ca4244', 'a20a0ca1ce9295b8efcdf3489caa4fa15e6997c3', 1, 1502350493),
(23, '/Uploads/Picture/2017-08-10/598c0cb93e53b.jpg', '', '62e103897c3191e6a7ebc4dc33d2b558', 'ef4cac15113a73500f8db2e23550d4e56bb2663c', 1, 1502350521),
(24, '/Uploads/Picture/2017-08-10/598c1d39b17c9.jpg', '', '9d0ffc945fcf1750a9e2c1b48418a3a5', 'cfcd3960cb7b5ff4dd95ecc35084cd5f424cfddc', 1, 1502354745),
(25, '/Uploads/Picture/2017-08-10/598c1d4936a7a.jpg', '', '934d544ce847eb4e409476be91ff545c', '0ab34beb255caad6e9e6aca4cbfc99bf595a4cea', 1, 1502354761),
(26, '/Uploads/Picture/2017-08-10/598c201bd4bf6.jpg', '', 'c0ffaa93767903ff85455ea73105872d', '9062d26295c1e0b131391285a0a48757cc614b61', 1, 1502355483),
(27, '/Uploads/Picture/2017-08-10/598c203a28109.jpg', '', 'cf0f2976ab09ff61520931984c2ca172', '971cbf756e5baddce3119ca44ce89de2e0e9a66d', 1, 1502355513);

-- --------------------------------------------------------

--
-- 表的结构 `o_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `o_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `o_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `o_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `o_ucenter_member`
--

INSERT INTO `o_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '9954d6cbcd0eb2807e7d14e6da8e5cda', '858174095@qq.com', '', 1500886090, 2130706433, 1502442311, 1885209894, 1500886090, 1);

-- --------------------------------------------------------

--
-- 表的结构 `o_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `o_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o_url`
--

CREATE TABLE IF NOT EXISTS `o_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o_userdata`
--

CREATE TABLE IF NOT EXISTS `o_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
