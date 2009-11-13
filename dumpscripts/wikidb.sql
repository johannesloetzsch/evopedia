-- MySQL dump 10.11
--
-- Host: localhost    Database: wikidb
-- ------------------------------------------------------
-- Server version	5.0.70

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `__PREFIX__archive`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__archive` (
  `ar_namespace` int(11) NOT NULL default '0',
  `ar_title` varbinary(255) NOT NULL default '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` tinyblob NOT NULL,
  `ar_user` int(10) unsigned NOT NULL default '0',
  `ar_user_text` varbinary(255) NOT NULL,
  `ar_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL default '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned default NULL,
  `ar_text_id` int(10) unsigned default NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL default '0',
  `ar_len` int(10) unsigned default NULL,
  `ar_page_id` int(10) unsigned default NULL,
  `ar_parent_id` int(10) unsigned default NULL,
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `__PREFIX__category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__category` (
  `cat_id` int(10) unsigned NOT NULL auto_increment,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL default '0',
  `cat_subcats` int(11) NOT NULL default '0',
  `cat_files` int(11) NOT NULL default '0',
  `cat_hidden` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categorylinks`
--

DROP TABLE IF EXISTS `__PREFIX__categorylinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__categorylinks` (
  `cl_from` int(10) unsigned NOT NULL default '0',
  `cl_to` varbinary(255) NOT NULL default '',
  `cl_sortkey` varbinary(70) NOT NULL default '',
  `cl_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `externallinks`
--

DROP TABLE IF EXISTS `__PREFIX__externallinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__externallinks` (
  `el_from` int(10) unsigned NOT NULL default '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60))
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `filearchive`
--

DROP TABLE IF EXISTS `__PREFIX__filearchive`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__filearchive` (
  `fa_id` int(11) NOT NULL auto_increment,
  `fa_name` varbinary(255) NOT NULL default '',
  `fa_archive_name` varbinary(255) default '',
  `fa_storage_group` varbinary(16) default NULL,
  `fa_storage_key` varbinary(64) default '',
  `fa_deleted_user` int(11) default NULL,
  `fa_deleted_timestamp` binary(14) default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` blob,
  `fa_size` int(10) unsigned default '0',
  `fa_width` int(11) default '0',
  `fa_height` int(11) default '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) default '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') default 'unknown',
  `fa_minor_mime` varbinary(32) default 'unknown',
  `fa_description` tinyblob,
  `fa_user` int(10) unsigned default '0',
  `fa_user_text` varbinary(255) default NULL,
  `fa_timestamp` binary(14) default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hitcounter`
--

DROP TABLE IF EXISTS `__PREFIX__hitcounter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__hitcounter` (
  `hc_id` int(10) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8 MAX_ROWS=25000;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `__PREFIX__image`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__image` (
  `img_name` varbinary(255) NOT NULL default '',
  `img_size` int(10) unsigned NOT NULL default '0',
  `img_width` int(11) NOT NULL default '0',
  `img_height` int(11) NOT NULL default '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL default '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL default 'unknown',
  `img_minor_mime` varbinary(32) NOT NULL default 'unknown',
  `img_description` tinyblob NOT NULL,
  `img_user` int(10) unsigned NOT NULL default '0',
  `img_user_text` varbinary(255) NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL default '',
  `img_sha1` varbinary(32) NOT NULL default '',
  PRIMARY KEY  (`img_name`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `imagelinks`
--

DROP TABLE IF EXISTS `__PREFIX__imagelinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__imagelinks` (
  `il_from` int(10) unsigned NOT NULL default '0',
  `il_to` varbinary(255) NOT NULL default '',
  UNIQUE KEY `il_from` (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `interwiki`
--

DROP TABLE IF EXISTS `__PREFIX__interwiki`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__interwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL default '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ipblocks`
--

DROP TABLE IF EXISTS `__PREFIX__ipblocks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__ipblocks` (
  `ipb_id` int(11) NOT NULL auto_increment,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL default '0',
  `ipb_by` int(10) unsigned NOT NULL default '0',
  `ipb_by_text` varbinary(255) NOT NULL default '',
  `ipb_reason` tinyblob NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL default '0',
  `ipb_anon_only` tinyint(1) NOT NULL default '0',
  `ipb_create_account` tinyint(1) NOT NULL default '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL default '1',
  `ipb_expiry` varbinary(14) NOT NULL default '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL default '0',
  `ipb_block_email` tinyint(1) NOT NULL default '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `__PREFIX__job`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__job` (
  `job_id` int(10) unsigned NOT NULL auto_increment,
  `job_cmd` varbinary(60) NOT NULL default '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_params` blob NOT NULL,
  PRIMARY KEY  (`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `langlinks`
--

DROP TABLE IF EXISTS `__PREFIX__langlinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__langlinks` (
  `ll_from` int(10) unsigned NOT NULL default '0',
  `ll_lang` varbinary(20) NOT NULL default '',
  `ll_title` varbinary(255) NOT NULL default '',
  UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `__PREFIX__logging`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__logging` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `log_type` varbinary(10) NOT NULL default '',
  `log_action` varbinary(10) NOT NULL default '',
  `log_timestamp` binary(14) NOT NULL default '19700101000000',
  `log_user` int(10) unsigned NOT NULL default '0',
  `log_namespace` int(11) NOT NULL default '0',
  `log_title` varbinary(255) NOT NULL default '',
  `log_comment` varbinary(255) NOT NULL default '',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `math`
--

DROP TABLE IF EXISTS `__PREFIX__math`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__math` (
  `math_inputhash` varbinary(16) NOT NULL,
  `math_outputhash` varbinary(16) NOT NULL,
  `math_html_conservativeness` tinyint(4) NOT NULL,
  `math_html` blob,
  `math_mathml` blob,
  UNIQUE KEY `math_inputhash` (`math_inputhash`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `objectcache`
--

DROP TABLE IF EXISTS `__PREFIX__objectcache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__objectcache` (
  `keyname` varbinary(255) NOT NULL default '',
  `value` mediumblob,
  `exptime` datetime default NULL,
  PRIMARY KEY  (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oldimage`
--

DROP TABLE IF EXISTS `__PREFIX__oldimage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__oldimage` (
  `oi_name` varbinary(255) NOT NULL default '',
  `oi_archive_name` varbinary(255) NOT NULL default '',
  `oi_size` int(10) unsigned NOT NULL default '0',
  `oi_width` int(11) NOT NULL default '0',
  `oi_height` int(11) NOT NULL default '0',
  `oi_bits` int(11) NOT NULL default '0',
  `oi_description` tinyblob NOT NULL,
  `oi_user` int(10) unsigned NOT NULL default '0',
  `oi_user_text` varbinary(255) NOT NULL,
  `oi_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL default 'unknown',
  `oi_minor_mime` varbinary(32) NOT NULL default 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL default '0',
  `oi_sha1` varbinary(32) NOT NULL default '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `__PREFIX__page`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__page` (
  `page_id` int(10) unsigned NOT NULL auto_increment,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_counter` bigint(20) unsigned NOT NULL default '0',
  `page_is_redirect` tinyint(3) unsigned NOT NULL default '0',
  `page_is_new` tinyint(3) unsigned NOT NULL default '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`)
) ENGINE=MyISAM AUTO_INCREMENT=4466088 DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `page_props`
--

DROP TABLE IF EXISTS `__PREFIX__page_props`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  PRIMARY KEY  (`pp_page`,`pp_propname`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `page_restrictions`
--

DROP TABLE IF EXISTS `__PREFIX__page_restrictions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__page_restrictions` (
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) default NULL,
  `pr_expiry` varbinary(14) default NULL,
  `pr_id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`pr_page`,`pr_type`),
  UNIQUE KEY `pr_id` (`pr_id`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `__PREFIX__pagelinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__pagelinks` (
  `pl_from` int(10) unsigned NOT NULL default '0',
  `pl_namespace` int(11) NOT NULL default '0',
  `pl_title` varbinary(255) NOT NULL default '',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `protected_titles`
--

DROP TABLE IF EXISTS `__PREFIX__protected_titles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` tinyblob,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL default '',
  `pt_create_perm` varbinary(60) NOT NULL,
  PRIMARY KEY  (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `querycache`
--

DROP TABLE IF EXISTS `__PREFIX__querycache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL default '0',
  `qc_namespace` int(11) NOT NULL default '0',
  `qc_title` varbinary(255) NOT NULL default '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `querycache_info`
--

DROP TABLE IF EXISTS `__PREFIX__querycache_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__querycache_info` (
  `qci_type` varbinary(32) NOT NULL default '',
  `qci_timestamp` binary(14) NOT NULL default '19700101000000',
  UNIQUE KEY `qci_type` (`qci_type`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `querycachetwo`
--

DROP TABLE IF EXISTS `__PREFIX__querycachetwo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL default '0',
  `qcc_namespace` int(11) NOT NULL default '0',
  `qcc_title` varbinary(255) NOT NULL default '',
  `qcc_namespacetwo` int(11) NOT NULL default '0',
  `qcc_titletwo` varbinary(255) NOT NULL default '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `recentchanges`
--

DROP TABLE IF EXISTS `__PREFIX__recentchanges`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__recentchanges` (
  `rc_id` int(11) NOT NULL auto_increment,
  `rc_timestamp` varbinary(14) NOT NULL default '',
  `rc_cur_time` varbinary(14) NOT NULL default '',
  `rc_user` int(10) unsigned NOT NULL default '0',
  `rc_user_text` varbinary(255) NOT NULL,
  `rc_namespace` int(11) NOT NULL default '0',
  `rc_title` varbinary(255) NOT NULL default '',
  `rc_comment` varbinary(255) NOT NULL default '',
  `rc_minor` tinyint(3) unsigned NOT NULL default '0',
  `rc_bot` tinyint(3) unsigned NOT NULL default '0',
  `rc_new` tinyint(3) unsigned NOT NULL default '0',
  `rc_cur_id` int(10) unsigned NOT NULL default '0',
  `rc_this_oldid` int(10) unsigned NOT NULL default '0',
  `rc_last_oldid` int(10) unsigned NOT NULL default '0',
  `rc_type` tinyint(3) unsigned NOT NULL default '0',
  `rc_moved_to_ns` tinyint(3) unsigned NOT NULL default '0',
  `rc_moved_to_title` varbinary(255) NOT NULL default '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL default '0',
  `rc_ip` varbinary(40) NOT NULL default '',
  `rc_old_len` int(11) default NULL,
  `rc_new_len` int(11) default NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL default '0',
  `rc_logid` int(10) unsigned NOT NULL default '0',
  `rc_log_type` varbinary(255) default NULL,
  `rc_log_action` varbinary(255) default NULL,
  `rc_params` blob,
  PRIMARY KEY  (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `__PREFIX__redirect`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__redirect` (
  `rd_from` int(10) unsigned NOT NULL default '0',
  `rd_namespace` int(11) NOT NULL default '0',
  `rd_title` varbinary(255) NOT NULL default '',
  PRIMARY KEY  (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `__PREFIX__revision`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__revision` (
  `rev_id` int(10) unsigned NOT NULL auto_increment,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` tinyblob NOT NULL,
  `rev_user` int(10) unsigned NOT NULL default '0',
  `rev_user_text` varbinary(255) NOT NULL default '',
  `rev_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL default '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL default '0',
  `rev_len` int(10) unsigned default NULL,
  `rev_parent_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`rev_page`,`rev_id`),
  UNIQUE KEY `rev_id` (`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=60400963 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=1024;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `__PREFIX__searchindex`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL default '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `site_stats`
--

DROP TABLE IF EXISTS `__PREFIX__site_stats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_views` bigint(20) unsigned default '0',
  `ss_total_edits` bigint(20) unsigned default '0',
  `ss_good_articles` bigint(20) unsigned default '0',
  `ss_total_pages` bigint(20) default '-1',
  `ss_users` bigint(20) default '-1',
  `ss_active_users` bigint(20) default '-1',
  `ss_admins` int(11) default '-1',
  `ss_images` int(11) default '0',
  UNIQUE KEY `ss_row_id` (`ss_row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `templatelinks`
--

DROP TABLE IF EXISTS `__PREFIX__templatelinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__templatelinks` (
  `tl_from` int(10) unsigned NOT NULL default '0',
  `tl_namespace` int(11) NOT NULL default '0',
  `tl_title` varbinary(255) NOT NULL default '',
  UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `__PREFIX__text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__text` (
  `old_id` int(10) unsigned NOT NULL auto_increment,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY  (`old_id`)
) ENGINE=MyISAM AUTO_INCREMENT=60400963 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=10240;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trackbacks`
--

DROP TABLE IF EXISTS `__PREFIX__trackbacks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__trackbacks` (
  `tb_id` int(11) NOT NULL auto_increment,
  `tb_page` int(11) default NULL,
  `tb_title` varbinary(255) NOT NULL,
  `tb_url` blob NOT NULL,
  `tb_ex` blob,
  `tb_name` varbinary(255) default NULL,
  PRIMARY KEY  (`tb_id`),
  KEY `tb_page` (`tb_page`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transcache`
--

DROP TABLE IF EXISTS `__PREFIX__transcache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` blob,
  `tc_time` int(11) NOT NULL,
  UNIQUE KEY `tc_url_idx` (`tc_url`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `__PREFIX__updatelog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  PRIMARY KEY  (`ul_key`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `__PREFIX__user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__user` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `user_name` varbinary(255) NOT NULL default '',
  `user_real_name` varbinary(255) NOT NULL default '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) default NULL,
  `user_email` tinyblob NOT NULL,
  `user_options` blob NOT NULL,
  `user_touched` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) default NULL,
  `user_email_token` binary(32) default NULL,
  `user_email_token_expires` binary(14) default NULL,
  `user_registration` binary(14) default NULL,
  `user_editcount` int(11) default NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `__PREFIX__user_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__user_groups` (
  `ug_user` int(10) unsigned NOT NULL default '0',
  `ug_group` varbinary(16) NOT NULL default '',
  PRIMARY KEY  (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_newtalk`
--

DROP TABLE IF EXISTS `__PREFIX__user_newtalk`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__user_newtalk` (
  `user_id` int(11) NOT NULL default '0',
  `user_ip` varbinary(40) NOT NULL default '',
  `user_last_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  KEY `user_id` (`user_id`),
  KEY `user_ip` (`user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `__PREFIX__watchlist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `__PREFIX__watchlist` (
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL default '0',
  `wl_title` varbinary(255) NOT NULL default '',
  `wl_notificationtimestamp` varbinary(14) default NULL,
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`)
) ENGINE=MyISAM DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-06-03 11:24:35
