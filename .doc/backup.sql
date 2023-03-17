-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: aim_admin
-- ------------------------------------------------------
-- Server version	5.7.9

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
-- Table structure for table `ac_test`
--

DROP TABLE IF EXISTS `ac_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ac_test` (
  `ac_id` varchar(255) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `day` int(4) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_test`
--

LOCK TABLES `ac_test` WRITE;
/*!40000 ALTER TABLE `ac_test` DISABLE KEYS */;
INSERT INTO `ac_test` VALUES ('aadc6a08401e425aa3cbf8d06e4401d7','zhangsan',4,'afaf','2019-07-23 22:42:06'),('28f0d6c4d1c24b3bbef6d491ac9ca73e','zhangsan',5445,'asg','2019-07-23 22:51:15'),('075707b64a3d4895af8419fa5199ec48',NULL,1,'123132','2019-07-23 23:36:26'),('ec0f791895f8440ead38c45334ec88d3','lisi',5,'测试原因','2019-07-23 23:43:43'),('5ac9262d45834076b1b70b03b4b4e657','zhangsan',5,'123123','2019-07-24 00:18:51'),('e850644d5a40401cb72d31000a29dd91','lisi',5,'22222','2019-07-24 00:22:23'),('80824f0238f2434cbe054ab423037b95','lisi',6,'测试申请原因','2019-07-24 00:36:28'),('e07fb3a2e14149d6bfa81c6a2979bf89','zhangsan',5,'asgasgsadasdg','2019-07-24 01:06:10'),('62ce0a1262724572953394093cc1a7b8','zhangsan',8,'asfaf','2019-07-24 01:14:40'),('ea61cdaf23904c92818b612d6c94a447','zhangsan',54,'ssfadasdfasdfasdf','2019-07-24 01:19:20'),('dbd06c6f3a3047a6a33201d245dff69a','admin',23,'afaf','2019-07-24 01:25:20');
/*!40000 ALTER TABLE `ac_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `act_ge_bytearray_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('237506',2,'source',NULL,'{\"resourceId\":\"237505\",\"properties\":{\"process_id\":\"KEY_leave\",\"name\":\"请假流程\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.fhadmin.org/\",\"executionlisteners\":\"{\\\"executionListeners\\\":\\\"[]\\\"}\",\"eventlisteners\":\"{\\\"eventListeners\\\":\\\"[]\\\"}\",\"signaldefinitions\":\"\\\"[]\\\"\",\"messagedefinitions\":\"\\\"[]\\\"\",\"messages\":[]},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"start\",\"properties\":{\"overrideid\":\"start\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]},\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow1\"}],\"bounds\":{\"lowerRight\":{\"x\":60,\"y\":160},\"upperLeft\":{\"x\":30,\"y\":130}},\"dockers\":[]},{\"resourceId\":\"end\",\"properties\":{\"overrideid\":\"end\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":688,\"y\":259},\"upperLeft\":{\"x\":660,\"y\":231}},\"dockers\":[]},{\"resourceId\":\"QJ1\",\"properties\":{\"overrideid\":\"QJ1\",\"name\":\"提交申请\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"#{USERNAME}\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"className\":\"org.fh.controller.act.util.ManagerTaskHandler\"}]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow2\"}],\"bounds\":{\"lowerRight\":{\"x\":250,\"y\":185},\"upperLeft\":{\"x\":150,\"y\":105}},\"dockers\":[]},{\"resourceId\":\"QJ2\",\"properties\":{\"overrideid\":\"QJ2\",\"name\":\"审批【部门经理】\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"R20171231556774\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"className\":\"org.fh.controller.act.util.ManagerTaskHandler\"}]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow3\"}],\"bounds\":{\"lowerRight\":{\"x\":415,\"y\":95},\"upperLeft\":{\"x\":315,\"y\":15}},\"dockers\":[]},{\"resourceId\":\"QJ3\",\"properties\":{\"overrideid\":\"QJ3\",\"name\":\"审批【总经理】\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"R20171231726481\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"className\":\"org.fh.controller.act.util.ManagerTaskHandler\"}]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow6\"}],\"bounds\":{\"lowerRight\":{\"x\":580,\"y\":185},\"upperLeft\":{\"x\":480,\"y\":105}},\"dockers\":[]},{\"resourceId\":\"pt1\",\"properties\":{\"overrideid\":\"pt1\",\"name\":\"批准or驳回\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow4\"},{\"resourceId\":\"flow5\"}],\"bounds\":{\"lowerRight\":{\"x\":385,\"y\":165},\"upperLeft\":{\"x\":345,\"y\":125}},\"dockers\":[]},{\"resourceId\":\"pt2\",\"properties\":{\"overrideid\":\"pt2\",\"name\":\"批准or驳回\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow8\"},{\"resourceId\":\"flow7\"}],\"bounds\":{\"lowerRight\":{\"x\":550,\"y\":265},\"upperLeft\":{\"x\":510,\"y\":225}},\"dockers\":[]},{\"resourceId\":\"flow1\",\"properties\":{\"overrideid\":\"flow1\",\"name\":\"启动\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"QJ1\"}],\"bounds\":{\"lowerRight\":{\"x\":149.3515625,\"y\":145},\"upperLeft\":{\"x\":60.53125,\"y\":145}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"QJ1\"}},{\"resourceId\":\"flow3\",\"properties\":{\"overrideid\":\"flow3\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"pt1\"}],\"bounds\":{\"lowerRight\":{\"x\":365,\"y\":125.015625},\"upperLeft\":{\"x\":365,\"y\":95.375}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"pt1\"}},{\"resourceId\":\"flow2\",\"properties\":{\"overrideid\":\"flow2\",\"name\":\"提交\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"QJ2\"}],\"bounds\":{\"lowerRight\":{\"x\":314.37109375,\"y\":104.625},\"upperLeft\":{\"x\":200,\"y\":55}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":200,\"y\":55},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"QJ2\"}},{\"resourceId\":\"flow6\",\"properties\":{\"overrideid\":\"flow6\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"pt2\"}],\"bounds\":{\"lowerRight\":{\"x\":530,\"y\":225.25},\"upperLeft\":{\"x\":530,\"y\":185.0625}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"pt2\"}},{\"resourceId\":\"flow4\",\"properties\":{\"overrideid\":\"flow4\",\"name\":\"驳回\",\"documentation\":\"\",\"conditionsequenceflow\":\"${RESULT == \\\"驳回\\\"}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"QJ1\"}],\"bounds\":{\"lowerRight\":{\"x\":344.6640625,\"y\":145},\"upperLeft\":{\"x\":250.62890625,\"y\":145}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"QJ1\"}},{\"resourceId\":\"flow5\",\"properties\":{\"overrideid\":\"flow5\",\"name\":\"批准\",\"documentation\":\"\",\"conditionsequenceflow\":\"${RESULT == \\\"批准\\\"}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"QJ3\"}],\"bounds\":{\"lowerRight\":{\"x\":479.37109375,\"y\":145},\"upperLeft\":{\"x\":385.3359375,\"y\":145}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"QJ3\"}},{\"resourceId\":\"flow8\",\"properties\":{\"overrideid\":\"flow8\",\"name\":\"批准\",\"documentation\":\"\",\"conditionsequenceflow\":\"${RESULT == \\\"批准\\\"}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"end\"}],\"bounds\":{\"lowerRight\":{\"x\":659.5,\"y\":245},\"upperLeft\":{\"x\":550.125,\"y\":245}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"end\"}},{\"resourceId\":\"flow7\",\"properties\":{\"overrideid\":\"flow7\",\"name\":\"驳回\",\"documentation\":\"\",\"conditionsequenceflow\":\"${RESULT == \\\"驳回\\\"}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"QJ1\"}],\"bounds\":{\"lowerRight\":{\"x\":509.6640625,\"y\":245},\"upperLeft\":{\"x\":200,\"y\":185.0625}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":200,\"y\":245},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"QJ1\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('237507',1,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\�\0\0;\0\0\0�:\�E\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0�\�\0\0u0\0\0\�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0�\�\�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\�\0\0\��+\0\0 \0IDATx\�\�\�|TU���3\�T�Jӵ��`o�����@���T@�\�uUt�� �\�\�\�V@�(�ࢲ\�\�E�H�ذz��\�BK�\�sn�2I\���_�ô�\�\�\�p\�s\�|\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�dBt�\�*\'\'\'i\�ҥwoݺ�\��\�ۏݶm[Rvv6s��P(\'11qCBBݻw\�ر\��\�\0 ��\��?�_�~XVVV\�&M���u\�ڵk���:\� ig\�\�ܘ\�\�L����k\�޽\�\�ر�\�\�_�J\�\0\0A@5�|��ɿ��\�\�-[�4͚5\�.�R�V�^m\�\�\�v\�\�\���\���\�#\0K\0�n!ܶ��;\�8ӰaCBx\�7\r\r\Z4���\�_/\�ի\�\�c\�.�W\0� �\ZQ9JZZ\�\0��:u\�\���έkM��\��輦�K�g�oZjk52q�u較����0����~YϞ=\�7nܯ�\n�\�bH\0Ղ\�TM�\�Q�����m����d\�\�er���\�6\�\�b�2Wс%�V�Z�u\�\�ٱ��\�\�\0@PMhv�����l\\6\�\�ٵm��\�\�/�A��\�͛7���;���>:�\�\0@�j@Sjv�h5\�;\n�\�h9JN�F�\�\�Ez\0A\0�\��)\n�\�ٻ;�\�0�xI:\�\���\�	\0\�]]\0�:\�\�z4{ʟ}�ڋ���\�q\0ՂN2\�\�z*Ȇ\'�>0��!]\0\0\�\�ר���DF\�\0q\0(\rZ�m\�j\�wl|\rӠUG:\0@�\�pH\�\�L�Î\���ڍN��\0\0q\0(-{w\�\�\�=;�\�1\0\0�8\0��]\�\�yg\�ܺ\��۶\�G�����e\0\0 �@	\�X=߆�\��MK�.�}�2�6\�f\��\�Ms�\0J\�G��4½v\��ވwQ\�T�Z~˺\�L�c.3I\�T\�\0\0#\�\0�%�p5�i\�|\�\�\�@\0\0A\0�C#\�ŕ���\04JS\0TKm:?N\'\0\0\�#\�\0\0\0\0A\0\0\0 �\0\0\0 �\0\0\0q\0\0\0\0q\0\0\0� \0\0\0� \0\0\0\�\0\0\0\�\0\0\0�8\0\0\0@\0\0\0@\0\0\0��8�\0@e����`(J]�f\�\�3f\�G\0\0q\0(�\�\�\�&M�l\�޽�䘘�q{�\�5q\�ĭ%�K^~�es\�7�����9\�s\�q\�g-Zdڷo\�ݿ|�rӲe\��?;;\�L�0!\�}�\�1qqyW\�ӦM3�;w\�\����[�\�̛7\�\\r\�%E�\�\�\�\�ʕ+ͩ���\�~۟fӦM�aÆ\�g�v\�\���,3iҤ}����\0\�\0*�Z�P��\r\�=ccc3����\�ۯ\'&&\�=ztց>�i�\�\��=y�Z櫯�2g�}v\�e/^�z\�z����Ь �\0��\�����)\�\�z\���.{,߰�p�\��\�\�s\�=\�\���\�\�G\�>ݯ\�ۨQ#oY\���\�\�sw\�\��̟??7ϙ3\�t\�\�\�\\p��\�=n\�8\�N>�d3~�xs衇z�y\�ر�S�N\�;\��۰a���!۷o�n\�/��R�\�?�V�Z�-[��+V�?�\�O\�rIII\�k1b�w�v\�\�q\0 ���\�\�\�ۆ�\�YV�=޴�\�9�򕔔s��\�\�\�_�\�ԭ[\�\��\�\'�xA���\����F|u��\�?{���\�\�\r�-Z�(0�G:\�3̠A��ܧ\�\\�~}s\�\�zm��\�\��k׮��\�kY�~}n\�\�\�4��\�róv�;\rz�\n���o�\��{�ܶϼ�\�v\�a�\�#�]mڴ1S�N5]�t�B��_~鍼\�y����}ܹ�2e�Y�t)�P\0(\0k�*�l �Ѷw�4i�!99y�\r��\�|�\�I��\�e�]\�K5�8+P��LZE!\\�X\�%\n\�~i�\�9�n\�W!s\�u\�y�\��\�\�\�\�O?\��\r\Z40��\�o\�\���7�D\���矛�n�)\�\�̚5\�[V�0�G�6>����^|�E���\���z\�\�\�\�j֬����7���\����^�F�5��I\��}\0��q \n\�Zۋ�\�JI#\�\�\�P~�³}/Vu~�|�I�LC��\�;odxժU&--\�q�G�9\��)h*(kڙ3gze\Z�\�z\����^��\�;/\�\�T{�`��\�CaY�\�>��K=d^�\�\n\�zmzͣF�2;w\�4\�?��WJ��>}�xe,���`�{�no]#\��\��q�\�%rD\\�u\�\�=\0� �B�`��J��J>T^���(<��F��5Ҽlٲ<˪tE˿��\�W�^^��ꪫr��^05k\�,��\�$�\�SSS\�1\����bcc\�ܹs�\�+*Q�/,\�\�\�\�3\��Jq4�}\�\r7xy�\�\�\�\�]F���^W\���\���W\�.�\�\�\�3\"^\��u\�\��F\�\0q\�`=J���\�\�ͱB�P�u���˩��zd�Ҩ�?�� ����u�iӦ�\�)�+�\�q\�\���e�\�e�\�\��ݧ�=�\���)�:o��;\�\��\�$2d�\��Z�p���7(Tkd���\���\�o\�A���+��\�\�\Z�\�\�\�\�͛󌈫n\\;��|\Zm/(�\0A@�!<%%\���|%\'\'\�\�m\�VQs�\r\�J|��R�m��\�m���8M��\�z\�9QW�qq�S�G\�Ղ#\�}D�o߾�V\�¦\0���\����ŧYYn��v\��ĉ�{�~��+9��\�\�(�\�\�\�ڵ�i׮]\�c�{�6���Z\�)���MF?��헬�TF�<�\�\���\0\0�8��GӀ쵭F`�[GKjX��\Z5jL�\�{sQ�L5\�����&Z3�F#ª\'���D�F�\�O=�T��\n\n\�\n\�}��W*RznzEi\�s��\�G\�dW��o�3�aEa\\%4K�,��I;+*Y�4r\�H>�\0@P%\��[��g��\�\�\�#.�>�#\�T��m\�6o�\�(�J=t��\�\�;�\�̚o\�?\04����\�^H\�u4\n\�\�h��F���-l4\\\'\�\�N�^\�\�~�;\�>\����\�O\�H欳Ί:��y��\�\�Q\�~饗r�?��^�fYQͺ�\Z3f��={6�R\0 ��JTvb/f\�`8Ɲ\�gsI>�\�-4J~#\��l#\n�~P\���\�����ꫯz)j\n\��(\�^}�չ�uv?\�*\�+��!92p���T��ߴ�\nۚ�P����z�>�ho\�B�\�G\�}�]�,G�C�\��\�\�hܸ�7W�����Ւ�e2�\r\�s�~�\�^\�YEU\�>cƌܿ�F�\Z|h �]\0\�/99�>@�\Z��~<\n�\�l\�}�8#\�}�QN�\����k�HTJR�\�\�W�~����\�\��\�P)؝�\�\�\��T\�Y>�R\0�qfM\0\0\0� \0\0\0\�\0\0\0\�\0\0\0�8\0\0\0\0�8\0\0\0@\0\0\0@\0\0\0\�\0\0\0\0\�\0\0\0\0A(il;\�]�i[�|�\�J7\0\0�8P�ڶ\�]_o[��\�\�\�\�M\0\0�<\�\���\�p۶D\�\�޶�\�\0\0PGu0Ӷ�l�ն\����m<\�\0\0\�#\�\�Ƙ�h�tw��	׉�\���mw\�E\0\0��0\"��\�\���\��\�l�¶�m�E7\0\0�8P�n�\�[w�Mwy������.p?\0\0@��4ՁF��\�6\"\��{L� \�Ut\0\0(k���:xζu����_e*\�\0\0@Jޣ\�R��\\�\�\����\0\0\0A(y�\�G\����t\0\0 �\0\0\0q�\�yׄP~(p\�|�\0\0�fMAU\���n\'\�v���~\���tU�������tF9�\��>��\0@����]k[�m���Y6}�\�w\�U\�CRRү[�li\\�n]:��mڴIg�]GO\0 �\�\�\��u\r�\�O�T���222�\�\�_zzz�����\0@�.��Ě�\�\'\�ڶ\�]\�\�-SA���5d͚5W�h\�\">\n\�!\�\'m\�ƍ\�Mx~\0�\�(�DUu�m-mK���m/\�\�ڶ�l�ڄؼ�n�>\�;\�9999_�^��\�(G���\��a��^�%�� TM�Lx��#m�k[�kߚ���\�\�F���z���m\�\�̤3\��\�͛�lܸ�\�\�\�\���\0\�Q�?\�*�Z\�.ט�53\�c?\�v�aT�Z��⋿�!�\�o��&�0^�!|�\�\�\�B�\�\�\���J�\0\05⨺tJ�\�f_=��{>˾BwU�;w�n]�hѢI�Z�\�ӢE�Ԍ��4��h$\\!\���T�\0\�b\�TQ�\\��n\�?L�F�U\�\�\�w}�mKl[�\��m۶��P�\��ti\�1v\�\�_z�\�99##��\�ի\�dee-���	%&&R�C���\�\���_ӰaCS�f\�\n�:5O�\rޟ-]�t\�?�p\�;\�\�}=/�\�Y|�\0`F\�Qխ��}g\�z�B6]T=�LE~�a�5k\�t�M;]�L�\0\�\ni���f��fٲe\�\�O�\�ݫ��h�pMQ�f\0A��\�]t\�E:�\�\�\��Z�����m��\�#�{\0P�q�&\0\0\0@\0\0\0\�\0\0\0\0\�\0\0\0\0A\0\0\0\0A\0\0\0 �\0\0\0 �\0\0\0\'�A�\�\�\�IZ�t\�\�[�n\�}��c�mۖ���]a_�}�fɒ%\�c�|\�m�\r���3\n\�$&&nHHH��{�\�;v��6��$XO�|6\���a�\���\�eee\�lҤ��[���]����\�K�����v\Z233Mzz���{�~�cǎ^_|q*�S��gִ\�є��G\�֓`=�\�-�.@i[�|�䴴�M�6�oӦ��W��IJJ\��S{ӶM�:uL�f\�b\�F�ɖ-[n�馛Rǌ�=Tu�m۶��P�$55u=\�z�\'Q����R߸\�v�	\'�`?�p6*e�ndL��\�k\�\r\�kӧO��XO��$*&F\�Qj�5�Fx�;\�8o\"\�έkM��\��輦�K�g�oZjk52q�u較���`\Z4h����~YϞ=\�7nܯ�J\�ǈ8\�I֓�\'Q�p�&J�8�ꫯ��l\�2\�\�e\���=��\�޷}\�\�f��WL\�Sn3Iu�R�Z�L\�֭�\��9{�z�r\�޽��B�\�SQ����\�\0└�QYO��$*JSP*tԿ8\�\��ٸlf���/{\�.�~\�:��4o޼A\\\\\�\�}�љ�F%[9\�\�,�XO��d=	�8p�4�����V\�#sUԟ\�(JN�F�\�\�Ez�r�0a\�4{������\�XO��$\�G�\�j\�hr�\��\�9̙[�;\�0}݉��|rrr&�H�[n\Z�\�z�\'A<:	�\�E��\�CS{с���A��B���B\�\�-֓`=	�8\�\�\�8	E�O~80��Y�\�,{�.\�\�6�b/֧��Ϣ�XO��$\�@�\�ר���DF�\0=zt��x/\�Ù�\'\'\'g�3�\�[�\'ā\"i\��l�Pk��c\�k��:\�A�>c�ܟ\�\�cb&\�E�\'ā\";�\�q�\�a\�\�{\�F\'\�A�\�\�N2�y(ɶ�k֬�N/��@\�\�\�;��o\�\�-t\�\�N\�FܽS�h�\�RXO �E�k\�:\�\�p[\�}�\�c\�6�h�����0��q�?���\�;�\'ā\"\�X=\�n\\^6\�7-��\��\�\�Lڜ�M\�?���r��k\�j��\�\\T�>;;{*�\�z��$@\n���Ƙ5߾�\�)�#\�\�k��oV\�\�dmYC�Zs\�\'D\�=m\�ĉ[\�֓�\'�8P �\�\�\�\���es_���\�SB�����d=	ā\�i䦸r�9\rHJJ�2x;11q�\�z��$P�q)��6�������\�p\�\rk����\�\�Ĭ��7\�+�\'Tn��@%��\�����o|衇\Z{y\�<p3�\0�\�෶�_��;˶c\�>�Bi�\�}\�\�\�0p;��\�H(\�2%f\���]�/_�ڽ�\�3j\�(ӿ���k׾l/o(\�~�ö\�\����[\�g{\�\�ԶKl�\�G\0\�i���m]�ψX��@\�\�68r�m-\�J�\�u�\�2\�F\�VӶs]�<ܶ��Ϝ��x������\�^/\\#\�\�ׯ�{\�=�䓽�ڷoo��\��iӦ�e\�O�m��>\�\�\�\��lKF��C\�\�l\�`�&\�~��#\0\�s�mqnm�\�lȇ60\�vѶ�\\K��.}\rT(�\�\�\��?V�\�n\�L�u�m��-r*�M�-�\�4��\�\�~я>�\�M+V�w�\�w\��!\�׮];ӯ_?/��\�\�\�\�R|qn}\�:��\�?�P�9��Ƕuq\�\�3\\_vv����ދ:|4Tg�`͜���ŋߴ`��֬Y\�a�\�\�5333㲲�L\\\\\\N\�ڵw7h\�`U�:u>��?�\�?����ڰ̶mz>���\�h����]\�zs9�\�>μ\0��Z��p;\�~�\�\�i&<\���	�]<�\��\�Эe&�\�VOKK�w߾}c4�\�\�}�\�6\�o��\�رc��\�KQ	N\�\nԿ\�v�	��\�,��	�|or׍[\�]n£\�\n\�\�ؖf\�\�\�G\0 �#����\�/>��\�=6l\�w\�qǙN�:�-Z�5���a<�e˖�+V���z\����o\�߿��m۶=�\�/�\\/CsA�a�}�\ZtX\�zc�1׆^�ELx}�\�\�]\0\�N\�5�or\�q�\�\Z\�\�\��\�s�\�\����\�vw�3\�K9��,,��42>`����C��y\�M7]7f̘�J�\�h\�\�\'\�v�@\�\��\��.T�#�\�c߹n=�\�q��t�[��\��h �W _~�\�O<�\�?222�����\�\�\���SWkذ�\�W�7\�xchѢE�RRR�u\�wظq\�\'N�\� �F#\��\�\�\�\�C_Q\�4\�p��]�3M\�I8\0��l�Ԅ8<\�\�Ł\��l\�Ċ�B��\�w\�ҥK\�\�s\�=���`�����y\�wz�\�qՄ	J:\�6v\r�l\��d�X3!\��3�\�@ħ.�j��9��	\0�@u\�999qS�L�x�\�ѯ؍O\�SO=\�\��Bx4\�hٟ���\�k\�Ԯ]�\�;\�\�`�R�NuA���69�~T��Fʺ\�\�\�\�P#��a���\�)\�f����\\@\�N�Fo���\�o^�/R#\�7o~+x`fQ)�80>..\�\�ݻ_Q�/K}3\�q�\�\���\�{�[~��O����ݮ\�zC>�\0\�$��\�\'�O�>���\�w��\�+(�G��\�5\�@����\�n���>\�|\ZmL֙pi\��m[Ĳ�\�]ׁK����M�*\�NP\�(�\�v�P[�p\��:�\�\�τKS��#��\�ڨ�C=\�+--mlqBx0�0 )!!ab	�q�i\\���,�n=ܱi\�vdNqM3\�\�\�G\0A�x�\�w?�4i\�ivCd�>�\�y\�V�Z�����\n\�O�\�ѣW1�em�\�H�=&|��\�S�ի��\�W\�\�\�װ@�P)���d\�ed\n�_�\�T�r�ms����\�\r\��Wi��+W�QMxqC�O\�8��\�x~T��\�����bV\�v�ۑ�\�ګ��\0 ��Մ����\�{�z\�{\�����i\�x��Q��<\�\� �\�9����\�j�m\�_nc����vq�Qm;��\0��\�]�\�A��	ev�}\�\�)�\�䝒T\Z�\��\�\�J\�(~/jMxa\\�J�]��i\�}�\�ө�T�S#�\�P�\�	�Y�����\�\���.H��\�\�\�\�u\�\�C�x�\�\��`M͎�\�c����\�//���H\Z\�޽{\�믿�\r�YE\�\�&��\�/\�64\�\"��q{U\�F�T/鏰i��\�:�q\�\�\\�ìY�TN�҉\'\�c*7{\�6��-q;ы���\�\�\\\�{�\�w`\�\�͛\�]wݵ߲\�=�\\���\�۷�\�n�m�\��yov)��A�\�2d\�$ƻ\��*�S-�\�\�O\�z�	�`\�N�^\�N�\�?}̾�Dק�]3�u\�>�\0��r�<y�+��P5ݥ\�\�.�Q�n\�#�X���љ�\�O\�\�\�~~�\��5��<��\r:���Ч\�7H_3�\�S��~���n\�\����\�\�\��\�z�\�yA�f͚�V\�11\�_�\�[�\�/����\�\��\�\�7�z��B�\�ͦR\���[Y��ԃ\�;N\r\\׷����\�\�\�\� ?Ȅ���l�\� �������v\����Ii��\�;\�ۍQ�2�Ӫ\��}_�;.\�t\�\�)��&\�W�n\�:\�Py�r\'\�z`\�y\�g�6m�{;;;\�,]�\�|�\�W\�\�~��,^�\�\�\�>�N\\\\��S���\���P4\�>h\� ͦ�R\�5\�\�Tٰ\�z@�\r\�:c毿�\ZWR5��9�\���+\�ּ\�E�\�Yz�I�&�\�\�{�\�L�v\�Za\�9_}�U�z�j\��\�?��\���\����*?33�ȿ\�\�/�Է9QOOO7[�n\�\��?���MW�p\�{�mv\��#\�Au�\��]؁�w\�}w�Q�;v��_~\�lٲŌ9\�+M�i�;\�#\�lSZ��a�j\�QA֓�<\�ڵ�\�e��\�;\���E�r\�_�|y\�{Pvp���yڞ=�\�\�j\'\�n\�soO�0a��pp�\�\�P\�\�;�ϻnݺ\�\�߯�n_\�o��\'^�\�\�\��\�N\�SZڵk�>{�\�\�M��%ȫV(\�i76=\�{�i\�\�{�u�S3c�\�\�Y\�EΙ3\�\�r\�-\����\�\�h�N�$�F�2S�N���:s\�\���7�\�O\�\�.\\hN?��|�W\r�?��\�;\�\\s\�5\�\�5kVn(�7o��6m����\�\�4\�}�	\�M�6=Ӿ\�w\�v�}�߹�<��\�=�z\�L\�\�>��\��\�ipǱv\�\�欳\�2Gyd��\��\�3\�L����\r)SyG*\�zr\�ʕ�y�}S\�תU\��g�}v\�e�.\�7\�ҿo�����\���?�\�+{�F\�[o�u\�^\�c�y߾D:\�#�i�\'M�d9\�\�y\�NI�\�9n\�8oy\�*,z\�\�k;v�wm\�Pʆ\rrw��\�m\r�\\z\�\�\���\�N\�+̟��\'o9����k3bĈ\����Χ���Y����ӕ�3\�8��\r\�\�ċMs����\�Y�]Ѿio�c\�\�?��\�\0\0 \0IDAT�3f\�(���5��\rͪU�4\r��#w\�T;ܰ��\�;\�F@%QZ�����V\���6d\�~�����ѹ馛r7,\��)i%/Ç7����i\�(<Q�~FA\\N=�\�\�mt�εA+o\Z�\�\�\�\�\Z�\��\�ų\�Oy)�!�����v g̼\�\�\�\'�|�\��y\�\�Ծ_�V\���֭[�\"=���5�=t\�\�\�m@��0^�֓)))\��\�\�\r\�\Z��[���E�\��\�\�[\�i�X�\Z�V�=��ý.-Z�(0�\��T�\�~�\�y��U�׺N�\�\�G���T����O���\�7}�to��ϯ>\�\Z��C�\�\�hӦ�7�ѥKo}�o#�\�\�<\�s�\���=��0e\�o� ���\'���S��<�H}\�ہ��D$\�\r͍��\�&M�h\�C\�^)\�r\�\"�\� }\�\�\�*�v\�\�9w0q\�\�<��k׮\�u��(\�h� \nȩ��\�\�o\�3\�$��6X���\�\��C�\���i\�J ��~�zoĳ,ٿ+\�n�ϴ\�\�-�\�Ծ\r	\�eC#\�.�\�\�z�S��]�y\��m[x�`ׁ�\Z���椓N�e\�\�!C�\�+\�z�\�.˽�Aj�+\�{�7\�,\n\�k׮�\�]\nʺ_%|�6m\�s\\�v�^y\�<�y��\��_�\�\�����\��p�ߧQi}3�\�zpD\��\�\���^�6��Ec�B�\�{�v\Z�#\�͚5�^��\����֡z~�\"�\�\�:�O�>|�@/Hfff�6\"ei�\�\�\r\�Jq�]>\�[_\�#@\�۾�^+ۿ?�֯\�[��$odG+p��h\�P$:��R��_�~y\�?�\�s���믛�-[\�ޯ�\'?DG���\�ѧ�\'H7x�`���\�|�\�G�S\�GAU\n�\r�F}J\�/��\�����\�\��\r\���)>&6�X�b�Fs��+-�_)\����W	��u9P��x\���7\�0>�G�S\�g\�\'ީ���T�|�\�\'��9R\�F���`ZZ�W�\�Zk BM�T3\�h\��3g\ZL\���\Z\�5����\rv�ڶm\��֨up�M�fk�ߥנ���;wz\"*%\�g[\���.�»n+�k}�A�\����#\�ZN\"G\�E\�\�A/�VD~P*+Z\�\0��y0o}���B��N,�ϒ\�u�P\�ƍ����D}\Z���l\�\�>oà-�9\�\��i%\�o@Tg��~�q\�+\�5\�]Јx\���\�xM�E#޽{����kݺ�7b$\Z\�y�\�\���}#����\���b\�W��k=�3fjZ\�ٳg\�O;T\�^{m���C�\r?��̕+W�\�]�<\�I\�\�+<���퟾\�[�,\�,�\Z@\��\ZX\�gH뜫��*�g_x\�\"}����h�\�\�D\n\�8�y\�\��U�\�7\�p�WV�o�.�\��0�\�\�\���\��ׯN\r\�eD\�\�\�\����\��$96@�\�2��~�\�\�\�z\�z6�?�[_\"�k�]	縝�\\��/��z\�e�\"��\��Q+\�={z�Xw\�\�\��J_�K�Fs��q�~[�\�u��\Z\�\n?x�SIP�\n�2��\n\����F�222\"\�\�Fǋ�x��\�cw\�̘1cH��\�}\�L)}�=\n*��U\�pq,X�`\�U�t�\�xF\�+\�zR�\��(�J\�.\�vT׃S^*�+\�\�q\�\���e�Z\�\�\�H�}.���4B��\�E!�\�O̳��׺Z�I�Z#\�\���w]�\�Y�;&W\\q��\�ZkgC\n�q\r�gk�\��4\�^PX�}�{��\���������\�hW\ZYv��\���%\'\'�2�����m?j\r\�\��f{9]t��5M��6x\�\�\�<\��Q�kH}��\��T4��\�km�;[\�W^\�T�������{��ݑ�)�m�\� H�߯��`�/K�M\��\�\�\�}\r��;\��Ihjo�y�DE\��\�=\�w\�\�������>|��{\���\�S�\�\�`pt\�Kw{�z#��<hy�B�3\�<S\�>gj\�+\�zR\n��q�q�\���#\���\�[\��)\�KH����\�\�7�O��µv��C��\�N;͛\�$�>Tٌ^���v\�7�:\�=�y���\�\�\\?��헬\�P��\�ץT� ^�z�\�-�+��\�2�\�P��M���]�\�jFu4\'��\�5jԘn7*�\�\�\���\�\�F5\�-\�V\�>�iT]2�\�½�KS.�\���ׁu*qQ��6\Z�y\�󛇷,��\���v\�ԩ���w�\r\��TH�@�\�i�T�xI|�K��,�ٯ_�]#G�|\�^\�ud\\a[���\�Opd\\�G\�\�3_\�\�Mh\�>�\�\n\�=	\�o=�\��F\�UC�\�	\n��Փ�\�Ν�\�\0\�hT\�9\�p�v�^SI�?w�F\��u \�K/��;0�K-�\�U\�?��\�\�\�P4���\�+\n\�\�pɒ%\�߭����5�	\��S�\�\'v%rTA�g%\��\�?\�\�\�\���ب�e\�{v\�?��\�#���?Z��>Us�#�u��\�6E�F�5��׿�\�\�hh\�X+�\�/�|�P\�\��4���v�^\�\�\�Ap��\�Q{\�5�\�u��NX�UP\�\'�\�~&\�~��|�������\�yNܣ$�YT��?��.\�|�Mo��\�\�\0�f��\�I��ʻ��gy�\��x$}�PB\�B�u඾\�`�h�[�y�}����{e#��/:0T��(P+|��,)�=�\�U\�F�Fǟ~�i\�\�\�{m�D\�e��\��)p�!^�٬4��/ԺU\��3f�\�)\0�x>222�Z�l\�-{�\�)���d\�A{ɡ\�@_�*�\�\�7\�\�\��\Z5Ϭ��ԥ\�\�E3�\�N\���\�t\��Ff�\��6`:�\�?��F\�U���M\�{=��\���*V�\�2�H\Ze��\�H�6fe9�LQ\��z�݆�L{q[\�H9J&��\�ӧ\�s\�=�ƽ�\�_P�\�l<\Z�\Z5j���\�/\�7-7n�\�S`с\���tR��:��N:C�\Z\�I\�i��\�H�?;��\�5[�?���?���6E\�FM�m�\�ꫯν�o��\��: �/��\�W	̐!C�u����]�\�\�G}��^��W\�y4P�\���\�<\�{ \�\�th��o;�\Z�j버7���\�\���3r_���\0]�N\"|\�}��Գg\�\�\�lE�\���+�V6p�\�\�^�\�\�\�mK�+鷊3��\�G\�D�D\�A[\�e\n��L\� ����\�\�O?լ-L\Z^A؝�\�III\��\�\�7!\��\�G�f��G\Z�\�\�\�[D}��\�\�v\���ҁ�6��p{��	&L\��\Z\�\�]��$*����\�vO�ϯ���\�A��\�cƌ9ޮ0_\�-/\Z�\��\�`��H��/LQ\�nI\�\��wG\��\�oN߽{�\�#G�\�RY@$}k���\����\�/\�S��f��W \�H��{���pw`fOBx\�ZO\���Ay\�W&nݺ��>��T\�СC\'ٍж5k֤��l���s\�\�kG����\�\Zl\�\�\�I\�<��\�y\�yJ�T��\��dE4�3\�\�\0@\�S\�CuW��\�;\�{\�5TCV\�/^�\�y�.�B�u�@�	\�ݺu�rذa�\�ׯ_�\�T4�NU����?;�B�~�\r\0OLy������]�v�\�n����Al�V��\�駟\�`C�@�!���@E�2��;w^���y�\�H��B��\�\�\\9\n!\0\�э7n�֭[\�y���O\0p04>hР{�\���j�x�T�0��`ø_�b\�}7R�\0�\"?~��322~�׿�5sʔ)\�\�\0\�\�v#4�\�\'�<=;;{�\�=\�\��2�q�\�\�0�p\�\�b�\0�3Mޚp�\�w,ުO\�\�6�7]SY\�/\�?�m>��c[�4���T*�\�\0\0A�(\�#eϞ=\�\�iv�>}\�.X�`\��x\�G}�һw\�\�Ν{�j\�SRRF��,TF�0>t\�P��\�:��\r�Q�r�m\�\���f߉g^\�g0\�a�17ٶ��\�l{��D�\�\�2\��Z4\���n\�p\�t>�\�z_;\0�����ZO\�n\����p�f\�^�.99�z�1�+!!�]�6m\�u\�\��#�8\"�A�Mt\�\�;v�ݼysƷ\�~�\�Y�b��\�c\�L\'y>==}f��a�[�n\�>|r���\�)��R\�u�<\�\�\�w�\�\�v�m�ٶ҄O\�n\\8�<3\�\�&|�\�o\�r�l\�\�»�v\�yoےm\�,Ɵ��m\'�P�P��ʹM\�:϶\�L�̔Az\rˢ<\�\���\0\�K0�{�\�\�ٳg�E�]�p\�B}e�s\�f��K]\�t�g����l�˅x\0�\�T��0�\�Ͼc\��\�SO=�V�eu\�z�1\�^�<c�֓MLx\�[a�t\�u�\�]�\�\�\�U�]n£\�\�\�v�mZ�j�\�T-\Z9h[;\�t��0�$�\�P\��a\�i&<\�\�\�\�\�X\�^��Cp�[F#\��pM\�軖�\�\�H�\�>)\0\�l���Z�p\r\0�M\�ѣG\�\�ÇO\Z0`@\�\�\'�\\\'r7;J�N[�\�\�z4���m;]�n\�B��.T|s!ܧЬo5:�\����w�5q?돺Oq��e\�1�}f\�e&�L�6��m�Lx仮\�\�\�X\�Bx�\�2\���H\�.��\�nww?ӞO\n�\�,�.\0��Ie*{�\�zذa��s\�\�)	ΎR�3�pYJ/.EQֲmkf\�#\�s#~F�{�	��h \�S۾u\�߶Mw\�)�\�D�\�:�\�(\�o\r<W\�o������k\�\�[� <0�϶�\�@\0�;��\�0~݈#Bs\�\�\�\��@Mx�)\n5�<oM\�=\��\��i\�}�[~��O#\�*!\�\�\�.�oV�ֶ}�_��ȸ/#\�q��=e\���\Z=\�(}�{\�?E�{Z�}z6\��*��D����,p_?��O\�s�mg\�X\0T�0ޭ[7��I;v\\9k֬:��p\�´ڨB�^\�U\�wk\�]�\�i�\�Z�\�{��]߅\�\�\\0o�\\Z>��\�s�	��os\�.v��La\�g5h����\�\�|*\0TmD�\\�\�W\�\�_\��\�l\�\�\�|^o�@`4��@U\����̙3��\�\�z\Z�A��\�i.�\�s\�U\�Z/�\�q\�(��P��|�[�+\�\�S �\�\�_&\�\�6�\�\�\�_|\"\0TmD|f`��ƭ\�uT�f\�H�h�Y��4wa��	A��\�ל�{V_�\�\�-PU�f�\�o�?z�\�\�EX��[\�p�c\�zSPj������\�\nڍ\"�C�i�\�w{���L�`\�l{۶�M� \�;\Z�H߻�o-\�קR�\�\�u)\�k��A&\��zM\�N>�Q�>\0\�e#���W��H�	\�>lµ��\\0�\�\\g�@�V\�n\�`�j��	\��Mx4ڸЫ-5��\�\\�\�]O4\�gGj\��=�F�ۺum�$Du��.�zkzMxNrՄ?\�\�\�~ǽ�n��k�<\�<\��\0\�A�\�\�V�*9ii�����\�W\���	�|wv�[�埻�\�\�3�1\�\�\Z\0TW�]3�\�\�{?�\�\�E�AE�Zg}\0�I��^���\�*U�0p�\�B�k!o1\0�x\��\��\��aKS���.�\�kο��\�\Z��n\\��4\0�\'�����l\0\�^E���SxI�6:HH���.�o\n�#y{\0\0@/:���\�=j\�in\�\�x+\0\0P�Tă5uƵ�a9��\�t\�\�\�v�	���m�\�\�\�\0\0\0�x\�4e�\���\�;��\���|B�jßr�5��\�\�\��~I�)\0\0\0 ��f8\�\�(~�t?q��\�<�>��(\�^\0\0\0TT1t\0\0\0@GU�`\�\�\�dgg\��}t2��XO��$\����~ݲeQlڴ)\�p\���$XO� �\�!>>~VFFQ���k����z�\'AG5���5d͚5�srr\��q\�F�ev]��\�I\�Q\r�w\�ys\�\�\�\�իW\�\�(55�#�>���\���7\0֓`=	�8�����^iii\�333\�r�y�\�)7n�2;;�?���\�IT<�tJ˸q\�\��\�\�{Ά\r��[�nRbb\"�R��ŋ��B�.�E�\0�\'�zqT3cǎ��W�^_�]��\Z��\�V�N�\Z���)=i���\�\�\�.\�ƥs\�\�S\���$XO� �j��\�ٳ\�䌌���W������$&&&���xHE\�\���\�/\�^0M�65\r\Z4���S�\�nܸ�K�\��\�ݱcG���\'#<\0\�\�Ҷ~�z�\���\�4l\�\�ԬY��$p�\�\�F���\�;؍J{��m�ږTQ_\�I��ե�S��\�ڵkE\�V��B�\�\�\�\�\�#��dY�?�Y�`�9餓\�\�\'�\�z �\�\�oN\�\�\�\�\�\�NJJ�1z�\�,z\0�INN~\�^�\�є��G\�\��0k\n�\�\�\�޹sg\'z\0\0ā\�\�\'x#\'\'\�6�\0\0ā\����۝�v\�z\�\0\0\�@)\�ѣ\�%���;\neۋ\�bcc/�w\0\0\0A(%\�\�\�\�o\�\�\���O��w\0\0\0A(�:u��7Fy�\ZͦB/\0\0�8P6mzf(�yNN\�^{q\�Ν;)O\0\0q��\��\�7��m8�u�S�\0\0\�@IRY�\rڝ	\�*O�Go\0\0�8PB\Z5j\�)\n�w\��;vt��\0\0\0A(��11=Y$A�\�0~�\0\0\�@ɹ�(�|\�ͮ\0\0@F�n\�T^�3g�<�q\�\�\�\�k\0\0� $�O=�\�\�\�k\0\0\�`��:`��\�Oۋ���%\'\'?b/\��hJJ\�#�\0\0(I��\0\0\0q\0\0\0� \0\0\0� \0\0\0\�\0\0\0\�\0\0\0�8\0\0\0\0�8\0\0\0P�pB\0\0P�\�ݻ�)\n=\�\��\�\�Ƀ�w����\�5�`��\0�\�CL\�Bz �\0�26ai�\"�����\�\0�8\0\0(!999Yd�[n\Z�\�\0@\��7\nY$[��B���@\0\0%�f͚�l\�\�P�\"�l[���>�\�\�\0\0���=:\�^�\�\�\��\'\'\'g�3�\�[\0A\0\0� �_�r�W�3�^\�\0\0���\�Ć��B�D{�r͚5\�\�%� \0\0J�\�Nl\�q�_�2��� \0\0J�\r\����\��\�;\0A\0\0���k\�N�a|]\�x\�\�gggO�w\0�8\0\0(%*?���� \�\�i\'N\�J\�\0q\0\0P�\"gO	�B̖\�\0@iKJJ�2x;11q�\�\0@)\�\�}bbb\�xa\"&f����^\�\0\0��=��\�=\�\�\�z\�\�^��\�L�\0q\0\0*���\�w�m\r��\ny��\",Sb\�e��\�\�{\�1�F�2����Y�v\�\���2\�;l;\�]\���U~��mMm�Ķ�|A\0��\�n\�e�����m\�@y�m}m\�X^��2�k=m��,^�F\�ׯ_�\�=�\�{�\�\'{��o\�\��\�\�7vӦMc\�0��h\�rw}�\��\��\�7#܎\�!\��M�m�\�;۞\�\��8\0\0\�ǯ���\�}&�\�6Ӷ��ͱ\�߶EN�ɶeQ\�Z\�V���~�\�GoZ�bŸ�\�;\�\�v\�ڙ~��ya�O�>ז\�ˈs�Zs�e[g��\�r��?�#~\�cۺ\�v�mg��\�\�n/2\�r�u�h�,\�\�\0\0��Z��0\�1?@j��4\�~Ȅ\�.\"Gk��\�Эe&�\�VOKK�w߾}c4�\�\�}�\�6\�o��\�رc��\�KQ	N\�\nԿ\�v�	��\�,��	�|or\�\�*\�.7\�\�p\�klK�mrY�cuֳg\�\�{�\�&\n�o\�\��4q;UY��\�\�\�,��}�2~���աOb�X\0�k۶m\'{��Ijj\�z@	\�H\�f�p�Fx5�Fs�\�\�`�_z\�\�]��\�.��h۝���\�h�M���BxO\�G\�}�76��\�ob?���\�:t\�`ѢE?��\�ю\�F\�.�\�?&\\ʣ��.�wt;(�V\�\��ϝ\��x���\�\��(g\�a��\�G�\��\�\�\�v\�ڍ�A[�\�+\��\��\�+\'\�g��\r\���_d��O\�`�3{\���\�\�7��\0\0P�.0\�ep\�\�6�۽�\��lۚ��B��\�w\�ҥKǨ��\�S�\���ߟ�����\ra��\�\�\�΋\�Rz��\�\�hT{�m\�lf\�܈�Q)\�\�\�3\�o>�\�[\�ڧ�,Y\�\�ɭ\��?\�\�wl\�l[\��x\'��k�9fv\�\����\�G��\0\0P���\�W�pm�*\����g&<b�T��ma\�yJ�\�|�\Z	W�YT\n\��\�g\�\�޽{\�7\�xcj	�,�\��s\�{�	\�\����Ou\���U��R}렑u��EכV������\�\�111��;c��\�\�\�\�\�\�fs\�g���:\�ԫW\�Ԯ]\�l߾\�l޼٤���9s\���\�ݻs��:ڟ[`�]&LG\0\0C#\�G�py\�6\�Z۶؄K%\�4\�r��Q~V\�dk\��}w�ei�ȇz��\rF\n\�1\Za|��IÆ\r�X�a|�k��\�\�\�\�L5O<\�\�\�̜\�n\�w;5���,�~�\r\�\�l�����^j.�\�\"Ӱa\����Y��ך5kf\�>�l/���\�{\�>0{�z_�\�qƓl�*��)\0\0��CMx�U�\�S]�\�=�@�\ZڹQ~V#�C��UZ!|\�ʕcT^\�\�S9\����Ư(\�~U�\��\��\�=\�\n\�Ns;3�\\{�^b!\\#\�mp�B�\��SO=�5�\r\��\�H��\�ϵh\�\"�~��/\�0ދ \0\0�\�{�4�\�PF��tz\n��0�\��52\�\�oXR/N\�(~/jMxa\\�JR||��%P3��R:�\�2귮�Ͷ�����\�7\�\�(\�9��J\\NpMן˧\�q\0T�?�{\�\�G\���~N?�\�O ��\�~�\�T�>�4\0��Qo\�\"��\�{���O�\�T��m}L��\\#\�\Z-_\�4���}A���*G�C�\�\�\���}\�\��p�\���\�n\�o�\�\�4h\��S�\r�1dȐI6Hu�0a´b�LՆ����o���M�\�\�vb��\�\�\0\0\"IDATBv�}�\��q}*��Og�\�]}X�\�\�ļ\�ׄk$|��^\r��PɊ�\\z�|\�\n\��镩�\�v�*=�/�`�B\0�L\���[�}\�M\��\�Lx�k��|t>IP�i$<==}B䁙III�Q�F\�\�o�\�=�\�.\����\�??O\���\�_�\rb\�\���\�믿\�G\�\�Ԇ�_|�ŵ\��\�\�|�͒b�\\�[_�y4]\�ק�A����S@�Єg��l9|,�GSڀ�g/\\\�ƚ|�ȥ(����7mڴ1��F\�uWK�c�sU�ڐ\�\0\0\�W��º����6;\�y\�g�6m�o\�K�����*���\�f�\�ŹA=..\�ԩS\�\\r\��U(\n\�\r��ˤ�r\�xA;@������\�t�N��[-\�ǿ�3�[���\�+�}\\l ��*�;A\0�j,x\�̂̼�2ߎ;\�\�/�l�l\�bF�镦��\�w\�ፌ\�\�\�OL�\�x)\�3���\��nܸq�\�A����k׮E��\�3\�\�ouݟ!�4h\�N�\�NGդ\�\0@���\��(\���&M�xA�F�\Z��)|?�\�&333�>\��u\�Y\�\�#�,��\�cM(��q\�#\nմ-ن�l�^e\�\�x��o�9)\�\�\�����阀Ҡ\�T\"v�\'�\0�Jǆ\�.˗/\�@Θy\�u\�\�W)�}�\�\�W���nݺ\��\�\�1`��x�^\'�WH:\�\r\n\�YYY�l(�_��\r\��~�\���\"��|�8\0\0�T4�nݺ7�*;�?cjժ�{�;xΣ\�[o�5OX/\�I\'�TkРA!\�x���ޮ|e�\r\�#\���\n�&\�`�n\�:x�Ce\�T�/\n7خp\�\0UB�f\�6�X�bXqϘ���5�NE\�ϐ\"�I�y�\�\�\�SO=\�\�l߾�!\�8d\�\�&O�a\�\'ީ�+\niN\�\�\��t]V�w��\�\�\�Xi�x�\�\�@5	\�t��`�\�\�\��ts\�\�^�z�ٳg\�O#\�\�^{m���C�\r?��̕+W�\�]�tr+,v\��\�D|ےD��\�t���e˖[f̘1�}��\�>s\�믿�Q\�<e)\Z�2e�9��\���,X�jժZ�y\�3\"^.�2\��mߛl�Eֈ\�~/�k�\�\��\�y�,�8PE����ًG\�	\0U\�<�b��\�\��\�.Oќ\�_�u��ٻw�Y�l�7�����(�?�\�35\�s�x\�7����\�\�\�hA\\o�Nv�ycl莱�{������\�\�\�iYYY:\�\�QZXgb-\� �\�X_\����5\0�f�|�\�7\�ׯ\�e\�ȑ{-ZT\�S\�5j�ٺuk\�}\Z�edd�W_}5rԲ@6��!�\'!�\�P�\�\ndE�p�\�o\�ֵF�\ZG���t�0a\�\�ѣGk�����\�/��\�tF׀�q\0\0P\�1br�z����{\�ϟ_��y�\��l�\\�e˖���xS��\�Ez�%K��>|x!�\�ќ\�I.|�V�NJJj��m\�[6|\��\�\�\��Ŀ��xKS\��B\0\0�6�תU�\�s\�=���0���n�M��\'�\�\�>�\�_�\"�F�\�/�,tdT\�(�>�h]\�n%�W*;�mr(�ֆ\�6x\�\�\�w\�z츸�\��b��\���7�\�kSYʼy�rw�U�x\0\0@55w\�\�\�=�\�/l�InժUlӦM�]n\�Сf�����ᚽ\��\�o�\�V\�,*{�\��Ü���\�\�\\\�ę_W9��\�[\�\r�\�m۶{m�~Ն\�\�\�[���\�/\\��HC.^�8�]�v\�٫G\�\�{~\�\'��k�<y��\�\��Z�Yva8A\0\0Tj\�|�\�/\��W6�_߲e˸\�0>k\�,�駟��;w\�\�w\�QG��=\�3\r6l\�\�,]�ԬY�\�\�%\�6u���>:\�s�&|ذa^M�\rR\�\���\rޟ\���\r\�{���6�o�\�I7~��gs\�i���u\�\�\�[�b��\�?�a?^9^�;\r\�\�\��Ni\n\0\00&L�f���#F�\�\n��r�\�\�l۶-\��w\�qG�\�w\�yg��TT�0v\�\�<e\n\Z	�\�g5ޝr�*��\�73t];b�s\�)��C��\�\�k?_��\�v�/�*�[��\0\0�u\�֭sbb\���\�t0\'����p?�+�\�\�UOrrrk{1׸3^\�,�8�\�\�m�\�Y�x��Y��B�\�\�g\���\�g��\0\0�\\*SiӦ\�l���l\�2ԬY����\\!\�͎\�;%%\�}z�jJMM\�|\�	\'��A�\Z{3fÆ\r:�\�;\�Sq\�TT���\�O\��駟r?���o�!�\�\�gq\0\0�o�;wn\�V�Z\�LW9��	\�M9J��줶m\�v��z�¸\�S>��c�c\�o�ˤ�\�\�J�r(����\�\�\�\�\�^NNΟ\�\�?�R\�\0@�a��N�?gΜ.GydL�&M8��fګ\�#\�*.\�a\�:\�:ؖ\�\�oe[F!O\�ö\r�ut�%y���\Zq\�9\�w�s6*Et0c�	��fOu�줦�.���\�\�ΡP(I�.Y�ě�Rrjvȫ\�U��u\�\�i�/���\�\����\�4\��\�\�;r��Z_Q#\0\0�\'\�=.��\����ǟr\�)	E�����5\�\nSr\�j�m��m�m�\�v�	�R\�7¶\'\\p\��z��lӴ.�\�v\�A�y\�m�(h\�嶝\�\�ӎ��ǻ\��nQ\�E}ۢ�F\\`[-�7V{��A�%�;\�\�̲\����R�q\0\0Ujj\�O\�w\��[�V�L�f\�\n\�~wS�#\�q�մ\�R\�t��@e�\Z\�\��\'hQ�?\�\��\�.7�Ms)a\�\��\�n�F���m�\�m[n۱.�?j۷�\�ۘ��l��l\�l\��2\��\�	׌\��Z۶m��a�����)��}�l���>`\�ԩ�V\�>\"�\0��LEa|�\�٪\�m\�xԑq�������c����\'\\!��	�zh\�϶]i£\�\n\�\Z\�dۻ.+��`\�W.�ww!�\�.ov�}| �b\�_l�\�\�%&\\\�\"Cm�ɶ�l�K�&\\�\�\�\�\\�יhtr\Z͉��\�5u\�� n\���޶ƶi���m[\���X��~��[��\�ۿjo�p\�>I\�\�{��Om{ɶ;u������eW御4\0\0�\�TB�Ф\�9�\�\�D>\�ώ�\�\�p\�L�4E�\�*=��mi��фG�\�\��Wp�횂�s&\\�-k\�\���/�\�n�a\�1�\rv!~�m��m2\�V�\�a��w�\�s\�=Äk�\�E���\��5\�r���w�\�\�v��	\�q�P�\�\0\0�j��\�\�s��a\�Bs\�\�\�>柬g\�޽7\�5��r�^&\\�Ʌօ&\\\�1,\"��\�U���m+Mx\��[\��m\�t�\�i��d\�m&<\�>\��[\�\�\�nh�ZkԼ�	@\�\��\��l\�\Z\�y\�\0@�{�\�7�\�0~݈#Bs\�\�\�\�p�&��)\n5�<\�qf\�L$�\��i\�}�[\��V��\�\�\�\�.���m�G<�JJ�	܎��E�_�-O��h��_�\�\�pɄ^�OQ��&<�֜OF�TN\�*p;ν���V]2j�\0\0p�a�[�n\n\�:v\�r֬Yu\n	\�ƅi�\�fQ�֌%\ZqרyZ\�\�.��\�n\�w!�1̛E<��\�*\��i£\�\�ܲ�\�\�>ӄG\�G�Y�D�\����\�Su\�\��mM\�X\�]Op;R�?����\�v����\�vʪF\�\0@�¸�\�>s\�L\�\�q������\�&\"H���;ϵW]7.�\�\�@H\��5\�Xt�\�T\���2\�u \�\�(?�킡\�_|\"�\���?�F\�\n\�.\�L�\�\�e��R;@\�\\\���\��RC�0\"\0\0�E5\�7\�|s�ѣGo.\�\�\nƚդ����@�Fw5\�Q�\�\��\�.+�5�x=�Q\�\�\�\r\�\�0\�8n�\�m۾vA�E���<\����e[]��4\�ٽ.|�\�q�\�7��q��U�\�T�\�\��\�v�U��R���u�]\�v�ޏ�\�X3\�]o斓�Mx�l�\0\0��4\�\�\��\�+\��t�\�-f_ݷ.�R�C]�Kȧ�\�\��\��E�A\�\�\�k\�킹O\�?2�\�̯�x<�\�[\�f��_�؃ݎ����{���\�A\�\���(\��X�;�\�\0@e��]���\n�{\�\���\�B3\�\��<8ӎ,�OSO�SJj�\�eE�\�\�6�\�\�>\0\0�2\�)\�\���dM�Mg\�\�I�\�Lxd[eI:R;�?	,��5U���\"�}g\�eF�5\��\0\0\0!.p�r��xL\�\nD��h\��.ARi�F̟v�WY��\0\0�$)L\�\0ZM�hۗ�]b\�%*�2R�\�ht�k��Bw�7\�v�mcm�Ŷ7Mxz\�Mރf\0\0\0\�\�Ĉ۷�kD���\�~nĲc\�u�\�Yt\'\0\0\0P�8\�\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\���\�+g�\�R}\0\0\0\0IEND�B`�',NULL),('260002',1,'source',NULL,'{\"bounds\":{\"lowerRight\":{\"x\":1485.0,\"y\":700.0},\"upperLeft\":{\"x\":0.0,\"y\":0.0}},\"resourceId\":\"canvas\",\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"},\"properties\":{\"process_id\":\"KEY_leave\",\"name\":\"请假流程\",\"process_namespace\":\"http://www.fhadmin.org/\",\"messages\":[],\"executionlisteners\":{\"executionListeners\":[]},\"eventlisteners\":{\"eventListeners\":[]},\"signaldefinitions\":[],\"messagedefinitions\":[]},\"childShapes\":[{\"bounds\":{\"lowerRight\":{\"x\":60.0,\"y\":160.0},\"upperLeft\":{\"x\":30.0,\"y\":130.0}},\"resourceId\":\"start\",\"childShapes\":[],\"stencil\":{\"id\":\"StartNoneEvent\"},\"properties\":{\"overrideid\":\"start\",\"name\":\"开始\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow1\"}]},{\"bounds\":{\"lowerRight\":{\"x\":688.0,\"y\":259.0},\"upperLeft\":{\"x\":660.0,\"y\":231.0}},\"resourceId\":\"end\",\"childShapes\":[],\"stencil\":{\"id\":\"EndNoneEvent\"},\"properties\":{\"overrideid\":\"end\",\"name\":\"结束\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[]},{\"bounds\":{\"lowerRight\":{\"x\":250.0,\"y\":185.0},\"upperLeft\":{\"x\":150.0,\"y\":105.0}},\"resourceId\":\"QJ1\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"QJ1\",\"name\":\"提交申请\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"#{USERNAME}\"}},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"className\":\"org.fh.controller.act.util.ManagerTaskHandler\"}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow2\"}]},{\"bounds\":{\"lowerRight\":{\"x\":415.0,\"y\":95.0},\"upperLeft\":{\"x\":315.0,\"y\":15.0}},\"resourceId\":\"QJ2\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"QJ2\",\"name\":\"审批【部门经理】\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"R20171231556774\"}},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"className\":\"org.fh.controller.act.util.ManagerTaskHandler\"}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow3\"}]},{\"bounds\":{\"lowerRight\":{\"x\":580.0,\"y\":185.0},\"upperLeft\":{\"x\":480.0,\"y\":105.0}},\"resourceId\":\"QJ3\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"QJ3\",\"name\":\"审批【总经理】\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"R20171231726481\"}},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"className\":\"org.fh.controller.act.util.ManagerTaskHandler\"}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow6\"}]},{\"bounds\":{\"lowerRight\":{\"x\":385.0,\"y\":165.0},\"upperLeft\":{\"x\":345.0,\"y\":125.0}},\"resourceId\":\"pt1\",\"childShapes\":[],\"stencil\":{\"id\":\"ExclusiveGateway\"},\"properties\":{\"overrideid\":\"pt1\",\"name\":\"批准or驳回\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow4\"},{\"resourceId\":\"flow5\"}]},{\"bounds\":{\"lowerRight\":{\"x\":550.0,\"y\":265.0},\"upperLeft\":{\"x\":510.0,\"y\":225.0}},\"resourceId\":\"pt2\",\"childShapes\":[],\"stencil\":{\"id\":\"ExclusiveGateway\"},\"properties\":{\"overrideid\":\"pt2\",\"name\":\"批准or驳回\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow8\"},{\"resourceId\":\"flow7\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow1\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":15.0,\"y\":15.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"QJ1\"}],\"target\":{\"resourceId\":\"QJ1\"},\"properties\":{\"overrideid\":\"flow1\",\"name\":\"启动\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow3\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":20.0,\"y\":20.0}],\"outgoing\":[{\"resourceId\":\"pt1\"}],\"target\":{\"resourceId\":\"pt1\"},\"properties\":{\"overrideid\":\"flow3\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow2\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":200.0,\"y\":55.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"QJ2\"}],\"target\":{\"resourceId\":\"QJ2\"},\"properties\":{\"overrideid\":\"flow2\",\"name\":\"提交\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow6\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":20.0,\"y\":20.0}],\"outgoing\":[{\"resourceId\":\"pt2\"}],\"target\":{\"resourceId\":\"pt2\"},\"properties\":{\"overrideid\":\"flow6\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow4\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"QJ1\"}],\"target\":{\"resourceId\":\"QJ1\"},\"properties\":{\"overrideid\":\"flow4\",\"name\":\"驳回\",\"conditionsequenceflow\":\"${RESULT == \\\"驳回\\\"}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow5\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"QJ3\"}],\"target\":{\"resourceId\":\"QJ3\"},\"properties\":{\"overrideid\":\"flow5\",\"name\":\"批准\",\"conditionsequenceflow\":\"${RESULT == \\\"批准\\\"}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow8\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":14.0,\"y\":14.0}],\"outgoing\":[{\"resourceId\":\"end\"}],\"target\":{\"resourceId\":\"end\"},\"properties\":{\"overrideid\":\"flow8\",\"name\":\"批准\",\"conditionsequenceflow\":\"${RESULT == \\\"批准\\\"}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow7\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":200.0,\"y\":245.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"QJ1\"}],\"target\":{\"resourceId\":\"QJ1\"},\"properties\":{\"overrideid\":\"flow7\",\"name\":\"驳回\",\"conditionsequenceflow\":\"${RESULT == \\\"驳回\\\"}\"}}]}',NULL),('262519',1,'source',NULL,'{\"bounds\":{\"lowerRight\":{\"x\":1485.0,\"y\":700.0},\"upperLeft\":{\"x\":0.0,\"y\":0.0}},\"resourceId\":\"canvas\",\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"},\"properties\":{\"process_id\":\"KEY_leave\",\"name\":\"请假流程\",\"process_namespace\":\"http://www.fhadmin.org/\",\"messages\":[],\"executionlisteners\":{\"executionListeners\":[]},\"eventlisteners\":{\"eventListeners\":[]},\"signaldefinitions\":[],\"messagedefinitions\":[]},\"childShapes\":[{\"bounds\":{\"lowerRight\":{\"x\":60.0,\"y\":160.0},\"upperLeft\":{\"x\":30.0,\"y\":130.0}},\"resourceId\":\"start\",\"childShapes\":[],\"stencil\":{\"id\":\"StartNoneEvent\"},\"properties\":{\"overrideid\":\"start\",\"name\":\"开始\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow1\"}]},{\"bounds\":{\"lowerRight\":{\"x\":688.0,\"y\":259.0},\"upperLeft\":{\"x\":660.0,\"y\":231.0}},\"resourceId\":\"end\",\"childShapes\":[],\"stencil\":{\"id\":\"EndNoneEvent\"},\"properties\":{\"overrideid\":\"end\",\"name\":\"结束\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[]},{\"bounds\":{\"lowerRight\":{\"x\":250.0,\"y\":185.0},\"upperLeft\":{\"x\":150.0,\"y\":105.0}},\"resourceId\":\"QJ1\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"QJ1\",\"name\":\"提交申请\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"#{USERNAME}\"}},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"className\":\"org.fh.controller.act.util.ManagerTaskHandler\"}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow2\"}]},{\"bounds\":{\"lowerRight\":{\"x\":415.0,\"y\":95.0},\"upperLeft\":{\"x\":315.0,\"y\":15.0}},\"resourceId\":\"QJ2\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"QJ2\",\"name\":\"审批【部门经理】\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"R20171231556774\"}},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"className\":\"org.fh.controller.act.util.ManagerTaskHandler\"}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow3\"}]},{\"bounds\":{\"lowerRight\":{\"x\":580.0,\"y\":185.0},\"upperLeft\":{\"x\":480.0,\"y\":105.0}},\"resourceId\":\"QJ3\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"QJ3\",\"name\":\"审批【总经理】\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"R20171231726481\"}},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"className\":\"org.fh.controller.act.util.ManagerTaskHandler\"}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow6\"}]},{\"bounds\":{\"lowerRight\":{\"x\":385.0,\"y\":165.0},\"upperLeft\":{\"x\":345.0,\"y\":125.0}},\"resourceId\":\"pt1\",\"childShapes\":[],\"stencil\":{\"id\":\"ExclusiveGateway\"},\"properties\":{\"overrideid\":\"pt1\",\"name\":\"批准or驳回\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow4\"},{\"resourceId\":\"flow5\"}]},{\"bounds\":{\"lowerRight\":{\"x\":550.0,\"y\":265.0},\"upperLeft\":{\"x\":510.0,\"y\":225.0}},\"resourceId\":\"pt2\",\"childShapes\":[],\"stencil\":{\"id\":\"ExclusiveGateway\"},\"properties\":{\"overrideid\":\"pt2\",\"name\":\"批准or驳回\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow8\"},{\"resourceId\":\"flow7\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow1\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":15.0,\"y\":15.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"QJ1\"}],\"target\":{\"resourceId\":\"QJ1\"},\"properties\":{\"overrideid\":\"flow1\",\"name\":\"启动\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow3\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":20.0,\"y\":20.0}],\"outgoing\":[{\"resourceId\":\"pt1\"}],\"target\":{\"resourceId\":\"pt1\"},\"properties\":{\"overrideid\":\"flow3\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow2\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":200.0,\"y\":55.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"QJ2\"}],\"target\":{\"resourceId\":\"QJ2\"},\"properties\":{\"overrideid\":\"flow2\",\"name\":\"提交\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow6\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":20.0,\"y\":20.0}],\"outgoing\":[{\"resourceId\":\"pt2\"}],\"target\":{\"resourceId\":\"pt2\"},\"properties\":{\"overrideid\":\"flow6\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow4\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"QJ1\"}],\"target\":{\"resourceId\":\"QJ1\"},\"properties\":{\"overrideid\":\"flow4\",\"name\":\"驳回\",\"conditionsequenceflow\":\"${RESULT == \\\"驳回\\\"}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow5\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"QJ3\"}],\"target\":{\"resourceId\":\"QJ3\"},\"properties\":{\"overrideid\":\"flow5\",\"name\":\"批准\",\"conditionsequenceflow\":\"${RESULT == \\\"批准\\\"}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow8\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":14.0,\"y\":14.0}],\"outgoing\":[{\"resourceId\":\"end\"}],\"target\":{\"resourceId\":\"end\"},\"properties\":{\"overrideid\":\"flow8\",\"name\":\"批准\",\"conditionsequenceflow\":\"${RESULT == \\\"批准\\\"}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow7\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":200.0,\"y\":245.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"QJ1\"}],\"target\":{\"resourceId\":\"QJ1\"},\"properties\":{\"overrideid\":\"flow7\",\"name\":\"驳回\",\"conditionsequenceflow\":\"${RESULT == \\\"驳回\\\"}\"}}]}',NULL),('272526',18,'source',NULL,'{\"resourceId\":\"272525\",\"properties\":{\"process_id\":\"Key_test\",\"name\":\"测试流程01\",\"documentation\":\"\",\"process_author\":\"系统管理员\",\"process_version\":\"\",\"process_namespace\":\"http://www.fhadmin.org/\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-72467598-325E-42E3-9A86-280EE01AE5ED\",\"properties\":{\"overrideid\":\"start\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-4ECC84D0-9FD7-4A88-897B-7D8E335E02F9\"}],\"bounds\":{\"lowerRight\":{\"x\":97.45455183864613,\"y\":145},\"upperLeft\":{\"x\":67.45455183864613,\"y\":115}},\"dockers\":[]},{\"resourceId\":\"sid-564FB26C-3807-4C43-AB95-908C51A7151B\",\"properties\":{\"overrideid\":\"submit\",\"name\":\"提交\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"#{USERNAME}\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2998AEF8-7548-47C2-9FD3-586C56BB57D4\"}],\"bounds\":{\"lowerRight\":{\"x\":235,\"y\":170},\"upperLeft\":{\"x\":135,\"y\":90}},\"dockers\":[]},{\"resourceId\":\"sid-68BB12AE-167F-4790-A606-2B5412EF0651\",\"properties\":{\"overrideid\":\"w1\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B1641219-740E-4CA9-92C8-9C5D13615702\"},{\"resourceId\":\"sid-C4941024-C539-41E7-B246-AC5895A8F582\"}],\"bounds\":{\"lowerRight\":{\"x\":340,\"y\":150},\"upperLeft\":{\"x\":300,\"y\":110}},\"dockers\":[]},{\"resourceId\":\"sid-85960AF4-C333-4E40-97EF-B3F3B5229A05\",\"properties\":{\"overrideid\":\"sup_approve\",\"name\":\"上级领导审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"R20171231556774\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-49C82238-71D7-433A-AF8F-AAAADC4F7A58\"}],\"bounds\":{\"lowerRight\":{\"x\":460,\"y\":95},\"upperLeft\":{\"x\":360,\"y\":15}},\"dockers\":[]},{\"resourceId\":\"sid-43DDC5EB-A463-4BD3-963E-FA9B66A757D5\",\"properties\":{\"overrideid\":\"total_approve\",\"name\":\"总领导审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"R20171231726481\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-AA2EE318-B1BA-4615-9AB7-2145004C2A55\"}],\"bounds\":{\"lowerRight\":{\"x\":460,\"y\":230},\"upperLeft\":{\"x\":360,\"y\":150}},\"dockers\":[]},{\"resourceId\":\"sid-C8E6DB9D-3B0B-482D-A5AC-5FE4D77F8312\",\"properties\":{\"overrideid\":\"w2\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-81296F36-C514-45BD-B4D1-C044EFA8125C\"},{\"resourceId\":\"sid-89121086-918E-4525-8AFC-D9FCF87BA577\"}],\"bounds\":{\"lowerRight\":{\"x\":520,\"y\":70},\"upperLeft\":{\"x\":480,\"y\":30}},\"dockers\":[]},{\"resourceId\":\"sid-952EE2AB-1675-4386-82DF-50545815DB67\",\"properties\":{\"overrideid\":\"w3\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-08CD667F-2F1A-4992-84C4-A6624E950A40\"},{\"resourceId\":\"sid-E824E2A9-11AB-44A4-B920-472298588563\"}],\"bounds\":{\"lowerRight\":{\"x\":520,\"y\":207.00000216744158},\"upperLeft\":{\"x\":480,\"y\":167.00000216744158}},\"dockers\":[]},{\"resourceId\":\"sid-EAB0C622-282E-4A3C-8678-B1272C5D8425\",\"properties\":{\"overrideid\":\"end\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":688,\"y\":118},\"upperLeft\":{\"x\":660,\"y\":90}},\"dockers\":[]},{\"resourceId\":\"sid-4ECC84D0-9FD7-4A88-897B-7D8E335E02F9\",\"properties\":{\"overrideid\":\"s1\",\"name\":\"启动\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-564FB26C-3807-4C43-AB95-908C51A7151B\"}],\"bounds\":{\"lowerRight\":{\"x\":134.32954854684422,\"y\":130},\"upperLeft\":{\"x\":97.8750054863365,\"y\":130}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-564FB26C-3807-4C43-AB95-908C51A7151B\"}},{\"resourceId\":\"sid-2998AEF8-7548-47C2-9FD3-586C56BB57D4\",\"properties\":{\"overrideid\":\"sub\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-68BB12AE-167F-4790-A606-2B5412EF0651\"}],\"bounds\":{\"lowerRight\":{\"x\":300.015625,\"y\":130},\"upperLeft\":{\"x\":235.5703125,\"y\":130}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-68BB12AE-167F-4790-A606-2B5412EF0651\"}},{\"resourceId\":\"sid-08CD667F-2F1A-4992-84C4-A6624E950A40\",\"properties\":{\"overrideid\":\"t_reject\",\"name\":\"驳回\",\"documentation\":\"\",\"conditionsequenceflow\":\"${res==\'1\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-564FB26C-3807-4C43-AB95-908C51A7151B\"}],\"bounds\":{\"lowerRight\":{\"x\":500.5,\"y\":268},\"upperLeft\":{\"x\":185,\"y\":170.890625}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":500.5,\"y\":268},{\"x\":185,\"y\":268},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-564FB26C-3807-4C43-AB95-908C51A7151B\"}},{\"resourceId\":\"sid-E824E2A9-11AB-44A4-B920-472298588563\",\"properties\":{\"overrideid\":\"total_res\",\"name\":\"批准\",\"documentation\":\"\",\"conditionsequenceflow\":\"${res==\'0\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-EAB0C622-282E-4A3C-8678-B1272C5D8425\"}],\"bounds\":{\"lowerRight\":{\"x\":660.8997044134895,\"y\":180.8690769129793},\"upperLeft\":{\"x\":514.2780299615105,\"y\":110.30475337099568}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-EAB0C622-282E-4A3C-8678-B1272C5D8425\"}},{\"resourceId\":\"sid-81296F36-C514-45BD-B4D1-C044EFA8125C\",\"properties\":{\"overrideid\":\"s_reject\",\"name\":\"驳回\",\"documentation\":\"\",\"conditionsequenceflow\":\"${res==\'1\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-564FB26C-3807-4C43-AB95-908C51A7151B\"}],\"bounds\":{\"lowerRight\":{\"x\":501.4545593261719,\"y\":89.35937564074993},\"upperLeft\":{\"x\":185,\"y\":12.000001907348633}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":501.4545593261719,\"y\":12.000001907348633},{\"x\":185,\"y\":12.000001907348633},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-564FB26C-3807-4C43-AB95-908C51A7151B\"}},{\"resourceId\":\"sid-C4941024-C539-41E7-B246-AC5895A8F582\",\"properties\":{\"overrideid\":\"approve2\",\"name\":\"审批\",\"documentation\":\"\",\"conditionsequenceflow\":\"${day>3}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-43DDC5EB-A463-4BD3-963E-FA9B66A757D5\"}],\"bounds\":{\"lowerRight\":{\"x\":359.35546875,\"y\":190},\"upperLeft\":{\"x\":320.5,\"y\":150.09375}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":320.5,\"y\":190},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-43DDC5EB-A463-4BD3-963E-FA9B66A757D5\"}},{\"resourceId\":\"sid-B1641219-740E-4CA9-92C8-9C5D13615702\",\"properties\":{\"overrideid\":\"approve1\",\"name\":\"审批\",\"documentation\":\"\",\"conditionsequenceflow\":\"${day>0&&day<=3}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-85960AF4-C333-4E40-97EF-B3F3B5229A05\"}],\"bounds\":{\"lowerRight\":{\"x\":359.35546875,\"y\":109.4453125},\"upperLeft\":{\"x\":320.5,\"y\":55}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":320.5,\"y\":55},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-85960AF4-C333-4E40-97EF-B3F3B5229A05\"}},{\"resourceId\":\"sid-89121086-918E-4525-8AFC-D9FCF87BA577\",\"properties\":{\"overrideid\":\"sup_res\",\"name\":\"批准\",\"documentation\":\"\",\"conditionsequenceflow\":\"${res==\'0\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-EAB0C622-282E-4A3C-8678-B1272C5D8425\"}],\"bounds\":{\"lowerRight\":{\"x\":660.1674466733663,\"y\":99.734630530404},\"upperLeft\":{\"x\":515.6880220766337,\"y\":55.183338219595996}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-EAB0C622-282E-4A3C-8678-B1272C5D8425\"}},{\"resourceId\":\"sid-AA2EE318-B1BA-4615-9AB7-2145004C2A55\",\"properties\":{\"overrideid\":\"t_res\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-952EE2AB-1675-4386-82DF-50545815DB67\"}],\"bounds\":{\"lowerRight\":{\"x\":479.31305509221943,\"y\":188.32606137912958},\"upperLeft\":{\"x\":460.21819490778057,\"y\":187.6895664995038}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-952EE2AB-1675-4386-82DF-50545815DB67\"}},{\"resourceId\":\"sid-49C82238-71D7-433A-AF8F-AAAADC4F7A58\",\"properties\":{\"overrideid\":\"s_res\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C8E6DB9D-3B0B-482D-A5AC-5FE4D77F8312\"}],\"bounds\":{\"lowerRight\":{\"x\":480.0171646467946,\"y\":52.210154980377474},\"upperLeft\":{\"x\":460.2172103532054,\"y\":51.110157519622526}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-C8E6DB9D-3B0B-482D-A5AC-5FE4D77F8312\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('272527',12,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\�\0\0>\0\0\0\��u�\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0�\�\0\0u0\0\0\�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0�\�\�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\�\0\0\��+\0\0 \0IDATx\�\�|e��\��މt�* 袛uA\n!��(k[@�4�\�ZV &�,X\�I( `~\Z�\"MJ��B�@BM%	��\�3w&L.)7�\�\��~>\'S\�ܹ7\�̝y\�3\�=G)B!�\�-\�|rY\�*\�D\�_���\���M@!�\�\�\�΋%���\�����$6!\�B)Y\��\�]�{��E,V_G�\'�BH)ܓ\���\�ĢM�Ųyq<�\��B�]\��\��6\r!�\��&�B�}ܓS�y?�\���18s��B!���ǧ��!�T�\�7!�Bʟ\�bS�\�+nGIח3Ě+\� \�6!\'6!�b��ЧՔ%{J,��B!�B!�B�C\�$���\�4�8M!�����%!�ζm\��~����gϞIIIM�u\����c\�\�\�ҥ\�nc�\�\�辍\Z5:r\�]w��Ϯ���ǲE	�8X�8:\�S\��{�U�Vj���=oܸ�z�\�\�\�\�\�T�VM�0�m۶\�̙3�f͚\�\�;\�φ\�Mc�B!N�=1�M@�Wn�\�6u�\�Q�t�\�b�u\�\�\�\�ի�QQQC�V�z�\����|vA�!\�ا�\�f �\��=�\��?�\�b�ĺ���v\�Z/��E�<R���S�B!N!��\�\�\��<v\�ب+W�a\�\Z\�\�\�\�L6L1qrr\����\�\�\��ƍ�z�\��]9|\rT\�\\�,y\�uQ-�^�}�7x\��\'�R��\0y�\�\�����U����z�\�\�\�ٙ�SL�3\�$��z\�\�\��z}�������\�ӧOY\�\�o�VY2��Q\��Ob�\�\"�%�x,�\Z!^�	!�p\�ĉ�Ǐ�_�n\�*ݺuS͚5\�\�Q��\�\�PڱF�\Z�I�&�k׮\�M�6\�\���\�~�T~��b�����[l��x��诏Է�\�#�B�BH�p��ڵk�\Z7n�0\n6J)ӨQ#թS\'/\�K���/��\� 6Kl�\�h}\nP\�>Z_\�C,�G�\nqB!�\�Q�=��g�ckMڕ3*n\�Ru���߿��N\��\\�&�bÕ\0U�VU;v�.���7on_�$6Y\�3e��,a(\�#>P��\�\�\�R\�B!N!����\��\�\�#%/~r\��ԕ�̌\�*+3]]���:�g!\�x	��-Zd���\�)#!��\�b\�*�\"q?}z�G�\nqB!���``&\�$r\�\��m*��\�[\�C��?\�,!�4iR\�\�\��\�o���G)\�n\��}\�,\Z�#A�8!��2)\n�%���|�\�𖓒�A�	2P�_�q\�P�B)+�\'�Q�\"+\�F\�o\�bn�^�z�e\�Ö ��$\�#N!v\n�� O8)\�8\�&��l	BHIB�8!�\�)��\�<\�vr��:�!\�B�r�\�k���B�8!��R�N���{\�[ֻ�y�:\�{��!�B�BHiP�~[U�^\�\\\�WoЎ\rD!\�BJ��)��KO�̆��x�	�\'�R\�\\�zN��y\�ܯ��v�\�ub�g\�6�r��\�o�\�$�!\�BJ�K���_��%\�s�kI\�U\�\��*�\��SY\�)\�\�L�2% ..n����ruu\�����\�V!�B�BH	�ɟ��_�ȵ��5(u\��Fur\�\�*�r<\��0a\'N,5j��K/��Ə\�t��\���;�Y�!\�BJx�vRX\�9?�\�6��O���\�W�=\�\�\�{\�\�\�u\�\�I�3\�%11q	\�8!\�BJx��JVf:Ё�>}��\'O.�\'\�\�:tPAAA�9r\�\�l-B\�V	#��\nB�^\��&\�ccc�7f\�gx�s\�_{\�5�\�\�\��aÆ�.Y�d[���qB!�\����px\�Ǎ\�&�+��[�\nqB!������ǎ[�p��D�Y��?\�=33sM@@��lEB(\�	!�R\�	OJJZe�i+\�&Lpsuu]\�\�\��8[�\nqB!�\�\0��\�\�\�.)�7��q\�\�y���GR�B!N!�D8�� &��\"\�\0\�,&L�\'�B�B!��pC�\�\Z^z�����\�\��Q\�\�FH�\��B�3����G�\�\�III\�W^�e\�9s\���\�g/_�vM�1\�\�\�͛�\�ԩ���\'z͘1c���aaa���UۈI\�\�e�C\�7ABl�qB!Ď\�k`f�Z�4!^�J��7qgg��\�\�x���~�\�\�ܲ�k׮����p=�Jy��\"��4\"��\�O���X���[�\�<��P�B!E�\�o`\�C=�n�\�\�\�\�\�Lu\�\�1�{�nm��\�WT7n\�Ж]]]U�\Z5ԣ�\�\Z�O�ĉ�M%�b<Nl���X�XW�zb�b\�\�ڙD��\'�0!\�B�����40sԨQ9�\�)))j��\��\�\�j\�ܹZh��{�\����K��\�ر��!Ƌ3\� �,\�)��,�*\�\�+!�P\�[���:�\�0F�B)���Y�fee%999��\�u���Q�-J*쾦L�`k\�Looo\�\���\�_k\"@|��\�*999{�\�ի��\�_�l\�2\��A�O�0!c\�̙a~~~C#\"\"\��u{��Ӆ87�\��y�.bo+K\�8<\�t�\�CO5]�%\�W�zu3֜�J=\�BH1�Xh\�KG������U@@�?\�\�\��~�N�8��03�y\�^q��\�>�CR\0\�R\r\Zd\��\�s�ƍ\�\�\�\�0\��U���P}�\�*1�\�+�,\�U��\rՅ9��K�e��t\�\�8!\�B)<Y��x{�\�\�\�Ή(\�&6\�\�׷Un\�\'�ܹs�-փPy��Z����\�1���\�\�!\�\�{\�:q\�D\'\�8�و�N\�\�!�c�e\�\�b��H\�Wt�>Yo\'���\�շ\�̳�P�B)D��\�\�\�Ǉa�Hxx��y\�I�\�\�\�\�1S\�\�9��[�+\�	\�9y�䲢V\�lݺ����Sr\�\�e�I�&�k\�\�;�;u\�Tm	7d\���\�E4^[��C��\r��S\�fb\r�\Z����\'��Q�\0�ɴ\�&<��8!���\�\�YYYk��������A\����V+�/2k\�,u\�ܹ|�ILLT_~��\��LOOW���\�|jj��r\�J�?��O�_�UmݺUm߾=�}��\�*!!!\�\�\�`\�\�ׯ�\r>\�߿?{=B6\�	ka\�^Y\��\�s\�Ƒ#G��k׮X3��\�\�	\�Կ,?��\�E\�g\�Ν\��\�\�3Y��u``�u\nBx�\�+K�x��e�c�Г}�\�6�� l�\�Ȳ�,Ubuፄ\�\���=��\rB!N!�$�\�\�\�4\�\�\�\�唿���r9e�\�\r\"\�\\�%7\�\�\�5o*�A`�\�_�R�6m\�\�\�V.\\ȱ�\�ի\�Ν;��S�Ni���{���\�k\��\r48p\���\�\��\�\�a;v\�%�G\\\\N=�#E_^\� m_ӦM���c\�f�aÆii��C||�ڻw/�rL�/��Xdq��i\�4�+V(kG<�\�u늼ϟ���t�j\�~�\�1�1�%c\n�z�>�r^ߦ�i{<Z��ov#����\�V�8!�\n>.%����4��򡩂򕲼F�\��\�\�\�R\�\Za.��n=zT+q\�\�\�f̘�e\�8r\����Qu\�\�\���)S��I�&��\�~[��AAA�Z�j�p6�G@ \�\�\�\����Ah\�{�\�3F�\�\�\�\��8{���Y����\0�u|��\�\�k\�yL���O�\�иqc\�\�\�mqn�QX\�Y��٩Ey?\�ǭCWd\�	��������ꫯ\�3��\�\�\�Xw2222\��\�\�oi[E�̙3�d��#\"\"�k�O\�E�\�6bე%sJ��x\�\'��ַ���\�Cك\�Ս\nqB!e����a2\�\�\�\�\�\�E�\�B�\�E���\�#i��.]�^�uM��\�;\�\�>SgΜ\�^C\�\�7\�|3\��Rq~��޽{�ɓ\'k�e��\��={�h\�|�\�Gj���\�\�\�۷W={���\0��k\�.�\�#�d�\�ׯ_�<�\�Ԉ���\�g�p|WRy�G��s�F.\\�-�C�=4q+Bu��xq|\�͵\�+��9�[.\�x�q��\�g\�ܹ�d\�bk\��m�/B�L���r\�\�%�\rЙ�u���3~��!\�\�ᴂ7\�WYd\�;��e���\��!_�SHYB\\~P�\�q�\�\"^�8!�TD�B \�\�W��|�������,(��0 ��\�M�H�\�\���M��\��\�W_i���[Mx\�\�O8\�v�f\�\Zu��i\��\�\����/^��O�7o�\�A\�4!oď@\�Kk-�f\�B\�\ZB�\��\�{O^b\�~׫WO�.���Z\�ĉ�\�\�}���\�m ·mۦ�7o�m�}�3QP\�\�eҤIӬΣ�\�\n������\�5\�xhh\�Z\�e�\�ց�_|�E�\�=h\�F�\Zi\�\�Ha�\�ʕ+U``��9γ\�˗_ݹsg5\�Ê(\�\����C\�o�א�e�>��\�2�Sʫ�\'��\�\�\�T;�~w �z��%�35s�s??�\��\r\Z�U�Vi1߈\�\�2�\��\�!\" \�ہ��\�/� 4�ǼU�\�\�_\�f/nTT�j۶�\�\�6{�\�LO<�K�^�4�\ro<D�t&�=�+0Bp?�\�\�\��\�O\n�ʯ�\�D�OO\���<݀9r�\�9s\"^}�U��\�8�f�Se\�8Nx*��\Z/^\�>N�y衇�-\�t\�ҫ�v\�\�� :99}\"��\0���-Jq�<\�\�\���#|!*�\�{\�B\�B!N!��饴_[�~�?�\�z,\�G�v\�ڲ�\Z\0�j���;j.1��m��<�\�sڠL\�x\r�\"�\�GxJ��\��\�[�!�\�b\�_~\�BU Q�}ڴiٯ!d\��\�#�\�Zġ6��9�6^�\�go\�ض�E�\�K2�\�\�\�y�ZTh+��5�\r\�7{�\�\rcƌq\�K�㉅����\r9\�10vԨQZl?�Z\0T\�\��@�[�{Ą˱\�`\�\��j!Sd>�}\�\�.�\�VY^[\�fBH\�G�\��� \�g��!\�R�D��i��c��y�6\�\�f�\��hB=����aWYe\�\0�~��\�K�G\Z\�)\�H=�ƍ51��\�x\� ��\Z! ͚5\�9\�K �\"3\�A�\�mڴQ�7o\��.��0\�ݥK��7(�\�\���=\��0�����((sLx[�Y�tV�D\\�ʕ+�D�>%��5\���\�\�t��N�\�o�w\�\�\�\�:S\�X��q<�^���l٢��\�k\��2b\��p\�8GI��>rN��\�2�\�cd)#Μ9���\�֍\nqB!�\\�О&\�w��\�eJ\�A4\���C��\�p��\�֭�:�|\�F\�:b�\r��n��<�\����|�\�\�\�\�#M!�뮻�8s�H�C\�\�\�@T\�\�G|:�[A \\�\�j�R\\��NI����M\"Ɵ\r\r]3n\�8Oc\0gRR�\"d͋/��c�*#�$�ӆ%K�hb\��.�~\�\�(��\�x�>�\�\��e��\�#z���w���I�#\�bp1!\�B���I|*~�4@�\��O��	V��\�y\�Zhǆ\r�@-�9\�;���9s\�h^p\0A<b\�-�o��\�\�\0O�\�\�~Qr�9\�BT�\�\�G|	On~�| \�\r\�qk\���\�\�ǀ\'x߾}Z�\0\�+\r\�IFj\�\�\�)+ \�\r\Z�Dpp�WAAA�ge\�e}�\�E�J~\��p�p|N>��b�P�JDw\��UY�� \�;Pz���\�8 �`�\�Z\�\�y�\�	�\'��\0a\'2�.N�pa�0�駟��hx��\�\�\���w\�Ӎ0��\�;����\��\nq�mA�ꫯj\�+\0Sx���\�3\�=�@�7\�\�Cmb[�\�\�hm� Ȇ��\'�rdHA�C���\�\�\�_~YK\�\�Q�\"�0�q\�\�|5f\��.]��w�\�rL\�\�~ҩB2J��嘶���+/\�r+S\�g���;dy��Q��\0�\���82���,\�J-��\�\�\�3\�B���\"\��\�7Y\�xQ\���\\�8�m_\�}\�Ba\���\0�X{�\�]\��M\�\�_\�Q1nU�g}I}?___o��\"�\����~s*\�XY���\�w��!,�\�qB)%J#~�,(�p\�o��ᠼExy�\�\Z\Z�zܸq�;w.�7��\�n����/B�ժ��@\�\�\�\�2?\\Y<\�-D��.\�\�\�\"�ӵ2�.##c�\�e\'�B�B!��>�s��Y�V�;a*6�L\�3�	/	t�w�n�rqq\"��)K�B\��u\�\"ʵ,ضR#B!N!��\�\�\r\��Vĸ�E�[���yќ\�\�H\�������\�O��\�\�X����+�\�fY�I�\�mB!N!��B�\��\�?\\#b�F׮]�\�\�\�Ç\�g͚USfK4&��胔�|||\\o�\�\�!\�e\�G\�,=D�OQ+�\�L�H(\�	!�bwb<  �7$$1\�\��\�{o\r\�m�\�(�@�\�\���\�ZݐY��\�!G���7R#��0�Va!\�B��0������\n\nJ\�֭[�7b\�K:;Ji�����酄Q\�C�g�\'�B�}���<\Z\Z�Ř1c\�\�ڥ���,ѽ\�\�W������EuOR9CX�ʴ���;\�B(\�	!�Rb|uϞ=\�o\�^�\"�pk���E0\� 5���>\"\��e]e���2BX\�\��\�...Q˗/�\�\�A(\�	!�R\�b\\D�߶m۾�ڷ<����(7�F|C�\�6� ��XO}\�?##��\��VbuOB!N!��R1ぁ��ure��!��a~�\��MD���\�\�}q\�B!N!��ҥ2�pk�P�E\�\�♖�Q�U�Ta!\�B!�\�!�\��M\�W\�\�\�\�SY<\�ZjD��\nqBJ??�\�\�b�~/\��\�T���p\'�\Z!�8.z��h\�rK���\�Ao9CX�8!�\�\�\�y�\\@\��Br��Ԉ-d��,�����$\�\\a���ZKQN(\�	)\0V�g�\�ְas\�BH%&�Ԉ\�\�)�\\��25�{�x�{nbuOB!NHެ{>�ׯ���*�\�ah(v&��M\�N�y!6�rsjDeJ�\�G�BX�rĒG��\'�\'Ċ\�\�\�0gg\���x�899-gk9�\'6H\�Ӻ�\�\�k\"�#��RL���r�p#5b���\�\�2\�\�\�\�B!N*5U�Tٞ��zQf\�䱉�\�����\�l-���\�\��iZwX\�X76!�8\�(�Tީe9��	�8���\�\�\�Af�Z�&\�t\'\'\'W��\�Gғ�Km�\�\�\��\�6\�bϲ�!%y�Q�H�Q�L,�+\'\�2�܄����3g\�\�l�\nO������ô<\\l1��RZ\�\ZB\\�wv\\�\�C��\�Ԉ�B�T\Zv\�\�\�}Uf��\�\�E\�]&q���Ql%�c\0\��\r�MA)t��`FjD�r�F�uL�H(\�I\�\0^\n�\�}.��L�1H\��\��\� #\�f�34\�\Z\�<+��\�E)K�R#z�\Zq�,\�I\�*��P�\�\�qy�L\�Y��\��c\�8HK�\��ڣ,�㏳Y!v(\�J�h\�L??�}r�Z\'���#\nqB*$gΜ\�԰a\�sr1��eҔ\��\�\�\��l�\0\�7(dF��MČO�\�j�D6!Ğ�N�(��q���ܧz�u��βn���w�sܳ\�yyyE1��B��\n����\�\�A��\"##��u��bu�\�a�������tvvΒΣ�Ly\�\�9x\�Ҙ-AJ=\�#��4lذ�����y���L����D�@\�\�\�꺖�)\�	�\�Ȟ\"4fKq\�\�\���o���{\��Z�\�#\�\�\�y��\�\�\rk֬\�#^\�$&&\�\�\�[��z\�\�&�����N8\�\��)\�\�\�\�\�A\\��[\�\�\�iŊ�\�z\�أ�ّ�z�I���UO�\�\�>�zmKE�\�\�\�ܶ_�ti\0�x������\�W�)+\"\"\"\����\"��+\"���,O�\�9��Ԉ���\�����\'�8!v.F~~~�\�ũ�\�Q};ql�9\�?#\����O6m\�\�MlLʇ؋/v�\�6)��0=�e�\\Q\�Bl����r\�8/\�|�\�oŘ���c\�>ޒ\�|������7IOO\�w\�\�{�U\�\��]�\������Kxe	�ᕝ\n��x;vlԕ+W�\\�v��իW=\�\�n�\�����j\�Ν�K�.J.\\��Ctr\����\�\�\��ƍ�z�\��\�6�	HM8��7�i2�*6]n8\�\���ܺu\�n\�]\Z7fxry��\�{l\rbo����\�:Df\�j\�ˋ\��v���sxXX\��B\\��{�興�����K}�\�C�Ow\�-�ƅ�Q�\"�\0Y�m����x{{+<.�^��\�@�\�ΌtnTrr2�_\�\�\��5%%eH�>}b\�:��xp\�U>\"�,e\�u��\���\�͛۸��\�\�СC�\Z5j���1III\�8\�]~���{$@�{\�=\�G��룧�O)!�E�\Z\�\�:�D\�P�R�\�>\����\�=�\�\�\�?(\�I�\�ĉk�=�T�f\�T�F���.�O�V���)r�\nx�\�ױE򤥲�0D9��\�b�A�����^����ڵkW�b�lE���;\�\�^�z1�)�h��\ZD���FDK\�\�qrY%\���Nf�9�E��\�.�\"��l�\�\�W\"\"\"\�m�|???�����\�,��\�۫\�ݻ�V�Z�Z�ji�k׮\������{\�޽\�ƍ\�\�]��\�G�SM�D�\�S�[�Ve\�իWՁ.���?K`�nZn�\n(�S���!\�e��y�uח}\0\0 \0IDAT\�\�M�6�\�\�p��\�ŋ��v~��?\�\�5O\�b����1N!,Qr�G�\�\�.�\�\�\�\�\�i��{xx�RИ+\�K\'`��\�\�\�}��U�<�_��-�`�a\���\�_������U~�\"\�8\�qq\�I�\�(\�C׶m\�\\Exڕ3*\�5*\�\�u\���\�Ե\�cʣj\�\�A�^\\\�\�\�U�:u<�\r<xòe\�βUr\�JY�5U��\�V�F�M�\�N� �k���}��>�\ri���h{�g�,YrT΃��.]\�t��\�\Z����\�F\�$7\�j\�\�y\�Ex� ׼=���{ݔ�WY7X�\�v�q\�:�\�wb�w\�\�������(K��gĂ�\�\��\�>===P��{��<D��\\�V\Z\"O\�\�z\�-ճgOU�jU������\�ر�\�֭��\�ߴ�M�\'\��)�}�Q��\�$O00s�\�\�\�֭[%��b\�\'��O�_��c����j\�e����e%A\\\\\�E�{�\��0[#���-�M���\�\�\�*gh\�	�\�\��r�z\�#nf˖-��Pt$08˓�D��\�x\�cF�lu\�޽w�IHe 00\�3--\r�+~r\��/@d���G\"�\'�\�%\"&\\D�^#O\�Ǎ����������\Z��\�M�PZ\�a�B�\'Ȏ���\�\�\�\�\�\�\�n\� 3\�:,Z5\�4��X4iҤ\�ɓ\'\��\�ozPd�O}jo�\�\�\�˧U�)�Gyd�.\Z	!�X\�Bz-L�t�B\�\�;��% <<|7V�_`�ph�\�pP�J��M��\�^�Uդ?�Lt��g��\'HQ�\�(y=�NI>�\�{\�-\'%G�\rd2�-A!\��w\\YBw\�	c@@�\0\�\�b\�!��+\�\�b|�\�\�\�~uz\�\�\rq�v�G�\�	�C�\��#̸�\�/4�\rX�ԫW��S�|\�y:p3\�kZ��\�lB�\rӅ\Z�d�CO�\�r�ٴi\��~\�\�\�?�֭[gt^�I�ϢB!N�\�zJ�7K��\�B\�gK\�\���6!���\�RJ�G}Tmܸ\�Hm\�1\�z\�\�\nCSH��\���\�\�\�r\�q��\�F�!�L��f�Aq�\�NNNQYYY˕\�)�F�N���T>y\�\��^��Ayc\'E\�ͫ����{*QWz\�	!��\n\�\��#\�\Zc�R322\\\\\\R\�\�\�\�\�\�SO�:��W5N�HC\�w\�}��%���~�\�X��\�,\nqR)�\�\�u�\�\�[2���y�:\�{��!��\nBxx�;\�x{gc�e˖��=[�h�\�\�VTw@�L��mU\�z�s]_�A;6!�R9\�\�\��\�\�j��(\�I�&\�F\�-\�\�\�.�a!��\�C5c���< ���\n_̌B��\�Wϩ{�+\�~�嵫���?Ӷ!�B�\�sŘ�|�t�q��i\"�B�T:.�\�+\"|���x,\�J\�q�s�J<��Ts�B!�L�1���T�d���\�\�\0�ɟ��_�ȵ��5(u\��Fur\�\�*�r<�BqL�3G�-\����\��s)ĉ\�7\�N\n<\�\�w}\�$�B�����\��Ν;K��������\�����\�?\�\�t6 !�\�@\�\�\�\�l\�\�\�\�e�q\��~u�\�\�R)ꃰ�={�h���ZE!N*\rmz�\�F C�F��N�>��5k\�4?��>>>��\�\�o\�\�\�\�\n�\�\�ɩ�\�mL�,��\�W�ye\�\�222\�\�_�\\\�\�gӦM*==\�\�\�+zy{\nqBH�dʔ)\'O�\�۷������\�o^x\���e!��i2i(\�\Z\"��\�\�&\��\r�\r�i~@�?�\�C�iӦ%�\�䚭��\�lo�|��ye�x\�\�o\�Rڵ�\�/v��TV&L�0\�ĉKG�\Z\�<l\�05f\�\�3g\�,;v\�lBHe&<<B�e޽d\�\"ܖ��(>\�\�\�|�\�Fc^�\�\�\�Ke����g\�\�\�\�\�\���\�\�ǇS���\�ܵ\�\0_\�rw�m��\�W\�ՂVb\�ؔ�2O���\�W�=\�\�\�{\�\�\�u\�\�	b\�%11q	\�8!��X�L�SzJA��[�C���\�:u\�\�)�\"\���\�\�h�|F!^�xDl�X?�G\�6\��\�T\�\n�B\�ݐ߳&�?�\�L�>}�ɓ\'��n�p�:��� M��9�i�!��\�d\�\"��\�z\�{v\�\�\�2��\�\��]M�6M+)\nxߔ)S2<���D������7cċ��\�~\�\��\�\�/�;w�\�ٳg\�&\'\'����9����\Z5j�7l\�0�N�:�\��\�9?��\��hT\��I,*�׆*Se+\��\�\�=�t<nr����w�Ë�\�\�\��!�\���\�^{\�%888bذa�K�,Yǖ#�T60@\�\�M����f-�#\"\"\����Qz�3\�Lx\�\�x\�\r�19�=���U�V�;Fv\�DLxff��I��!b�#�7�x!�={�\�ϟ��\�_\�j۶�\�ݻ�6)z<==Ujj*��J�~LLL?ٮ\�\�ɓ/�8�4iҔ�\n\�av\�E�5�L�\rź�UU�P���Ń>U\��\��Q��J \�$\�\r\�7n�۬Y�V>��ŋo`B*����iiiCD\�N�Q��]�bE��iˋ���P~~���S-Č�_�^ĉ\��}�ݧZ�l���\�իk\�\'\�(ֳg\�X�|<�7<\�p4���\�\�\�݉�^�̜9��� [�_�\�Pzy\�I\�\�b\���|�+W�T�\��\�\�\��Ə��_�W�b\�\��s.��ee	W�eZ�QƯ\�\�.�ׇ}�\�7Y�L\�\���?�fAPPP�\�2Ǆ\�\���񻿑���dXX\�&�$!\�Q����&�f�\�B��\�W\�)\�\���Dx�U-E3�!��>���lGL�#���q\�)�?���\�>|x\�\�?\\�\�_V�7Vr\��~\�\�\��;�T�\�Fxlٲ\�\�\"~h��/�\�:w�b;\�J�#�\'<��|\�\�#�|�>?@lM^6lذi͛7\�I`\'?~\\-]�t:[\�6\�	OHH+�\r6T�Z�rٱc\���m\�\�?t\�\�a�(!đ�զM�Q�i\"eq�bF~\�;\�\�\��e˖�ݾ}�i\�� &\\�PDq�-��$�T�sH��\n?͔\�\�Ӷ�M�\����\�ןu\�\��Д|��\�ߒ\�q\�\�9\�y\�\�\�W�>}���γf\�z#88��\��\�\"즆\�9e	M\�h�\�\�\\���ϟ\�\��O,\�J�\�p���\�Cbcc�w.�7\�\�T<\��\Z\�\�\�\���-Kq���\Z���2a#�\�2?\�\�\�cբE�R�xk�1\��\n��\�$33s���\�rW1o1ē\�3�m^vd�[\�\�z(ċw#MD��)S�8կ_�D�	\�2����k\�i\�N���o�h>c\�HQˈ���^���ȴ?Ƈ�\�qqq�m�	/�	�3gΤ\'�Th|}}[����\��\�\�-�x��3g6�0ߘp[Y�|9B^Bu#��)�2q\�\�\�.\\X3v\�X���\n�V��ڵk\�aÆ����|�\�?\�*��\�x��x�\����\�1�a��וޫ\� �-���;��\�\�U�C��\�=\�\\��)�CS\n\�(\'N�XR\"\�@Sqݱc\�\��\�\�#�?\�҄��$�;v\�,B�SY�O8<\�\�bυ��OF\�]lll��98$�\"b�~\��\0[�\�G<\�\�\�7>�\��\�\rG\��\���Gz�6�.yx��\�\�Hax\�j�=V˧L�ȴϸ1PB~���6q00�رcZ8�!\�1\n��W^�e\�9s\�(�.�\�1b\�-\�͛7Oˊ�0\�{͘1cu@@�\0\�$�T\�\�\�\�#Ct���\"՟DDD\�u?wFFF\��1j;L�\�\�=���\�X�is�\'���Bn⃥�\�1ݥ	�\�\�\�\�D>\�6G\\�6\��l3+��\�1�p�l)�\�\"\�	����[v�Ƃ�R�\�͋��3\�\�x���~�P��v\�\�jȐ!�7�?~|y�*??�\�\�\�{\�\�\�\�\'   LD�����^$��mxx�s�\�\"<h�5\�0.\�F*fx軈57R45-C�\�v\�\�E��r3��\�Ϻ�oʥ\�СC].\\���dA)�\�[ҩ����_̓K\�\�&a>/�]�\�(֓\��L�\�ܲe���\�?�\�\�\�Lu\�\�1�{�nյkW��\�޸q\�rQtuEa.�裏޲/x\�\'N�\�6cƌp\���\'�ؓ\0W�z!>YYYX��\�D��[L1]T:�}.v�n\�%XY\"\�\�F���*��q�.Я\�\�]5	x\�F�\�ǍB\�F󦤤4-�\�҂��MD�7�l�\�\�\�\�\�\�\�\�}UD\�Zgg\�e\�\�\�\�\�y\��\�\��=YhԨ�&�\�\�\�\��\�ݫ�˖��\�i���9\�yٰa\�\�r\�Q���\�-3��Q�\�\�ɓ� �s�`�պuk5w\�\�\��\0\��_|1\�Z;vt1� \�2L�b/\�H1(\�\�ٞ����-J*��o�=b\�\�f���n&��ߨn\����X�>\�H\�\�\�T\Z�B!n�V�Z\�:w\�\�jk����{�\�n?��\�s�����*?\���\�,�[�.~VxxxD瓦\�\�ٹs�z\�\��\��N�j�\�)�裏�*^y�ʨ|��z�]K�\��\�\�վ}��j_�l�s��LP\�m����\"jq����2eJ��3�\�nTu�\�8�\�\�\�\�ۡ\�\���߯U|\���	&d̜93L:�C\�\'��%(C߰aÁr}\�Z�{yy��\07�\�\�4��#�\�e���,^\���\�-5�\�I�5\�wP+N!nnW\�\':t\�P�q��?��\�c�,\�\��<T~�CS?+eyMI�	�\�Ν\�D��S�ԗ_~��Xw�\�k����֬Y�y\�r�\�[�j�\r�=qℶM\\\\��\�_�m�@ʜ\�rN�\�09-�Igq�\�P\�\�u^� \�n�y`fA<�\�3j\�֭\�B\����׸�A�ٴ?�\\�q\�\�eΚ5k���g)\�	!e!����1��\Z��\�;	n\�\0\�.�\Zc\�\�!�Z_ol\�\�\�\r�\�����<m�\�\�\�ړ��M._�ܲ�\��!=brrr\��\�\Z\�G~\��o�\�\�=\�\�v��(>\�q�˗/W�z�RժUӖ###s�+___m!)b\�Ǐז�oߎ�L(p�\�\���s3�aÆI\�YD\�\�b㼄\'\\ᅪ��Κ��\�\�իW�uf���\�?�|���q\�=�T�8q\�3fP�B\�C������\�Ni˔�z��bQ��h\�e�t�S�\",�%\�9��\�.\���$\\�~�n\�eIZZ\Z>���\�i\��\�\�S�jWSSSs�\'<\��\nBP��\"\�\�݌��\�M\�ͫ�z�%\�zPPP��>��&\�W�X��5kf��\���絸w;8O\���s���8/�}�\�3\"\�\��b&b\�16aM�i�s�I�&\�\�\�\�ҩS�j&L�(b|�t\Z�3N))P3%%\�e��0	p\�����\�ϥ\�Z�\�\�Mo8�fU���Vl�\�k\�R|�PP�С\�{\�&\�\�\�\�\r!WV\�ر^9�\�L��\�be��vy� \�N�<�D�hW\�kx	�o��^{\�5̓�v\�Zu\�]wi�ϦM��=鯿�:J\��\�{O%&&ڭ߶m���矕�\'e��\��X�l=@Z~�)\�:xƟ~�\�\"\�s\�\�uz�\�\'\�\�k�qֶ�\�Ä�\n*�s)C-6]\�Y\�\�_��j�� #\n<\�\��\�_�[S�n\�\�R���\"D_\�\"}�.\�)\��W\�\�&\'�GY��=z�/��\"S���Ka�����\�,��\�8d�h׮][\�\�q:t\��e(wwwd�QgϞ\�Rщ\�B� m�\�\�߿��!�!\�\�a\�ׯ�\�	�\�3�ڣ���qG��i\�y��\�P\�\�3�\�\�\�|\�\�իu�\�\�_\�ʙx�\�\�\�x\�׭[�\��\�\"\�S�˙\�۷א���\'���\0\�\�\�W$n���b\�j�q� ��w3�vx\�\�7m{]���!\�\�urDN!n���[bRR�72,�\�\�.Y�dZI\�\�\�\�?W�#��2\��㢋���B*9�N�����\�g\�\�qj׮�\�\�9r����+\�~������\�o﯅s\�VU�\'�P���Z�\���\�W�s�^�z�xҤI\�*�\�,��R���\��\\�\�|�\�7������꫅O�1?p\�@���7���ut�\�\�\�3g\���}���`X\n!�Р\n���\�=<],U0+�\07s�j�s\�<\�\�~g\�۬�}\�4�,+\'N!nBn��ccc��/�����\�\�2�(�.3ļL\�o� \"����*�\'�\�`\�ƍ�\'^n�[!3m�W��\�oWe�Dn\�\�h\��w��-\�\�{ｷ2((\��ܹsW\�\�\�V\�8\�6\�Z^�r3]�\�3~\�\�%-7=\�%[l�p?�\�\Z\"�5	!�\�Fz��B�+K\��*\�c7�����\�&D\�m޳g\�=z��SV��������-e�Q\�&��Jl��\��5�8R\Z^M\���2e�z\�w\�ѣG��f�ni\�M�׿��~��W5p\�@�{\�1����\�P\�ehh\�Z\�e�\�\�\�)_|�E�\�=He�bP�O�ή��\�ʕ+�,:q��\����O�pBHa���k/׾q\�+\�*��B\�\Z\�\�u\�\�?��ox\�ʪ�Ϗ?����R��e-\�\�HW\�cXQ�\�\�q\�୷\�RK�.UÇ\�r�#\�g\�Z1�)���תo\ZE|\�G��e˴\�\�x�\�\�=^\�Q(\�y	1>r\�H\�9s\�D��\�n���m��Y�{yyi\�61`�\�ŋ\�:�4a\05΋��� e֬Y5Q$�\"�b+\�>�lg\�\���K�vR�P�\�˗/�2d\�>�\�v\�ڵk\�\������_III9RJ\�\��\�������\\A370�ϸ9U!\�\�\�\�`�\�@\��_~Y3Rf�\�y9o޼5҉\�7{�\�\rcƌq\�K���\�Z�T�� g8�\�\Z5\n\�\�C��gۿ����vȍ�p�����R=��AD��ሐ\� ��|DN!NLddd\�^�p\�\'(\�Q\�^�O?���|\�G���\�8�	lCLVʴ/J��\\�re�\�䞚;w\�ѣG{Z�q<\rA\�Tt\�P��{�\�\�<�\�v\�\�Q���&v�ٲe�\�۷o�}1&�R���}DpO\�m�\�;/\�<==?�\0\'��M�x����[�v\�\�\��\�\\bb\�����p�:!\��\�nJKK{:444u���\�듒��j�F%M�_|1\��K/��#�\nBU��\�Y��C�ˬE8!$?��G�\�\�t�\�}o�\0�S�WoP��\nsAn\�\�׬Y��}��WZ�n]���{mժU8\�ΫbR�\���A���*((H�R.�>BU�\�\���C��r&!$7=SRR�\���X���y[tŢ\�\�\�+l%b\r=⹀�\����\�\���ճgϦ�侱�iӦ]�\�X���\�\�&�\�@�JZZ\���\�ٳ\'�$�	\�p�pBHn\�\�\�?055���p�\�!\�\�D��vvv�3\"\"\�#�p�.l�\�9t\�PL۶m\��\�w=e�^�^�b\�;v\�؅ɓ\'_�*b���\�Æ\r��XZb�\�\�ҥK��%\n�\�mӦ\�O�v\���׹Q�FEv8 %881\�C�B1P�}������/��!\�{���7FlذaGLL\�5��/\"�\�\'7��\�����t��k׮~^��Bn\�\�ϟ_U~���w\\�\nq\n�,\�\���w\�ΝZ�l\�\�\�\�]\�.<\�\�2\�\'\�lUB����֡C�\�dv�*\�\�\�%Cl�3gF�_�~olll&[�P��\�\r=Fz�+�9\�q\�F��\r�nڴi[߿k׮\�S�NM8x�\�%Y|Fn\�Q\����\�\�? \���\�gp7j\�\�\�\�\�	W�	\'�\�\�ޝ:u�\�\�\�D\�Ie)��]l\\BB\�\npR8X\��<߽���Ν;����\�׹\�;b��׿z\�y\�\r\�֭[\�\�ӳjjj\�դ��\�cǎ]���\��\�\�ׯ_G����#]Ɓ���-�\0\��!!!kǎ��t\�\�n�G�p=E!E8!�SL���,#Lu�\\#�1.�-D(\�\�N��\���7���\���\�o�\�\�\�\�czBl+�-\�b=���b�\�?\\#b�F~źP�3e�y\�	�\��\�=FY\�5.\�kQ	S\�\�\�l!B!^N��LBu#�T\01.7Uߐ��\�\�ƍK��\�{kXo�gG�D\�zV\�$��\"<2\'ׂGu���ً\�\�I}7[�P�BH!\�\�T�\n�\"(((�[�n\�b\�(\�Ê��Tj>\\���*U\��Gr]� 222�-D(\�	!�\�a*τ��~1f̘\���UL8E8!����\0x�Ǚ\�Ч�\�\�CPγ���}s�X}�L\�\�0\�\�(\�\�]\�~\�PB\�I��iܸq�S����\'��\�\�\�\�\�\�\�=Df\'�\0o�u��)\��]�Eaaa\��B܎xP��\�\�b�b?+\���\�\�P�\�\����D���v�;\�\�\�\�\�\�MwyE\�\�\�p\�رQW�\\r\�ڵ\�W�^���j1�� \�\�\�セ��\�7n\�\�ٳ\�wl\�U0SSS�ev�X+}u��222�&��O�\�Ӻb�bHWTM\�\�B�\�\�k\"\�O��X���Sʒ�B�\'6)!\�.h�0O+\"�_޽{w��*\�\�\�\nV�zuU\�Bc\�&ҙq�\�M�\�\�\�~			�����_SRR��\�\�\'��\����n�䘎\�]K_�xzzz88��\� 7�u]l\�s.-6El��T\�\�o��\�3\�f\�\n!�ȉ\'\�=z��f͚�8<�l���\Z5jh֤I�ӧOw���\��\�\�<��\�\�\�B�X�*G#\�c�=\�\����A\��]\�� \���\�Z�\�\�/BN�\�\��)-t���\�4e�|�Ҽ\�\�\0\0bIDAT�7�\��Oo��ĐC�_ЍBl\�bO�k\�N���Ag�f͚^X\Z�l�^�8� w\�\�������\�\r�ko<\Z����(\npB!^q�E7���\� Lsh�9<��.\�18��3b\rM\'�y��Bl\�(��\�%\�Ӯ�Q\��آ�%SYY�ʫVsՠ\�#ʳFc6^1�Z��\�رc���y\�\�͛d�\�-\�\�\�q�x\\Y\�71\�q���\�K�\n^__\�V...��8pOC��MgB!^�i�\n\�|\�9*n6K\�\�{��g�4��b���p��\�%\�O\���J�~5{ݵ��{�f]FP���oѢE�t�\�(��\�^7�ڞbȯ=\ZX_��\�!eI\�ZVB\�\�\�ch\npB!\�@���i��.��XS�nl6BHQAv\�D�Dn\\<�-�\��d\\W\�E�&��K�&M�\�9y�\�\�|�M�޽{\�\�́�]\�P�}�.�[\�됨\0O�\�	�U�yjp�\n�tb?���\����P�;/*K�IA 4��X�Q\��\�\�e\�\�6\'�\�R\"3J^3S�O\��^x\�I\�ѠA��S�N\r�\�\�$\�p��)6A\��l/\�_��\�x�Ć��U�A�\�\�\��\�\�U�y������,a�\�<##\�\�\�\�\�?x\�\nq\�1o(\�3۪g�}8�\����\�YʒC|��9z�%�����\�\�O�NV\�y\�!\��\"+\�F\�o\�bn�^�z�E��T�!\'\���.\n\��(�\n}D+a�Oň\�	\�Yl�\�he�X��.���ǂ�P�;8\�p�1����ϱZwN\�K�u\�\��I	)Q�Ol��9�\Z`l2\�Q���C�\�	\'\��۔\�\�\�@@\�I\�Ǻx\�q8�B�%\�Y�/N�b��\�\�=El��\�G\����ਂ\�\�\��qzz�B\npB!N!\���r\�?M\��ꨪ\�\�4P1�\�z\��88�=3A\�Ẹ~Iϝ����\�Mۣ���\�e�	G\�\�8e�\'\�#l\�m}]�1��W��Q�~���W\�E��xf\nq\�\�7�,T���Av\\Y*�<�\��\�\�\��Oa�g�ܼj���kWz\�I�A8	�\�)\�\'\�\��A\�����\�B�#6|���aⷸPY�\�\�O�*\�@M�\0\�.CON(\�I�\�\�\��\�\�˗֬Y��Q\�$&&\">�[\�f�(K\�n\�\�\�\�\�u1\�\�\�i���~�\�-�S\\ܼT�\�=y��\�`z�\'{���� ���\�\�\�5���dC1~oI�\0\�{7\��W}Z\"\\��`\�\�\��B�T*\�\�ܶ_�ti\0�x���������%l�\�\�P7N;$\�\�UU\���.�\�{\��\�\r\��, �!J�B�#S\n���b&\n\� De���� ��2\�\�\�YQ\�#�\�(\�U0u\�\�\�$�Y��P��ʋ\\g\�\�\�?ٴiS��ҧ�2!�\�ŋ�\�:�M�\r2�lV�gb�\r���<.wX2n�ܲ.=\�2\�RT\�u~TYR.S�ГE�k��PG��C��\�~�uz\npB!N���zh\�֭[�>}�K\�\�O./bbb�\�\�ʺ��Dr���M�#qC\�\�㕩�_=�~�R+mo\�\�Gԉݟ)\���{\��<[��``\�He	GA�2�l{Y\��+Kx�.ԋ�������\�8\���\07\�Уϙ3gVQ�\nqBtRSS�\�\�\�\�^�z�\�Jl�\�%))i\�ŋ�\�\�\�\�\�\�\�A}] 3\nn\"f�\�?�\�.\��y����cs�U5\r�%W�;\��w�R���PNNt\�\��\�\\\�8jx�1\�1\�\�(�Ga)G�%$�(�\��~rOy_�\��X��P��;}���-**\�C��j׮]M��\�\� 7�\�8İEr\0�\\]�u\�\��H\�Z��w�\Z^�3�7jo[@�{l�ܯ��]����\n�8\"o����#G�,�>}z\�ԩS�3P\��؇q���;���\�)�	�\'�ЫW/\�\�Q�\�߿�y�\�\�M�6�Ø�R%\�(��C�K��g�\�\�@}Z[�\��^\�\n�\�M�us�c\�|M\\��\���j��4�9Ȕ)SN�<��o߾*::�o���\�{ｷ��l!�q)޺/RX��V\"�\'\�\�S�o�\�\�\�z7\"\"��v�P���͛7w����wO���\�\�իw[͚5�\�9\��ѣG\�ʕ+qCPw\�q�\�~O\�	G�BdG��LĄ#���1�� �\�V�mq��(\"\� +�a��Ȅ	�8qb\�\�ѣ�\��^թS\'\�s\�.;v\�����E\��)K��ZEy���_\�(\�\�_\�,o�0�\�\�\�\�y\��\'E\0a*�lٲ�s||�\01�B\�i�\���/�@n\Z\Z��q;�a�\')\n\�p`f�\�\�\��\\�^\���ltO�2C�\�j̘1.~�\�\�b\�x� ��\0_����.\�\�B!NJ�Gyz�\����LMM\�r�%\'\'�\�˗{-Z�(�GС�_HM8�MA*ӧO��Q�Fe�p�:��� �\�\�\�%#G�L�7oޚ\��.=���ƨ�p\\g\�ˣE�8���\�a^NKK�QE��F\�x\�\"�e�\�#ba\�R\�\�Y��mcG\�cƌq�<7���\�^s	�6l�\�%K֕�\0T�$1\\[�2�\�\�\��\�[�|y�!\�r�\�S*7�\�\�/ʒ\�Yb\�Z*KA�l\Z\�\"|pA\"\�\0��q\�ƹ͚5k\��\�ßY�x�����,=U��FF�8��\�\�\��1\�\�B!N�A?�e__\�j���W\�4	b\�\�\�*l\�h�?v\�\�bĄ$\�\�b|���\�3g\�\\�dXXX��~~~�NNNSe���\�\�			�,\�C�8!\�\�L�V\��\�\�\�0�Ul!���X��t��.g]�R��\'\\\�.\�1ᶈ�	&�A��������9%����\�m�\�\�ǀw\�W�!���U�B!N\�-dff��\�u��O��w�+�T\�6�І��)(\�\�B���x\�w�]`���\n��\�\�\�.6gG),z��gppp�-b�\�\�\�҆�\0�,\�B_�lN�			k\�\'�B��\\�G&#�V�\�\����0{J�\��\�1\���Q쌾|Z\�8��8����[lKLxA\��&L�9sf�b\�{����SSS񛪧�\�\�\�\�4;>>>��\nqB�\�\�n둕�U\�z��K��I���4���eKB\�}`f��p=L\�sƌ+�1b\�e��\\#_�ٗd\�D\�B=�e\�	�\'\�f�\�(� \"<C�)\nq��(\�x����?\�\�!�\�f&%%�W^y\�m\�̙�\�ׯ��|\�\�55bĭ��y�\�:u\�hb|\�ĉ^\"\�W�\0N��233G\�5\�\�ey���s���\�x$�\'\�f����y�\\E\�O\�AF��\���6q�\Z�Y�V-M�/^�X\�ZO\�\�Y}��\�a\�\�\�\�O?Unnn\�ƍ\�r\�ڵ\�c�=��p=�J�>�\0c-\�E�ke葆0\"\"��}	)#�\�đhР��L\Z\�\�Ux}RRRz���\�F���p\�Y�Wv��z\�w\�˙��JD�ڽ{����￫�f�pWWWU�F\r�裏޲/x\�ǌ1]_\nJN�8!E?����*`-<E\�8ˢB�����[(n��%(µb=�eG5j��R\�f�����`�u��e5w\�\�lo9�v/���rqq\�u_ݻww�4i^����<��P�Rd�����I\r}�^z!���E��MA�Kl��23vGS�L	��b����\�\����\�^��\�\�\�\�\�\�uիWW�\��jٲe��\�ر���	��0???�� ��!àA�z郍\n\�5l\�e�\�\�r���\�Tε�����L�\���Ү�MMMM��C:��E\�F�>}:&�\�/\"x��\'��b\�3\�<��nݪy\�BQdp2\��R���.ڴ?�\\�q\�\�eΚ5k���gS�Rt\�\'����ܾ\r[��2�a�\�\�\�;I\�\�2<�/�0�₸\�g\�f/����?��3\�m\�\�\�Udd�6/\"S]�r%�͟?_%&&fo�믿j\"q��\�9\��\�?W			�~/�X\\�~��m�`���\�\�!D\�jx\�&ә���?\��?)\�>L:f��nb\���s\�\�E�b&BM\�=�jժ\�\�\�\";���!,q\�=�T�8q��\�{=ㄔ]/�� \"\"\�?2��y\�d�\�����il%RNT��\�`J�E\�$\�y�N�WxxxD�Wq�\�o�]�\�\�G�^�ZU�VM}�\�\�%�\�\����N�:��D\�۷O��\�\�7\�PC�U��7�18�	\�Gy$\�~�.]�<�����SM�\�Ԧx>\�\�sF�6\�\�ǎ�6mڤ\�\�\�հaô��D\��co9��\���\�i2�{�:u6�<yrbQ+f�n\�Z\�~�s\�NmЦ��W׮]�\�N�:U�0a\�\�3f,���\�\�3N�\'�G\0\���0�*�\�Y)\�k\�2|\�ZJ;Whx��O��N�>�e؀07�;e\��A}H�\'\�U~AAAڶ\�f\�!s�7\�І�����\��\�l�/}͚5�\��nu\�\�E�=\�3�<��\�\��hܸ�&\�AӦMKM�\�\�ݻW\�\�˱k,)[\�N���\�x�\�Ŏ}��UE-[��~�駜\�?+K=��\�E\�g\�Ν\��\�\�3n۶m_\�f�WB(\�	!\��\�4L�ü��\�)\�\"oai{\�αa\�ջwo��jx���\�;M���eo��̓�\�\'O�������T{�\�Ѷ�裏\���9C�۷o�D\�\�X\r��k׮\��~��e\�\��\rA\rO/�\��\r \�Ϝ9�}_y�G��=�f ~z\�\�b�$رc���\�1;U�QI\��p�z�\�J\�k|�N��\\9sŊ�\���6^�n�\��)\n���\�^C�ۗ\"�\nqB)M�\Za\�<\�EP\r�\��\��\�s\�J\�\�\�\�	e\�\�\��0�+4\�{@t#de��\�Z!�A�F���^P�}�Yv��D1�\�\�q|.�=~�x������\�\��\n#�[��e�8q��\Z�\�0x��=�\rD��m\�T�\�͵m��7\�|�DE8\�ѣ���E�N�\Z\'\�	(\�\��W�\n\�P\�\�\�����g�\�ђ\�\'$$$\�\�W_-tx\nr��eK�w�~Ra��9s��\�spDD\�R�\'��\�\�v��\�@\�\�J|\�f\�5fQ��Ԉ��\�_�yf��נ\����k�9\r\�yo۶�\�\�6{�\�L �B@z�\�	nx\�!(\� t\�\���\�\'�|2���|�I�(\�\n�\�\��4i\�4��\�:q\"\�3������$�EbE\�\�Xo+��AAA\�\�Ν�J�.�z\�!��$\�\�\�f\���K�����\�\�\"\�\�|�ᇆg\�B(\�	!�\�Xd\'?C\�S�u̱,\�ڵk\�\��Rl�#hdp��y\�\�\�\�q��@�\���p��d\�@\\o��\�\�,f~�\�-T\�\�ŋZљi\�n\�Y��1\�-��F\�:\�\�U$!\�!����\�>{��Ķ�!\�m\�\�\��㢋p\��-�vUdd\��\�\Z\Z�VD�@���5{\�_|��p�B4j\�H��7�jb�r\�JX\��>\�IN�8!��:\�\�\�2�V��\�\�\�?5цA��\"\�0\�\�E�d&\�4Jl���\�&�.<���Y��Z�j�M!h\�9�\�E�H�n\�ԑ#Grlq�i֬�&\�^o��:\�\�E�\�nӦ�ڼy�&ƍ�3�b&⺻t\��F$�\��1{\�af�8�<e\���s�MY\�d	G\�U2;;,,\�¼b|\�ȑ�s\�̉x�\�W\��\�H���Y��}���\�k��\'\Z�m衇�-\�p�Y�f\�DV�pB(\�	!\�AG4�\��\rO)\\�\"��\�b`�18��h\��\��ɓ\'�����־�n\�	GL�!�!ڑ\���Լ\�g\�\�\��}�ݧM\�\�.-\�\n\��s�	w\�,\0�\�<\�O\�`͂@�\n\�\�\r0\�:���فA�Ҟ\�y��c޼yk\r\Z\�O\�s���{^b�\�?\���\0\��J��F�R3f\�\�\��\n�`��\�?\�2�FL�\��\�\�Z�L	)[XЇB\�x��t�H\�W\�f���p_�Ue!\�1�\�%�T#��80��@\\c`�9<�xĈZ��Q0\�1Hy\�:�F��\r�4�Xg\�)���\�6�B>���\�0�q̿�\�+\�\�\�\�^y�\�\"\n\�3\��F\0`�m�j�Ln�\�\��\��_D\�\�p��+WFݸq㩹s\�\��? <��q\�\0�v\�\�=�S�\�g�q�`�z��ڲe\�-�BL�10�\"�����M@���\��5&&&�-B\�����)\�Nd�I\�\�\"l\�,[�,B\�\�_DD\�7|ذaӌl %�\���\�?4\�(�\��4�����J\�y\�ZvCԙ߇��\�t\��\��c\r��\�o�i\"\�BT2��px\�_~�eUP\�?x�\�}G\�k��\�\�h�q\�F-c�բE-^��$2� ^\Z\�B\�U\'K�\�,]�t�y��GBI�7rn�!�z\�Ν;�l\�\�\�\�\�[[�����N��n���t���\�\0^q��D�\��\'<88~ґ\�\�_+!\���82��I\���{K\�b�\�UE\��\�7\�d!�\�^�:��9��V\��5\n�\�\��=��\�}sРA�\�\��*((ȳ8E�1��@��r&!\�CS!���\�\�;\"t��W��a\�#�K�������\0a*iiiO����\�ٳ\'��DxHH���BN�8!�B\n\�i\�\�G�\'<##c��B!N!�ĸ�\�\���\�+�7fʬE8!\�B���@�Ϛ5a*\��^\��N�8!�B�&\�oܸ\�?$$䆭b\�\�ΘpB(\�	!�R�<\��?��\�\�wﾚ߶([?k֬\�2;�\�(�P�B!�\�xVV�oHH�\�޽{�s\�1\�ӧO�D\�z\�!�B�B!%\�L\�\�ӟ\nvڵkW1nΎBN�8!�BJx\�E�?\Z\Z\�s\�\�DC�1\�G!\��qeB!W�\Z4b|M\�ƍ�O�:UUDx\0E8!z\�	!��\n.\�e�...��\�P�B!��\�\�\��\�<%�P�B!�B(\�	!�B�\'�B!�B�B!�B!N!�B�8!�B!�\�aAB!��yN\�\��I;Φ\"\�q�G�B)N��\�c\�\�\�\�L�8�B!\�\n�\�\���\�g\��:!�B�B!%\�b~�\��b\�\�,�P�B!�t�{_�o�\�\'ġa�8!�B!\�\0=\�b�8;;geff:ɔ�Q\�\�q@��\�e�Q�\�V��\�#@�8!��2\�\�\��\�\�˗֬Y��Q\�$&&\�\�\�\\|ԗb_�>M�8!��r\�\�\�m��K�P��?			\�\�\�.-ڋU\�\����\�1<\Z�8|\�I!vJjj\����YYYl��%�\�ŋ�d��?㰲�*L\�Ů�^\'�P�B)mz衝\"\��>}��Q�\�\�\�|#\�\�t\�޽w�\�\���\��\�a\�\�\nqB!eAjj\�\�\�\�k\�\�\�l�r ))i\�ŋ�\�\�\�k_\'�G�\nqB!eD�>}~�ԡC�.Q���?x�`\'\'�\�8�vl�1fk�X?���ܯ�B!N!�\�իWTzz�����\'�8q\�\"c\�K�ؘ��\�8\�]\�\�H��/\�ϻ_l�.�/�m)vL���\�ZeImH�\'�R\�b<##�{ll\�\���ܑ#G~NLLL\�\�\�d\�\0\�~\�\r�\n۶m۵�/\�.\�z��?�=$�Nl��\�%�ە\�;��\�Le�\'�8L_H!��`�e˖\����\�|d���\'[�ؠX�#E\�R��\�Q\�CY\�OF\�\�\�\�\"6\\\�y�m<L�P�B)Gy\�}2\�ǖp�\�*�X\���b\�\����EYr�eS\�804�B)\�S�\�\'�%$\��\�b\�bQbAl&Bz\�	!����B?\�\�S\��%��k\'�L�����\nqB!�����\�q��\\]YJ\�#\���s\�(\�P\0�38\n\�9�z�\\\�M�\"�=T\�\�\�\�\�\�%�>x����)1\�ϛ\�T���1\'\�~8�\0\��H��\�}�\����D8q\0`y\�+�5f�9\�\\\�\�3\�3Y�\�\�\0��\�\��ޖ�nqt\�q\0X���\0\0�8\0\0q\0\0@�\0�\0\0�8\0\0q\0\0\�\0\0�\0\0!\0\0q\0\0\�\0\0�\0\0!\0\0q\0\0\�\0\0 \�\0\0!\0\0B\0\0\�\0\0 \�\0\0!\0\0B\0\0\�\0\0 \�\0@�\0\0B\0\0�8\0\0�������-\0\�>\�\0�8xQ\0qH�\0�y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�����@\�R�\0\0\0\0IEND�B`�',NULL),('342568',1,'请假流程.bpmn20.xml','342567','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.fhadmin.org/\">\n  <process id=\"KEY_leave\" name=\"请假流程\" isExecutable=\"true\">\n    <startEvent id=\"start\" name=\"开始\"></startEvent>\n    <endEvent id=\"end\" name=\"结束\"></endEvent>\n    <userTask id=\"QJ1\" name=\"提交申请\" activiti:assignee=\"#{USERNAME}\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"org.fh.controller.act.util.ManagerTaskHandler\"></activiti:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"QJ2\" name=\"审批【部门经理】\" activiti:assignee=\"R20171231556774\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"org.fh.controller.act.util.ManagerTaskHandler\"></activiti:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"QJ3\" name=\"审批【总经理】\" activiti:assignee=\"R20171231726481\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"org.fh.controller.act.util.ManagerTaskHandler\"></activiti:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"pt1\" name=\"批准or驳回\"></exclusiveGateway>\n    <exclusiveGateway id=\"pt2\" name=\"批准or驳回\"></exclusiveGateway>\n    <sequenceFlow id=\"flow1\" name=\"启动\" sourceRef=\"start\" targetRef=\"QJ1\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" sourceRef=\"QJ2\" targetRef=\"pt1\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" name=\"提交\" sourceRef=\"QJ1\" targetRef=\"QJ2\"></sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"QJ3\" targetRef=\"pt2\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"驳回\" sourceRef=\"pt1\" targetRef=\"QJ1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${RESULT == \"驳回\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"批准\" sourceRef=\"pt1\" targetRef=\"QJ3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${RESULT == \"批准\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" name=\"批准\" sourceRef=\"pt2\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${RESULT == \"批准\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"驳回\" sourceRef=\"pt2\" targetRef=\"QJ1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${RESULT == \"驳回\"}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_KEY_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"KEY_leave\" id=\"BPMNPlane_KEY_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"660.0\" y=\"231.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QJ1\" id=\"BPMNShape_QJ1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"150.0\" y=\"105.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QJ2\" id=\"BPMNShape_QJ2\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"315.0\" y=\"15.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QJ3\" id=\"BPMNShape_QJ3\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"480.0\" y=\"105.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"pt1\" id=\"BPMNShape_pt1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"125.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"pt2\" id=\"BPMNShape_pt2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"510.0\" y=\"225.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"60.0\" y=\"145.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"150.0\" y=\"145.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"200.0\" y=\"105.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"200.0\" y=\"55.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"315.0\" y=\"55.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"365.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"365.0\" y=\"125.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"345.0\" y=\"145.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"145.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"385.0\" y=\"145.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"145.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"530.0\" y=\"185.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"530.0\" y=\"225.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"510.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"200.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"200.0\" y=\"185.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"550.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"660.0\" y=\"245.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('342569',1,'请假流程.KEY_leave.png','342567','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0\���\0\0 oIDATx\�\�\�kl\\\�\�Q)�*�BB|A�BZ!D���*��qQ\'v0D\ZQ\Z\�e�sل4A�\�-�4��XD)Q.�B\ZRu!�l`)�4�-o�&B�\�\�4gt<��\��؞�<��\�\�3\�a<��\�;\�9\'�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z!I��?��\�\�ׯOV�\\�,_�ܘ\�bŊ\�7\�(�G�#\0\Z$J\�ڵk�\�\�\�d���\�$����d͚5�һ��\0�b&W\�m���|���ޕ\0\0\r\��\�\�����\0��X)��.\0�a[t��\�\�\�\���U�ފ{�#.\�uʩ�\0вEwϮ\�ɦW\�J\�}\�A#��\�TE\0�%�\�\���kH\�MǶ��)��.\0@k\��]�@͢�)��.\0@K\�M\�\�Yt\�6U\�\0Pt\rE\0�Y�ne�Vэ\�TE\0�%�\�\�u�^�\�\�m\n��\0ВE��\�d\�ks�.[(\\�)��.\0@K\�[\�Z<�\�\�uʩ�\0кE�\�/�\�o>:t\�BẸMAUt\0Z�\�ƙ\�>\\��\�\Zݸ\�\�\�]\0�\�)�_~�|�yU�?��k͒��\�&�5��\�\04u\�i\�쮢\0ВE��Y\�\�fwVE\0�)�\�t(��.\0@S]C\�\0Pt\rE\0@\�5]\0\0EW\�\0@\�Ut\0Pt]\0\0E\�Pt\0]C\�\0Pt\rE\0@\�Ut\0Pt]\0\0]E\0@\�5]\0\0E\�Pt\0\�\�ԩS�;;;gMt\�-<d�`�����曋��}�\�d߾}\�\�,Y2\�}���\�\�v\�8���k����\�*�]]]ɋ/��|\�[\�J6m\�T�mǎ\�\�\�͛7\'^xaqĶ\'�tR�\�Oz\�\�^{���\����\�K\�W\\Q\�6\�3}�tE\0`��nR\Z��|~\�x\�\�_�X�Ҳw\�\'&\�{n�r�\�>9\�S��\�E��//^��|9�o�Ew\�̙5�Ͻ�\�[~����\�B[Y�?�\��d�\�\�\�Yg��\\z\�\��\�\�{\�2����l\�\�~�\�.\0�\�t�U�\�kѭ,��}�\���#�<�\\��l\�R,��͔)S�7.G\�L\�q\�\�\�ׇ~xĢ\�\�\�7\��={�$\�֭+��\�/�;fk\���\�ln\�\�V�y�E��^H\�\�,\�w\�m��/_|�Ŗ.\0\0LB\�-\��f\�X�n˕+W�gp��]u\�U\�\�Q�b��Z9\�\�\�p\�	\�\�\01����\�\�W�\�\�F��˟|�I�\�\�׭[���ݹsg�Z�C�\�%<f�s�\�۸\�9\n\\�bE\0`\�ny�7�44b�n��\�{�|9Jn:�z\�q\�U\�>ft\�z\�\�\��\�ח�_�pa]K\�>�\�!�\�\�l�\�\�~��\�ǉ�\Z��\�ONN;\�\�\�Qʣ���\�\�\�{Fw׮]Ų\��\�3\�,�\�����\�HKu\��*�\0О%\�h�Ѩ�{\�9\��э��]tQy�(��Zl�\�\�UY�\�]�[�\�\�5Jm�\�x�t�ryB�4;ڢ#\�m<\�\�ݻ�E=�B��\�1�:\��l��\0-Zt�\n-�����|����\�\�\�n\"�n,�裏\��V\�ty��m\�i\�B\�\�R�>f�Z��h�n��׮][\�-vH���+�\0�\�2>EwP�M5�\�fw\�ʖ\�\�\�\���\�q�n\�tC���\�=�A��%�ښ\�\�❮Ս�;�\�\��y��\�fg�\�;：;\�)�\0�\�2�EwOgg\�\�ʂ\�Ȣ[YbӢ[���E�駟4C\Z\�6�Ι3g\�\�te�\�Y��\�\�h\�X��=\�B�4�[Y�\�e\r\��ٵ��\�Y�9\��\�\�O?�X��\�Ѝ\�\��d\�\�\�v�St@\�el���3��Ytc�G,\�ݙk�q\�u\�\r:aDvi\�H\�+�i\��1\��Œ�\�\�\�Y槞z�\�c֚u6�\0�.M�)��\0Pt]C\�\0EEwr\���\�?h�C��X\�\0]E��F�,�pkc��8�n�\��tg�8��1\�3\�~\\pA�\�>�\�c�.\0�\�*�\�7\�x��\�e�\�Nb�\�\�~�\0�t\�I�\�G[8\�#\�\�\0���\�\�#Wq��8KY|}\�gʇ	ۺu\��\\x\�\�\�\�8\�E\0Pt\�\�\Zq�����q����Ϩ�fF7FOOOq�SN9E\�\0]E��Fz��\�}\�Yܘэ\�c�B\��fϞ]\�\�\�NSt\0EW\�m��Qx\�Yޘ͍\��\�\�n\�}�L�R\�\�\�3\�Tt\0EW\�m\�q��\�k�^7�3�\�7ft�m�\�;\�8\�\0�\�*�\�;\���QVO=�\�\�r�8\�Xz��\\i�nz9N1�ޯ��C\�\0]E��\�覗�\�\�7\��\�Nh\�b�\�\0���k(�\0�\�\�\Z�.\0(�(���\0�.���\0(�(��.\0�\�\�*�\0���\�\Z�.\0(�(���\0�.���\������\�\0�.���\0(�����\�\0���k(�\0�\�\�\Z�.\0(�(���\0�.���\0(�(��.\0�\�*���\0��?Ɗ��\�����k(�\0�\�2�V�\\�`*�\0��\�~֮]{���W\�l��m۶O\nEw�w%\0(�4��U��m͚5�}���9\�%wŊ\nc�w%\0(�4H�\\�,_�|o|lު#ޓ���c&W\�\0E�\'\0�\�I\0\0�\�I\0@��*\�=	\0(\�=	\0(\�=	\0(\�=	\0(xO\0(xO\0�K�\�\�?�x\���듕+W:\�$�+V$o��\�@a<\��\�\"\'\r9	4H��ڵk�\�\�\�a\�{o�\�\�\�\�K֬Y3\����.rҐ�@�\���n�_�|�~\�JE9i\�I�\�c8\�\�<#>��Tt����\Z Cp\np]䤜\�\0\���O����W\�{+\�)��\�	]��+\'夜Z6��\�ڞlz��\�ݗn4⺸M�\np]9)\'\�$В����\Z\�\�\��\�2�+�Qt夜��@k���~�f�\�m�W��\�\�I9)\'���M\�\�\�q�\�\�(�rRN\�I@��=K\�\�(�#��^)9i\�I�\�<��\�q�\�\��\�\�n>�\��J\�ICNM\��\��{\�\0�\��\0�Xv��)�{:::��*\�ICNM\��\�7&�^�3�\�\�uq�\�\�?�\�\�\�9\�+$\'\r9	4a�\�\��\�\�!\�	]Π�[m�\�^��rҐ�@���_&�\�|t\�\�q�\�\�6�+��=�km����rh\�\0�3�|�na͵gq���p�\�fs夜��@3��_&�n^��\�+�Z3�\�\�Ķf-8�\\>���)�wzE䤜��@�H�f-8#\�\�\�\�͕�rRNM\��\�N7k!���;���K.񻔓rRN\�\��\Z\�\�\��\\,YHJ_��rRN\�\��\0gLn-��\�\�P�\�rҐ��\07x۔ܞ\�\�\�AeWN\Zr\�\\��S\�\�z\�!\'.�izw�Pf\�ۭٕ����\�$I�7n\\�x�\�͛7o\��\�O�O�^<�\�\�_�̚5+�\�;<��ϟ?�_�b\�\�mXrG*�fv\�!\'i�����\�t\��&�g\�N��\��C�}��d߾}I�����\�\�o����׿N~�$7\�pÁ�\�GO{�!�[ܭ���\��\�ICN2\n��W�\�w_r\�-�K\�\�_�\�\�w\�I~�ӟ&3g\�\�\�e���WS���Kn\�!\�Oٕ����	gq�~�\�w]{\�ɲe\�FUp+��\�+\�\�W_��\�\��\0?LJn���0%w�\�\�{�\�\'~�a\��\�_�(\�3f\�x\�+,��\0o#\�x6я����\�1�%7\�\�6R<\�5\�\\3\�\�\���WY�pZ�\�6jف�]9i\�I�A�ɍ�\�F\�\�V�\�\�\����\0\�4�ʵ�\�(�\'K_G��~\�\�\�ICN2�\�\�\n�\�sOqM\�x�\�\�~70mڴ=^q.�iҒۓ)��x,}��\�ֺ��+\'\r9\�d�\�o~�%���\�W_%\�m֬Y-a\��&.��Ҍl���\�l\�M\�\�ۭٕ���d2fs\�8�q���\�\�&fu�\0�I\�*�\�J\�pe�\�\�ٕ���d\"\�\�b��Fl���ꪃ���\��\���S��^\�Y����{\�.�\�\�Zr\�cym)��AN\Z�.%N\�hѢd\"=�\�C_h�WL��F>��!�[;�Kwg�{�w��͑J\�hKn�\�4�+\'\rE�q6o޼�8�\�Dz�\�7\�u�~C<}\�f.xsxe�Ut\'�\�\�[2k�\�obɭ�QVv夡\�2^����\�\�O?�Т�s\�΃���ګ\�\�\0/\�\\d�\\�7g�\�\�R,Q��{�o��;\\\�\�?��;\�烜Tt�ӧOO�\�\�7�E7~�?\�\�\�噋(S��\�ҥK�j3��\�\�j��;��[Yv�ٕ���\�x�d�#��\�\\\�{rrG!�6�12�Ye&w\���\�\��3�C>)���+��r\�gt��⋃f�\�m�bo>�\�\�\�\�8z2>��?�===\�\�+W�L����\�\�_,\���\�W�_�\��9s\�\���^x\�䤓N�y��￟|��U�\�\�O?=��\���\�\�\�j�\�I�\�=ԙS3�r�f\�-X�`\�mn��\�\�\�g�}��y\��K�,��q\�\�\��\���ϯ�\�G}4hr#������n�\�k��3���^J��\�bN_x\�I|\�;�\�#~f���{.�\�뮛�5�;v\�\�o�n\�|Pp�&�\�F�\�\�|r�\�g\�3-�\��N����dʔ)ő\����\�\�{2�\�\'�\���,?��\�[�����\�*��;��\�ׯ�|\��i\�N�{ꩧ�\��xy۶m��3ڝ��[ѝ0\�\�\�\�1\�\�믿^̒4�N<�\�b�K�.�\�SN�Eq����\�ŋ˗��\�[tgΜ9bG\�ڵ�xyݺu5�{���E7-\�\���\�~{���;w&\�w^�+\nydz��\����o9\�c=�\\P~Ώ=���\�\�)���&�����j��.4,��tvvέ\�.����K\�/�\�b�\�l\�-[\�s\�=W�~Ϟ=\�\�\��k׮�Y>\�1�y\�\�\��y\'�|�\�*�`�!\�\�ח^�AE7�Fn��\�J3��\�	-��Π:ꂜ�C٬�\�\�\�K\��Gyd�,F�����l�\�\�Mqy\�ƍů?���E7��\�6�6m*\�o�\�şw\�QG�?��Ӌ���Ӱ��9�\�n+_��⋇<v�\�-f~\�\�\�����ӵ͛7\'Gq�]&\�\���?O�qt\��\�^\�\�s�W������]~![kFwÆ\r�\��\�\'�	�x����\���9�\�3k\�\�^��\\�\�\�n\�Z�|饗��\�^N\�\�$\'��^gl��\��:�nw\�qt[6\'\�\��\�l�]u\�U\�\�Q��Uˮ\�\�	\'�P^>��1K\\όn�m^~�\�b�����\�K.�\���i�N?\�Jy\\�ǈ_-�\���X�1ёfm�>�\"�?\�3]&\�\�~�����\'�\�h]]]_93\�Ę����^-�5\�7��ĬA.�|᭷\�*~�\�\�\�c\�\�A�ǣ\�L\�p3�\�Z\�t�$��\�w��|��\�/?����2�\�dqXiFu�ό6ׯ�us2���*[�,F���}\�覹�.��\�.�k\�BL��\�F\�F&\�ϏI�(��Mv\�W:3��w\�.��(\��\\\���\�ftc\��\Zi���L�n�᫷\�~{��-l��h�\�\�Ut\�c�y�\�w�Hgw\�\�\�v+w�\���\�\n�8q�\�\�F�E�\���\�:���,��e���\�*ew�\�\�\�\�6*�\�sΐ\�X�[9�\Z;�\�6�\�A�\\�w�\�HE7��m#\�97{�\�!\�\�(�Q�c�W:�.{Hg�\�\�x���N�s�\�1��GvW>����\�i��&\'�\\W_}��7\�t\�D\�\�tuu}Q�z\�۫\�F\�Ų�\\\�\�tG�XB�+\� \�<�\ZT��cKw>n\�l�Υ\�\�\�M<~e�\�U�Vt\�\�\�eO\�F��Z\�}|3ȴaэ��\�������E7]NPk߄z�.D\�ƨ<�M\�\�\�M+���\�O�j�\�\���w\�\�F\� \\m�F\�`��-\'�t3g\�ܷlٲqm��8fsGZ/E\�\�l\�lAZZ#\�3#\�w� O�I�p\�nv\"�}|,�>�\�!͌.5\�nv�li\�f�\�\�bm��1�Z�\�Nfi\�n�n�\�tC�C<�o�\���n�����\\���Bg;��ڴ8GɎ%\r3f\�r�xqD�\�>KGL*\�\�\�dA<~\�\���#��\�u�fkf\�_�~�Ḕ\�\��P�~\�����x�۳\�o��1�喝�]�[9bmX��v7�\�\�\�\�\�,���qz0�\\i3�\�P��\��\�\�2��~c=~/M��٢[-\�lL�ߝ�\��\�s���Utg͚5\�(��\�aĢ�^~�\�n\�\�,��6�\�;{\�\\Ŏ�Qj\�\�\�SO=��\�]\��pciV����\Z�\n�.M��?\�\�1�z{{Zr�\�\�](�,Yh\�[\n�\��\�\��\�Gb�Z��\��X/fb�5�D\�\�\�*�0\��\�a�j\�\�\�\�H��ɖ\�\\\�>��\�C�\��Pt�\�6b�\�\�\�#=\�Av�\�c~7b��\\fILviD\�a\�\�m����\�-��I�\�l��쬱��\�\�S\�\\s\�@�fvK3����+^\��.��\0Wvǵ4#\'\�$4B��>R(���\�oư�\��/~�ͱ\\a\�ԩ���\�\�-d�\�\r,W������Śݮ�����\�k�\�O\ZU\�-�I?)影\�5�\�\�-^vG;#k\�39i\�IZhvwA\�\�ӧ�7oޗ���\�޶m\�ױN\'|�\�w\�رŊ�\�}�\�}�m�Ne�\�\��!�[\�h�X� \'\r9I+�6m\�?vvv�P(�[\�@\�\�1�.��qZ_g<\��\0?L\�nw\�\� \�!\'.�i1#��M���\�\�ICN\\�\�63��+\�ICN\�\�mWv�\\9i\�I@��\�\�\�%WN\Zr\��\0o7�&7\�9���4\�$ �\rކN�\�ICN\�\� \'\r9	p\�I9	 �8 \'\�$ �\r\�I9	pC���4\�$ �\rrҐ��\0\���4\�$ �8 \'\�$�\0\������\078 \'\�$ �\rrҐ��\078\�ICN\\�rҐ��\0\�����\0\\�rRN\�m\�ʕ�S�rRN\�g\�ڵ{{{�g�m۶}R��ޕ \'\r9	4��U��m͚5�}���\��^�bŁ\�X\�]	rҐ�@�B���/\��qP+��K�&S�NMZ���\�~\�\rrr<��hA��\�\�\�\�q�W�fVZ\�\n\�J����\�Ҹ\�+�\��Kp\�\�ݽ^\0E�B�;Sr�#�\��xe\0]�V흕E7fu�\�PtZ9����\�\�\�\�\�\�PtZ5��j\�\�\�\�PtZ1���)�\�\�(�\0-\�;G*���\0�\�p\09	�\0��\0p\09	�\0��\0p\09	 ���\0@N �\�$\0@N �\�$\0@Np\09	�\0��\0p\09	�\0��\0p\09	 ���\0@N �\�$\0@N �\�#wF.�0�z�\0]�V\�\�n>�\��J(�\0���}\�\�=G{�\0]�V\�Ś�����s�B\0�.@+gc���{\�\�(�\0���\�\�\�(�\0횏;\�\�(�\0m\'�\�\�\�\�;�\"\0�.@;edq��\�\\\0E�\�2���K.��\0�.@ۉ%I\�+\0�.@[��0\ncC髣.\0(�\0mSr\�r3��]\0E��J\�H\��\�4�;G(�\�\�\�\�(�\0-WrG*�fv�jڴi��\�\����ukgg\�W���c1(��dYl\�\�E`�ܚ\�L\�h���J\�\�\�\�\��\�פ�\�ѵFa\�]]]]�z�@\����\�s��Sv߂��\�諷\�\��/�\��j��\�,%�Q��E\���G����K�iӦ%s\�\�MV�Z����M����\'\��\�?O�oߞ�[�.y衇�\�\�\�ʲ;`v]�F\Ziǳ�~Z�\��d�)D�]�dI\�\�ۛ\�c׮]\�\�\�~\�~\�\�E�Q%�Q\�\�\�>%��lɽ�\�����\"\�w\�-�*�fvA\�hD)MK\�7\n\�\�\�\�Ѩ��5�m.\�\�f�+̙3��<\�PŲ��￿r\��ڠ\�j\�\�ɔ\�?FR�Zo٭u?e���nv&w�%7[v+fvw{�A\�K\�\rO�\�j2���-�\�x<s�5�\�Yr\�f\�\�\�r�\�1d\�\�Z\�\0�.@�j�\�j�u��[\��\�\�\�\�\��ln\�H6�.]jV]�C*�w�����[\�\�\"���s\�p\�ę\�\�\�bֵ��\\�n�!{\�X\�7�.@n�es�;ڒ���sfv��\�`i�\���ն)�ַ�\�����\�\�\�<�e~C�\�Wr\�-��\�\�7�䦬\�m�����\�\�\�u[\�\�׬Y3�E7N*�y.;��@\�k\��\�\�C\�\��a\�ny�7-���_�\�7z\'�Jq�\�s�\�o]���ΠV+�c)��eך\�\�(�\�\�\���:�\�p�\Z\��<�!\���\r\�0Zn\�m\�\��Ufr����\r~?�=&��\0�4�{�3�ftM�\�؛\�\�{:::�����\�\0��5�j\�-\�tkt�f-��Π:\�\�\�]t�\�\�ϲ7���.\0\0M[vG*�\�u\�\�\�\�6{\�2�[\�qt�f5Ҍ\�x�m�_Ak�3��\�s�όv�\�;3\Z\00*�fvG[^\�\�^\�m3q\\ݴ�.Y�d\\�\�ҥK�����\�\0@�bf�r���\�/G�Vv��9\�䶙X���\�m�Ni�x�\�\�\�\�\�zԫ\0��\�fwP˖\�\�\�`V\�~!\�\�ewWZDo��Ɔj,)v\�M7\r�\�n\�0\0@-�\���>��!\�*\�7\�\��\��E�{�z0-�s\�\�sٍ�{\�}�eK\�@WW\��\�\0@�\�\�XU[A\�\��d��3����!\�W1�k\�\0\�Te\�\� 3�B�([Ncmm\�GM��\�\n�\�YvMn�B�~ū\04\�X�X�p���\�\��,�q�\�8�D\�֦\�\ZbyB��,N�\�#�$W^ye\�\�\�\�qyU��*�����\�\�a��f��\�i�G3v[�\0��\�.?�\\��|>�\�\n\�\�\�ut\0��\�nw\�\� �\"Π\�\�\��B��n-�\��\�\�\���u\�3\0`2��\�6=���\0@˩5�k�\0\0mWv�\\\0\0ڮ\�nPr\0h7�&7\�9�\0\0m\�d/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\��?&)��\��\�\0\0\0\0IEND�B`�',1),('342572',1,'测试流程01.bpmn20.xml','342571','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.fhadmin.org/\">\n  <process id=\"Key_test\" name=\"测试流程01\" isExecutable=\"true\">\n    <startEvent id=\"start\" name=\"开始\"></startEvent>\n    <userTask id=\"submit\" name=\"提交\" activiti:assignee=\"#{USERNAME}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"w1\"></exclusiveGateway>\n    <userTask id=\"sup_approve\" name=\"上级领导审批\" activiti:assignee=\"R20171231556774\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"total_approve\" name=\"总领导审批\" activiti:assignee=\"R20171231726481\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"w2\"></exclusiveGateway>\n    <exclusiveGateway id=\"w3\"></exclusiveGateway>\n    <endEvent id=\"end\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"s1\" name=\"启动\" sourceRef=\"start\" targetRef=\"submit\"></sequenceFlow>\n    <sequenceFlow id=\"sub\" sourceRef=\"submit\" targetRef=\"w1\"></sequenceFlow>\n    <sequenceFlow id=\"t_reject\" name=\"驳回\" sourceRef=\"w3\" targetRef=\"submit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${res==\'1\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"total_res\" name=\"批准\" sourceRef=\"w3\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${res==\'0\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"s_reject\" name=\"驳回\" sourceRef=\"w2\" targetRef=\"submit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${res==\'1\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"approve2\" name=\"审批\" sourceRef=\"w1\" targetRef=\"total_approve\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${day>3}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"approve1\" name=\"审批\" sourceRef=\"w1\" targetRef=\"sup_approve\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${day>0&&day<=3}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sup_res\" name=\"批准\" sourceRef=\"w2\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${res==\'0\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"t_res\" sourceRef=\"total_approve\" targetRef=\"w3\"></sequenceFlow>\n    <sequenceFlow id=\"s_res\" sourceRef=\"sup_approve\" targetRef=\"w2\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_Key_test\">\n    <bpmndi:BPMNPlane bpmnElement=\"Key_test\" id=\"BPMNPlane_Key_test\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"67.45455183864613\" y=\"115.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submit\" id=\"BPMNShape_submit\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"135.0\" y=\"90.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"w1\" id=\"BPMNShape_w1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"300.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sup_approve\" id=\"BPMNShape_sup_approve\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"360.0\" y=\"15.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"total_approve\" id=\"BPMNShape_total_approve\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"360.0\" y=\"150.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"w2\" id=\"BPMNShape_w2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"480.0\" y=\"30.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"w3\" id=\"BPMNShape_w3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"480.0\" y=\"167.00000216744158\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"660.0\" y=\"90.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"approve2\" id=\"BPMNEdge_approve2\">\n        <omgdi:waypoint x=\"320.5\" y=\"149.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.5\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"360.0\" y=\"190.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sub\" id=\"BPMNEdge_sub\">\n        <omgdi:waypoint x=\"235.0\" y=\"130.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"300.0\" y=\"130.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"approve1\" id=\"BPMNEdge_approve1\">\n        <omgdi:waypoint x=\"320.5\" y=\"110.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.5\" y=\"55.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"360.0\" y=\"55.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sup_res\" id=\"BPMNEdge_sup_res\">\n        <omgdi:waypoint x=\"515.022026431718\" y=\"54.97797356828194\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"660.6215971771277\" y=\"99.87467117565609\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"s_res\" id=\"BPMNEdge_s_res\">\n        <omgdi:waypoint x=\"460.0\" y=\"52.22222222222222\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"481.0526315789474\" y=\"51.05263157894737\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"total_res\" id=\"BPMNEdge_total_res\">\n        <omgdi:waypoint x=\"514.0019454114215\" y=\"181.00194757886305\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"661.384924288853\" y=\"110.07123256036436\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"t_res\" id=\"BPMNEdge_t_res\">\n        <omgdi:waypoint x=\"460.0\" y=\"188.33333453746755\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.6451608392421\" y=\"187.6451630066837\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"t_reject\" id=\"BPMNEdge_t_reject\">\n        <omgdi:waypoint x=\"500.5\" y=\"206.50000216744158\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"500.5\" y=\"268.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"185.0\" y=\"268.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"185.0\" y=\"170.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"s_reject\" id=\"BPMNEdge_s_reject\">\n        <omgdi:waypoint x=\"500.98387785270984\" y=\"30.983877852709846\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"501.4545593261719\" y=\"12.000001907348633\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"185.0\" y=\"12.000001907348633\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"185.0\" y=\"90.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"s1\" id=\"BPMNEdge_s1\">\n        <omgdi:waypoint x=\"97.45455183864613\" y=\"130.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"135.0\" y=\"130.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('342573',1,'测试流程01.Key_test.png','342571','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�\�4\0\0-\\IDATx\�\�\rpT���w(~�S���L�a�N;�\�0\��r{�J�:^���d��� �*\"V\�$��\�TE�B)R*R\�\�劐��4\�\�E�@@L�JL#_�\0\�y�\�\�\�{�\�Mv��g��\�<�gϞ�\�\�9\��x��\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�~�\�A�%\��\0\0�Lt\�\0@�\0\0?\0\0�\0\0H�\0\�\�0��\�\�װy�f���\�X�n�⨪�26m\�\�)1�|\0\0$~���[[[k455\�\�\�D����\�ذaC�Ho%�\0\0H�\0	@+�Hn\�\�\�u\�\�\�w\0\0@\�H\0ڮ�dfNh+�\0\0H�\0	@\�\n�Dt\�w\0\0@\�~+�\'�9l\�\��\'cWՓf貮CN]\0\0@t\\+�\'Z\Z;ߛn|��\�.�\��1\�\0\0D���۰\�n�kG\�U*�\0\0�.�;E���\�E]}AEt\0\0\�p�\�\�\\WQt�1\�\0\0D\0\�%]\0\0@t2Etu��H���!��.\0\0 �\0�\�=u�D]}AEt\0\0\�p�\�\�a\�\\[ֽmA\�\�c*�\0\0�.�+EWc��\�\�DW\�!��Nt��\�\0\0]�\�ݶ6c\��s��-\�:}A\�7�[*a�\�\0\0]��]��\��\�{t�1fG\��;M�S�\�\�w�=\0\0�.�;E��\�8��\��x\�%\�\�F������kK�-�Z\�\�@v\0]\0׉noU\\���JtC%���\0\0�\�d�\�FS\����f�\��\"��㥜I\0\0�.�+D���k��\�R\�\0@t\�#�D�\�i�\�*��n\0\0�.\0��\�Mr+��<d\0\0\�@t��\�x\�hc\0\0@t]\"\�D��\�R�:\0\0�\� ��n\�$7QmTv\0]\0D�H�\��\���o\�\�B\��\�\�\0@t]\"m�ZyUI�L°n��\�H\�Cv\0]\0D�H�\�k/�oɪ�\�:%׎y�\�\�\�\0@t]\"e�I>\�IkO�\���\�\0 �\0�.��t\�\�\�³h\�5V)��\0\0\�@t\�\����7\�\�\��b����\�\�$6V\�u���\�.\0\0��\�\"���z�wiޑ8\���*G�ya���dF�ف}�\\zv\0]\0Dэ�Vt-ѵ�]\�\rY?(�ۓ\�\�!��~\0\0@t\�l\����\�!�k�\�\�\�۪\�\�\�[�M㭠��\�x$7Tv\�\�\0@tb>&[�~�$D7{/F\'�θ�\�[BZ\�\�\�\n��\�vk}<\�[�5�3\0\0\��阴�\�\��݋\�#֮]kh�ANN\�0�\�ʲ_�\��%�{�\�$�(\�oI�\�Mt5F�a�w\�y�����P��\0�T ����kGs�\n/��9\�\�\�f��:\�\�8#�I�V\�#\�$�$>�u\�\�~]O�+\�lY�_V\�\�czt\0\0х,\�`�\�)��n\�Utc��φ\�z\�\�\�A.���2\�\0\0 �\�:\�\rVx��\�uo��V|\�g�9\�\�S���&e݋/�x��qt\0]\�W\�@t]-��V{C,\�\�[E5)3������\�\�6~�\�_�\�a\�$~Jv\0\0@t�c#т}R\�Ȟ` ����3}���ټy��]CC�!�����\"c\�ʕ\�����w\��\�O?5\�:t\�|�\�\�5\���\�^{-���-[t��\�6�����+++{\�f\�ԩ\��eˌӧO\�/Y�$����(&�G�\�n��\�h�7\�\�K.���[H쳆A\�cq]�h\0\0@t�c�G\�\�\"�6�ݗ^z�\�mfϞm.�8q¼�w\�^���\�\\Vytn�#\\z\�Ƒ#G�R�z�js\�S�Nu{�+��Ҹ\�[¾o��nܸє`[�l\�|�\�\�\�[o�e\\u\�U\�^g���\�ŋ�C?{�E7N��\�F0\�{\�m8ٝ�>ݤZ�C܇�~��X�\�چ�\�似��\�\0\0\�plD#�\'D&fF���RtkkkMI��ݶm[��\�qTJ\�Ex�\�\�歊�J��\�I���Z��x^~�\�Ɣ)S�Ut�u\Z�|^��\��3ft�\�\�\�\\\�\�h��٥\�\�Zq���c\��v֬Yn]�����\�X.0����/��\�4W\'���C�\�޽�@\�\�#\��\0\0�.�s\�\r[�M�\�^}�զj�T\�\�\�כ�i��Ǫ�j\�UE\�~\���\�\�\�W_}�KU\�M�<\�سg�q\��c	\�cǎ�\�ao�bŊ\�s�j�h\�g���3Z[[\�\�m\�U����Vp��q\�ƙ\�\����\�\�\�\�\Z4\�)��\�Z%vIE\�\"�i�\�}Ȱ\�\�z�8Nn^^\�?ɱ�TB/�\�h�\��\�\"�בQ\0\0]\�؈�TVt���©\�\�}mE\�e�Ma�\�\�n�-؛����\�.\\��[\�t��\�\�DW_K\�\�p\�\r\�k͝;׸��\�\�ۋ.�\�\\�\�˗/.\��\�\�p�Fi�\Z�}á-.\�p�/\�\�\"�Ę1c���\�<گ\�\�_($\��z��\�.\0\0\�pld�\�j/�n��U��\�\�o�1l�VrU<��\�:SZm�\�\�SxUt�}A\�Vî\�:\���@E\�c]\��\����]\�׽�\�;�\�\�{ik�\�qQ[�$��G7Y���\� ��r>M\�	3$\�\�\�d�A�z\0]\�\�H�誈z���TUt�\�n[\�u\�>�l�\�8G5���;w\�\�ֻko*���H}�ъ�^g���m\�)��x;��]$�J�\�\r����͓��sL�,\��B\�\�\�\�\�\�y\0\0]\�\�H��*�\�^{�ٻ뱪��r\������U�V�m��cC�1�\rL\�\r}��m�������\���*ҽ�\�\�:/�\�\�e˹E\�)��Vdc�y-\�\�\�\�$�I|m]\�v\�\���.\�ג�\0\0]@tc\n���\�\�n��E@���\��y�?\�\�\�P퓵[�M��HmѢE]zq�\�\�\��7\�x#\�\�\�\��\�\�f\�]\r}ퟵ/������-����٣@\�g��װ{�\�\�\�\�[{����SZ+��}�Ϲ!\"�/\�\�\�\�\�\�kd�Wd$\0\0Dݨ\"\�ʥʮ\�^p���\�{><��]\�\�бtU�uD�\�\���V|������\�\��������\�	�\0\�^N\�\�h\"��\�v33��?~�\�^�w���I��\�\�\�\���\'���$C\0 ��\�8p\n\�\�\�]a�[\�G\\���|>߷�\�!�\�f�\�\�W��\0\0]@t��#�J�\�nF�+��\�\�].\�h�\�\�{XbQ~~�5d.\0\0D]\"�E7�Ժ^rC)))*\�\�l\�\�U\�>.�://\�d1\0@f]@t�\�]�\�\�g�\�\"r{�\�\�}\\��c\�\�\�m�\�\�v}�\0�\�\0 �D����=��\'MC��\�9�7I��\�\��L\�=%B�=2\0 3���\�\�!�\�\��|>�\�\�$\��[���z�^\�srr�&\�\02�.\�n\��\�\�«Dv�C\���\�c�\��m\�\0@f�c\�%ݬ@�z\�\\/\�\�e�\�\�&�Y\�\�+`\02�.��\�f�^\�X9���}�:^�\�\�\�ŗ�{\0\0��\rDх�@D�+$ZuJb���<_��\�\�\0@f�c\�Et!+��|?��+\�hI\�7^�wenn\�\�\0@f�c\�Et!+5j\�w�@�\�\�ְe\�\���\�8}�\0�\�\0\���\�B�0�\��\�#��\�\��Y\�[EX��\�\0\�pl ��.d^��_��A[�\�A[����w\0 \�\�rD套8ɞD�@t!^��5�xM/bS\�.j{[/rc\�\0@2ĥ�7\�\�ad\�S�\��.$Xz/��R.�[fMK�w\�\�C_/\0$P^�{\�#G�����.�\�B�R\�\�օl\�	+J\�\��x\�%bUW��=�=�.�\�B*ѩ�u\nb��X�$֩�������\0}�p��\'�\��K ��NDt\"�g�\�!Kz�\��z��\�\�\�\��h��\�\\@t	D2����\����>��-Ӿ\�M\"�\�\0\�MbQ\�D�@t�\r�����\���>�\�v���c�\����%\�!\0\�u!�-��\�@t	D܂\�\�/Er�S�\�\�\�|��\�+%%%C\�;\0`��٫K5]\������\�B\�Y�-\�m��\�\n\n~\�\�\�\�\"S\�\�h�\��.d�G��Br\�3\"��\�x�\"�\�\��\r�\�w���\��W��\r�q\�\�$�����ZW\�v|Ӑtøp߾}\r�7o6���\�$\�\�\�ȭ����\�شiS�\��HD�@t�X}��$�m���zw\�\�c\�Ǐ�8S>�\�iU��(f/��m\�!\���!i�\�\�\�\�\ZMMM�ȥ1����\r6t��VrT\"��	\�;$���\�\�q�Zz@�_�\�!iܛ$���\�q,77�V�]H8Z\�Er3Gv\�G�������%�\�\�\�\"�׊d��תX}�_K,��Y_^OeS\�cx��E���	F~~�1s\�L���\��ꫯ�\�ǏʩS���\ZuuuƋ/�h�\�n\'\�]\�G�Y\�2ѭ��\�\�?������\�&�\�\�K�{V\�k�^\�\�]/\�\�A\\\�X\�\\Ŷ\�6\�%K��ųhhmm5�\�煴3�η		�?�\"��nz���yF\�V�=\�9�fɭ��:K�dyyy\�K\�_dt�^&�g%�˺�=�P�\�\�[�/u�4d�Vr��;e\��z\��y�>�h٥�)ݓ\�6�m����\�I3tY\���\�\"��#rU!\��I�^P�%ю\�B�\��zGK.|O\�\�׻_D�Ţ��\�\�\�(a.��Zړ\�lW(++�\'�mkx�\�C\�\�\�����\�փ\�\����~�K\�:}AEt]\0\0w���3L�\�}>_�Vn%�E*ߔuoE\��\�mqVr\�\\�\�Tv��mAJD�a\�;\�$׎\�]�TD\�\0p!\�\�+���\�\�r\�\�0`�[�;\�ٓ\�\�v��\��=��0@JD���\�E]}AEt]\0\0�R\\\\|�u[D\�\�\�t�\\��^H��.]JUR+�;וG]}AEt]\0\0�\��z�E9�C��\�\�Ғ\�\�\��C�iO0\� ��. �\0\0}͓E�[���A\�%��\�?���F2\�qv�a\�$Utu��H���!��.�\0\�\�<yDb�J�+\���~f�[>7lؐT\�\�I%�{�o�*�{\�^�(����\�\"�\0\0ٍ�\�k\�g�/BEgPs�\�9�>$Ut[\�0v�-\�޶ \��1\�Et\0�>�\�\�MԐb=\r5\�l�`\�CREWc��\�\�DW\�!��.�\0\�?r��\0хԉn[��\��9\�\�d�>��\"��.\0@\�\�R*��}��3�}^7;b��>\�\�h�.�\0�\�У\�%�mm\�\�=5\�\�k��(�v\�6�-\�]D\�\0\�\�\\ʨ��\�[�\�.��\�\0�/|>\�_G�Bt��\��T\�EX]D\0�=\�\�c�1r\�\��\�\�\�\��\�3\�3�03\Z$Ot�*�v ��nQj�n)�\0 bA�=�)���-Y�$)��t\�R\��\�ہ��.�\�f	\�$:%\�\�\nv	\0@w�~�\�Q�\�gU7\��\�\�\�\�\�\�\��\�\0��\�Bdɵ\�V+�\�.\0@x��ꎳ��\�^7eʔ�\r5�C�=�\�#]���\�\0�.�\�%���\0\0�����>��±\�M��\�~���,n\�U\�}ꩧ��H�;�V\0\�Et�+��Ȭ�8=�\0\0]E����Q\�\"�/;�\�\�n_\��y!�\\ZRAMM\�s\�\�=4cƌ�|\�(..6w~aa�q���O>�d\�+��Ҥ\�!���Q�ۛ\�R\�\0�����\�?\�q\�:{p�Z#�\�\��\�jo�^���&D;��^x\�\�ɵ�\�k�V�ȬY�\�+--\�|衇�y�\�|��9C\�\�ӧ\�/Fo����?�\�x��\�\r\�\����}\�s\�=�	\�%ݴ1\�[�6\�\�\0�\n�\�r�ڛ+r9W����d�ݖ �ۡC���\ZZٕ\�^gW\'�\�j�\�֠\�	\�S:\�\�/�l�;6܈�f���j�kǣ�>jJ\�s\�.�o߾\�x\�\'��S�vTVV�Et	D7-�[\�\�\�!�\0\�/(//(bZ)�\�\�}Aׅp�UY�7�״zv[��!R�\'7���\�Ku&L0V�Z�\���f\�\ZC_Gd�\�%݌�\�D=\0 \�\�\�\�;_�^E(۴�뼸,y\�\'zaZ�\�\�\�=�U\\FWH\"s\�έz\���\�?�<!\�c|�嗆�\����\�.�\�&�\�.<K�\�\0\0d�\�^\"\"�X\�5,\�\�d���;\�{���j��~�b{\�\�^Ōg)`��\�+UJ�\�6�\�\�\�떗���\��nR%7QmTv ��{\"�oYb\�\��z\'�W���\�\�~9~���Ur\�Uv\�\�>\�\��\"���PB{kH̷nc!�y�\���3f\�`\��\�\�\���D��\�O�2e\�\�\�M&ڳ;y�䳈.�\�&\\r+����a\�F+����\��\�(,,�J�v�%�����\�~\�<�N|\�\�#\�\�(�~K]\�M�\�*�-Y5b�]�\�\�1\��8=�\0\�\n����\�l\r��Ynn\�\��<��\�gt�T�c\��\�Ct	D7.\"\�g8i\�Iv�ݞ�]\0\�d�.b�\�\Z{�#���W xpL�4)�a\�bEgVK�Յ:ć�\�$D\�\��=&{�\�\�8\�5V)��\02\nɡ��\\�\�\�-999\�\�+Ѕ�\�\����T�S\�M�8qc��\�ʣ��A�]D7ӎ\�>\�fo�\�:߿\�Ce\0қ?%�ך�lSqq�\�+�\����\�uZ\�T�m>�\�4I�\�\�i�.��i\�dɍV2#\�\��>J�\r=�\0����}\�x�*�\����=RRR\�q��ᔊ���;v\�\�\�4KE��\�D\�ʹc���ۓ\�\�!��~\0��ѿzY+\�8�o�=�\n�\nDEAA�q��锊��_ H��D1\�^��H�.��iǤ\'�\nj8ٍGrCe��]\0H\n^��ak\Z]�Q\�Q�F}��1�ئ�\�~NY ���z��*ƌci}����0�\�vk}<\�[�5�l\n\0	t�\�~���D�\���#G^\�^�>���\�\�+�\'}>_�}e�\�TTTT�\�\�\�\�\�~\�X�r��ةS�\�>O��>^VVFE7�+�]�IO�\��R\�\070@r\��OI��}���| �\�\�{\�IK�nQQQ�{tCe\�\�\�]�b��|�\�7\�p�)��\�n߾\�|���\�1b���\�ǟ�ys�x���\�k����lق\�f�\�=&C��]\0\�*���Η\���\�4�\�>\���R\\\\|d�\�\�)ua\�ر_�I*N\�I43ҟA2Ut:�\�W_}\�X�x�1d\�c���]$x��\���\'N�0ow\�\�\�e}mm�\�\�\�HE7sD�\�c2�\\F[Ae\�\0\�XƏ�\�Eg$��x��	G��W�\�T�\�u`\�U)����e/�\��\�H\����.\�9p\���~֬Y]^g��\�\�zD7��\�1Av{�\�d��[\�a]\0���v���^`&�\�}�8 :tf����\�TΌv\�}�u�zf�hqC\�Jmee��\�|ǘ2eJPt{\�.\�۶m3ﷶ��\�\�\�X�z�y;n\�8D\�}�VQM�\�h3�\n\0 V\�w�\�\��Ok\�C�\�H	����[�nMIUW$�S\��D�\�L\�={�\�>��)#:��]\�Ֆ��o\�{�\�\�\"�ڮ���\�7n�u�\�D�\�\�*�\�n�\�@�())*R[-���{@d�.�\n��Y3\'N�ؑ��\�I�\��9�n\�=�ږ�\"\�\�\�`ViuY�o�vѢEƲe\�\�v�p\�\�^^�\�3��Q��솶\��\�ގNv煼=�\0999W�ؾ\�������K\�\�^��!��\�\�����dJ\�\�o���{<�\�\�sC\�\�Ν;�\�z\�\��v\�ڵQ=\�ゾ\\D7f\�u^�\�\�X.0��<������\�m�\�v\�\�\�?g�@\�ў\�����O?�4)-��\�3��Et\�\�\���ɢ��(��\�رü\�6\�\�egnh\�\Z�wWG_\�er���\�\�B\�TR\�yb�\'�y�\�\0�\�#DlwY��U~\�c�@F!\�\�\"@G�M�\�\�\�;�#�[\� ���\�\�\�Ʊc\�\�u:A�N 1a\�������Z\�]�~�1r\�Hs8�Pa\�V\�\�e5\�u�\�\�K��\0�n\�\�\��R~O��.2���\�O\�+��\�A�@e7Q�\�}��u\�\�Ɂ�\�\r�~�\0Ft�]&�\0��|!W\�+\\��_\'�C\�+\�\n���z�\�_�\�\�jo��\�\�@ ��\�[\��;��躜x\�\rhW\0������\'�\��s^�weaa\��\�+\�\��&9�[\�瞳\��~[,��u\�\�����\�\�X��\�\"��n\�n�Y.<��\�o�d��Er\�\�o���F��.{\\�Е*��?�seee\�kjjN566�;}��\�ڠ��>WWW�\�̙3�\�v*�Z\�\�\�\�]D7ˉ���v\0�H\�\�\���\��G����Y�Π\���Wȁޠ\��\�L�P�\�?c�\�\�\�]DٍH��\� \0�+t�}��\\ⴶ4���d�\0�D\�\�2z빵GW@r@GP8_\�v�ʭ%�\�xb�\0]\�M�*��+\0���#����ڞ �+�W\0]\�u�\�\"�\0\�)..�L/,\�̬\�d�\0 ��\�f٭Gr�7:$�\�\�Ǻ\�\�\�^@t	D\�\�Z3\�e\�b�a\\�o߾�����\�<�\�FUU��iӦN�9�2مN\� Qe\�bv@\'}`�\0 ���M?t�OUrkkk���&΁4Fss��aÆN�\�J\�\Z��\��Z\��v\�t�:m/{\0\�%]D7\�h%\�\�ٕs���ƽ�\��~�6�\�T$w�ۇ\0\0D\�W���+p\�sB|�\\\���*�J���\0�.?��.\� �9\�Z|>߿\�9�\�jQ�\�\�ɹ��\0�\��#�\�\�<�\�ac\�\�?���4C�u\�\r\�`$��..Ӌ̪KJJ��W\0\0\�\�G\�u\�9x�����\�\�G�\��N\�\�\�\�/x�ޱ:<�%���~� �\n\0 ��\�\"�.>v�\�Mr\�hܵ�s�s�?�\���\�~-�:\�\�2����\0�.?��@f�\�~�������q\�pfq�q��W$W�\�]�S��W\0\0\�\�G�Htw�+�(��\�\�`�1@\��)9wO�|�6�}%//\�|v\0 ��\��Kp�����\"�/\�9{Z��\�>�\�˞\0D�Y\�b\�\�Q\"��>ƹ\�9\�fF�y���$\�Et�\�m){\0]~d���W\"��>ƹ\�9\�FF�\Z�]�ϷԺ��E$�!�\n\0 ��\�B?ݖ�;��k˺�-\�:}�s�s\�M�=�\n9/ߖ8\'qDb{\0]~d����\��m�����\�\�tEEE?��q���\���|>_{\0]~d���n[��\��9\�\�d�>ƹ\�9�\��X\�\�ZKp�w�W\0\0\�\�G]s\�\�\�fG\�\�\�ǘ�_����\�6\'\'g��[$:%v{�\�d$\0H)\�\�\����#�\�f�趵��\��y\"�\�ڡ\�\�Tw��\�\�\�6c��|�\"�C\�\���O^^\�?��\0 -\�\�\�v455��\�\�\�x@~d\�9*\�ު�Tw��\�N�蔨�n+2\�\�\�\�\�*\�\�g\"�Z�ݜ��\r\0\�JMM\�36l\�<z�(?ri�ܪ������n4Uܞ���SY\'�\�B\�V+��\"��@\�N9Ͼ���\"�5���W�y\0 c���\�~R�c\�ҥ�ʌ[?�\�H.�kG_%\��5�DwZ�\n\�tWvEl\��:��+�Zb\0 �\"�\�0\Z:�{�At	Dע���OiϮ\�\�(\�U���+r�<//\�{d\Z\0�$\���\�U���i#\�%�Et��ؔUvEp�I\�m�s\�\�\�\"���a\0\0�+1��{�=�.��;\�[�6\�\�c\"̐�\�D�,\��=�\�\0�|�)tH�>���=�.\�b\�\�k�6��[^^>\�\��� \�Ϸ\Z\"��.��Q\0\0R\'0GBEW���\��K�Tt\�mC���A�\�\�\'\�M�\��-#�\0\0�^^\n\�H�~�&{]\�e�\�ۅgI}�ܹDΗ���\�G\�\0\0铗\�H���d\�!@t	�n�GO���;z�\�+DjW\�\nG%\�#k\0\0�W\\\n{�\\zu\�%\�$����\�;\�{?l\��z\�\�-**��\�\�5r~\�$�\"�~�\0@f�ˑ\�D�\0\�%\\ ���W�\�\�$\�6Zٍ��n�+R�#qڍ�\�\�\�_�%\0\0�\�\�@t\�dJ�2ߒU#\�uJ����m?��\�\������\��/\�\0\0\�pl ��n��t�X8i\�Iv�\��\�/.�뮻�\�o��H~~�p�\0\02�.��\���/N\�-�G^c�b�]O\Z�\0\0D]\�E�\��zﲮ8\���*c�;\�Iz�\�X+�\��\��`�`\0\0@t�c\�uiE7\�\�\�v�7d��($7ZɌ$��(�6�\Z�\0\0�\�ǆ�o��\�$D7�DW�\\#k�zU\�\�\�\�\Z�\��$�\�qHn��\0\0]\�\��\�kE�н�nv]�\��\r:\�l:=N�\'��Hn�\�ҳ\0�\�\0\�F�E׎\�p^D7�b\�ڵƘ1c\���S�ʿ\�wV �P �!\�^���\�\'\n\�\�ױ��>\�\�I\�B+�\�\��x��^k(�\0\0���xD7X\�u\n/��9\�\�\�f�\�\Z\�X�\�{+�{J��Vk��/%v˺��H\��:�l�\�\�ݾVN�\�\0 3�.�Ft�^mi@t3��\��{6L�n}�qj\�\�\0\0D\�\"�i\rDם=�~����W��R.���2\�\0\0 �\�:�>\���*\�W�-�{�\�\�\"\�*FO?�t\�m?��S��C��7o6D\�\�(**2V�\\i>�\�k��߲e�q�\�w���]�\�m*++{\�f\�ԩ\��eˌӧO\�/Y�$ݢ۪��\�e�E��\�d���\�1�.\0\0��p\�\�\"�6��\�������\�uuua�;\��K/�\�8r\�HP*W�^m>\�ԩSݶ��\�+�[n�%\����\�ƍM	�ex�\��\�\�7\�l.k��\�[\�UW]\�\�u,X\\^�xqpY\�7���m\'1Lᤷ�jRfFsH�L\�N\0\0D Q�{\�\��ό$E\�ݝ;w��B�2y�����\�\Z\�^\�\�\'LYڽ{�y�۩d��N�4)X�u\n��\�\�_nL�2�[EW_������:\�T\�Ϙ1��d?��\�\�������3b\��}tY+\��sw\�\�a\�Κ5+-�\'�*��\�k�\�#�\0\0�.@B�ɰ\�T�\�\�k\nd\�z�\�;Ｓ[�t�\�\�ƞ={�&L0\�;v̔N{�+V�3t\�PSDC__+\�v�ؖ]\�\�\�\�`W7n���\�*\�\�*\�Ί\�A�\�\�\�\�V�\�U\�M\0Z\�\rm#�!�\�\�yzr\0]�ԓ	���R��r\�\�*�۷o\�&�*��\�n0n�\�6c\�ܹ\��\�_o\�^t\�E\�r��._�<�l�~N�L\�DWEz۶m��{�\�ٳ\�ں�@\�u^�\�\�X.0��<�\0@t�WtU~&N�ح�ࡇ겭Vr��뮻ΔV[l��\�^]m_P�հ+�\�\�\�vQ]nhh\�\"�7\�xc����\�:\�[\�K/B�8.j�\�t�\�&�\�6�\�y�؇}^)�\0�\�d�\�j���-�A�u�\�j��:G5���\�\�\�	\�ݵ�P�~��\�hEW/�\�\�\"<��o�\�\�\��\�p�膓\�x	\�\0\0�.@v��VR��U\���V{mm1T�Ԗ�{\�7�}ss��j\�*�\n��\�!C�Æ\r\n��^\��ؕ_{$��DW_\�)��\�j\�-\�=�\�\�\���Q?�-\�.\�D\�.�A\0\0 �\0\�+�---A�\�Q\n\n\n�<\��˹^�tu\�o��{���3���W�g\�\�\�ooC�٢\Zz\�=\nĢE��\�k�\�\�mYY�yk�Ԑ��\�\�n@�\0\0��ݢ\��%Q{u\�\��:\Zi,\�\�o�\�\�@/6s>�\�\�Ç�}�\n��\�\�k\�\�\�\�%�\Z*˞�\�\�\�L�-�kE�\�\0\0]��%��\�D\�)�I\�\0\0]\0D\�\�x\�-�0\0\0��\�.]���[{t$\0\0\�@t	W����K�\0\0��\��\�pR�\�\0 �\0�.��\�\�z$\0\0\�@t�l]�\�\�u!\0�\� �DV�.�\0\0\�@t	D\0\0]\0D�@t\0�\��\�\"�\�:\0\0 � ��.�\0\0H��\��.�\0\0H��\��.\0\0 �\0�.�\�\0\0��\�\"��.\0\0��]D�\\\0\0$\0D\�%\�\0\0\�]\�%\�\0\0\�]\�\0\0D\0\�%]\0\0@t]D�\\\0\0$\0D\�%\�\0\0\�\0\�Et\�u\0\0@�D�@t\�u\0\0�.\0�K �\0\0�\�d\�\�\�&�K�\0\0�?d���MMMHfDcc\�\�vr\0\0��@MM\�36l\�<z�(��fɭ��:+QI�\0\0�?@���X�n\�I��9��h\�t\�%\�\0 �\0\0\�:\0\0 �\0�\�\0\0�\�\0@�\0\0�?\0\0�\0\0H�\0\0\�:\0\0 �\0�\0\0H�\0\0\�:\0\0 �\0�\�\0\0�\�\0@�\0\0�?\0\0�\0\0H�\0\0\�:\0\0 �\0�\0\0H�\0\0\�:\0\0 �\0�\�\0\0�\�\0@�\0\0�?\0\0�\0\0H�\0\0\�:\0\0�?\�\0\�u\0\0@�\0 \�\0\0\�\0�\\\0\0$\0\0r\0\0��\0\�u\0\0@�\0 \�\0��\0\�u\0\0@�\0 \�\0\0\�\0�\\\0\0$\0\0r\0\0��\0\�u\0\0@�\0r\0\0��\0\�u\0\0@�\0 \�\0\0\�\0�\\\0\0$\0\0r\0\0��\0\�u\0\0@�\0r\0\0��\0\�u\0\0@�\0 \�\0@f$� ��d|\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H+��\�P2GIo\�\0\0\0\0IEND�B`�',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','350001',141),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('342584','KEY_leave:1:342570','342575','342583','start',NULL,NULL,'开始','startEvent',NULL,'2019-07-24 09:25:07.854','2019-07-24 09:25:07.854',0,NULL,''),('342585','KEY_leave:1:342570','342575','342583','QJ1','342586',NULL,'提交申请','userTask','admin','2019-07-24 09:25:07.854',NULL,NULL,NULL,''),('342594','Key_test:1:342574','342588','342593','start',NULL,NULL,'开始','startEvent',NULL,'2019-07-24 09:25:20.199','2019-07-24 09:25:20.199',0,NULL,''),('342595','Key_test:1:342574','342588','342593','submit','342596',NULL,'提交','userTask','admin','2019-07-24 09:25:20.199','2019-07-24 09:27:08.136',107937,NULL,''),('342600','Key_test:1:342574','342588','342593','w1',NULL,NULL,NULL,'exclusiveGateway',NULL,'2019-07-24 09:27:08.137','2019-07-24 09:27:08.151',14,NULL,''),('342601','Key_test:1:342574','342588','342593','total_approve','342602',NULL,'总领导审批','userTask','R20171231726481','2019-07-24 09:27:08.156','2019-07-24 09:30:39.702',211546,NULL,''),('345003','Key_test:1:342574','342588','342593','w3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2019-07-24 09:30:39.715','2019-07-24 09:30:39.836',121,NULL,''),('345004','Key_test:1:342574','342588','342593','end',NULL,NULL,'结束','endEvent',NULL,'2019-07-24 09:30:39.840','2019-07-24 09:30:39.841',1,NULL,''),('347510','KEY_leave:1:342570','347501','347509','start',NULL,NULL,'开始','startEvent',NULL,'2019-07-24 09:39:33.619','2019-07-24 09:39:33.621',2,NULL,''),('347511','KEY_leave:1:342570','347501','347509','QJ1','347512',NULL,'提交申请','userTask','zhangsan','2019-07-24 09:39:33.625','2019-07-24 09:40:28.779',55154,NULL,''),('347517','KEY_leave:1:342570','347501','347509','QJ2','347518',NULL,'审批【部门经理】','userTask','R20171231556774','2019-07-24 09:40:28.779','2019-07-24 09:41:49.664',80885,NULL,''),('347523','KEY_leave:1:342570','347501','347509','pt1',NULL,NULL,'批准or驳回','exclusiveGateway',NULL,'2019-07-24 09:41:49.664','2019-07-24 09:41:49.737',73,NULL,''),('347524','KEY_leave:1:342570','347501','347509','QJ3','347525',NULL,'审批【总经理】','userTask','R20171231726481','2019-07-24 09:41:49.741','2019-07-24 09:43:26.200',96459,NULL,''),('347530','KEY_leave:1:342570','347501','347509','pt2',NULL,NULL,'批准or驳回','exclusiveGateway',NULL,'2019-07-24 09:43:26.201','2019-07-24 09:43:26.224',23,NULL,''),('347531','KEY_leave:1:342570','347501','347509','end',NULL,NULL,'结束','endEvent',NULL,'2019-07-24 09:43:26.229','2019-07-24 09:43:26.230',1,NULL,''),('347541','KEY_leave:1:342570','347532','347540','start',NULL,NULL,'开始','startEvent',NULL,'2019-07-24 09:44:06.796','2019-07-24 09:44:06.797',1,NULL,''),('347542','KEY_leave:1:342570','347532','347540','QJ1','347543',NULL,'提交申请','userTask','wangwu','2019-07-24 09:44:06.797','2019-07-24 09:44:18.056',11259,NULL,''),('347548','KEY_leave:1:342570','347532','347540','QJ2','347549',NULL,'审批【部门经理】','userTask','R20171231556774','2019-07-24 09:44:18.056',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('342587',NULL,'participant','admin',NULL,'342575'),('342597',NULL,'participant','admin',NULL,'342588'),('342603',NULL,'participant','R20171231726481',NULL,'342588'),('347513',NULL,'participant','zhangsan',NULL,'347501'),('347519',NULL,'participant','R20171231556774',NULL,'347501'),('347526',NULL,'participant','R20171231726481',NULL,'347501'),('347544',NULL,'participant','wangwu',NULL,'347532'),('347550',NULL,'participant','R20171231556774',NULL,'347532');
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('342575','342575',NULL,'KEY_leave:1:342570','2019-07-24 09:25:07.853',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('342588','342588',NULL,'Key_test:1:342574','2019-07-24 09:25:20.198','2019-07-24 09:30:40.138',319940,NULL,'start','end',NULL,NULL,'',NULL),('347501','347501',NULL,'KEY_leave:1:342570','2019-07-24 09:39:33.472','2019-07-24 09:43:26.371',232899,NULL,'start','end',NULL,NULL,'',NULL),('347532','347532',NULL,'KEY_leave:1:342570','2019-07-24 09:44:06.796',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('342586','KEY_leave:1:342570','QJ1','342575','342583','提交申请',NULL,NULL,NULL,'admin','2019-07-24 09:25:07.854',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('342596','Key_test:1:342574','submit','342588','342593','提交',NULL,NULL,NULL,'admin','2019-07-24 09:25:20.199',NULL,'2019-07-24 09:27:08.103',107904,NULL,50,NULL,NULL,NULL,''),('342602','Key_test:1:342574','total_approve','342588','342593','总领导审批',NULL,NULL,NULL,'R20171231726481','2019-07-24 09:27:08.157',NULL,'2019-07-24 09:30:39.663',211506,NULL,50,NULL,NULL,NULL,''),('347512','KEY_leave:1:342570','QJ1','347501','347509','提交申请',NULL,NULL,NULL,'zhangsan','2019-07-24 09:39:33.643',NULL,'2019-07-24 09:40:28.739',55096,NULL,50,NULL,NULL,NULL,''),('347518','KEY_leave:1:342570','QJ2','347501','347509','审批【部门经理】',NULL,NULL,NULL,'R20171231556774','2019-07-24 09:40:28.780',NULL,'2019-07-24 09:41:49.587',80807,NULL,50,NULL,NULL,NULL,''),('347525','KEY_leave:1:342570','QJ3','347501','347509','审批【总经理】',NULL,NULL,NULL,'R20171231726481','2019-07-24 09:41:49.742',NULL,'2019-07-24 09:43:26.168',96426,NULL,50,NULL,NULL,NULL,''),('347543','KEY_leave:1:342570','QJ1','347532','347540','提交申请',NULL,NULL,NULL,'wangwu','2019-07-24 09:44:06.797',NULL,'2019-07-24 09:44:18.054',11257,NULL,50,NULL,NULL,NULL,''),('347549','KEY_leave:1:342570','QJ2','347532','347540','审批【部门经理】',NULL,NULL,NULL,'R20171231556774','2019-07-24 09:44:18.056',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('342576','342575','342575',NULL,'请假人员','string',0,NULL,NULL,NULL,'系统管理员',NULL,'2019-07-24 09:25:07.853','2019-07-24 09:25:07.853'),('342577','342575','342575',NULL,'开始时间','string',0,NULL,NULL,NULL,'2019 七月 24 周三 - 17:24',NULL,'2019-07-24 09:25:07.853','2019-07-24 09:25:07.853'),('342578','342575','342575',NULL,'结束时间','string',0,NULL,NULL,NULL,'2019 七月 24 周三 - 17:25',NULL,'2019-07-24 09:25:07.853','2019-07-24 09:25:07.853'),('342579','342575','342575',NULL,'请假时长','string',0,NULL,NULL,NULL,'2',NULL,'2019-07-24 09:25:07.853','2019-07-24 09:25:07.853'),('342580','342575','342575',NULL,'请假类型','string',0,NULL,NULL,NULL,'公假',NULL,'2019-07-24 09:25:07.853','2019-07-24 09:25:07.853'),('342581','342575','342575',NULL,'请假事由','string',0,NULL,NULL,NULL,'afaf',NULL,'2019-07-24 09:25:07.853','2019-07-24 09:25:07.853'),('342582','342575','342575',NULL,'USERNAME','string',0,NULL,NULL,NULL,'admin',NULL,'2019-07-24 09:25:07.853','2019-07-24 09:25:07.853'),('342589','342588','342588',NULL,'USERNAME','string',0,NULL,NULL,NULL,'admin',NULL,'2019-07-24 09:25:20.198','2019-07-24 09:25:20.198'),('342590','342588','342588',NULL,'创建时间','string',0,NULL,NULL,NULL,'2019-07-24 17:25:20',NULL,'2019-07-24 09:25:20.198','2019-07-24 09:25:20.198'),('342591','342588','342588',NULL,'原因','string',0,NULL,NULL,NULL,'afaf',NULL,'2019-07-24 09:25:20.198','2019-07-24 09:25:20.198'),('342592','342588','342588',NULL,'day','string',0,NULL,NULL,NULL,'23',NULL,'2019-07-24 09:25:20.199','2019-07-24 09:25:20.199'),('342598','342588','342593','342596','审批结果','string',0,NULL,NULL,NULL,'【批准】系统管理员,fh,<p><img src=\"../../plugins/ueditor/jsp/upload/image/20190530/1559156162349002920.jpg\" title=\"1559156162349002920.jpg\" alt=\"timg.jpg\"/><img src=\"../../plugins/ueditor/jsp/upload/image/20190530/1559156170108004003.png\" title=\"1559156170108004003.png\" alt=\"1.png\"/></p><p style=\"line-height: 16px;\"><img src=\"http://127.0.0.1:8081/plugins/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"../../plugins/ueditor/jsp/upload/file/20190530/1559156178112000772.rar\" title=\"timg.rar\">timg.rar</a></p>',NULL,'2019-07-24 09:27:07.691','2019-07-24 09:27:07.691'),('342599','342588','342593','342596','res','string',0,NULL,NULL,NULL,'0',NULL,'2019-07-24 09:27:07.695','2019-07-24 09:27:07.695'),('345001','342588','342593','342602','审批结果','string',0,NULL,NULL,NULL,'【批准】王五,fh,<p>4242</p>',NULL,'2019-07-24 09:30:37.203','2019-07-24 09:30:37.203'),('345002','342588','342588',NULL,'res','string',0,NULL,NULL,NULL,'0',NULL,'2019-07-24 09:30:38.066','2019-07-24 09:30:38.066'),('347502','347501','347501',NULL,'请假人员','string',0,NULL,NULL,NULL,'张三',NULL,'2019-07-24 09:39:33.615','2019-07-24 09:39:33.615'),('347503','347501','347501',NULL,'开始时间','string',0,NULL,NULL,NULL,'2019 七月 24 周三 - 17:39',NULL,'2019-07-24 09:39:33.616','2019-07-24 09:39:33.616'),('347504','347501','347501',NULL,'结束时间','string',0,NULL,NULL,NULL,'2019 七月 24 周三 - 17:39',NULL,'2019-07-24 09:39:33.616','2019-07-24 09:39:33.616'),('347505','347501','347501',NULL,'请假时长','string',0,NULL,NULL,NULL,'2',NULL,'2019-07-24 09:39:33.616','2019-07-24 09:39:33.616'),('347506','347501','347501',NULL,'请假类型','string',0,NULL,NULL,NULL,'年假',NULL,'2019-07-24 09:39:33.616','2019-07-24 09:39:33.616'),('347507','347501','347501',NULL,'请假事由','string',0,NULL,NULL,NULL,'sagasg',NULL,'2019-07-24 09:39:33.616','2019-07-24 09:39:33.616'),('347508','347501','347501',NULL,'USERNAME','string',0,NULL,NULL,NULL,'zhangsan',NULL,'2019-07-24 09:39:33.616','2019-07-24 09:39:33.616'),('347514','347501','347509','347512','审批结果','string',0,NULL,NULL,NULL,'【批准】张三,fh,<p>荻花圣殿</p>',NULL,'2019-07-24 09:40:20.868','2019-07-24 09:40:20.868'),('347520','347501','347509','347518','审批结果','string',0,NULL,NULL,NULL,'【批准】李四,fh,<p>123</p>',NULL,'2019-07-24 09:41:42.231','2019-07-24 09:41:42.231'),('347527','347501','347509','347525','审批结果','string',0,NULL,NULL,NULL,'【批准】王五,fh,<p>4242</p>',NULL,'2019-07-24 09:43:04.804','2019-07-24 09:43:04.804'),('347528','347501','347501',NULL,'RESULT','string',0,NULL,NULL,NULL,'批准',NULL,'2019-07-24 09:43:05.049','2019-07-24 09:43:05.049'),('347529','347501','347501',NULL,'res','string',0,NULL,NULL,NULL,'0',NULL,'2019-07-24 09:43:09.080','2019-07-24 09:43:09.080'),('347533','347532','347532',NULL,'请假人员','string',0,NULL,NULL,NULL,'王五',NULL,'2019-07-24 09:44:06.796','2019-07-24 09:44:06.796'),('347534','347532','347532',NULL,'开始时间','string',0,NULL,NULL,NULL,'2019 七月 24 周三 - 17:43',NULL,'2019-07-24 09:44:06.796','2019-07-24 09:44:06.796'),('347535','347532','347532',NULL,'结束时间','string',0,NULL,NULL,NULL,'2019 七月 24 周三 - 17:43',NULL,'2019-07-24 09:44:06.796','2019-07-24 09:44:06.796'),('347536','347532','347532',NULL,'请假时长','string',0,NULL,NULL,NULL,'2',NULL,'2019-07-24 09:44:06.796','2019-07-24 09:44:06.796'),('347537','347532','347532',NULL,'请假类型','string',0,NULL,NULL,NULL,'公假',NULL,'2019-07-24 09:44:06.796','2019-07-24 09:44:06.796'),('347538','347532','347532',NULL,'请假事由','string',0,NULL,NULL,NULL,'fgjdfghdfh',NULL,'2019-07-24 09:44:06.796','2019-07-24 09:44:06.796'),('347539','347532','347532',NULL,'USERNAME','string',0,NULL,NULL,NULL,'wangwu',NULL,'2019-07-24 09:44:06.796','2019-07-24 09:44:06.796'),('347545','347532','347540','347543','审批结果','string',0,NULL,NULL,NULL,'【批准】王五,fh,<p>4242</p>',NULL,'2019-07-24 09:44:17.854','2019-07-24 09:44:17.854');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `act_id_membership_ibfk_1` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `act_id_membership_ibfk_2` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `act_procdef_info_ibfk_1` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_procdef_info_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('342567','请假流程',NULL,NULL,'','2019-07-24 01:24:44.620',NULL),('342571','测试流程01',NULL,NULL,'','2019-07-24 01:24:46.104',NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '模型名称',
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL COMMENT '创建时间',
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `VERSION_` int(11) DEFAULT NULL COMMENT '版本',
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '字典ID',
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `act_re_model_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `act_re_model_ibfk_2` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_re_model_ibfk_3` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作流模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
INSERT INTO `act_re_model` VALUES ('237505',5,'请假流程','KEY_leave','00102','2019-03-08 21:44:16.820','2019-03-09 04:34:04.740',1,'{\"name\":\"请假流程\",\"revision\":1,\"description\":\"\"}',NULL,'237506','237507',''),('260001',3,'请假流程(反射)','KEY_leave','00102','2019-07-22 01:25:13.574','2019-07-23 22:38:06.344',2,'{\"name\":\"请假流程\",\"revision\":2,\"description\":null}',NULL,'260002',NULL,''),('262518',3,'请假流程(反射)','KEY_leave','00102','2019-07-22 18:25:39.162','2019-07-23 22:38:05.391',3,'{\"name\":\"请假流程\",\"revision\":3,\"description\":null}',NULL,'262519',NULL,''),('272525',23,'测试流程01',NULL,'00103','2019-07-22 22:07:55.394','2019-07-23 22:41:04.781',1,'{\"name\":\"测试流程01\",\"revision\":1,\"description\":\"Activiti app Rest config\"}',NULL,'272526','272527','');
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('KEY_leave:1:342570',1,'http://www.fhadmin.org/','请假流程','KEY_leave',1,'342567','请假流程.bpmn20.xml','请假流程.KEY_leave.png',NULL,0,1,1,'',NULL),('Key_test:1:342574',1,'http://www.fhadmin.org/','测试流程01','Key_test',1,'342571','测试流程01.bpmn20.xml','测试流程01.Key_test.png',NULL,0,1,1,'',NULL);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `act_ru_deadletter_job_ibfk_1` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_deadletter_job_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_deadletter_job_ibfk_3` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_deadletter_job_ibfk_4` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `act_ru_event_subscr_ibfk_1` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `act_ru_execution_ibfk_1` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `act_ru_execution_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `act_ru_execution_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `act_ru_execution_ibfk_4` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('342575',1,'342575',NULL,NULL,'KEY_leave:1:342570',NULL,'342575',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-07-24 09:25:07.853',NULL,NULL,0,0,0,0,0,0,0,0,0),('342583',1,'342575',NULL,'342575','KEY_leave:1:342570',NULL,'342575','QJ1',1,0,0,0,0,1,NULL,'',NULL,'2019-07-24 09:25:07.854',NULL,NULL,0,0,0,0,0,0,0,0,0),('347532',1,'347532',NULL,NULL,'KEY_leave:1:342570',NULL,'347532',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-07-24 09:44:06.796',NULL,NULL,0,0,0,0,0,0,0,0,0),('347540',2,'347532',NULL,'347532','KEY_leave:1:342570',NULL,'347532','QJ2',1,0,0,0,0,1,NULL,'',NULL,'2019-07-24 09:44:06.796',NULL,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `act_ru_identitylink_ibfk_1` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `act_ru_identitylink_ibfk_2` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_identitylink_ibfk_3` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
INSERT INTO `act_ru_identitylink` VALUES ('342587',1,NULL,'participant','admin',NULL,'342575',NULL),('347544',1,NULL,'participant','wangwu',NULL,'347532',NULL),('347550',1,NULL,'participant','R20171231556774',NULL,'347532',NULL);
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `act_ru_job_ibfk_1` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_job_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_job_ibfk_3` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_job_ibfk_4` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `act_ru_suspended_job_ibfk_1` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_suspended_job_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_suspended_job_ibfk_3` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_suspended_job_ibfk_4` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `act_ru_task_ibfk_1` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_task_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `act_ru_task_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('342586',1,'342583','342575','KEY_leave:1:342570','提交申请',NULL,NULL,'QJ1',NULL,'admin',NULL,50,'2019-07-24 01:25:07.854',NULL,NULL,1,'',NULL,NULL),('347549',1,'347540','347532','KEY_leave:1:342570','审批【部门经理】',NULL,NULL,'QJ2',NULL,'R20171231556774',NULL,50,'2019-07-24 01:44:18.056',NULL,NULL,1,'',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `act_ru_timer_job_ibfk_1` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_timer_job_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_timer_job_ibfk_3` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_timer_job_ibfk_4` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `act_ru_variable_ibfk_1` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_variable_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_variable_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('342576',1,'string','请假人员','342575','342575',NULL,NULL,NULL,NULL,'系统管理员',NULL),('342577',1,'string','开始时间','342575','342575',NULL,NULL,NULL,NULL,'2019 七月 24 周三 - 17:24',NULL),('342578',1,'string','结束时间','342575','342575',NULL,NULL,NULL,NULL,'2019 七月 24 周三 - 17:25',NULL),('342579',1,'string','请假时长','342575','342575',NULL,NULL,NULL,NULL,'2',NULL),('342580',1,'string','请假类型','342575','342575',NULL,NULL,NULL,NULL,'公假',NULL),('342581',1,'string','请假事由','342575','342575',NULL,NULL,NULL,NULL,'afaf',NULL),('342582',1,'string','USERNAME','342575','342575',NULL,NULL,NULL,NULL,'admin',NULL),('347533',1,'string','请假人员','347532','347532',NULL,NULL,NULL,NULL,'王五',NULL),('347534',1,'string','开始时间','347532','347532',NULL,NULL,NULL,NULL,'2019 七月 24 周三 - 17:43',NULL),('347535',1,'string','结束时间','347532','347532',NULL,NULL,NULL,NULL,'2019 七月 24 周三 - 17:43',NULL),('347536',1,'string','请假时长','347532','347532',NULL,NULL,NULL,NULL,'2',NULL),('347537',1,'string','请假类型','347532','347532',NULL,NULL,NULL,NULL,'公假',NULL),('347538',1,'string','请假事由','347532','347532',NULL,NULL,NULL,NULL,'fgjdfghdfh',NULL),('347539',1,'string','USERNAME','347532','347532',NULL,NULL,NULL,NULL,'wangwu',NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `link` varchar(255) DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
INSERT INTO `cms_article` VALUES ('1','3','文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','3','文章标题标题标题标题',NULL,'red',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','16','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) NOT NULL COMMENT '栏目名称',
  `image` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `sort` int(11) DEFAULT '30' COMMENT '排序（升序）',
  `in_menu` char(1) DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` VALUES ('1','0','0,','0','1',NULL,'顶级栏目',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','1','0,1,','1','4','article','软件介绍',NULL,NULL,NULL,NULL,NULL,20,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,10,','1','4','article','网络工具',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,10,','1','4','article','浏览工具',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','10','0,1,10,','1','4','article','浏览辅助',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','10','0,1,10,','1','4','article','网络优化',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','10','0,1,10,','1','4','article','邮件处理',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','10','0,1,10,','1','4','article','下载工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','10','0,1,10,','1','4','article','搜索工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','18','0,1,18,','1','5','link','门户网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','18','0,1,18,','1','5','link','购物网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','18','0,1,18,','1','5','link','交友社区',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','18','0,1,18,','1','5','link','音乐视频',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','1','0,1,','1','6',NULL,'百度一下',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','0,1,','1','6',NULL,'全文检索',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','1','0,1,','1','6',NULL,'公共留言',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','1','3','article','网站简介',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','2','0,1,2,','1','3','article','内部机构',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_db`
--

DROP TABLE IF EXISTS `db_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_db` (
  `DB_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_db`
--

LOCK TABLES `db_db` WRITE;
/*!40000 ALTER TABLE `db_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_timingbackup`
--

DROP TABLE IF EXISTS `db_timingbackup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_timingbackup` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL COMMENT '主键',
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='备份定时器';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_timingbackup`
--

LOCK TABLES `db_timingbackup` WRITE;
/*!40000 ALTER TABLE `db_timingbackup` DISABLE KEYS */;
INSERT INTO `db_timingbackup` VALUES ('e3b20e0a9ca9457fadb46e87668c67b9','act_ge_bytearray_998372','2019-05-23 12:00:57','act_ge_bytearray',2,'0 0 * ? 3 TUES','每年 3 月份的 每个星期二  每小时执行一次','fff');
/*!40000 ALTER TABLE `db_timingbackup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_img`
--

DROP TABLE IF EXISTS `file_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_img` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `origin_name` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_img`
--

LOCK TABLES `file_img` WRITE;
/*!40000 ALTER TABLE `file_img` DISABLE KEYS */;
INSERT INTO `file_img` VALUES (64,'/file/eaed4268-b203-494c-9dbf-4af8287fcbc0.png','eaed4268-b203-494c-9dbf-4af8287fcbc0.png','ttttt.png',NULL),(65,'D:\\file\\editorImg\\20190722111530055.png','20190722111530055.png','ttttt.png','2019-07-21 19:15:33'),(66,'D:\\file\\editorImg\\20190722112250054.png','20190722112250054.png','test.png','2019-07-21 19:22:50'),(67,'D:\\file\\editorImg\\20190722112527538.png','20190722112527538.png','ttttt.png','2019-07-21 19:25:28'),(68,'D:\\file\\editorImg\\20190722112623020.png','20190722112623020.png','test.png','2019-07-21 19:26:23'),(69,'D:\\file\\editorImg\\20190722112635354.png','20190722112635354.png','ttttt.png','2019-07-21 19:26:35'),(70,'D:\\file\\editorImg\\20190722114318739.png','20190722114318739.png','ttttt.png','2019-07-21 19:43:19'),(71,'D:\\file\\editorImg\\20190722114750923.png','20190722114750923.png','test.png','2019-07-21 19:47:51'),(72,'D:\\file\\editorImg\\20190722115004577.png','20190722115004577.png','ttttt.png','2019-07-21 19:50:05'),(73,'D:\\file\\editorImg\\20190722115545879.png','20190722115545879.png','test.png','2019-07-21 19:55:46'),(74,'D:\\file\\editorImg\\20190722130240233.png','20190722130240233.png','ttttt.png','2019-07-21 21:02:40'),(75,'D:\\file\\editorImg\\20190722130402281.png','20190722130402281.png','ttttt.png','2019-07-21 21:04:02'),(76,'D:\\file\\editorImg\\20190722130857010.png','20190722130857010.png','ttttt.png','2019-07-21 21:08:57'),(77,'D:\\file\\editorImg\\20190722131022513.png','20190722131022513.png','ttttt.png','2019-07-21 21:10:23'),(78,'D:\\file\\editorImg\\20190722131409391.png','20190722131409391.png','ttttt.png','2019-07-21 21:14:09'),(79,'D:\\file\\editorImg\\20190722131517274.png','20190722131517274.png','test.png','2019-07-21 21:15:17'),(80,'D:\\file\\editorImg\\20190722131554948.png','20190722131554948.png','ttttt.png','2019-07-21 21:15:55'),(81,'D:\\file\\multiImg\\20190722171910805004-4.png','20190722171910805004-4.png','ttttt.png','2019-07-22 01:19:11');
/*!40000 ALTER TABLE `file_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_fgroup`
--

DROP TABLE IF EXISTS `im_fgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_fgroup` (
  `FGROUP_ID` varchar(100) NOT NULL COMMENT '主键',
  `NAME` varchar(255) DEFAULT NULL COMMENT '组名',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`FGROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_fgroup`
--

LOCK TABLES `im_fgroup` WRITE;
/*!40000 ALTER TABLE `im_fgroup` DISABLE KEYS */;
INSERT INTO `im_fgroup` VALUES ('1e37e06c56f346b497b39f1e0471f0e4','朋友','zhangsan'),('455661b624e148f9960fa1630e04a9f0','同事','lisi'),('76c1b136283040888763ce3e663588ca','同事','zhangsan'),('7f89eaecacac40e19678db39c47664d3','同事','admin'),('8db01045031e4f1fb4dae69d820ca2b3','朋友','admin');
/*!40000 ALTER TABLE `im_fgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_friends`
--

DROP TABLE IF EXISTS `im_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_friends` (
  `FRIENDS_ID` varchar(100) NOT NULL COMMENT '主键',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `FUSERNAME` varchar(100) DEFAULT NULL COMMENT '好友用户名',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '添加时间',
  `ALLOW` varchar(10) DEFAULT NULL COMMENT '是否允许',
  `FGROUP_ID` varchar(100) DEFAULT NULL COMMENT '好友分组ID',
  `DTIME` varchar(32) DEFAULT NULL COMMENT '删除时间',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FRIENDS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_friends`
--

LOCK TABLES `im_friends` WRITE;
/*!40000 ALTER TABLE `im_friends` DISABLE KEYS */;
INSERT INTO `im_friends` VALUES ('02a207bfe9a047d2b5ecdbb0c1738472','lisi','zhangsan','2019-05-14 18:49:44','yes','455661b624e148f9960fa1630e04a9f0','2019-05-14 18:49:44','同意对方申请好友并加对方好友'),('4aafd5683f8a4ed9b0c0986b47bd0ae1','zhangsan','admin','2019-05-30 13:27:34','yes','1e37e06c56f346b497b39f1e0471f0e4','2019-05-30 13:27:34','同意对方申请好友并加对方好友'),('6756321628d441e8a182e2239ca853ca','admin','zhangsan','2019-05-30 13:35:11','yes','7f89eaecacac40e19678db39c47664d3','2019-05-30 13:35:16','');
/*!40000 ALTER TABLE `im_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_hismsg`
--

DROP TABLE IF EXISTS `im_hismsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_hismsg` (
  `HISMSG_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '发送者',
  `TOID` varchar(100) DEFAULT NULL COMMENT '目标(好友或者群)',
  `TYPE` varchar(30) DEFAULT NULL COMMENT '类型',
  `NAME` varchar(100) DEFAULT NULL COMMENT '发送者姓名',
  `PHOTO` varchar(255) DEFAULT NULL COMMENT '发送者头像',
  `CTIME` varchar(100) DEFAULT NULL COMMENT '发送时间',
  `CONTENT` longtext COMMENT '发送消息内容',
  `DREAD` varchar(10) DEFAULT NULL COMMENT '是否已读',
  `OWNER` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`HISMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_hismsg`
--

LOCK TABLES `im_hismsg` WRITE;
/*!40000 ALTER TABLE `im_hismsg` DISABLE KEYS */;
INSERT INTO `im_hismsg` VALUES ('207c73818d5f405887c20c49367be9fa','admin','zhangsan','friend','系统管理员','uploadFiles/photo/fh_avatar2_2019052822483366qs2yoofq.jpg','2019-05-30 13:24:12','nih ','1','zhangsan'),('3be1c281c8014794817eaac9bf19109c','zhangsan','admin','friend','张三','assets/images/user/avatar-2.jpg','2019-05-30 13:24:18','你也好','1','zhangsan'),('443dd16fda3540dfba8a910899eb7e0e','zhangsan','admin','friend','张三','assets/images/user/avatar-2.jpg','2019-05-30 13:34:58','grg','1','zhangsan'),('44912231c1884f01b56ee3e9d91b4967','zhangsan','admin','friend','张三','assets/images/user/avatar-2.jpg','2019-05-26 01:43:57','333','1','zhangsan'),('6a968af1550e4df59ee9af187f970e6f','admin','zhangsan','friend','系统管理员','assets/images/user/avatar-2.jpg','2019-05-26 01:35:57','img[uploadFiles/imgs/20190526/dbe8b21291304e8a947de0823e58cf74.jpg]','1','zhangsan'),('7db2f7daaa4743ddb93bb31e42efa853','admin','zhangsan','friend','系统管理员','assets/images/user/avatar-2.jpg','2019-05-26 01:36:04','file(uploadFiles/file/20190526/9e84afa065534b09b246dec3c883501f.rar)[9e84afa065534b09b246dec3c883501f.rar]','1','zhangsan'),('a64f228d09c6426a94c8e85545853ced','admin','zhangsan','friend','系统管理员','uploadFiles/photo/fh_avatar2_2019052822483366qs2yoofq.jpg','2019-05-30 13:24:25','file(uploadFiles/file/20190530/9ded8a0774874dcfb46335deab930f42.zip)[9ded8a0774874dcfb46335deab930f42.zip]','1','zhangsan'),('bda8b39431dd4bc199d8f28fa8dea57e','admin','zhangsan','friend','系统管理员','uploadFiles/photo/fh_avatar2_2019052822483366qs2yoofq.jpg','2019-05-30 13:24:37','img[uploadFiles/imgs/20190530/0ee64dd12113492c8fb5c093a0a77027.png]','1','zhangsan'),('e7d9794d607749caabc3ff80e44c625d','admin','zhangsan','friend','系统管理员','assets/images/user/avatar-2.jpg','2019-05-26 01:35:24','你好','1','zhangsan'),('f1f48cd3fa31445196a24a5cb3008637','zhangsan','admin','friend','张三','assets/images/user/avatar-2.jpg','2019-05-30 13:34:58','grg','1','admin'),('ff85823929464d6385aba18ef0bfcf69','admin','zhangsan','friend','系统管理员','assets/images/user/avatar-2.jpg','2019-05-26 01:35:44','face[礼物] ','1','zhangsan');
/*!40000 ALTER TABLE `im_hismsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_imstate`
--

DROP TABLE IF EXISTS `im_imstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_imstate` (
  `IMSTATE_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `ONLINE` varchar(10) DEFAULT NULL COMMENT '在线',
  `AUTOGRAPH` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `SIGN` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IMSTATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_imstate`
--

LOCK TABLES `im_imstate` WRITE;
/*!40000 ALTER TABLE `im_imstate` DISABLE KEYS */;
INSERT INTO `im_imstate` VALUES ('49548c35352d4337b4978a198bdce889','admin','online','I LOVE FH Admin','4.jpg'),('69ffe5039fbb4735aa5e163efcd4070b','zhangsan','online','I LOVE FH Admin','5.jpg');
/*!40000 ALTER TABLE `im_imstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_iqgroup`
--

DROP TABLE IF EXISTS `im_iqgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_iqgroup` (
  `IQGROUP_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `QGROUPS` longtext COMMENT '群的ID组合',
  PRIMARY KEY (`IQGROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_iqgroup`
--

LOCK TABLES `im_iqgroup` WRITE;
/*!40000 ALTER TABLE `im_iqgroup` DISABLE KEYS */;
INSERT INTO `im_iqgroup` VALUES ('16204d8eeeb94e63abe41486d59e0865','admin','(\'09c38d77167c48e3a96821bf97d4cac9\',');
/*!40000 ALTER TABLE `im_iqgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_qgroup`
--

DROP TABLE IF EXISTS `im_qgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_qgroup` (
  `QGROUP_ID` varchar(100) NOT NULL COMMENT '主键',
  `NAME` varchar(255) DEFAULT NULL COMMENT '群名称',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '群主',
  `PHOTO` varchar(255) DEFAULT NULL COMMENT '群头像',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`QGROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_qgroup`
--

LOCK TABLES `im_qgroup` WRITE;
/*!40000 ALTER TABLE `im_qgroup` DISABLE KEYS */;
INSERT INTO `im_qgroup` VALUES ('09c38d77167c48e3a96821bf97d4cac9','同事','admin','uploadFiles/imgs/20190715/30db77aa31ef44ceb796522758bfd135.png','2019-05-25 22:32:27');
/*!40000 ALTER TABLE `im_qgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_sysmsg`
--

DROP TABLE IF EXISTS `im_sysmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_sysmsg` (
  `SYSMSG_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '接收者用户名',
  `FROMUSERNAME` varchar(100) DEFAULT NULL COMMENT '发送者用户名',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '操作时间',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '留言',
  `TYPE` varchar(50) DEFAULT NULL COMMENT '类型',
  `CONTENT` varchar(100) DEFAULT NULL COMMENT '事件内容',
  `ISDONE` varchar(30) DEFAULT NULL COMMENT '是否完成',
  `DTIME` varchar(32) DEFAULT NULL COMMENT '完成时间',
  `QGROUP_ID` varchar(100) DEFAULT NULL,
  `DREAD` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SYSMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_sysmsg`
--

LOCK TABLES `im_sysmsg` WRITE;
/*!40000 ALTER TABLE `im_sysmsg` DISABLE KEYS */;
INSERT INTO `im_sysmsg` VALUES ('dfa1f679c3ff4b96b7ee66b370ee632b','zhangsan','admin','2019-05-30 13:35:11','','friend','您同意了系统管理员申请好友并加对方好友','yes','2019-05-30 13:35:16','','1'),('f7c7a76cf5c5493298c6a1582a8c9299','admin','zhangsan','2019-05-30 13:35:16','','friend','张三 已经同意你的好友申请','yes','2019-05-30 13:35:16','','1');
/*!40000 ALTER TABLE `im_sysmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_myleave`
--

DROP TABLE IF EXISTS `oa_myleave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_myleave` (
  `MYLEAVE_ID` varchar(100) NOT NULL COMMENT '主键',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `TYPE` varchar(100) DEFAULT NULL COMMENT '类型',
  `STARTTIME` varchar(100) DEFAULT NULL COMMENT '开始时间',
  `ENDTIME` varchar(100) DEFAULT NULL COMMENT '结束时间',
  `WHENLONG` varchar(50) DEFAULT NULL COMMENT '时长',
  `REASON` varchar(1000) DEFAULT NULL COMMENT '事由',
  PRIMARY KEY (`MYLEAVE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_myleave`
--

LOCK TABLES `oa_myleave` WRITE;
/*!40000 ALTER TABLE `oa_myleave` DISABLE KEYS */;
INSERT INTO `oa_myleave` VALUES ('100e486a271446d8ac661c9dd031ffe6','admin','公假','2019 七月 23 周二 - 14:33','2019 七月 23 周二 - 14:33','2','asgasdg'),('21494880778a4aac953a15741762c6d4','admin','产假','2019 七月 23 周二 - 14:39','2019 七月 23 周二 - 14:39','2','asgasgas'),('40aa9edf432a40c3b69867746003e3cd','admin','公假','2019 七月 24 周三 - 17:24','2019 七月 24 周三 - 17:25','2','afaf'),('5697cd93dfbf4d97a75e9d60212b5235','admin','其它','2019 七月 23 周二 - 12:51','2019 七月 23 周二 - 12:51','3','测试请假流程'),('773a7612932b42deb7e20e32a756e2b5','admin','产假','2019 五月 30 周四 - 02:55','2019 五月 30 周四 - 02:55','sdf','sdf'),('7b3ccfe664784449aa1efa3014220700','zhangsan','年假','2019 七月 24 周三 - 17:39','2019 七月 24 周三 - 17:39','2','sagasg'),('8425e0bc190f455a915c81df1007fcea','wangwu','公假','2019 七月 24 周三 - 17:43','2019 七月 24 周三 - 17:43','2','fgjdfghdfh'),('a0f081690d0a462db230c75f2361e427','admin','公假','2019 七月 24 周三 - 17:23','2019 七月 24 周三 - 17:23','2','sgaasgasgd'),('a34d6389653248b88deb77e3c1a59051','zhangsan','其它','2019 七月 24 周三 - 17:17','2019 七月 24 周三 - 17:17','3','asfafafafasfasf'),('a41c3736302348c28c20bcce8a8fc31a','admin','年假','2019 七月 24 周三 - 10:12','2019 七月 24 周三 - 10:12','2','sagasgasg'),('b8bb0773262c4b3ab5a6f0881d6f8d40','admin','其它','2019 七月 23 周二 - 10:44','2019 七月 23 周二 - 10:44','2','sagagasg'),('bda841ed581e45e6a15ab2c81a71c1f3','admin','其它','2019 七月 23 周二 - 12:45','2019 七月 23 周二 - 12:45','3','xcxf'),('c3c5f2e0d59a4a5ca9c894778f638c34','lisi','事假','2019 五月 30 周四 - 02:24','2019 五月 30 周四 - 02:24','asdad','asda'),('d349f8546ee047c8a52391bf1ff352c3','admin','事假','2019 七月 23 周二 - 10:22','2019 七月 23 周二 - 10:22','2','asg'),('d59eb98033214f8287b6caed7a0504ed','zhangsan','婚假','2019 七月 23 周二 - 13:25','2019 七月 23 周二 - 13:25','3','sssss'),('ef11deeb4b3f487690313ec46775824b','admin','病假','2019 七月 23 周二 - 15:00','2019 七月 23 周二 - 15:00','3','sdagasgd'),('f52295f202a7437ea55ce7e8f3473d94','zhangsan','其它','2019 七月 24 周三 - 17:00','2019 七月 24 周三 - 17:00','3','sgasgasdg'),('f5e964ab64b5407c8ee8b4adab548d87','zhangsan','病假','2019 七月 23 周二 - 12:58','2019 七月 24 周三 - 12:58','2','测试员工张三病假');
/*!40000 ALTER TABLE `oa_myleave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'张三',12,'男','天津'),(2,'李四',13,'女','北京'),(3,'王五',3,'男','上海'),(4,'赵六',44,'女','广州'),(5,'孙七',42,'男','河南'),(7,'张三',12,'男','天津'),(9,'王五',3,'男','上海'),(10,'赵六',44,'女','广州'),(11,'孙七',42,'男','河南'),(12,'王八',14,'女','云南'),(21,'张三',12,'男','天津'),(22,'李四',13,'女','北京'),(32,'王五',3,'男','上海'),(42,'赵六',44,'女','广州'),(124,'王八',14,'女','云南'),(125,'Cesh',12,'男','河北');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_button`
--

DROP TABLE IF EXISTS `sys_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_button` (
  `BUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `SHIRO_KEY` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`BUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_button`
--

LOCK TABLES `sys_button` WRITE;
/*!40000 ALTER TABLE `sys_button` DISABLE KEYS */;
INSERT INTO `sys_button` VALUES ('117825711d484e719a2a3bf1d0d45c2b','发站内信','sms','发站内信按钮'),('1af9cef37b1f4cc79abacb52c25a3dfa','驳回','Reject','驳回'),('3542adfbda73410c976e185ffe50ad06','从系统导出到EXCEL','toExcel','从系统导出到EXCEL'),('688f6db8b226468e82e0f2c40d377fd9','作废','Abolish','作废'),('7b9756f1455d418396d14bf5a1f8ed09','指定下一办理对象','NextASSIGNEE_','指定下一办理对象'),('c3d94fcfd3ee4a2a8f08bb1cd110bc5c','发邮件','email','发邮件按钮'),('e2a0d76a25bd467aa29aaadf3a8def18','委派','Delegate','委派'),('ed570ab55e4f4151a6654a4578aec787','从EXCEL导入系统','fromExcel','从EXCEL导入系统');
/*!40000 ALTER TABLE `sys_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_codeeditor`
--

DROP TABLE IF EXISTS `sys_codeeditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_codeeditor` (
  `CODEEDITOR_ID` varchar(100) NOT NULL,
  `TYPE` varchar(30) DEFAULT NULL COMMENT '类型',
  `FTLNMAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `CODECONTENT` text COMMENT '代码',
  PRIMARY KEY (`CODEEDITOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_codeeditor`
--

LOCK TABLES `sys_codeeditor` WRITE;
/*!40000 ALTER TABLE `sys_codeeditor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_codeeditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_createcode`
--

DROP TABLE IF EXISTS `sys_createcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL COMMENT '主键',
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` longtext COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  `HTYPE` varchar(32) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_createcode`
--

LOCK TABLES `sys_createcode` WRITE;
/*!40000 ALTER TABLE `sys_createcode` DISABLE KEYS */;
INSERT INTO `sys_createcode` VALUES ('00e5dc6ceb8348b68551a240cf22470a','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 09:40:38','文章管理','single'),('020d4826d64c40b690b90fbb5f9a791f','category','Category','cms_CATEGORY','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790PARENT_ID,fh,String,fh,父级编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790PARENT_IDS,fh,String,fh,所有父级编号,fh,是,fh,无,fh,2000,fh,0,fh,nullQ313596790SITE_ID,fh,String,fh,站点编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790OFFICE_ID,fh,String,fh,归属机构,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790MODULE,fh,String,fh,栏目模块,fh,是,fh,无,fh,20,fh,0,fh,nullQ313596790NAME,fh,String,fh,栏目名称,fh,是,fh,无,fh,100,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,栏目图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790HREF,fh,String,fh,链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790TARGET,fh,String,fh,目标,fh,是,fh,无,fh,20,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790SORT,fh,Integer,fh,排序（升序）,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790IN_MENU,fh,String,fh,是否在导航中显示,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790IN_LIST,fh,String,fh,是否在分类页中显示列表,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790SHOW_MODES,fh,String,fh,展现方式,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790ALLOW_COMMENT,fh,String,fh,是否允许评论,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790IS_AUDIT,fh,String,fh,是否需要审核,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790CUSTOM_LIST_VIEW,fh,String,fh,自定义列表视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 11:15:13','栏目管理','single'),('04c882cf0d3e48489aa714d9ae5b3ff5','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 10:02:01','文章管理','single'),('0648acc6256243ee8124fa2dfbf1650e','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 09:12:45','文章管理','single'),('0be5bec4563e43768b3e4e07b694ae1b','testact','TestAct','TESTACT','AC_ID,fh,String,fh,备注1,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790USERNAME,fh,String,fh,备注2,fh,是,fh,无,fh,32,fh,0,fh,nullQ313596790DAY,fh,Integer,fh,备注3,fh,是,fh,无,fh,4,fh,0,fh,nullQ313596790REASON,fh,String,fh,备注4,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790CREATETIME,fh,String,fh,备注5,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790','2019-07-24 15:12:20','测试申请1','single'),('0fdfa1b9f56f4c8492fc5a0423d82faa','stu','Student','TB_STUDENT','SNAME,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DDS,fh,String,fh,数据字典,fh,是,fh,无,fh,100,fh,0,fh,1Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,3,fh,0,fh,nullQ313596790BIRITHDAY,fh,Date,fh,生日,fh,是,fh,无,fh,32,fh,0,fh,nullQ313596790HSS,fh,String,fh,字典2,fh,是,fh,无,fh,100,fh,0,fh,6d30b170d4e348e585f113d14a4dd96dQ313596790','2019-05-14 20:31:46','学生信息','fathertable'),('15acceab3cc346bbaa9dabf18e45487c','stu','Student','TB_STUDENT','SNAME,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DDS,fh,String,fh,数据字典,fh,是,fh,无,fh,100,fh,0,fh,1Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,3,fh,0,fh,nullQ313596790BIRITHDAY,fh,Date,fh,生日,fh,是,fh,无,fh,32,fh,0,fh,nullQ313596790HSS,fh,String,fh,字典2,fh,是,fh,无,fh,100,fh,0,fh,6d30b170d4e348e585f113d14a4dd96dQ313596790','2019-05-13 04:50:16','学生信息','tree'),('213cfa9e654148ff9c23815577495440','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 09:53:44','文章管理','single'),('24ac12386a7e47009f2c59d26914cf21','img','Img','file_IMG','ID,fh,Integer,fh,备注1,fh,是,fh,无,fh,16,fh,0,fh,nullQ313596790URL,fh,String,fh,备注2,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790NAME,fh,String,fh,备注3,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790ORIGIN_NAME,fh,String,fh,备注4,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790CREATETIME,fh,String,fh,备注5,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790','2019-07-19 14:13:59','图片','single'),('27f005aecf864b7cb1e99f007c7d11ca','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 11:05:30','文章管理','single'),('2d6c05ed94064c46b0ad74cbb633d797','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 11:00:42','文章管理','single'),('2fa0aeb35fa748469f00f8a8ef71469b','stu','Student','TB_STUDENT','SNAME,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DDS,fh,String,fh,数据字典,fh,是,fh,无,fh,100,fh,0,fh,1Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,3,fh,0,fh,nullQ313596790BIRITHDAY,fh,Date,fh,生日,fh,是,fh,无,fh,32,fh,0,fh,nullQ313596790HSS,fh,String,fh,字典2,fh,是,fh,无,fh,100,fh,0,fh,6d30b170d4e348e585f113d14a4dd96dQ313596790','2019-05-13 04:49:27','学生信息','fathertable'),('3109b113a8754251bce0d8185453fd24','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 10:33:52','文章管理','single'),('3a797d7aced941af95afe86f2d592efe','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 10:36:23','文章管理','single'),('4bbb8f0cec2a42d9b6420dede24dcf61','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 10:15:47','文章管理','single'),('52ef5b4d679c448f87587e6e5841145e','stu','StudentMx','TB_STUDENTMX','SNAME,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DDS,fh,String,fh,数据字典,fh,是,fh,无,fh,100,fh,0,fh,1Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,3,fh,0,fh,nullQ313596790BIRITHDAY,fh,Date,fh,生日,fh,是,fh,无,fh,32,fh,0,fh,nullQ313596790HSS,fh,String,fh,字典2,fh,是,fh,无,fh,100,fh,0,fh,6d30b170d4e348e585f113d14a4dd96dQ313596790','2019-05-13 04:34:49','学生信息(明细)','sontable'),('5dd7e9f222b74362b59e552efeec5ba4','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 10:46:25','文章管理','single'),('5e3f67c485e7459e8da31e152d84d883','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 10:25:01','文章管理','single'),('627930ba41e04e8b9dfd719ecb919cd4','stu','Student','TB_STUDENT','SNAME,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DDS,fh,String,fh,数据字典,fh,是,fh,无,fh,100,fh,0,fh,1Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,3,fh,0,fh,nullQ313596790BIRITHDAY,fh,Date,fh,生日,fh,是,fh,无,fh,32,fh,0,fh,nullQ313596790HSS,fh,String,fh,字典2,fh,是,fh,无,fh,100,fh,0,fh,6d30b170d4e348e585f113d14a4dd96dQ313596790','2019-05-25 03:44:45','学生信息','single'),('697ab14cf63246ff9744c50b2e56bb2a','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 09:43:17','文章管理','single'),('6ab0abee84dd4d03b94e5238dad0cc8b','category','Category','cms_CATEGORY','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790PARENT_ID,fh,String,fh,父级编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790PARENT_IDS,fh,String,fh,所有父级编号,fh,是,fh,无,fh,2000,fh,0,fh,nullQ313596790SITE_ID,fh,String,fh,站点编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790OFFICE_ID,fh,String,fh,归属机构,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790MODULE,fh,String,fh,栏目模块,fh,是,fh,无,fh,20,fh,0,fh,nullQ313596790NAME,fh,String,fh,栏目名称,fh,是,fh,无,fh,100,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,栏目图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790HREF,fh,String,fh,链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790TARGET,fh,String,fh,目标,fh,是,fh,无,fh,20,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790SORT,fh,Integer,fh,排序（升序）,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790IN_MENU,fh,String,fh,是否在导航中显示,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790IN_LIST,fh,String,fh,是否在分类页中显示列表,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790SHOW_MODES,fh,String,fh,展现方式,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790ALLOW_COMMENT,fh,String,fh,是否允许评论,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790IS_AUDIT,fh,String,fh,是否需要审核,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790CUSTOM_LIST_VIEW,fh,String,fh,自定义列表视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 14:01:47','栏目管理','single'),('6c80a66bf1db4cddbb46ba9dd21f0732','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 10:57:29','文章管理','single'),('7b943127e46546c99a99fe0f9ccdb9c1','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 10:36:50','文章管理','single'),('7bda4b9437dc4e75a7aaa9df3a4f130a','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 09:11:46','文章管理','single'),('80bbf2e9ec424df1938794f4f92de350','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 09:13:21','文章管理','single'),('8575e932796b4234a41b2ce28633ff3d','article','Article','ccARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790NAME,fh,String,fh,名称,fh,是,fh,无,fh,200,fh,0,fh,nullQ313596790CATEGORY,fh,String,fh,分类,fh,是,fh,无,fh,2000,fh,0,fh,nullQ313596790FILE_PATH,fh,String,fh,生成文件路径,fh,是,fh,无,fh,500,fh,0,fh,nullQ313596790FILE_NAME,fh,String,fh,生成文件名,fh,是,fh,无,fh,200,fh,0,fh,nullQ313596790CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记（0：正常；1：删除）,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 17:05:37','文章管理','single'),('9a520761041b478da3176070eed8f364','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 10:40:05','文章管理','single'),('9ee64521e02a45f384a4338aef5281fc','article','Article','TB_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 11:09:55','文章管理','single'),('a975a6c9390e415387147b8ce7998765','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 09:33:06','文章管理','single'),('ac11e7ae93504c07bb7afe7ffd68202a','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 10:35:32','文章管理','single'),('add379f82a75474ab07d3ec8c8dc6080','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 10:33:38','文章管理','single'),('b3628ae094fd4fa5ad16aea7c0bcdbf8','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 10:28:41','文章管理','single'),('b5380bb4940e48e99f6743b8d9b874d4','stu','Student','TB_STUDENT','SNAME,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DDS,fh,String,fh,数据字典,fh,是,fh,无,fh,100,fh,0,fh,1Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,3,fh,0,fh,nullQ313596790BIRITHDAY,fh,Date,fh,生日,fh,是,fh,无,fh,32,fh,0,fh,nullQ313596790HSS,fh,String,fh,字典2,fh,是,fh,无,fh,100,fh,0,fh,6d30b170d4e348e585f113d14a4dd96dQ313596790','2019-05-25 22:27:24','学生信息','single'),('b56bcfcee4ff4341aa53cb8d68809c44','category','Category','cms_CATEGORY','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790PARENT_ID,fh,String,fh,父级编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790PARENT_IDS,fh,String,fh,所有父级编号,fh,是,fh,无,fh,2000,fh,0,fh,nullQ313596790SITE_ID,fh,String,fh,站点编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790OFFICE_ID,fh,String,fh,归属机构,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790MODULE,fh,String,fh,栏目模块,fh,是,fh,无,fh,20,fh,0,fh,nullQ313596790NAME,fh,String,fh,栏目名称,fh,是,fh,无,fh,100,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,栏目图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790HREF,fh,String,fh,链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790TARGET,fh,String,fh,目标,fh,是,fh,无,fh,20,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790SORT,fh,Integer,fh,排序（升序）,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790IN_MENU,fh,String,fh,是否在导航中显示,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790IN_LIST,fh,String,fh,是否在分类页中显示列表,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790SHOW_MODES,fh,String,fh,展现方式,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790ALLOW_COMMENT,fh,String,fh,是否允许评论,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790IS_AUDIT,fh,String,fh,是否需要审核,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790CUSTOM_LIST_VIEW,fh,String,fh,自定义列表视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 14:00:38','栏目管理','single'),('c2fa81b3709f4317a0bc694f755f317d','stu','Student','TB_STUDENT','SNAME,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DDS,fh,String,fh,数据字典,fh,是,fh,无,fh,100,fh,0,fh,1Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,3,fh,0,fh,nullQ313596790BIRITHDAY,fh,Date,fh,生日,fh,是,fh,无,fh,32,fh,0,fh,nullQ313596790HSS,fh,String,fh,字典2,fh,是,fh,无,fh,100,fh,0,fh,6d30b170d4e348e585f113d14a4dd96dQ313596790','2019-05-25 03:42:50','学生信息','tree'),('c3383deb7c1947209c9494e1bb0f6854','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 10:32:10','文章管理','single'),('c50338ec418041ceba834445a0b23d6e','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 10:07:23','文章管理','single'),('cab6e033a9c74b30a1c03d29fd54650d','category','Category','cms_CATEGORY','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790PARENT_ID,fh,String,fh,父级编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790PARENT_IDS,fh,String,fh,所有父级编号,fh,是,fh,无,fh,2000,fh,0,fh,nullQ313596790SITE_ID,fh,String,fh,站点编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790OFFICE_ID,fh,String,fh,归属机构,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790MODULE,fh,String,fh,栏目模块,fh,是,fh,无,fh,20,fh,0,fh,nullQ313596790NAME,fh,String,fh,栏目名称,fh,是,fh,无,fh,100,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,栏目图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790HREF,fh,String,fh,链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790TARGET,fh,String,fh,目标,fh,是,fh,无,fh,20,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790SORT,fh,Integer,fh,排序（升序）,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790IN_MENU,fh,String,fh,是否在导航中显示,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790IN_LIST,fh,String,fh,是否在分类页中显示列表,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790SHOW_MODES,fh,String,fh,展现方式,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790ALLOW_COMMENT,fh,String,fh,是否允许评论,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790IS_AUDIT,fh,String,fh,是否需要审核,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790CUSTOM_LIST_VIEW,fh,String,fh,自定义列表视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-15 14:03:01','栏目管理','single'),('d851e998a84540f3a08db4b48fc438f5','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 09:37:40','文章管理','single'),('e218011c6fad413f9f1b1ae1ada94ced','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 09:21:56','文章管理','single'),('f0a8c02201b54b8b970195e2f4d2cef2','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 09:31:55','文章管理','single'),('f4d13cd9b8b548ef8e5ef8c159ec995c','article','Article','cms_ARTICLE','ID,fh,String,fh,编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CATEGORY_ID,fh,String,fh,栏目编号,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790LINK,fh,String,fh,文章链接,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790COLOR,fh,String,fh,标题颜色,fh,是,fh,无,fh,50,fh,0,fh,nullQ313596790IMAGE,fh,String,fh,文章图片,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790KEYWORDS,fh,String,fh,关键字,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DESCRIPTION,fh,String,fh,描述、摘要,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790WEIGHT,fh,Integer,fh,权重，越大越靠前,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790WEIGHT_DATE,fh,Date,fh,权重期限,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790HITS,fh,Integer,fh,点击数,fh,是,fh,无,fh,11,fh,0,fh,nullQ313596790POSID,fh,String,fh,推荐位，多选,fh,是,fh,无,fh,10,fh,0,fh,nullQ313596790CUSTOM_CONTENT_VIEW,fh,String,fh,自定义内容视图,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790VIEW_CONFIG,fh,String,fh,视图配置,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790CREATE_BY,fh,String,fh,创建者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790CREATE_DATE,fh,Date,fh,创建时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790UPDATE_BY,fh,String,fh,更新者,fh,是,fh,无,fh,64,fh,0,fh,nullQ313596790UPDATE_DATE,fh,Date,fh,更新时间,fh,是,fh,无,fh,0,fh,0,fh,nullQ313596790REMARKS,fh,String,fh,备注信息,fh,是,fh,无,fh,255,fh,0,fh,nullQ313596790DEL_FLAG,fh,String,fh,删除标记,fh,是,fh,无,fh,1,fh,0,fh,nullQ313596790','2019-07-16 09:14:03','文章管理','single');
/*!40000 ALTER TABLE `sys_createcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionaries`
--

DROP TABLE IF EXISTS `sys_dictionaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL COMMENT '主键',
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  `TBFIELD` varchar(100) DEFAULT NULL COMMENT '关联字段,默认字段为 BIANMA',
  `YNDEL` varchar(10) DEFAULT NULL COMMENT '禁止删除,为yes禁止删除',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionaries`
--

LOCK TABLES `sys_dictionaries` WRITE;
/*!40000 ALTER TABLE `sys_dictionaries` DISABLE KEYS */;
INSERT INTO `sys_dictionaries` VALUES ('00ef925d227444859eef2057693722ae','达州','dazhou','0032504',4,'d3538add7125404aba4b0007ef9fde50','达州市','',NULL,NULL),('010692054ac24eeebf5b8067f0f0521a','安庆','anqing','0030401',1,'249999f296d14f95b8138a30bbb2c374','安庆市','',NULL,NULL),('023473e9e6204583a110531036357514','山西','shanxi','00323',23,'1','山西省','',NULL,NULL),('02e5eb8f50bd4824ad97427e2b372d14','绥化','suihua','0031312',12,'b2d4133b5dbf4599ada940620d2ab250','绥化市','',NULL,NULL),('035fe989f54742ac8b64b80b24213442','来宾','laibin','0030809',9,'c5f3d426c582410281f89f1451e1d854','来宾市','',NULL,NULL),('055273fe79f94e09a64698dab8d30ea8','揭阳','jieyang','0030708',8,'0dd1f40bcb9d46aeba015dc19645a5b9','揭阳市','',NULL,NULL),('05ab2921b64d4f5c935c35228cc49ecb','大同','datong','0032302',2,'023473e9e6204583a110531036357514','大同市','',NULL,NULL),('05ed855479d94b139c77ae82452bb39c','涪陵区','fulingqu','0033102',2,'1c85fbd06cf840d093f3640aca1b6b2d','涪陵区','',NULL,NULL),('076995f7d0034b32a94e0130d406d137','湖州','huzhou','0033002',2,'6d846178376549ed878d11d109819f25','湖州市','',NULL,NULL),('076a163af6814f93954a543bd3b2fa4d','广州','guangzhou','0030704',4,'0dd1f40bcb9d46aeba015dc19645a5b9','广州市','',NULL,NULL),('085ebd2776384eff842de8b61b781a7e','潼南区','tongnanqu','0033122',22,'1c85fbd06cf840d093f3640aca1b6b2d','潼南区','',NULL,NULL),('0953fe05e34642169c4cf24492b163b9','湘西','xiangxi','0031514',14,'c59f91630bef4289b71fcb2a48994582','湘西市','',NULL,NULL),('098bf5e3603e44889a2c4bb25e350400','阿坝','a\'ba','0032501',1,'d3538add7125404aba4b0007ef9fde50','阿坝市','',NULL,NULL),('0a2561ec256b4f46b4fa76c621256595','鹤岗','hegang','0031304',4,'b2d4133b5dbf4599ada940620d2ab250','鹤岗市','',NULL,NULL),('0a65f2ef68d54b7c8772e1d916684c4a','岳阳','yueyang','0031506',6,'c59f91630bef4289b71fcb2a48994582','岳阳市','',NULL,NULL),('0a754e878c304b99bf5d34a82ca3705c','吉林','jilin','0031604',4,'857be71b0d6d4a40a2c83476824206d1','吉林市','',NULL,NULL),('0b08e52f2b264d0da66d37e718e32aba','常德','changde','0031507',7,'c59f91630bef4289b71fcb2a48994582','常德市','',NULL,NULL),('0c908137935946ac885cb56e55ff4f5d','北碚区','beibeiqu','0033109',9,'1c85fbd06cf840d093f3640aca1b6b2d','北碚区','',NULL,NULL),('0dba32de24014bcab807fd0fc51953aa','北海','beihai','0030802',2,'c5f3d426c582410281f89f1451e1d854','北海市','',NULL,NULL),('0dd1f40bcb9d46aeba015dc19645a5b9','广东','guangdong','00307',7,'1','广东省','',NULL,NULL),('0e18ab3edf5e43ee8737c156b0b50692','吉安','ji\'an','0031803',3,'cb3008cbd6ae4b5f8cebd2254ccb8603','吉安市','',NULL,NULL),('0e4f0359b4104a4e84723fda8f86cc37','请假流程标识','Leave process identification','KEY_leave',1,'act002','请假流程标识','','','yes'),('0eb279a28a0d43c7a075d58c6cfc3e02','长寿区','changshouqu','0033115',15,'1c85fbd06cf840d093f3640aca1b6b2d','长寿区','',NULL,NULL),('0efda23d751b42cb9472ca4f80cdf6c5','德州','dezhou','0030303',3,'10f46a521ea0471f8d71ee75ac3b5f3a','德州市','',NULL,NULL),('0f975f2f51e245439b7d759f822a4a43','嘉定区','jiadingqu','0030210',10,'f1ea30ddef1340609c35c88fb2919bee','嘉定区','',NULL,NULL),('1','地区','area','003',3,'0','地区','','',NULL),('10a2b2b54bce432baf603c7fa4b45de0','淮北','huaibei','0030409',9,'249999f296d14f95b8138a30bbb2c374','淮北市','',NULL,NULL),('10c14cd82df9496bb86c5681ddfb92fb','本溪','benxi','0031902',2,'b3366626c66c4b61881f09e1722e8495','本溪市','',NULL,NULL),('10f46a521ea0471f8d71ee75ac3b5f3a','山东','shandong','00303',3,'1','山东省','',NULL,NULL),('10f5278b19824877988e8baa5a1b58f4','邯郸','handan','0031104',4,'75362368f22f4d60a810c2a45cced487','邯郸市','',NULL,NULL),('11ab8df614c14451bb08a91fbe05162e','防城港','fangchenggang','0030804',4,'c5f3d426c582410281f89f1451e1d854','防城港市','',NULL,NULL),('11fa0741880a45f09c81f0681acbc6dd','办公审批','bangong','00101',1,'act001','办公审批','','','yes'),('12a62a3e5bed44bba0412b7e6b733c93','北京','beijing','00301',1,'1','北京','',NULL,NULL),('13b4d440cdd043378c2bbd0b797bc7b7','黄石','huangshi','0031404',4,'312b80775e104ba08c8244a042a658df','黄石市','',NULL,NULL),('13e9e380abed4def837bea1671b92633','大兴安岭','daxinganling','0031302',2,'b2d4133b5dbf4599ada940620d2ab250','大兴安岭市','',NULL,NULL),('14452abafbef4cadbb05a5a74a61eb6f','广安','guang\'an','0032507',7,'d3538add7125404aba4b0007ef9fde50','广安市','',NULL,NULL),('158588bf48464dcca0e656968b8e09c0','密云区','miyunqu','0030115',15,'12a62a3e5bed44bba0412b7e6b733c93','密云区','',NULL,NULL),('159d49075827476490aee58956fb159c','潜江','qianjiang','0031406',6,'312b80775e104ba08c8244a042a658df','潜江市','',NULL,NULL),('15da226f465b4dac95c8333fd3d81747','淮安','huaian','0031702',2,'577405ff648240959b3765c950598ab0','淮安市','',NULL,NULL),('16535e38a2534f4781353e7570831ea1','丽江','lijiang','0032909',9,'510607a1836e4079b3103e14ec5864ed','丽江','',NULL,NULL),('165fd1c02d98439d8d7cc2e81def88d6','陇南','longnan','0030609',9,'3283f1a77180495f9a0b192d0f9cdd35','陇南市','',NULL,NULL),('16a1eb63489e4d28827fc16a90e2ed61','贵港','guigang','0030805',5,'c5f3d426c582410281f89f1451e1d854','贵港市','',NULL,NULL),('1895a514cda74329817bce6a5fe918f4','济源','jiyuan','0031203',3,'7336944efb4b40fcae9118fc9a970d2d','济源市','',NULL,NULL),('1929f99821f2484fa33991233c1555e9','大理','dali','0032904',4,'510607a1836e4079b3103e14ec5864ed','大理','',NULL,NULL),('192a36eb3d234a909e339c06b9cf723a','许昌','xuchang','0031215',15,'7336944efb4b40fcae9118fc9a970d2d','许昌市','',NULL,NULL),('19cf8222eac9457280ebb40f14052590','南岸区','nan\'anqu','0033108',8,'1c85fbd06cf840d093f3640aca1b6b2d','南岸区','',NULL,NULL),('1a99e7e302ce4f24b4b5d5d4b20a75fe','清远','qingyuan','0030711',11,'0dd1f40bcb9d46aeba015dc19645a5b9','清远市','',NULL,NULL),('1ac809034f3d471592a5c74e19c7f1bc','烟台','yantai','0030315',15,'10f46a521ea0471f8d71ee75ac3b5f3a','烟台市','',NULL,NULL),('1b65dd2a2057489c9598c789b4114d24','孝感','xiaogan','0031415',15,'312b80775e104ba08c8244a042a658df','孝感市','',NULL,NULL),('1b8b44f0c4384a09987ab0c5d9ceedd2','神农架林区','shennongjialinqu','0031407',7,'312b80775e104ba08c8244a042a658df','神农架林区','',NULL,NULL),('1c4313525bdc4d4b9f7849dfb614cfb3','柳州','liuzhou','0030810',10,'c5f3d426c582410281f89f1451e1d854','柳州市','',NULL,NULL),('1c85fbd06cf840d093f3640aca1b6b2d','重庆','chongqing','00331',31,'1','重庆','',NULL,NULL),('1cf92384c7ee46faa91acface462b32f','沧州','cangzhou','0031102',2,'75362368f22f4d60a810c2a45cced487','沧州市','',NULL,NULL),('1d0deff7da2745cc960cfa9ae07bdd13','抚顺','fushun','0031906',6,'b3366626c66c4b61881f09e1722e8495','抚顺市','',NULL,NULL),('1d6d2d9af05849da9807d4cba0144695','南通','nantong','0031705',5,'577405ff648240959b3765c950598ab0','南通市','',NULL,NULL),('1e228d052ec24bb7ba64524f51689cef','鄂尔多斯','eerduosi','0032005',5,'c072c248c7ab47dda7bf24f5e577925c','鄂尔多斯市','',NULL,NULL),('1e429ce404794a30aad09bc592d0f5ce','荆门','jingmen','0031405',5,'312b80775e104ba08c8244a042a658df','荆门市','',NULL,NULL),('1e89ca839dbf46a3bc8c02b7d55802c5','长沙','changsha','0031501',1,'c59f91630bef4289b71fcb2a48994582','长沙市','',NULL,NULL),('2087851693514e3c9c98fd843fb5b32c','河西区','hexiqu','0032603',3,'2c254799d3454f2cbc338ef5712548e9','河西区','',NULL,NULL),('20a08ca32856488dad122529f901fb9b','固原','guyuan','0032101',1,'5690b0534fe745e5ba0f504f0c260559','固原市','',NULL,NULL),('20f6d6c3b3234c21b52755ab6b690ffe','杭州','hangzhou','0033001',1,'6d846178376549ed878d11d109819f25','杭州市','',NULL,NULL),('212dbe5474304ad8b5f6e6049a72da46','包头','baotou','0032003',3,'c072c248c7ab47dda7bf24f5e577925c','包头市','',NULL,NULL),('217c993dce9544c89279e88bdd60e7a8','黄冈','huanggang','0031403',3,'312b80775e104ba08c8244a042a658df','黄冈市','',NULL,NULL),('22ef24142b0a4d6e9f05582e3c8790a9','济南','jinan','0030301',1,'10f46a521ea0471f8d71ee75ac3b5f3a','济南市','',NULL,NULL),('2303cab27d704a259d7b0c42a687f3db','马鞍山','maanshan','0030413',13,'249999f296d14f95b8138a30bbb2c374','马鞍山市','',NULL,NULL),('23aff8da2e6c4513be3155f372c45046','石嘴山','shizuishan','0032103',3,'5690b0534fe745e5ba0f504f0c260559','石嘴山市','',NULL,NULL),('23caa037fe8c4283b7a7fc42da4a45a9','武威','wuwei','0030613',13,'3283f1a77180495f9a0b192d0f9cdd35','武威市','',NULL,NULL),('23f71d660bb94d239dde6738b73d3905','延边','yanbian','0031609',9,'857be71b0d6d4a40a2c83476824206d1','延边市','',NULL,NULL),('24007511f8ec42da8c6555305afe56ce','青岛','qindao','0030310',10,'10f46a521ea0471f8d71ee75ac3b5f3a','青岛市','',NULL,NULL),('2431e2f471624fd9bf0f76b7049b1296','驻马店','zhumadian','0031218',18,'7336944efb4b40fcae9118fc9a970d2d','驻马店市','',NULL,NULL),('244ffa16c2cd4594af2dfed2f7257d24','德阳','deyang','0032505',5,'d3538add7125404aba4b0007ef9fde50','德阳市','',NULL,NULL),('2477f3e5e2c94c73844b060d9dc82316','深圳','shenzhen','0030715',15,'0dd1f40bcb9d46aeba015dc19645a5b9','深圳市','',NULL,NULL),('249999f296d14f95b8138a30bbb2c374','安徽','anhui','00304',4,'1','安徽省','',NULL,NULL),('25892ce9cba1429fb1b45d4aaeaf3bca','石家庄','shijiazhuang','0031108',8,'75362368f22f4d60a810c2a45cced487','石家庄市','',NULL,NULL),('2627d3e9f98a4cdfbe0f59a4c5d3772a','白银','baiyin','0030601',1,'3283f1a77180495f9a0b192d0f9cdd35','白银市','',NULL,NULL),('26a79d023ad7483194241cddf97f3689','莱芜','laiwu','0030307',7,'10f46a521ea0471f8d71ee75ac3b5f3a','莱芜市','',NULL,NULL),('26b093ae7635474d8da8162efe7e4035','合川区','hechuanqu','0033117',17,'1c85fbd06cf840d093f3640aca1b6b2d','合川区','',NULL,NULL),('26d4e79797d34b11b58eb12e5c0c55ae','抚州','fuzhou','0031801',1,'cb3008cbd6ae4b5f8cebd2254ccb8603','抚州市','',NULL,NULL),('273f2c545056473abaf320327073b48b','无锡','wuxi','0031709',9,'577405ff648240959b3765c950598ab0','无锡市','',NULL,NULL),('27927fbc83154894b096221da15b326a','保定','baoding','0031101',1,'75362368f22f4d60a810c2a45cced487','保定市','',NULL,NULL),('287baf1c903444359971b0ce8d58dce2','普洱','pu\'er','0032912',12,'510607a1836e4079b3103e14ec5864ed','普洱','',NULL,NULL),('29a4dbca082b49078af67caf5fd28f4f','漳州','zhangzhou','0030509',9,'d4066f6f425a4894a77f49f539f2a34f','漳州市','',NULL,NULL),('2a4c3b9f024743d19907b36ab4a43499','宣城','xuancheng','0030417',17,'249999f296d14f95b8138a30bbb2c374','宣城市','',NULL,NULL),('2a4f0cb0748645bab53b94b62412df04','黔西南','qianxinan','0030907',7,'592f6fcf45a74524aa8ea853fc9761d5','黔西南市','',NULL,NULL),('2ae081dd5d3c47b584fdaf24769e49e1','玉溪','yuxi','0032915',15,'510607a1836e4079b3103e14ec5864ed','玉溪','',NULL,NULL),('2ba8e6d0fd944983aa19b781c6b53477','海南','hainan','00310',10,'1','海南省','',NULL,NULL),('2bd0431e3566451297ecd194287a878a','甘孜','ganzi','0032506',6,'d3538add7125404aba4b0007ef9fde50','甘孜','',NULL,NULL),('2c0da3154cc74d7990c597bed6ebf2d6','大兴区','daxingqu','0030112',12,'12a62a3e5bed44bba0412b7e6b733c93','大兴区','',NULL,NULL),('2c254799d3454f2cbc338ef5712548e9','天津','tianjin','00326',26,'1','天津','',NULL,NULL),('2d0e4687904b48738ac6bd6a42e7f32d','忻州','xinzhou','0032309',9,'023473e9e6204583a110531036357514','忻州市','',NULL,NULL),('2d0ff92556b544c19dbfc8b8b055e19a','常州','changzhou','0031701',1,'577405ff648240959b3765c950598ab0','常州市','',NULL,NULL),('2e3c279cf0a44115869049e4a6d9ed08','西宁','xining','0032207',7,'5a80e3435c0e4dc09bafceeadb38e5f0','西宁','',NULL,NULL),('2f097a8914de4b01a04bf61852435672','阿勒泰','a\'letai','0032802',2,'2fabed91c6d94e698ed449165cd250ca','阿勒泰','',NULL,NULL),('2f5e433682f24e20b600532062ff0bcb','白山','baishan','0031602',2,'857be71b0d6d4a40a2c83476824206d1','白山市','',NULL,NULL),('2f7f68eb9be845be90e74a0763de2c7f','平谷区','pingguqu','0030114',14,'12a62a3e5bed44bba0412b7e6b733c93','平谷区','',NULL,NULL),('2f8e7a55eaab4649b9abe43ade744e58','大庆','daqing','0031301',1,'b2d4133b5dbf4599ada940620d2ab250','大庆市','',NULL,NULL),('2fabed91c6d94e698ed449165cd250ca','新疆','xinjiang','00328',28,'1','新疆','',NULL,NULL),('30d424f63bf44e8391683f371ed3552f','秦皇岛','qinhuangdao','0031107',7,'75362368f22f4d60a810c2a45cced487','秦皇岛市','',NULL,NULL),('312b80775e104ba08c8244a042a658df','湖北','hubei','00314',14,'1','湖北省','',NULL,NULL),('3186f859efa246f793401c475d3d0090','阿里','a\'li','0032701',1,'3e846b08dbbe495e93bc93f8f202de79','阿里','',NULL,NULL),('325e45e49c1849efb7fea2296f686210','赣州','ganzhou','0031802',2,'cb3008cbd6ae4b5f8cebd2254ccb8603','赣州市','',NULL,NULL),('3283f1a77180495f9a0b192d0f9cdd35','甘肃','gansu','00306',6,'1','甘肃省','',NULL,NULL),('329838f633f340779483910f33387ccd','通州区','tongzhouqu','0030109',9,'12a62a3e5bed44bba0412b7e6b733c93','通州区','',NULL,NULL),('3326f321dfe54e5292e94a9f2a518723','乌鲁木齐','wulumuqi','0032812',12,'2fabed91c6d94e698ed449165cd250ca','乌鲁木齐','',NULL,NULL),('33fe30734ed84994bdd46ebe69aac088','朝阳区','chaoyangqu','0030103',3,'12a62a3e5bed44bba0412b7e6b733c93','朝阳区','',NULL,NULL),('34bc05269e304e2e99c9ded314a12321','石景山区','shijingshanqu','0030105',5,'12a62a3e5bed44bba0412b7e6b733c93','石景山区','',NULL,NULL),('34d6634b8baa47a3b1c0d0346d93873b','和平区','hepingqu','0032601',1,'2c254799d3454f2cbc338ef5712548e9','和平区','',NULL,NULL),('3521e41344aa42aaa1cd212482992055','漯河','luohe','0031207',7,'7336944efb4b40fcae9118fc9a970d2d','漯河市','',NULL,NULL),('366bc947374d4826b09882d387b880ff','病假','sick leave','00404',4,'6d30b170d4e348e585f113d14a4dd96d','病假','','','no'),('38bc876c1cab4434af9d14be194463c8','南充','nanchong','0032514',14,'d3538add7125404aba4b0007ef9fde50','南充市','',NULL,NULL),('39595ea4b765445dae9c26ae870b3a0f','克州','kezhou','0032809',9,'2fabed91c6d94e698ed449165cd250ca','克州','',NULL,NULL),('3a3b4ea7445a4aec80083e5957028990','汕头','shantou','0030712',12,'0dd1f40bcb9d46aeba015dc19645a5b9','汕头市','',NULL,NULL),('3a5d1b6e800541c683724672cae3e0f6','泰安','taian','0030312',12,'10f46a521ea0471f8d71ee75ac3b5f3a','泰安市','',NULL,NULL),('3ad7c52e9a7044a1a9ab00f29f8cef7c','阿克苏','a\'kesu','0032801',1,'2fabed91c6d94e698ed449165cd250ca','阿克苏','',NULL,NULL),('3ae7c64c40c147eeb3898883e20a7fe0','山南','shannan','0032707',7,'3e846b08dbbe495e93bc93f8f202de79','山南','',NULL,NULL),('3d2a8f11e6d345b5af2f8e5d8bb6bb7a','鹰潭','yingtan','0031811',11,'cb3008cbd6ae4b5f8cebd2254ccb8603','鹰潭市','',NULL,NULL),('3dbed4444dfc4884ab57d769ceac9507','松江区','songjiangqu','0030213',13,'f1ea30ddef1340609c35c88fb2919bee','松江区','',NULL,NULL),('3e846b08dbbe495e93bc93f8f202de79','西藏','xizang','00327',27,'1','西藏','',NULL,NULL),('3eed1c5fb2c9420dbe6e76fdb0f9c4cb','眉山','meishan','0032511',11,'d3538add7125404aba4b0007ef9fde50','眉山市','',NULL,NULL),('3f7c5e8ba51849549f5e5dfee72566cc','呼伦贝尔','hulunbeier','0032007',7,'c072c248c7ab47dda7bf24f5e577925c','呼伦贝尔市','',NULL,NULL),('3fb6c72b11124211a22d9f8f40715737','辽阳','liaoyang','0031910',10,'b3366626c66c4b61881f09e1722e8495','辽阳市','',NULL,NULL),('3fffacbb502d4647bd358ff00412f536','长治','changzhi','0032301',1,'023473e9e6204583a110531036357514','长治市','',NULL,NULL),('407fa7f152f4461582cfd6904b2c454a','晋城','jincheng','0032303',3,'023473e9e6204583a110531036357514','晋城市','',NULL,NULL),('415fe5fbf3054a3ea2ebdbe24ce4c49f','永川区','yongchuanqu','0033118',18,'1c85fbd06cf840d093f3640aca1b6b2d','永川区','',NULL,NULL),('417d25314a9e43c6b7b725db160db360','延安','yan\'an','0032409',9,'534850c72ceb4a57b7dc269da63c330a','延安市','',NULL,NULL),('4266f08d4bc24321bba7ea3a83a8ba95','永州','yongzhou','0031511',11,'c59f91630bef4289b71fcb2a48994582','永州市','',NULL,NULL),('429dc62e0f6641b8b2ddced272d5d087','遵义','zunyi','0030909',9,'592f6fcf45a74524aa8ea853fc9761d5','遵义市','',NULL,NULL),('432c0a1be10143beba6de15ad8811b64','安顺','anshun','0030901',1,'592f6fcf45a74524aa8ea853fc9761d5','安顺市','',NULL,NULL),('44fee1b9a9e141f9bdf90053f4972d2e','北辰区','beichenqu','0032610',10,'2c254799d3454f2cbc338ef5712548e9','北辰区','',NULL,NULL),('458411aef2d34ccd99ab5976f0f1f030','金华','jinhua','0033004',4,'6d846178376549ed878d11d109819f25','金华市','',NULL,NULL),('45a5be4b22ec494c99b112a7c96bca47','钦州','qinzhou','0030812',12,'c5f3d426c582410281f89f1451e1d854','钦州市','',NULL,NULL),('4795a00ae89441ce82bcabdf086e8316','宝鸡','baoji','0032402',2,'534850c72ceb4a57b7dc269da63c330a','宝鸡市','',NULL,NULL),('480875fd43a947119e24c2302eeead53','伊春','yichun','0031313',13,'b2d4133b5dbf4599ada940620d2ab250','伊春市','',NULL,NULL),('4921e0e6f9d445cdb6a4b3da98ab3555','林芝','linzhi','0032704',4,'3e846b08dbbe495e93bc93f8f202de79','林芝','',NULL,NULL),('4972af008f074efd91ea8312587afb42','牡丹江','mudanjiang','0031308',8,'b2d4133b5dbf4599ada940620d2ab250','牡丹江市','',NULL,NULL),('49b4639e83e441c581bfdefda3a9ac27','宜春','yichun','0031810',10,'cb3008cbd6ae4b5f8cebd2254ccb8603','宜春市','',NULL,NULL),('4b41fbe4cdae414a91af371e3105ebe5','景德镇','jingdezhen','0031804',4,'cb3008cbd6ae4b5f8cebd2254ccb8603','景德镇市','',NULL,NULL),('4b72f022312e4664ae7863b343239ff0','淄博','zibo','0030317',17,'10f46a521ea0471f8d71ee75ac3b5f3a','淄博市','',NULL,NULL),('4be3e0a560a2486eae928b44110e971e','白城','baicheng','0031601',1,'857be71b0d6d4a40a2c83476824206d1','白城市','',NULL,NULL),('4c5dbcb293bf40f8837c0acec1ad67eb','佳木斯','jiamusi','0031307',7,'b2d4133b5dbf4599ada940620d2ab250','佳木斯市','',NULL,NULL),('4cee922697a64ec78de69210e8e40af1','昌都','changdu','0032702',2,'3e846b08dbbe495e93bc93f8f202de79','昌都','',NULL,NULL),('50b42656af3f4068984fa042e81d7d22','威海','weihai','0030313',13,'10f46a521ea0471f8d71ee75ac3b5f3a','威海市','',NULL,NULL),('510607a1836e4079b3103e14ec5864ed','云南','yunnan','00329',29,'1','云南省','',NULL,NULL),('512a316326984ed8aa32d7f610b7604f','玉树','yushu','0032208',8,'5a80e3435c0e4dc09bafceeadb38e5f0','玉树','',NULL,NULL),('51f23688604848809184ec828f89cfca','嘉兴','jiaxing','0033003',3,'6d846178376549ed878d11d109819f25','嘉兴市','',NULL,NULL),('5259c4093aa84f7c88a367685581fbc6','门头沟区','mentougouqu','0030107',7,'12a62a3e5bed44bba0412b7e6b733c93','门头沟区','',NULL,NULL),('52630830669149edba48a7bb9b06e297','中卫','zhongwei','0032106',6,'5690b0534fe745e5ba0f504f0c260559','中卫市','',NULL,NULL),('534850c72ceb4a57b7dc269da63c330a','陕西','shanxi','00324',24,'1','陕西省','',NULL,NULL),('537974fdf5f54b8f99452bb8a03cf37b','厦门','xiamen','0030508',8,'d4066f6f425a4894a77f49f539f2a34f','厦门市','',NULL,NULL),('53ca3f5aede8420b835b38bbc542da81','松源','songyuan','0031607',7,'857be71b0d6d4a40a2c83476824206d1','松源市','',NULL,NULL),('558d920174014b4cb5a0c8f518b5819b','东城区','dongchengqu','0030101',1,'12a62a3e5bed44bba0412b7e6b733c93','东城区','',NULL,NULL),('56103b0e83a44d07a6025061fab4cebc','运城','yuncheng','0032311',11,'023473e9e6204583a110531036357514','运城市','',NULL,NULL),('5690b0534fe745e5ba0f504f0c260559','宁夏','ningxia','00321',21,'1','宁夏','',NULL,NULL),('576fa3bd7d294f61af1315e95f70d44c','九龙坡区','jiulongpoqu','0033107',7,'1c85fbd06cf840d093f3640aca1b6b2d','九龙坡区','',NULL,NULL),('577405ff648240959b3765c950598ab0','江苏','jiangsu','00317',17,'1','江苏省','',NULL,NULL),('58ed29aefce044339ecf067f514c43cb','宁德','ningde','0030504',4,'d4066f6f425a4894a77f49f539f2a34f','宁德市','',NULL,NULL),('5908fbf750a347b8a6b82af7778bb866','商洛','shangluo','0032404',4,'534850c72ceb4a57b7dc269da63c330a','商洛市','',NULL,NULL),('592f6fcf45a74524aa8ea853fc9761d5','贵州','guizhou','00309',9,'1','贵州省','',NULL,NULL),('59dbb93b007d44a6ae97744ac14e642c','龙岩','longyan','0030502',2,'d4066f6f425a4894a77f49f539f2a34f','龙岩市','',NULL,NULL),('5a80e3435c0e4dc09bafceeadb38e5f0','青海','qinghai','00322',22,'1','青海','',NULL,NULL),('5b5747166f714882b5cdfbeb7856f965','周口','zhoukou','0031217',17,'7336944efb4b40fcae9118fc9a970d2d','周口市','',NULL,NULL),('5c89402bd4a34028b9c61d4f7ebb7876','其它','Other','00407',7,'6d30b170d4e348e585f113d14a4dd96d','其它','','','no'),('5c91965168eb4deaab99266bbb4b64e1','朝阳','chaoyang','0031903',3,'b3366626c66c4b61881f09e1722e8495','朝阳市','',NULL,NULL),('5d2d367b0aee49449e65d0dd7601ee29','巴中','bazhong','0032502',2,'d3538add7125404aba4b0007ef9fde50','巴中市','',NULL,NULL),('5ddde49610d4433eb157897d01ba6838','东莞','dongguan','0030702',2,'0dd1f40bcb9d46aeba015dc19645a5b9','东莞市','',NULL,NULL),('5e85d09db1054472bcca22d82da6ec5d','乐山','leshan','0032509',9,'d3538add7125404aba4b0007ef9fde50','乐山市','',NULL,NULL),('603fe04b11704a0eb7e20b97c008c5f5','行政审批','xingzheng','00102',2,'act001','行政审批','','','yes'),('60c96ec0debf4cc4bf5974c93d4f638c','阳泉','yangquan','0032310',10,'023473e9e6204583a110531036357514','阳泉市','',NULL,NULL),('61c3711334fe44b0806e717e6fb238b0','滨海新区','binhaixinqu','0032613',13,'2c254799d3454f2cbc338ef5712548e9','滨海新区','',NULL,NULL),('6214f40ad2704fb6af0ded59420ca958','安康','ankang','0032401',1,'534850c72ceb4a57b7dc269da63c330a','安康市','',NULL,NULL),('62ed6854726c4674ae2f5b676ddec7fb','新乡','xinxiang','0031213',13,'7336944efb4b40fcae9118fc9a970d2d','新乡市','',NULL,NULL),('6303e3eeffb441018044b039063e3f96','丹东','dandong','0031905',5,'b3366626c66c4b61881f09e1722e8495','丹东市','',NULL,NULL),('644316de71f942f9a90eb1f810eca872','怀柔区','huairouqu','0030113',13,'12a62a3e5bed44bba0412b7e6b733c93','怀柔区','',NULL,NULL),('64a03236dd084d09ada9a1ca22b3815f','长春','changchun','0031603',3,'857be71b0d6d4a40a2c83476824206d1','长春市','',NULL,NULL),('65629a05de764a19b66b752726f5cdbd','海淀区','haidianqu','0030106',6,'12a62a3e5bed44bba0412b7e6b733c93','海淀区','',NULL,NULL),('6567a081f5d142779e17edbda3da9a04','宁波','ningbo','0033006',6,'6d846178376549ed878d11d109819f25','宁波市','',NULL,NULL),('6624ad3b318149f3a8ee5beef1b8b38f','肇庆','zhaoqing','0030719',19,'0dd1f40bcb9d46aeba015dc19645a5b9','肇庆市','',NULL,NULL),('674ec37e9641450dadc9798df10c58bc','静安区','jinganqu','0030204',4,'f1ea30ddef1340609c35c88fb2919bee','静安区','','',NULL),('67cba9a4ca4c4c38ac3ba2c21dd191e6','南昌','nanchang','0031806',6,'cb3008cbd6ae4b5f8cebd2254ccb8603','南昌市','',NULL,NULL),('68a8f7a8337141d3a092fadfd2457970','鸡西','jixi','0031306',6,'b2d4133b5dbf4599ada940620d2ab250','鸡西市','',NULL,NULL),('6932b6b7b5124bef8385fb8e5b5c2568','通化','tonghua','0031608',8,'857be71b0d6d4a40a2c83476824206d1','通化市','',NULL,NULL),('694348f8e1c0444e8e0b2c2caf4de1a6','榆林','yulin','0032410',10,'534850c72ceb4a57b7dc269da63c330a','榆林市','',NULL,NULL),('697141b58ada46518bc8ec0cc3d64b31','博州','bozhou','032804',4,'2fabed91c6d94e698ed449165cd250ca','博州','',NULL,NULL),('69ba7746763049d4a97de39a8d9db697','年假','annual leave','00406',6,'6d30b170d4e348e585f113d14a4dd96d','年假','','','no'),('6a2226c73bc745faa6973dd3af3e274a','吐鲁番','tulufan','0032811',11,'2fabed91c6d94e698ed449165cd250ca','吐鲁番','',NULL,NULL),('6b2b1d55b06b44cd8a487d327397b69b','徐汇区','xuhuiqu','0030202',2,'f1ea30ddef1340609c35c88fb2919bee','徐汇区','',NULL,NULL),('6d1e9b9c9c334448878312d589eeaeac','荣昌区','rongchangqu','0033123',23,'1c85fbd06cf840d093f3640aca1b6b2d','荣昌区','',NULL,NULL),('6d30b170d4e348e585f113d14a4dd96d','请假类型','Type of ask for leave','004',4,'0','请假类型','','','yes'),('6d846178376549ed878d11d109819f25','浙江','zhejiang','00330',30,'1','浙江省','',NULL,NULL),('6daab50a4a1048f993f348a66dcfa83d','喀什','kashi','0032807',7,'2fabed91c6d94e698ed449165cd250ca','喀什','',NULL,NULL),('6dc38f66c86a4f32ac9d585e668c110e','怒江','nujiang','0032911',11,'510607a1836e4079b3103e14ec5864ed','怒江','',NULL,NULL),('6e1f1c6d82704e5cadcd0bc8ef2ab79f','昆明','kunming','0032908',8,'510607a1836e4079b3103e14ec5864ed','昆明','',NULL,NULL),('6e639147d90943c38490cafe223985ce','梅州','meizhou','0030710',10,'0dd1f40bcb9d46aeba015dc19645a5b9','梅州市','',NULL,NULL),('6e67518f1da44dbaa8cf95920779f188','汕尾','shanwei','0030713',13,'0dd1f40bcb9d46aeba015dc19645a5b9','汕尾市','',NULL,NULL),('6eaa823330da42b6b5783e389707853c','四平','siping','0031606',6,'857be71b0d6d4a40a2c83476824206d1','四平市','',NULL,NULL),('6ecc40e527404bba89207cc158ef3994','河源','heyuan','0030705',5,'0dd1f40bcb9d46aeba015dc19645a5b9','河源市','',NULL,NULL),('6ee20f02066e43a29f10ca6dbd0b7c71','普陀区','putuoqu','0030205',5,'f1ea30ddef1340609c35c88fb2919bee','普陀区','',NULL,NULL),('6f5749ab2b5d4cbea1655e9a5197096d','湛江','zhanjiang','0030718',18,'0dd1f40bcb9d46aeba015dc19645a5b9','湛江市','',NULL,NULL),('6f8c18c8b3a54bc287c1dfc5642be577','三明','sanming','0030507',7,'d4066f6f425a4894a77f49f539f2a34f','三明市','',NULL,NULL),('6f9601270aca46519e7f8836e0d2446c','广元','guangyuan','0032508',8,'d3538add7125404aba4b0007ef9fde50','广元市','',NULL,NULL),('6fd083505ab24086b234c032dab3c2a7','海口','haikou','0031001',1,'2ba8e6d0fd944983aa19b781c6b53477','海口市','',NULL,NULL),('70733399b60d4b058c255fa9fff2eee0','莆田','putian','0030505',5,'d4066f6f425a4894a77f49f539f2a34f','莆田市','',NULL,NULL),('70c1525174a04767865d0e6b7ed01f5a','七台河','qitaihe','0031309',9,'b2d4133b5dbf4599ada940620d2ab250','七台河市','',NULL,NULL),('70c41ec5cb9e4aec98bd2357702c4082','江门','jiangmen','0030707',7,'0dd1f40bcb9d46aeba015dc19645a5b9','江门市','',NULL,NULL),('715a834c60734d498ec6043eaa1c0f12','产假','maternity leave','00403',3,'6d30b170d4e348e585f113d14a4dd96d','产假','','','no'),('71aba068cd5b4588a03be75e2e49f496','鄂州','ezhou','0031401',1,'312b80775e104ba08c8244a042a658df','鄂州市','',NULL,NULL),('7336944efb4b40fcae9118fc9a970d2d','河南','henan','00312',12,'1','河南省','',NULL,NULL),('748623f3282b4ca7ace0e73303327310','巴南区','bananqu','0033113',13,'1c85fbd06cf840d093f3640aca1b6b2d','巴南区','',NULL,NULL),('74d2aaddaf294355b01970d52e303a1a','资阳','ziyang','0032519',19,'d3538add7125404aba4b0007ef9fde50','资阳市','',NULL,NULL),('75362368f22f4d60a810c2a45cced487','河北','hebei','00311',11,'1','河北省','',NULL,NULL),('755e2d15540c49dbad6be564f694a4af','曲靖','qujing','0032913',13,'510607a1836e4079b3103e14ec5864ed','曲靖','',NULL,NULL),('75b889c8e86c4d518a1fb74b089ceae8','攀枝花','panzhihua','0032515',15,'d3538add7125404aba4b0007ef9fde50','攀枝花市','',NULL,NULL),('75e0334ad60b41a1b42ae6724b06c874','镇江','zhenjiang','0031713',13,'577405ff648240959b3765c950598ab0','镇江市','',NULL,NULL),('762bc3b1443e4ea98ab051b4007c0238','邢台','xingtai','0031110',10,'75362368f22f4d60a810c2a45cced487','邢台市','',NULL,NULL),('76d023f160e448c8bcb78598bf246a44','黔南','qiannan','0030906',6,'592f6fcf45a74524aa8ea853fc9761d5','黔南市','',NULL,NULL),('773cb4f25b9d4ebcba2953570da776c9','吴忠','wuzhong','0032104',4,'5690b0534fe745e5ba0f504f0c260559','吴忠市','',NULL,NULL),('776b55acb6804296a00c9f97723633ba','舟山','zhoushan','0033011',11,'6d846178376549ed878d11d109819f25','舟山市','',NULL,NULL),('79b98f7f0c054fa0ab2a3a2cb75d1b87','邵阳','shaoyang','0031505',5,'c59f91630bef4289b71fcb2a48994582','邵阳市','',NULL,NULL),('7a8097646dc8419284201db66dd6eda1','芜湖','wuhu','0030416',16,'249999f296d14f95b8138a30bbb2c374','芜湖市','',NULL,NULL),('7ab1618b70354ee2ab49e8fd5cbca27f','哈密','hami','0032806',6,'2fabed91c6d94e698ed449165cd250ca','哈密','',NULL,NULL),('7bed9f7f137e4048bbfd0d564283312d','日照','rizhao','0030311',11,'10f46a521ea0471f8d71ee75ac3b5f3a','日照市','',NULL,NULL),('7c034f9f019440b9a29f44576e5ac4e9','测试流程标识','test process identification','Key_test',3,'act002','test',NULL,NULL,'no'),('7c6addc8becd4e759479228f6dd38bb2','通辽','tongliao','0032008',8,'c072c248c7ab47dda7bf24f5e577925c','通辽市','',NULL,NULL),('7f69cfd9e1ae4c92b4ddf13b9f78cb6c','保山','baoshan','0032902',2,'510607a1836e4079b3103e14ec5864ed','保山','',NULL,NULL),('802ef5c62bbb47e3a026e3c92989f53e','临夏','linxia','0030608',8,'3283f1a77180495f9a0b192d0f9cdd35','临夏市','',NULL,NULL),('8114568fa8a34c6e878ff13d5ba59006','齐齐哈尔','qiqihaer','0031310',10,'b2d4133b5dbf4599ada940620d2ab250','齐齐哈尔市','',NULL,NULL),('8127fbeb13a44c3284dfa8e2326ce19a','茂名','maoming','0030709',9,'0dd1f40bcb9d46aeba015dc19645a5b9','茂名市','',NULL,NULL),('813ff1376c0445c6a64b9f00452c2427','成都','chengdu','0032503',3,'d3538add7125404aba4b0007ef9fde50','成都市','',NULL,NULL),('81443e6b687349c6ae3231aff5e038ba','铜陵','tongling','0030415',15,'249999f296d14f95b8138a30bbb2c374','铜陵市','',NULL,NULL),('8170c3271bc840d78e92ed355851aa5e','西城区','xichengqu','0030102',2,'12a62a3e5bed44bba0412b7e6b733c93','西城区','',NULL,NULL),('8346ebddc2464a9bbb99f7b0794da39c','韶关','shaoguan','0030714',14,'0dd1f40bcb9d46aeba015dc19645a5b9','韶关市','',NULL,NULL),('8362c89358c748a5907b44de500a1333','泰州','taizhou','0031708',8,'577405ff648240959b3765c950598ab0','泰州市','',NULL,NULL),('83e9fbd9e7fa4d878575088df7798b5e','泸州','luzhou','0032510',10,'d3538add7125404aba4b0007ef9fde50','泸州市','',NULL,NULL),('857be71b0d6d4a40a2c83476824206d1','吉林','jilin','00316',16,'1','吉林省','',NULL,NULL),('85b8accc31b34d70bce548a9d42767dd','汉中','hanzhong','0032403',3,'534850c72ceb4a57b7dc269da63c330a','汉中市','',NULL,NULL),('85c0cb3849bc4d79b9c2fa2b63b2c858','福州','fuzhou','0030501',1,'d4066f6f425a4894a77f49f539f2a34f','福州市','',NULL,NULL),('85da31513d984f3e8a179b764efb3a22','太原','taiyuan','0032308',8,'023473e9e6204583a110531036357514','太原市','',NULL,NULL),('863205a0ac1d4c50b19bb79f602dbea7','张家口','zhangjiakou','0031111',11,'75362368f22f4d60a810c2a45cced487','张家口市','',NULL,NULL),('8636d6e9bdb34510bcb528159ca4f29d','辽源','liaoyuan','0031605',5,'857be71b0d6d4a40a2c83476824206d1','辽源市','',NULL,NULL),('866bf0b4a8cc41dfb5071f8edb271934','佛山','foshan','0030703',3,'0dd1f40bcb9d46aeba015dc19645a5b9','佛山市','',NULL,NULL),('86b85d3d8ddc4632946bdc4cdf642504','虹口区','hongkouqu','0030206',6,'f1ea30ddef1340609c35c88fb2919bee','虹口区','',NULL,NULL),('86f8ddfe6f744d8186b5fea32aac64c4','测试审批','test','00103',3,'act001','test',NULL,NULL,'no'),('871c4e3b4a044b2e8235d731835db559','酒泉','jiuquan','0030606',6,'3283f1a77180495f9a0b192d0f9cdd35','酒泉市','',NULL,NULL),('87563959aa914187a0b5af82f862a0f0','金昌','jinchang','0030605',5,'3283f1a77180495f9a0b192d0f9cdd35','金昌市','',NULL,NULL),('87ca58986beb4c58a877953e56486538','婚假','Marriage holiday','00402',2,'6d30b170d4e348e585f113d14a4dd96d','婚假','','','no'),('886a63c7def64cdfad1cfc0a2de8a1e0','崇左','chongzuo','0030803',3,'c5f3d426c582410281f89f1451e1d854','崇左市','',NULL,NULL),('89341f9a48444d258609e87cf40604fa','伊犁州直','yilizhouzhi','0032813',13,'2fabed91c6d94e698ed449165cd250ca','伊犁州直','',NULL,NULL),('89461222215e40f7b8067c7b791a9c2c','南平','nanping','0030503',3,'d4066f6f425a4894a77f49f539f2a34f','南平市','',NULL,NULL),('895262136b904f4888aa5af2f89dc967','洛阳','luoyang','0031206',6,'7336944efb4b40fcae9118fc9a970d2d','洛阳市','',NULL,NULL),('896bce499bd740ffb9f745a4782a7886','青浦区','qingpuqu','0030214',14,'f1ea30ddef1340609c35c88fb2919bee','青浦区','',NULL,NULL),('8a7265e11f0141ba808c0410b76d415b','临沂','linyi','0030309',9,'10f46a521ea0471f8d71ee75ac3b5f3a','临沂市','',NULL,NULL),('8a79e7d2af7244b0b543492374ec6549','兴安盟','xinganmeng','0032012',12,'c072c248c7ab47dda7bf24f5e577925c','兴安盟','',NULL,NULL),('8abbfbb071f34df4b77e2828f53ef99b','怀化','huaihua','0031512',12,'c59f91630bef4289b71fcb2a48994582','怀化市','',NULL,NULL),('8af40c23c6fe4ed8819dbe99f1f125f0','奉贤区','fengxianqu','0030215',15,'f1ea30ddef1340609c35c88fb2919bee','奉贤区','',NULL,NULL),('8b336fb55c2346a2b5ec13f578c627ef','苏州','suzhou','0031706',6,'577405ff648240959b3765c950598ab0','苏州市','',NULL,NULL),('8b5512281c364e09a67d8e81a5bd7ce9','南川区','nanchuanqu','0033119',19,'1c85fbd06cf840d093f3640aca1b6b2d','南川区','',NULL,NULL),('8b95528d20c44f86adf1e64009ce317b','贵阳','guiyang','0030903',3,'592f6fcf45a74524aa8ea853fc9761d5','贵阳市','',NULL,NULL),('8bfd173e34704a7f978c539f87a511a8','宝山区','baoshanqu','0030209',9,'f1ea30ddef1340609c35c88fb2919bee','宝山区','',NULL,NULL),('8c64bc307e894223a429a4f50a0cd387','唐山','tangshan','0031109',9,'75362368f22f4d60a810c2a45cced487','唐山市','',NULL,NULL),('8d10532fba444c66bead45a6d9e13b6a','延庆区','yanqingqu','0030116',16,'12a62a3e5bed44bba0412b7e6b733c93','延庆区','',NULL,NULL),('8e35c978f8b248cb93863818be6be56b','大足区','dazuqu','0033111',11,'1c85fbd06cf840d093f3640aca1b6b2d','大足区','',NULL,NULL),('8f617ff8e61c49689cb26540a618a80c','宁河区','ninghequ','0032614',14,'2c254799d3454f2cbc338ef5712548e9','宁河区','',NULL,NULL),('8fa97a231db54e879ece49d566f0561d','天门','tianmen','0031410',10,'312b80775e104ba08c8244a042a658df','天门市','',NULL,NULL),('9068c4ec7d1a4de69339fb61654cb3d9','温州','wenzhou','0033010',10,'6d846178376549ed878d11d109819f25','温州市','',NULL,NULL),('921a9e3d2c434cca943aca4f3e5087b5','渝中区','yuzhongqu','0033103',3,'1c85fbd06cf840d093f3640aca1b6b2d','渝中区','',NULL,NULL),('923ca61a8fdb4357a5220763fdbd7c37','台州','taizhou','0033009',9,'6d846178376549ed878d11d109819f25','台州市','',NULL,NULL),('92800c5b33df4f15a689ceda6bd23f2b','信阳','xinyang','0031214',14,'7336944efb4b40fcae9118fc9a970d2d','信阳市','',NULL,NULL),('9381ab9da4b64001b289252ee21d1157','河东区','hedongqu','0032602',2,'2c254799d3454f2cbc338ef5712548e9','河东区','',NULL,NULL),('95a7fd77484f4ef39e9ed4596556a93c','海西','haixi','0032205',5,'5a80e3435c0e4dc09bafceeadb38e5f0','海西','',NULL,NULL),('9795de38301642539aefda61adf595a4','江津区','jiangjinqu','0033116',16,'1c85fbd06cf840d093f3640aca1b6b2d','江津区','',NULL,NULL),('97c543ee46e84586998554f5f745fcc6','杨浦区','yangpuqu','0030207',7,'f1ea30ddef1340609c35c88fb2919bee','杨浦区','',NULL,NULL),('983eaae633244ecea99d11a804b1c736','万州区','wanzhouqu','0033101',1,'1c85fbd06cf840d093f3640aca1b6b2d','万州区','',NULL,NULL),('9a7465597dda46c8bb4c5c98aabfb4b9','阳江','yangjiang','0030716',16,'0dd1f40bcb9d46aeba015dc19645a5b9','阳江市','',NULL,NULL),('9b483ad27bc14af2a47d8facdf8fafca','嘉峪关','jiayuguan','0030604',4,'3283f1a77180495f9a0b192d0f9cdd35','嘉峪关市','',NULL,NULL),('9bb5220b50dd4def87ffbf6444a28c58','黄浦区','huangpuqu','0030201',1,'f1ea30ddef1340609c35c88fb2919bee','黄浦区','',NULL,NULL),('9c8a7d5f3423458eb9e6ef68f6185fca','黄山','huangshan','0030411',11,'249999f296d14f95b8138a30bbb2c374','黄山市','',NULL,NULL),('9d9700b28ae347bca4db9f592c78eb02','百色','baise','0030801',1,'c5f3d426c582410281f89f1451e1d854','百色市','',NULL,NULL),('9e4d7c5d9d86458d8c8d8a644e7eec9a','阿拉善盟','alashanmeng','0032001',1,'c072c248c7ab47dda7bf24f5e577925c','阿拉善盟','',NULL,NULL),('9e833df814a74d1690f8039782ddf914','昭通','zhaotong','0032916',16,'510607a1836e4079b3103e14ec5864ed','昭通','',NULL,NULL),('9e9d0ad23c9e45df9dd9c269c0e4fdfa','昌平区','changpingqu','0030111',11,'12a62a3e5bed44bba0412b7e6b733c93','昌平区','',NULL,NULL),('9fc24347a7ca4a34bdea408dad223348','闵行区','minhangqu','0030208',8,'f1ea30ddef1340609c35c88fb2919bee','闵行区','',NULL,NULL),('a013e3db1b384beb843959c33f361203','静海区','jinghaiqu','0032615',15,'2c254799d3454f2cbc338ef5712548e9','静海区','',NULL,NULL),('a0d5b55e48c945faad1d7bb624de7de8','九江','jiujiang','0031805',5,'cb3008cbd6ae4b5f8cebd2254ccb8603','九江市','',NULL,NULL),('a165da9b81b940fe9764fc7f5d41232d','银川','yinchuan','0032105',5,'5690b0534fe745e5ba0f504f0c260559','银川市','',NULL,NULL),('a268c4b698274f12a64ba48db568d057','潮州','chaozhou','0030701',1,'0dd1f40bcb9d46aeba015dc19645a5b9','潮州市','',NULL,NULL),('a34815cb348d4598a6fac4ece3baa0cd','衡阳','hengyang','0031504',4,'c59f91630bef4289b71fcb2a48994582','衡阳市','',NULL,NULL),('a39af97e7ad04ebfb530f49b05c7b146','阜阳','fuyang','0030407',7,'249999f296d14f95b8138a30bbb2c374','阜阳市','',NULL,NULL),('a405680276e645188a122e8933f77a38','乌兰察布','wulanchabu','0032010',10,'c072c248c7ab47dda7bf24f5e577925c','乌兰察布市','',NULL,NULL),('a46bb0749dac4627b9a7d465dc75aca5','武汉','wuhan','0031411',11,'312b80775e104ba08c8244a042a658df','武汉市','',NULL,NULL),('a4d4d8f678dd4dba958f466bbc581c5f','菏泽','heze','0030305',5,'10f46a521ea0471f8d71ee75ac3b5f3a','菏泽市','',NULL,NULL),('a6898561d8664f6dad7a32f63ab64e19','铁岭','tieling','0031913',13,'b3366626c66c4b61881f09e1722e8495','铁岭市','',NULL,NULL),('a76ed518fb584442aaf1769fd2583677','兰州','lanzhou','0030607',7,'3283f1a77180495f9a0b192d0f9cdd35','兰州市','',NULL,NULL),('a7d500ab05844c45b839f4a30c1d7643','宜昌','yichang','0031416',16,'312b80775e104ba08c8244a042a658df','宜昌市','',NULL,NULL),('a9093795a013403e869a4308f17c7588','海东','haidong','0032203',3,'5a80e3435c0e4dc09bafceeadb38e5f0','海东','',NULL,NULL),('aa4b703a13dc4116bea578295efd9ea0','赤峰','chifeng','0032004',4,'c072c248c7ab47dda7bf24f5e577925c','赤峰市','',NULL,NULL),('aab8d56a03de4bbc84d433bc24748730','贺州','hezhou','0030808',8,'c5f3d426c582410281f89f1451e1d854','贺州市','',NULL,NULL),('ac1aa3c1b928467ebfa261cfaeb77be9','葫芦岛','huludao','0031908',8,'b3366626c66c4b61881f09e1722e8495','葫芦岛市','',NULL,NULL),('ac23d537ccd64827ab44007c5503bd58','安阳','anyang','0031201',1,'7336944efb4b40fcae9118fc9a970d2d','安阳市','',NULL,NULL),('acd9f9b8fb8a4e47bd1e5d4eea45809c','滁州','chuzhou','0030406',6,'249999f296d14f95b8138a30bbb2c374','滁州市','',NULL,NULL),('acf5c250d6614fb9920e442a3b178b86','东营','dongying','0030304',4,'10f46a521ea0471f8d71ee75ac3b5f3a','东营市','',NULL,NULL),('act001','工作流分类','CATEGORY','001',1,'0','工作流分类','','','yes'),('act002','工作流标识','KEY_','002',2,'0','工作流标识','','','yes'),('adfac2a66ce04767bdbabbd8c115cd5d','黄南','huangnan','0032206',6,'5a80e3435c0e4dc09bafceeadb38e5f0','黄南','',NULL,NULL),('ae2c4a00360442f29ce8b0c284525ded','崇明县','chongmingxian','0030216',16,'f1ea30ddef1340609c35c88fb2919bee','崇明县','',NULL,NULL),('ae384d9313e448949c8ed9c565e5cade','扬州','yangzhou','0031712',12,'577405ff648240959b3765c950598ab0','扬州市','',NULL,NULL),('affc6a796b524efdb006bd1730003df7','西青区','xiqingqu','0032608',8,'2c254799d3454f2cbc338ef5712548e9','西青区','',NULL,NULL),('b0251d85679b40dca30ee83af80838bb','拉萨','lasa','0032703',3,'3e846b08dbbe495e93bc93f8f202de79','拉萨市','',NULL,NULL),('b041a523ae214f03969454aa8c180ced','房山区','fangshanqu','0030108',8,'12a62a3e5bed44bba0412b7e6b733c93','房山区','',NULL,NULL),('b08ccea3cf89458e97b346546221e4ae','凉山','liangshan','0032102',2,'5690b0534fe745e5ba0f504f0c260559','凉山市','',NULL,NULL),('b1d50a7eb21f44389733e17831fd121d','盘锦','panjin','0031911',11,'b3366626c66c4b61881f09e1722e8495','盘锦市','',NULL,NULL),('b20bb3345c6f459ba5f565e749636716','事假','Compassionate leave','00401',1,'6d30b170d4e348e585f113d14a4dd96d','事假','','','no'),('b21a81793ca6459f97c246ccbd543c67','张掖','zhangye','0030614',14,'3283f1a77180495f9a0b192d0f9cdd35','张掖市','',NULL,NULL),('b2356bf7a1d546709ac296de1bf2a9eb','连云港','lianyungang','0031703',3,'577405ff648240959b3765c950598ab0','连云港市','',NULL,NULL),('b2409f9c928f4dd1bd224809f54a1225','宝坻区','baodiqu','0032612',12,'2c254799d3454f2cbc338ef5712548e9','宝坻区','',NULL,NULL),('b2d4133b5dbf4599ada940620d2ab250','黑龙江','heilongjiang','00313',13,'1','黑龙江省','',NULL,NULL),('b3221428d30249d8acbb40f0f38d7a5c','南宁','nanning','0030811',11,'c5f3d426c582410281f89f1451e1d854','南宁市','',NULL,NULL),('b3366626c66c4b61881f09e1722e8495','辽宁','liaoning','00319',19,'1','辽宁省','',NULL,NULL),('b38f0725533a47cea5d0f5f520ad72c7','沙坪坝区','shapingbaqu','0033106',6,'1c85fbd06cf840d093f3640aca1b6b2d','沙坪坝区','',NULL,NULL),('b4736703fc064dbe8b8440c79991a1ed','大连','dalian','0031904',4,'b3366626c66c4b61881f09e1722e8495','大连市','',NULL,NULL),('b5329030086d470fa8cf6b38aaafb320','随州','suizhou','0031409',9,'312b80775e104ba08c8244a042a658df','随州市','',NULL,NULL),('b68e669c229945ae86e053d15c277a6a','惠州','huizhou','0030706',6,'0dd1f40bcb9d46aeba015dc19645a5b9','惠州市','',NULL,NULL),('b7785f96730e4a35820e08da1c200c4d','璧山区','bishanqu','0033120',20,'1c85fbd06cf840d093f3640aca1b6b2d','璧山区','',NULL,NULL),('b84acd830f3b4c65bd82c97cc925badf','自贡','zigong','0032520',20,'d3538add7125404aba4b0007ef9fde50','自贡市','',NULL,NULL),('b8e203af46924284a9a8be9851a557a2','南开区','nankaiqu','0032604',4,'2c254799d3454f2cbc338ef5712548e9','南开区','',NULL,NULL),('b908e46ac1544cb6a26f1e1fb22f2a94','宜宾','yibin','0032518',18,'d3538add7125404aba4b0007ef9fde50','宜宾市','',NULL,NULL),('b9c02b885a4a49719b1000110ed47df4','毕节','bijie','0030902',2,'592f6fcf45a74524aa8ea853fc9761d5','毕节市','',NULL,NULL),('ba821dcfd50d4f64af1cd3eecc5f54e0','海北','haibei','0032202',2,'5a80e3435c0e4dc09bafceeadb38e5f0','海北','',NULL,NULL),('bbf9ff3b0fa444f18d70f2a4a9e45609','绵阳','mianyang','0032512',12,'d3538add7125404aba4b0007ef9fde50','绵阳市','',NULL,NULL),('bc2ec49f78204ea29cd666e2dc6583a2','临沧','lincang','0032910',10,'510607a1836e4079b3103e14ec5864ed','临沧','',NULL,NULL),('bc97087ea25547a794cec553d03c1abc','那曲','naqu','0032705',5,'3e846b08dbbe495e93bc93f8f202de79','那曲','',NULL,NULL),('bd1efd2194724213b72efa91fe3d5ddc','浦东新区','pudongxinqu','0030211',11,'f1ea30ddef1340609c35c88fb2919bee','浦东新区','',NULL,NULL),('bdb65b22a7c447dcadbc6328292e5aef','中山','zhongshan','0030720',20,'0dd1f40bcb9d46aeba015dc19645a5b9','中山市','',NULL,NULL),('bdce443b39ba4cef8c0c0b75bdc8e253','沈阳','shenyang','0031912',12,'b3366626c66c4b61881f09e1722e8495','沈阳市','',NULL,NULL),('be33f1cad2954520bbf033e4198890f7','亳州','bozhou','0030403',3,'249999f296d14f95b8138a30bbb2c374','亳州市','',NULL,NULL),('be359cbd02944e1da5997ae560831db1','定西','dingxi','0030602',2,'3283f1a77180495f9a0b192d0f9cdd35','定西市','',NULL,NULL),('beaf0090ebf94ad9af5dd78e372611fe','咸阳','xianyang','0032408',8,'534850c72ceb4a57b7dc269da63c330a','咸阳市','',NULL,NULL),('bff8ba692e4c4d78a23309ec0ad745c7','桂林','guilin','0030806',6,'c5f3d426c582410281f89f1451e1d854','桂林市','',NULL,NULL),('c0170db89f2e48fe99bfdcd857fe2016','承德','chengde','0031103',3,'75362368f22f4d60a810c2a45cced487','承德市','',NULL,NULL),('c072c248c7ab47dda7bf24f5e577925c','内蒙古','neimenggu','00320',20,'1','内蒙古','',NULL,NULL),('c0e55c6a60564359859d87d25c249ac4','锦州','jinzhou','0031909',9,'b3366626c66c4b61881f09e1722e8495','锦州市','',NULL,NULL),('c1875ba50f6d4e61870be000be8ee78e','东丽区','dongliqu','0032607',7,'2c254799d3454f2cbc338ef5712548e9','东丽区','',NULL,NULL),('c22083b403ba4ea698ba4dfc7245a317','平凉','pingliang','0030610',10,'3283f1a77180495f9a0b192d0f9cdd35','平凉市','',NULL,NULL),('c256624d6caa49979ebc4dce35006945','武清区','wuqingqu','0032611',11,'2c254799d3454f2cbc338ef5712548e9','武清区','',NULL,NULL),('c2e0fca8943d41ba8ec5d013e9bc3f41','日喀则','rikaze','0032706',6,'3e846b08dbbe495e93bc93f8f202de79','日喀则','',NULL,NULL),('c3717fb4891148a0bef623dbd746e7e6','开封','kaifeng','0031205',5,'7336944efb4b40fcae9118fc9a970d2d','开封市','',NULL,NULL),('c4817fc49be444e491920112aa9a3e32','淮南','huainan','0030410',10,'249999f296d14f95b8138a30bbb2c374','淮南市','',NULL,NULL),('c59f91630bef4289b71fcb2a48994582','湖南','hunan','00315',15,'1','湖南省','',NULL,NULL),('c5f3d426c582410281f89f1451e1d854','广西','guangxi','00308',8,'1','广西省','',NULL,NULL),('c7852784049a473c917863c5bc84dd95','甘南','gannan','0030603',3,'3283f1a77180495f9a0b192d0f9cdd35','甘南市','',NULL,NULL),('c7a5ba87961742f3b242ee4d30a55921','营口','yingkou','0031914',14,'b3366626c66c4b61881f09e1722e8495','营口市','',NULL,NULL),('c8342c1dcf584cbf92f20d90a62a34bf','平顶山','pingdingshan','0031209',9,'7336944efb4b40fcae9118fc9a970d2d','平顶山市','',NULL,NULL),('c8d4119e57f84e71815769f03935e471','黔东南','qiandongnan','0030905',5,'592f6fcf45a74524aa8ea853fc9761d5','黔东南市','',NULL,NULL),('c928e9192e2f4f5ca06c6599371ff83c','六安','lu\'an','0030412',12,'249999f296d14f95b8138a30bbb2c374','六安市','',NULL,NULL),('c9811aef284b4ae8b8bf7698e90d8b3b','泉州','quanzhou','0030506',6,'d4066f6f425a4894a77f49f539f2a34f','泉州市','',NULL,NULL),('c9df1fd73d0642eea8b050738f6ed9fa','聊城','liaocheng','0030308',8,'10f46a521ea0471f8d71ee75ac3b5f3a','聊城市','',NULL,NULL),('ca2e3717bb734c4b9142f29e36a31989','株洲','zhuzhou','0031502',2,'c59f91630bef4289b71fcb2a48994582','株洲市','',NULL,NULL),('cabe896dba3a4a21ba194f8839a3eb98','大渡口区','dadukouqu','0033104',4,'1c85fbd06cf840d093f3640aca1b6b2d','大渡口区','',NULL,NULL),('caeba09845bf4a29960a840d4f436f09','上饶','shangrao','0031808',8,'cb3008cbd6ae4b5f8cebd2254ccb8603','上饶市','',NULL,NULL),('cb3008cbd6ae4b5f8cebd2254ccb8603','江西','jiangxi','00318',18,'1','江西省','',NULL,NULL),('cc2aaa3ed3904d66a2f79676b14a1b49','黔江区','qianjiangqu','0033114',14,'1c85fbd06cf840d093f3640aca1b6b2d','黔江区','',NULL,NULL),('cd66a360619847d2b17989643f03dc8f','济宁','jining','0030306',6,'10f46a521ea0471f8d71ee75ac3b5f3a','济宁市','',NULL,NULL),('cd87ffcb742744d18bbce6928922a5be','衡州','hengzhou','0033007',7,'6d846178376549ed878d11d109819f25','衡州市','',NULL,NULL),('cdc1df5961994a9d94751003edd0fc58','宿州','suzhou','0030414',14,'249999f296d14f95b8138a30bbb2c374','宿州市','',NULL,NULL),('cddd155314404710bd1ab3fa51d80cf2','天水','tianshui','0030612',12,'3283f1a77180495f9a0b192d0f9cdd35','天水市','',NULL,NULL),('ce0dcc5a66dd44b3b9a42aef4aa8b4ba','蚌埠','bengbu','0030402',2,'249999f296d14f95b8138a30bbb2c374','蚌埠市','',NULL,NULL),('cf632a4f4de54b619ad5cb6835f35434','玉林','yulin','0030814',14,'c5f3d426c582410281f89f1451e1d854','玉林市','',NULL,NULL),('cf7d29feb2c34cbfaf4e28896ca577e4','巴彦淖尔','bayannaoer','0032002',2,'c072c248c7ab47dda7bf24f5e577925c','巴彦淖尔','',NULL,NULL),('cfb2df83812d4fabb10ba91e98be9467','黑河','heihe','0031305',5,'b2d4133b5dbf4599ada940620d2ab250','黑河市','',NULL,NULL),('cfee5c9833664e0aba76267389e4adbd','丰台区','fengtaiqu','0030104',4,'12a62a3e5bed44bba0412b7e6b733c93','丰台区','',NULL,NULL),('d13b01a607e34fdfa16deb7292a0f299','鹤壁','hebi','0031202',2,'7336944efb4b40fcae9118fc9a970d2d','鹤壁市','',NULL,NULL),('d1646344b9cc45018c3a347f6dc6c77b','红桥区','hongqiaoqu','0032606',6,'2c254799d3454f2cbc338ef5712548e9','红桥区','',NULL,NULL),('d26fc248d49c4a71b2a003033adc88de','娄底','loudi','0031513',13,'c59f91630bef4289b71fcb2a48994582','娄底市','',NULL,NULL),('d3538add7125404aba4b0007ef9fde50','四川','sichuan','00325',25,'1','四川省','',NULL,NULL),('d3c2d3b9184b4e3185ca6bdbe73c5cff','襄樊','xiangfan','0031414',14,'312b80775e104ba08c8244a042a658df','襄樊市','',NULL,NULL),('d3c76818757942fba8ebf8246fa257a9','咸宁','xianning','0031413',13,'312b80775e104ba08c8244a042a658df','咸宁市','',NULL,NULL),('d4066f6f425a4894a77f49f539f2a34f','福建','fujian','00305',5,'1','福建省','',NULL,NULL),('d4131ecb91d3435db1dbd770ac39221f','鞍山','anshan','0031901',1,'b3366626c66c4b61881f09e1722e8495','鞍山市','',NULL,NULL),('d42e09432d10454caecf1d4335aca1da','合肥','hefei','0030408',8,'249999f296d14f95b8138a30bbb2c374','合肥市','',NULL,NULL),('d4f8ba23c3ef4fbaa00c8f8a7c047bf1','商丘','shangqiu','0031212',12,'7336944efb4b40fcae9118fc9a970d2d','商丘市','',NULL,NULL),('d5f5462779bc4976a3fbcbdeba45ed00','丽水','lishui','0033005',5,'6d846178376549ed878d11d109819f25','丽水市','',NULL,NULL),('d5f621c6fab44d1eab1bdafd9d08e042','绍兴','shaoxing','0033008',8,'6d846178376549ed878d11d109819f25','绍兴市','',NULL,NULL),('d7443dcd45704a27981810fc32b93390','潍坊','weifang','0030314',14,'10f46a521ea0471f8d71ee75ac3b5f3a','潍坊市','',NULL,NULL),('d7c388a2ed58414a9bd4dfbedf6858b3','顺义区','shunyiqu','0030110',10,'12a62a3e5bed44bba0412b7e6b733c93','顺义区','',NULL,NULL),('d7e006b55b96491282e9c2e672d35a34','克拉玛依','kelamayi','0032808',8,'2fabed91c6d94e698ed449165cd250ca','克拉玛依','',NULL,NULL),('d7e25a4040694008b4cb8aa322f77ad9','张家界','zhangjiajie','0031508',8,'c59f91630bef4289b71fcb2a48994582','张家界市','',NULL,NULL),('d80455402bc44d2ca15e905913301fb2','焦作','jiaozuo','0031204',4,'7336944efb4b40fcae9118fc9a970d2d','焦作市','',NULL,NULL),('d90a14bfbfe44a3e8d60bda8f8f362a6','铜仁','tongren','0030908',8,'592f6fcf45a74524aa8ea853fc9761d5','铜仁市','',NULL,NULL),('da583c36f6754d498176755c93db8d7c','遂宁','suining','0032516',16,'d3538add7125404aba4b0007ef9fde50','遂宁市','',NULL,NULL),('db3b9c7116bc49e3a65fa641dd82155d','红河','honghe','0032907',7,'510607a1836e4079b3103e14ec5864ed','红河','',NULL,NULL),('db6336fcf27f4c00b37513ff0e368ae6','长宁区','changningqu','0030203',3,'f1ea30ddef1340609c35c88fb2919bee','长宁区','',NULL,NULL),('db77fd88654c4014a71d541171d2795b','西安','xi\'an','0032407',7,'534850c72ceb4a57b7dc269da63c330a','西安市','',NULL,NULL),('dc022922169446549dfac0de221d2a4d','雅安','ya\'an','0032517',17,'d3538add7125404aba4b0007ef9fde50','雅安市','',NULL,NULL),('dc9b2098188f4b5c93aec5c9bbfb895d','吕梁','lvliang','0032306',6,'023473e9e6204583a110531036357514','吕梁市','',NULL,NULL),('dcbcde16e75643f9b8dd4b6293c87dd5','滨州','binzhou','0030302',2,'10f46a521ea0471f8d71ee75ac3b5f3a','滨州市','',NULL,NULL),('dcd0ca1cde8f420dbfecbac4cf1506ee','巴州','bazhou','0032803',3,'2fabed91c6d94e698ed449165cd250ca','巴州','',NULL,NULL),('dcd445ef42c9484bbd14bacd02bebf37','郑州','zhengzhou','0031216',16,'7336944efb4b40fcae9118fc9a970d2d','郑州市','',NULL,NULL),('dcf99d941ca44b30915e16a4048d5004','益阳','yiyang','0031509',9,'c59f91630bef4289b71fcb2a48994582','益阳市','',NULL,NULL),('dee1fa3295ec42219815769d00fabe70','迪庆','diqing','0032906',6,'510607a1836e4079b3103e14ec5864ed','迪庆','',NULL,NULL),('e06c4a42478b4853827911b8adac6def','庆阳','qingyang','0030611',11,'3283f1a77180495f9a0b192d0f9cdd35','庆阳市','',NULL,NULL),('e1204d4286834046886f26ae6af0722a','湘潭','xiangtan','0031503',3,'c59f91630bef4289b71fcb2a48994582','湘潭市','',NULL,NULL),('e15cb9bb072248628b7ec481b6337229','六盘水','liupanshui','0030904',4,'592f6fcf45a74524aa8ea853fc9761d5','六盘水市','',NULL,NULL),('e1bbd9b635e140ee8fcf0dc06743519b','廊坊','langfang','0031106',6,'75362368f22f4d60a810c2a45cced487','廊坊市','',NULL,NULL),('e384a07d11bf413eb83cd490939ca7a2','綦江区','qijiangqu','0033110',10,'1c85fbd06cf840d093f3640aca1b6b2d','綦江区','',NULL,NULL),('e3ca4d54f3354ba5b17e1f93415ceb1a','云浮','yunfu','0030717',17,'0dd1f40bcb9d46aeba015dc19645a5b9','云浮市','',NULL,NULL),('e4adf72e96ee4b7fa3528ee5ba4eb5cf','梧州','wuzhou','0030813',13,'c5f3d426c582410281f89f1451e1d854','梧州市','',NULL,NULL),('e556d8e5e148406883e1a83d6595e406','铜梁区','tongliangqu','0033121',21,'1c85fbd06cf840d093f3640aca1b6b2d','铜梁区','',NULL,NULL),('e7200f8c6dce4ea193bf33f55d9fd192','池州','chizhou','0030405',5,'249999f296d14f95b8138a30bbb2c374','池州市','',NULL,NULL),('e7de6c7b752040b2bd3175641d83d128','哈尔滨','haerbin','0031303',3,'b2d4133b5dbf4599ada940620d2ab250','哈尔滨市','',NULL,NULL),('e8311a6f0ab4495484fdf24902ee97cc','新余','xinyu','0031809',9,'cb3008cbd6ae4b5f8cebd2254ccb8603','新余市','',NULL,NULL),('e91a5fc37b774b598648dbd0ee5e7566','财务流程标识','Financial process identification','KEY_finance',2,'act002','财务流程标识','','','yes'),('e9a653c9850c46bc9e2e1916de643a52','楚雄','chuxiong','0032903',3,'510607a1836e4079b3103e14ec5864ed','楚雄','',NULL,NULL),('ec0eed6293294d58aa56f6c381263288','郴州','chenzhou','0031510',10,'c59f91630bef4289b71fcb2a48994582','郴州市','',NULL,NULL),('ec107e60189346adb2b5749d6f6fe074','德宏','dehong','0032905',5,'510607a1836e4079b3103e14ec5864ed','德宏','',NULL,NULL),('ec892838cf4944cc8b330216f02de1e6','津南区','jinnanqu','0032609',9,'2c254799d3454f2cbc338ef5712548e9','津南区','',NULL,NULL),('ec96c3771161459c99eb01124db7aa8a','三门峡','sanmenxia','0031211',11,'7336944efb4b40fcae9118fc9a970d2d','三门峡市','',NULL,NULL),('eca8a2f4e2534f77b7bccf263139d8c7','内江','neijiang','0032513',13,'d3538add7125404aba4b0007ef9fde50','内江市','',NULL,NULL),('ecb8f08c1408495bb31842c221d3edb4','渝北区','yubeiqu','0033112',12,'1c85fbd06cf840d093f3640aca1b6b2d','渝北区','',NULL,NULL),('ed5391a7608b4a61a24d95f2384f2131','阜新','fuxin','0031907',7,'b3366626c66c4b61881f09e1722e8495','阜新市','',NULL,NULL),('ed5b3d39695f496d88c37f56508d6447','仙桃','xiantao','0031412',12,'312b80775e104ba08c8244a042a658df','仙桃市','',NULL,NULL),('ed97335f8b3d42fabfd89993bc68475d','海南','hainan','0032204',4,'5a80e3435c0e4dc09bafceeadb38e5f0','海南','',NULL,NULL),('ede65c49ae624ef8900414298f79a438','乌海','wuhai','0032009',9,'c072c248c7ab47dda7bf24f5e577925c','乌海市','',NULL,NULL),('f0570e2fe4644e32af5c5401e8c371ba','盐城','yancheng','0031711',11,'577405ff648240959b3765c950598ab0','盐城市','',NULL,NULL),('f0eb076930844fe18fdd8dcf5fc1f56e','塔城','tacheng','0032810',10,'2fabed91c6d94e698ed449165cd250ca','塔城','',NULL,NULL),('f16ddc177870477685297a6abb157637','朔州','shuozhou','0032307',7,'023473e9e6204583a110531036357514','朔州市','',NULL,NULL),('f1e2cdd9518c4ac2b5e1ea52985b9771','果洛','guoluo','0032201',1,'5a80e3435c0e4dc09bafceeadb38e5f0','果洛','',NULL,NULL),('f1ea30ddef1340609c35c88fb2919bee','上海','shanghai','00302',2,'1','上海','',NULL,NULL),('f260eee573dc48fca1572b228d280849','版纳','banna','0032901',1,'510607a1836e4079b3103e14ec5864ed','版纳','',NULL,NULL),('f389ad0eb7884c4d91d4f31312bc8771','萍乡','pingxiang','0031807',7,'cb3008cbd6ae4b5f8cebd2254ccb8603','萍乡市','',NULL,NULL),('f416737f56924f7cb642a75f57b1530a','渭南','weinan','0032406',6,'534850c72ceb4a57b7dc269da63c330a','渭南市','',NULL,NULL),('f498d09200ba48df9d6e281776eba4f8','徐州','xuzhou','0031710',10,'577405ff648240959b3765c950598ab0','徐州市','',NULL,NULL),('f4bdd6b8f0704479a6d051f52d62d693','河池','hechi','0030807',7,'c5f3d426c582410281f89f1451e1d854','河池市','',NULL,NULL),('f4f2434769b842afbbf1791018b69800','河北区','hebeiqu','0032605',5,'2c254799d3454f2cbc338ef5712548e9','河北区','',NULL,NULL),('f57d2b8d983f43d5a035a596b690445b','金山区','jinshanqu','0030212',12,'f1ea30ddef1340609c35c88fb2919bee','金山区','',NULL,NULL),('f6337bdeefa44b0db9f35fe2fe7d6d6f','十堰','shiyan','0031408',8,'312b80775e104ba08c8244a042a658df','十堰市','',NULL,NULL),('f661c388a73d478699a2c1c5909b45f1','三亚','sanya','0031002',2,'2ba8e6d0fd944983aa19b781c6b53477','三亚市','',NULL,NULL),('f6ff36eb35414a5dacf7ccc0c479d2ea','宿迁','suqian','0031707',7,'577405ff648240959b3765c950598ab0','宿迁市','',NULL,NULL),('f775a440cb004c63b0b3d3429b58a1e6','衡水','hengshui','0031105',5,'75362368f22f4d60a810c2a45cced487','衡水市','',NULL,NULL),('f845a1c0a62b45bfbf358688eec3680d','巢湖','chaohu','0030404',4,'249999f296d14f95b8138a30bbb2c374','巢湖市','',NULL,NULL),('f9565fe7c0a348ba949131645d20e8fa','恩施','enshi','0031402',2,'312b80775e104ba08c8244a042a658df','恩施市','',NULL,NULL),('f970bd1da8f94bfa92206fa94d595cbb','锡林郭勒盟','xilinguolemeng','0032011',11,'c072c248c7ab47dda7bf24f5e577925c','锡林郭勒盟','',NULL,NULL),('f9a9156f0e9e41438e823f93070248bd','濮阳','puyang','0031210',10,'7336944efb4b40fcae9118fc9a970d2d','濮阳市','',NULL,NULL),('f9ceff59e02c4be3a4b20aa806c1ec0d','呼和浩特','huhehaote','0032006',6,'c072c248c7ab47dda7bf24f5e577925c','呼和浩特市','',NULL,NULL),('fa2ff170919e406d9d5547ff09d14d0d','双鸭山','shuangyashan','0031311',11,'b2d4133b5dbf4599ada940620d2ab250','双鸭山市','',NULL,NULL),('fa3446ef035546c09c1f27268b43b937','南京','nanjing','0031704',4,'577405ff648240959b3765c950598ab0','南京市','',NULL,NULL),('fbdbbe70e361402e886dfd3d2c7bd434','公假','Public holidays','00405',5,'6d30b170d4e348e585f113d14a4dd96d','公假','','','no'),('fc70429d9b8146e0ac31ce38410e2cb7','南阳','nanyang','0031208',8,'7336944efb4b40fcae9118fc9a970d2d','南阳市','',NULL,NULL),('fd06b72a41654fcfbfe2c3327ca4e9fc','珠海','zhuhai','0030721',21,'0dd1f40bcb9d46aeba015dc19645a5b9','珠海市','',NULL,NULL),('fd1d83119c414e56b3a35052c9d6dd0f','文山','wenshan','0032914',14,'510607a1836e4079b3103e14ec5864ed','文山','',NULL,NULL),('fd2a0cad70c643528587d1ccde4c5530','铜川','tongchuan','0032405',5,'534850c72ceb4a57b7dc269da63c330a','铜川市','',NULL,NULL),('fd79801a69ad4ec5857df82358c26368','江北区','jiangbeiqu','0033105',5,'1c85fbd06cf840d093f3640aca1b6b2d','江北区','',NULL,NULL),('ff880943e156482ea50d1ece4ff233a6','昌吉州','changjizhou','0032805',5,'2fabed91c6d94e698ed449165cd250ca','昌吉州','',NULL,NULL),('ffb2cc1e96fe485b94335589315ab38c','临汾','linfen','0032305',5,'023473e9e6204583a110531036357514','临汾市','',NULL,NULL),('ffd838f71da648319bfe4f176e0e209f','晋中','jinzhong','0032304',4,'023473e9e6204583a110531036357514','晋中市','',NULL,NULL),('ffeaa196501d4f35a486e42be17f2986','枣庄','zaozhuang','0030316',16,'10f46a521ea0471f8d71ee75ac3b5f3a','枣庄市','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dictionaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `LOG_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) DEFAULT NULL COMMENT '操作时间',
  `CONTENT` longtext COMMENT '事件',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES ('03ef753e082f41acad371a1f98dce98c','admin','2019-12-12 15:41:31','成功登录系统'),('063367b066b34e0b8442a671b178de37','','2019-12-10 15:11:00','退出系统'),('0b2e5d804eab4faabd8bd5bb08de5dd7','','2019-12-09 17:31:20','退出系统'),('0cca0e87d3564402a442f241375e8354','admin','2019-12-09 18:51:41','成功登录系统'),('0d06c945cad345c284a01881e5b7d87d','','2019-12-10 11:19:53','退出系统'),('0e3635ff2c4748bd9ef41450110223e4','','2019-12-12 14:29:51','退出系统'),('194230253e1749969e4c0efe585434fc','admin','2019-12-06 12:00:29','成功登录系统'),('1b3aa17d71684508a96c5d8cb66db837','','2019-12-12 15:41:28','退出系统'),('1b3e1d2c087b4cd2acbc1e26a8e1c1a1','admin','2019-12-10 11:01:19','退出系统'),('1bd711823de54d70b6f04569f02901c1','admin','2019-12-09 18:22:38','成功登录系统'),('1faadfda14c44537a0959005c324b409','admin','2019-12-06 11:34:54','成功登录系统'),('202f3acb074846539a85d1f560f83704','admin','2019-12-11 10:42:25','成功登录系统'),('299f92c110834e9a9610e3f574077830','admin','2019-12-10 10:56:23','成功登录系统'),('2ab28292137d4d4e8bc2df17739c1f21','admin','2019-12-13 11:45:46','修改按钮：null'),('2d2cb32af05742be879a6d1eeb1cd4ad','admin','2019-12-10 15:20:28','退出系统'),('2fb1119c0e1f49709764213c55297932','','2019-12-09 18:20:31','退出系统'),('3392f81bf98547daa159fda43508de40','admin','2019-12-06 10:49:34','退出系统'),('354234c7cfaf4ee0a89346b2a81b3f19','admin','2019-12-09 17:15:17','成功登录系统'),('36ace473399e4d689e876d61cc5a3d2e','','2019-12-05 16:52:33','退出系统'),('37ba705491404b218d8c1b9c3943e269','admin','2019-12-05 18:32:23','成功登录系统'),('40f7ed5509c140cfb5b0292a570efa99','admin','2019-12-05 18:09:27','成功登录系统'),('4279bb77a8d5431aa6d1ff09df5a2591','','2019-12-05 18:09:25','退出系统'),('448cdf6b2d27409790dafe89cd3a32d6','admin','2019-12-10 15:16:57','成功登录系统'),('479fdfc526a74b83a4d216cdec1c271c','','2019-12-06 11:08:43','退出系统'),('47be640875fb4c7c889208f720f03dba','admin','2019-12-06 10:43:57','退出系统'),('49d82fd222e2413aa4e6eac3949c1a78','admin','2019-12-13 11:19:04','成功登录系统'),('4a918d43a25644cfa5c0bbc6606a46a3','admin','2019-12-09 17:31:23','成功登录系统'),('52a14da42f994b3a822341cc43527ffd','admin','2019-12-10 17:24:47','成功登录系统'),('544089f8827548a18f056a5af5737587','admin','2019-12-05 16:09:47','成功登录系统'),('573368a665c84fb6b4b26dc33ecf0fec','','2019-12-05 18:21:17','退出系统'),('57c053fc75be400995d75b9c43f8a9e2','','2019-12-06 12:00:25','退出系统'),('5bdd7c1e8bbb4666af95536c36bb614c','admin','2019-12-05 18:21:19','成功登录系统'),('5c74ee164df740809ce25166e823a89e','admin','2019-12-06 11:09:42','退出系统'),('5d7e2b9e2f7e4d1d87b080a523eebcd5','admin','2019-12-06 11:34:50','退出系统'),('60d91cd4d83542039912598f2d9ff9c3','','2019-12-11 11:53:21','退出系统'),('65e68f23399c4ba69417bd7c079fad4f','admin','2019-12-06 10:44:00','成功登录系统'),('68c52e0127894e12b313e84ed858d6a5','admin','2019-12-06 11:37:42','成功登录系统'),('6982fb62e1fe4381b8c6bfa796060bc9','admin','2019-12-11 12:03:34','成功登录系统'),('69d33cf355024c4f82224f329492743e','','2019-12-10 10:57:38','退出系统'),('6b3d449842bf4a9682912a7e786bf3a8','','2019-12-11 16:13:27','退出系统'),('6bb59a31b47046ca90ee8e0f35e8187d','','2019-12-06 11:47:48','退出系统'),('6bd12e986153498ba5f839bf91c85e71','admin','2019-12-06 11:51:33','成功登录系统'),('6ca0d8ba9bb441b8aab8c340ff3605c8','admin','2019-12-10 11:01:22','成功登录系统'),('6d91674fa68c4274ad4ad50df388ff5e','admin','2019-12-10 17:28:47','成功登录系统'),('716364496fb3456ab6a0e666d99fa187','admin','2019-12-06 11:37:39','退出系统'),('7346f430e78c43f18e2f5d7a0f12f553','admin','2019-12-10 18:07:46','成功登录系统'),('744f3bcfa44a42bd8ef66eb53df85541','admin','2019-12-09 18:20:34','成功登录系统'),('7bdfa3a3e55545a985dd1151a5e9a644','admin','2019-12-05 16:11:50','退出系统'),('7c875ffb2c1041ad8537389ec6e22faa','admin','2019-12-09 17:12:49','退出系统'),('7d216f7d4f354c87879adfa00d4c234c','','2019-12-10 18:10:31','退出系统'),('823a28dc90fe42aeb9e41e21b97c3731','admin','2019-12-09 18:34:06','退出系统'),('8460845321a64fb39c8488edd4e0713a','admin','2019-12-06 11:38:16','成功登录系统'),('890248733e834aa19e0e72fb14cc86f6','admin','2019-12-10 15:20:30','成功登录系统'),('8b7250992b904787a4de0728d3f44a78','admin','2019-12-09 18:20:58','退出系统'),('8f97780b9b2c49289f5c64672a29a586','','2019-12-10 17:28:43','退出系统'),('943dc2daa7b446a9b7f31391ac470a02','admin','2019-12-06 11:08:56','尝试登录系统失败,用户名密码错误,无权限'),('956d6366bc80428f842b167ef894dd32','admin','2019-12-11 11:38:53','成功登录系统'),('96ec995244414f61826e11d5f189e00d','admin','2019-12-11 11:38:45','退出系统'),('975fcc3dd6394cc8b5f182b64f850af1','admin','2019-12-09 17:15:13','退出系统'),('978d31d3ea894d088112ce9b97d6aea9','admin','2019-12-06 10:32:22','成功登录系统'),('9ac936ff115845d089c374d7bc2aa6fb','admin','2019-12-06 10:50:17','成功登录系统'),('9aed7c2bf13c41ee81651402cf6b35c8','','2019-12-10 10:59:15','退出系统'),('9de01245787147a9ae5f3a69a45da612','admin','2019-12-09 17:05:25','成功登录系统'),('9e7f82fd5ffe4e958d5a2c36fb2cc048','admin','2019-12-11 16:16:28','成功登录系统'),('a4562c8a9e444efc86b88a016b782db2','admin','2019-12-09 17:12:52','成功登录系统'),('a49731c5718b4e24a728292d883a7a15','','2019-12-09 18:22:35','退出系统'),('a676db31ada94eeb9b2fde448d18256b','admin','2019-12-11 16:13:31','成功登录系统'),('a79349e614a240e697413fb47ed9a090','admin','2019-12-06 11:09:47','成功登录系统'),('a8659db0ff464819a76916a463c06825','','2019-12-12 15:43:51','退出系统'),('a8af882f132a49c4a647145642b43ab3','admin','2019-12-06 10:52:39','成功登录系统'),('aa376ea1d5de4c01b849fca36644667a','','2019-12-11 11:37:36','退出系统'),('aeebc02713d94ab19138c6f812727058','admin','2019-12-06 11:38:13','退出系统'),('b08e3e30137f4c9e9c5cf9339415dec0','admin','2019-12-06 11:46:26','成功登录系统'),('b096ac21ed684bfdbcc8d191052f0a46','admin','2019-12-05 18:08:33','成功登录系统'),('b320358d53fd4d2f98b0dd4383eb59d9','admin','2019-12-10 10:59:18','成功登录系统'),('b4eaa4fb1ae648b89e378389aca9a6db','admin','2019-12-12 18:32:43','成功登录系统'),('b7a54a01d2b0497eb97838ce68e433f9','admin','2019-12-11 16:16:24','退出系统'),('b8999a018ef54c4186618e20a046e068','admin','2019-12-12 14:29:54','成功登录系统'),('bb9834261f1d45279932222d9464544e','','2019-12-10 18:07:42','退出系统'),('bc4a0aa9fdda437ea3b916e51ee01b94','','2019-12-12 18:32:39','退出系统'),('c8c569e1aa3f411cb1253746f3e2594a','admin','2019-12-10 15:11:04','成功登录系统'),('cc065beb13c14df6bd66c661362d9104','admin','2019-12-06 11:08:59','成功登录系统'),('cd8309c24ff943ed8577dcfd429fdc67','admin','2019-12-10 18:10:36','成功登录系统'),('cf1bc9c0ccb04066abf9e98937b01613','admin','2019-12-12 15:43:55','成功登录系统'),('d0fe3f859788404da37b11b0a17b6383','','2019-12-09 18:45:28','退出系统'),('d38ec288bdd14852bcbb9214be254893','admin','2019-12-11 11:37:39','成功登录系统'),('d42ebf455e794184bda272293b64db58','admin','2019-12-05 16:12:08','成功登录系统'),('d64b5fa459e34105b5e3c535b2c6f126','admin','2019-12-09 18:21:01','成功登录系统'),('d72df4440a5346f5864250aa3adb5055','','2019-12-09 18:34:40','退出系统'),('d826cba511de473e87ffa979f41d4c3b','','2019-12-06 11:46:23','退出系统'),('d9b2e9bdd0844eb7a3cc7c251b69429d','admin','2019-12-10 11:19:56','成功登录系统'),('daee6a39a9464a7b9a3cf76ece21a0e8','admin','2019-12-13 11:46:15','修改按钮：null'),('db244d16952d447a86c35ccc82ce3742','','2019-12-09 17:05:22','退出系统'),('db59807cc14e494e8d14f86c7a2fa4bc','admin','2019-12-10 16:54:43','成功登录系统'),('dc9f9fd4f3b64d71bbb927178527fe09','admin','2019-12-09 18:45:32','成功登录系统'),('de3eb0c016784d55990b7b98a9199e8c','admin','2019-12-06 11:51:30','退出系统'),('e0dbd7bf9b6143a5ae8f8e24432d8367','admin','2019-12-06 10:50:13','退出系统'),('e4c98ad6d635400183c4cc6cb4156128','','2019-12-10 18:30:24','退出系统'),('e51a7be27a154956bd7efeef02839804','admin','2019-12-06 10:49:37','成功登录系统'),('e5653b3fc7084a4cbbfd78d87a40f27c','','2019-12-11 12:03:31','退出系统'),('ef2984cecbb44ee29739ab8148a76845','admin','2019-12-12 10:02:48','成功登录系统'),('f351f03b83d14397bf8798613b3a939a','admin','2019-12-09 18:52:36','成功登录系统'),('f376ec81e40141139550d851c9274cad','','2019-12-06 10:52:35','退出系统'),('f3c290b411f948ffae7bd4f3b5f39d91','admin','2019-12-11 11:53:25','成功登录系统'),('f5a93d59c13c41e28b59376589a7e525','admin','2019-12-10 18:30:27','成功登录系统'),('fa20b5a2104a4e049dddfba404c6218f','admin','2019-12-06 11:47:52','成功登录系统'),('fb2d3f96386f4da9857d70a96070b0ac','admin','2019-12-09 18:34:43','成功登录系统'),('fc284bda577c4f88b04321d9d28eaab4','admin','2019-12-10 10:57:41','成功登录系统'),('fc65253c05694e7f8856e3179d7ae52b','admin','2019-12-09 18:34:09','成功登录系统');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MENU_NAME` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `MENU_URL` varchar(255) DEFAULT NULL COMMENT '菜单路径',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `MENU_ORDER` varchar(100) DEFAULT NULL COMMENT '排序',
  `MENU_ICON` varchar(60) DEFAULT NULL COMMENT '图标',
  `MENU_TYPE` varchar(10) DEFAULT NULL COMMENT '类型',
  `MENU_STATE` int(1) DEFAULT NULL COMMENT '状态',
  `SHIRO_KEY` varchar(100) DEFAULT NULL COMMENT '权限值',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理','#','0','1','fa fa-television','2',1,NULL),(2,'权限管理','#','0','2','fa fa-unlock-alt','2',1,NULL),(3,'日志管理','/im/sys/log/log_list','1','4','fa fa-newspaper-o','1',1,'log:list'),(4,'性能监控','/im/druid/index.html','5','1','fa fa-line-chart','1',1,'(无)'),(5,'系统工具','#','0','5','fa fa-suitcase','2',1,'(无)'),(6,'基础权限','/im/sys/role/role_list','2','1','fa fa-vcard-o','1',1,'role:list'),(7,'按钮权限','/im/sys/buttonrights/buttonrights_list','2','2','fa fa-toggle-right','1',1,'buttonrights:list'),(8,'菜单管理','/im/sys/menu/menu_list','1','2','fa fa-tags','1',1,'menu:list'),(9,'按钮管理','/im/sys/button/button_list','1','1','fa fa-server','1',1,'button:list'),(10,'用户管理','#','0','3','fa fa-users','2',1,NULL),(11,'系统用户','/im/sys/user/user_list','10','1','fa fa-user','1',1,'user:list'),(12,'数据字典','/im/sys/dictionaries/dictionaries_list','1','3','fa fa-book','1',1,'dictionaries:list'),(13,'代码生成器','#','0','9','fa fa-gears','2',1,'(无)'),(14,'正向生成','/im/sys/maker/createcode_list','13','1','fa fa-gear','1',1,'createCode:list'),(15,'反向生成','/im/sys/maker/recreatecode_list','13','2','fa fa-reply','1',1,'recreateCode:list'),(16,'模版管理','/im/sys/maker/codeeditor_edit_1.html?type=createOneCode&ffile=controllerTemplate','13','3','fa fa-book','1',1,'(无)'),(17,'单表模版','../../tools/codeeditor/codeeditor_edit_1.html?type=createOneCode&ffile=controllerTemplate','16','1','fa fa-bookmark-o','1',1,'codeeditor:list'),(18,'主表模版','../../tools/codeeditor/codeeditor_edit_1.html?type=createFaCode&ffile=controllerTemplate','16','2','fa fa-bookmark-o','1',1,'codeeditor:list'),(19,'明细表模版','../../tools/codeeditor/codeeditor_edit_1.html?type=createSoCode&ffile=controllerTemplate','16','3','fa fa-bookmark-o','1',1,'codeeditor:list'),(20,'树形表模版','../../tools/codeeditor/codeeditor_edit_1.html?type=createTreeCode&ffile=controllerTemplate','16','4','fa fa-bookmark-o','1',1,'codeeditor:list'),(21,'处理类','../../tools/codeeditor/codeeditor_edit_1.html?type=createOneCode&ffile=controllerTemplate','17','1','','1',1,'(无)'),(22,'mapper层','../../tools/codeeditor/codeeditor_edit_1.html?type=createOneCode&ffile=mapperTemplate','17','2','','1',1,'(无)'),(23,'service层','../../tools/codeeditor/codeeditor_edit_1.html?type=createOneCode&ffile=serviceTemplate','17','3','','1',1,'(无)'),(24,'serviceI实现类','../../tools/codeeditor/codeeditor_edit_1.html?type=createOneCode&ffile=serviceImplTemplate','17','4','','1',1,'(无)'),(25,'mybatis_xml_mysql','../../tools/codeeditor/codeeditor_edit_2.html?type=createOneCode&ffile=xml_MysqlTemplate','17','5','','1',1,'(无)'),(26,'mybatis_xml_oracle','../../tools/codeeditor/codeeditor_edit_2.html?type=createOneCode&ffile=xml_OracleTemplate','17','6','','1',1,'(无)'),(27,'mybatis_xml_sqlserver','../../tools/codeeditor/codeeditor_edit_2.html?type=createOneCode&ffile=xml_SqlserverTemplate','17','7','','1',1,'(无)'),(28,'mysql_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createOneCode&ffile=mysql_SQL_Template','17','8','','1',1,'(无)'),(29,'oracle_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createOneCode&ffile=oracle_SQL_Template','17','9','','1',1,'(无)'),(30,'sqlserver_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createOneCode&ffile=sqlserver_SQL_Template','17','10','','1',1,'(无)'),(31,'html_列表页面','../../tools/codeeditor/codeeditor_edit_2.html?type=createOneCode&ffile=html_list_Template','17','11','','1',1,'(无)'),(32,'html_编辑页面','../../tools/codeeditor/codeeditor_edit_2.html?type=createOneCode&ffile=html_edit_Template','17','12','','1',1,'(无)'),(33,'处理类','../../tools/codeeditor/codeeditor_edit_1.html?type=createFaCode&ffile=controllerTemplate','18','1','','1',1,'(无)'),(34,'mapper层','../../tools/codeeditor/codeeditor_edit_1.html?type=createFaCode&ffile=mapperTemplate','18','2','','1',1,'(无)'),(35,'service层 ','../../tools/codeeditor/codeeditor_edit_1.html?type=createFaCode&ffile=serviceTemplate','18','3','','1',1,'(无)'),(36,'serviceI实现类','../../tools/codeeditor/codeeditor_edit_1.html?type=createFaCode&ffile=serviceImplTemplate','18','4','','1',1,'(无)'),(37,'mybatis_xml_mysql','../../tools/codeeditor/codeeditor_edit_2.html?type=createFaCode&ffile=xml_MysqlTemplate','18','5','','1',1,'(无)'),(38,'mybatis_xml_oracle','../../tools/codeeditor/codeeditor_edit_2.html?type=createFaCode&ffile=xml_OracleTemplate','18','6','','1',1,'(无)'),(39,'mybatis_xml_sqlserver','../../tools/codeeditor/codeeditor_edit_2.html?type=createFaCode&ffile=xml_SqlserverTemplate','18','7','','1',1,'(无)'),(40,'mysql_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createFaCode&ffile=mysql_SQL_Template','18','8','','1',1,'(无)'),(41,'oracle_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createFaCode&ffile=oracle_SQL_Template','18','9','','1',1,'(无)'),(42,'sqlserver_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createFaCode&ffile=sqlserver_SQL_Template','18','10','','1',1,'(无)'),(43,'html_列表页面','../../tools/codeeditor/codeeditor_edit_2.html?type=createFaCode&ffile=html_list_Template','18','11','','1',1,'(无)'),(44,'html_编辑页面','../../tools/codeeditor/codeeditor_edit_2.html?type=createFaCode&ffile=html_edit_Template','18','12','','1',1,'(无)'),(45,'处理类','../../tools/codeeditor/codeeditor_edit_1.html?type=createSoCode&ffile=controllerTemplate','19','1','','1',1,'(无)'),(46,'mapper层','../../tools/codeeditor/codeeditor_edit_1.html?type=createSoCode&ffile=mapperTemplate','19','2','','1',1,'(无)'),(47,'service层','../../tools/codeeditor/codeeditor_edit_1.html?type=createSoCode&ffile=serviceTemplate','19','3','','1',1,'(无)'),(48,'serviceI实现类','../../tools/codeeditor/codeeditor_edit_1.html?type=createSoCode&ffile=serviceImplTemplate','19','4','','1',1,'(无)'),(49,'mybatis_xml_mysql','../../tools/codeeditor/codeeditor_edit_2.html?type=createSoCode&ffile=xml_MysqlTemplate','19','5','','1',1,'(无)'),(50,'mybatis_xml_oracle','../../tools/codeeditor/codeeditor_edit_2.html?type=createSoCode&ffile=xml_OracleTemplate','19','6','','1',1,'(无)'),(51,'mybatis_xml_sqlserver','../../tools/codeeditor/codeeditor_edit_2.html?type=createSoCode&ffile=xml_SqlserverTemplate','19','7','','1',1,'(无)'),(52,'mysql_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createSoCode&ffile=mysql_SQL_Template','19','8','','1',1,'(无)'),(53,'oracle_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createSoCode&ffile=oracle_SQL_Template','19','9','','1',1,'(无)'),(54,'sqlserver_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createSoCode&ffile=sqlserver_SQL_Template','19','10','','1',1,'(无)'),(55,'html_列表页面','../../tools/codeeditor/codeeditor_edit_2.html?type=createSoCode&ffile=html_list_Template','19','11','','1',1,'(无)'),(56,'html_编辑页面','../../tools/codeeditor/codeeditor_edit_2.html?type=createSoCode&ffile=html_edit_Template','19','12','','1',1,'(无)'),(57,'处理类','../../tools/codeeditor/codeeditor_edit_1.html?type=createTreeCode&ffile=controllerTemplate','20','1','','1',1,'(无)'),(58,'实体类','../../tools/codeeditor/codeeditor_edit_1.html?type=createTreeCode&ffile=entityTemplate','20','2','','1',1,'(无)'),(59,'mapper层','../../tools/codeeditor/codeeditor_edit_1.html?type=createTreeCode&ffile=mapperTemplate','20','3','','1',1,'(无)'),(60,'service层','../../tools/codeeditor/codeeditor_edit_1.html?type=createTreeCode&ffile=serviceTemplate','20','4','','1',1,'(无)'),(61,'serviceI实现类','../../tools/codeeditor/codeeditor_edit_1.html?type=createTreeCode&ffile=serviceImplTemplate','20','5','','1',1,'(无)'),(62,'mybatis_xml_mysql','../../tools/codeeditor/codeeditor_edit_2.html?type=createTreeCode&ffile=xml_MysqlTemplate','20','6','','1',1,'(无)'),(63,'mybatis_xml_oracle','../../tools/codeeditor/codeeditor_edit_2.html?type=createTreeCode&ffile=xml_OracleTemplate','20','7','','1',1,'(无)'),(64,'mybatis_xml_sqlserver','../../tools/codeeditor/codeeditor_edit_2.html?type=createTreeCode&ffile=xml_SqlserverTemplate','20','8','','1',1,'(无)'),(65,'mysql_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createTreeCode&ffile=mysql_SQL_Template','20','9','','1',1,'(无)'),(66,'oracle_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createTreeCode&ffile=oracle_SQL_Template','20','10','','1',1,'(无)'),(67,'sqlserver_sql_脚本','../../tools/codeeditor/codeeditor_edit_1.html?type=createTreeCode&ffile=sqlserver_SQL_Template','20','11','','1',1,'(无)'),(68,'tree_树形页面','../../tools/codeeditor/codeeditor_edit_2.html?type=createTreeCode&ffile=html_tree_Template','20','12','','1',1,'(无)'),(69,'html_列表页面','../../tools/codeeditor/codeeditor_edit_2.html?type=createTreeCode&ffile=html_list_Template','20','13','','1',1,'(无)'),(70,'html_编辑页面','../../tools/codeeditor/codeeditor_edit_2.html?type=createTreeCode&ffile=html_edit_Template','20','14','','1',1,'(无)'),(71,'在线管理','/im/sys/online/online.html','1','5','fa fa-globe','1',1,'online:list'),(72,'我的通讯','#','0','4','fa fa-comments-o','1',1,'(无)'),(73,'好友管理','/im/imsn/friends/friends_list','72','1','fa fa-user-o','1',1,'friends:list'),(74,'好友分组','/im/imsn/fgroup/fgroup_list','72','2','fa fa-male','1',1,'fgroup:list'),(75,'我的群组','/im/imsn/qgroup/qgroup_list','72','3','fa fa-users','1',1,'qgroup:list'),(76,'数据库管理','#','0','10','fa fa-database','2',1,'(无)'),(77,'数据库备份','/im/sys/db/brdb/table_list','76','1','fa fa-sign-in','1',1,'brdb:listAllTable'),(78,'备份定时器 ','/im/sys/db/backup/backup_list','76','2','fa fa-clock-o','1',1,'timingbackup:list'),(79,'数据库还原','/im/sys/db/brdb/brdb_list','76','3','fa fa-recycle','1',1,'brdb:list'),(80,'SQL编辑器','/im/sys/db/sqledit/sql_edit','76','4','fa fa-pencil-square-o','1',1,'sqledit:view'),(82,'工作流程','#','0','7','fa fa-hdd-o','1',1,'(无)'),(83,'模型管理','/im/act/model/model_list','82','1','fa fa-tasks','1',1,'model:list'),(84,'流程管理','/im/act/procdef/procdef_list','82','2','fa fa-random','1',1,'procdef:list'),(85,'运行中流程','/im/act/ruprocdef/ruprocdef_list','82','3','fa fa-refresh','1',1,'ruprocdef:list'),(86,'历史的流程','/im/act/hiprocdef/hiprocdef_list','82','4','fa fa-ellipsis-h','1',1,'hiprocdef:list'),(87,'申请审批','#','0','6','fa fa-briefcase','1',1,'(无)'),(88,'请假申请','/im/ioas/myleave/myleave_list','87','1','fa fa-pencil-square-o','1',1,'myleave:list'),(89,'任务管理','#','0','8','fa fa-book','1',1,'(无)'),(90,'待办任务','/im/act/rutask/rutask_list','89','1','fa fa-envelope','1',1,'rutask:list'),(91,'已办任务','/im/act/hitask/hitask_list','89','2','fa fa-envelope-open','1',1,'hitask:list'),(92,'内容管理','#','0','11','','1',1,'(无)'),(93,'栏目管理','../../category/category/category_list.html','92','1','fa fa-random','1',1,'category:list'),(94,'文章管理','	../../article/article/article_list.html','92','2','fa fa-random','1',1,'article:list');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `RNUMBER` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('1','系统管理组','5030985901804146207931691433982','0','1','1','1','1','R20170000000001'),('147d873ec4154673a15ac7c093b68657','备用组','','0','0','0','0','0','R20190219170377'),('e295424edf854dac8329dee5a6b7f016','部门经理','3807748889172416296100021927936','1','3807748889172416296100021927936','4799506339367320868261724160','4799506339367320868261724160','3807748889172416296100021927936','R20171231556774'),('ebdb884104f24671ad8d30440242adad','员工','3807748889172416296100021927936','1','3807748889172416296100021927936','4799506339367320868261724160','4799506339367320868261724160','3807748889172416296100021927936','R20171231102049'),('f1cb1a689f2a4b57bcf8761b350c0ffc','总经理','3807748889172416296100021927936','1','3807748889172416296100021927936','4799506339367320868261724160','4799506339367320868261724160','3807748889172416296100021927936','R20171231726481'),('fhadminzhuche','注册用户','0','1','','','0','0','R20171231000000');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_button`
--

DROP TABLE IF EXISTS `sys_role_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_button` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `sys_role_button_ibfk_1` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_button` (`BUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_role_button_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_button`
--

LOCK TABLES `sys_role_button` WRITE;
/*!40000 ALTER TABLE `sys_role_button` DISABLE KEYS */;
INSERT INTO `sys_role_button` VALUES ('2b3e72844e9642ed9056731643518bfa','ebdb884104f24671ad8d30440242adad','7b9756f1455d418396d14bf5a1f8ed09'),('2e941c79fdd34387b292e27444ba081f','f1cb1a689f2a4b57bcf8761b350c0ffc','117825711d484e719a2a3bf1d0d45c2b'),('3242f38b09d64bc2bb89bd845a1e10d0','f1cb1a689f2a4b57bcf8761b350c0ffc','688f6db8b226468e82e0f2c40d377fd9'),('34edcd073e5e480c824166e5dfd9d2eb','e295424edf854dac8329dee5a6b7f016','c3d94fcfd3ee4a2a8f08bb1cd110bc5c'),('45caf625a8bd4f7d92233d6be53d1e67','ebdb884104f24671ad8d30440242adad','117825711d484e719a2a3bf1d0d45c2b'),('4fd20366545d457d878469698300db7e','f1cb1a689f2a4b57bcf8761b350c0ffc','1af9cef37b1f4cc79abacb52c25a3dfa'),('5191716b9a1f4180a89607c43b3c0384','fhadminzhuche','117825711d484e719a2a3bf1d0d45c2b'),('5220351589b7475588cbca6400f41cb1','e295424edf854dac8329dee5a6b7f016','7b9756f1455d418396d14bf5a1f8ed09'),('53787c5736cc4b4da21e51f9f9c7b042','ebdb884104f24671ad8d30440242adad','c3d94fcfd3ee4a2a8f08bb1cd110bc5c'),('60fe1d06944e4925b4ae930da9e8b1eb','f1cb1a689f2a4b57bcf8761b350c0ffc','7b9756f1455d418396d14bf5a1f8ed09'),('611c9bde27754b99896892368a0bed15','e295424edf854dac8329dee5a6b7f016','e2a0d76a25bd467aa29aaadf3a8def18'),('7d7400610af745af91a78b5320cf0078','e295424edf854dac8329dee5a6b7f016','117825711d484e719a2a3bf1d0d45c2b'),('ab9337220acf41b78e7f6bb165dc8713','e295424edf854dac8329dee5a6b7f016','1af9cef37b1f4cc79abacb52c25a3dfa'),('b49b9415a31c4de2818c32d13fd5209e','ebdb884104f24671ad8d30440242adad','e2a0d76a25bd467aa29aaadf3a8def18'),('cbe304e060bd485c83cded08bd976c6e','ebdb884104f24671ad8d30440242adad','688f6db8b226468e82e0f2c40d377fd9'),('cdbfd62ecad149d4a7eeffaaefbc1c3b','e295424edf854dac8329dee5a6b7f016','688f6db8b226468e82e0f2c40d377fd9'),('cf38f7e5708140a0923999442665faef','f1cb1a689f2a4b57bcf8761b350c0ffc','c3d94fcfd3ee4a2a8f08bb1cd110bc5c'),('f4db056c93044b3db39767ee857134a0','f1cb1a689f2a4b57bcf8761b350c0ffc','e2a0d76a25bd467aa29aaadf3a8def18');
/*!40000 ALTER TABLE `sys_role_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sms`
--

DROP TABLE IF EXISTS `sys_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sms` (
  `SMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sms`
--

LOCK TABLES `sys_sms` WRITE;
/*!40000 ALTER TABLE `sys_sms` DISABLE KEYS */;
INSERT INTO `sys_sms` VALUES ('03abf4df77fa41028e4e6b7f0d8c4834','<p>你好asdadsad</p>','1','zhangsan','lisi','2019-05-30 01:39:18','1','535545d9addb4f86962b40fef8b33e02'),('08753d6145974b0093d309e4655f36d2','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 17:06:33','2','9774e9f83f724b95b131b5248f2d17bb'),('0b0aeec5471c47d78588cb4498776f29','您申请的任务已经被作废,请到已办任务列表查看','1','系统消息','admin','2019-05-30 15:00:10','2','46ef1154f8ed4863afb9197dee3f44e6'),('138dd0711b764169a5b68ea2a52ce933','<p><img class=\"loadingclass\" id=\"loading_jyfcheni\" src=\"http://127.0.0.1:8081/plugins/ueditor/themes/default/images/spacer.gif\" title=\"正在上传...\"/>sdfsdfsdfsdfs</p>','1','admin','zhangsan','2019-07-23 12:54:38','2','2171ebafab094f7e98974383687e889a'),('13de1b8a836d434693fa8003d463d617','<p>sdfsdfsdf</p>','1','admin','zhangsan','2019-05-30 02:13:57','1','6adc3082a57f4b7cb99a4c4b44041b5a'),('255cdb711e21442ebc588cb780d19d21','<p>你好asdad</p>','2','lisi','zhangsan','2019-05-30 01:34:20','2','138acc9da2184d5c96b16e5098edc872'),('2641c77d373741048e98be347f7b76fc','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 14:18:22','2','430be3c96ebf461a9fc49a01da8441ef'),('2bdac4e8b51840d88f1710d03324aa4d','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-05-30 02:27:52','1','417eac967aba4fb18038821666da8a47'),('3021b02cc8bb43f0a216f226f06126d0','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 13:38:15','2','49072da4d6d346e49d18a8bfcb4718e3'),('33d186a11dd3454c8c0156b035c6cd75','<p>你好asdadsad</p>','2','lisi','zhangsan','2019-05-30 01:37:26','1','eed31bd2622649fe99fc37ccce4030ab'),('3e7583689a7d47318f386a3f814e6e3a','<p>sdfsdfsdf</p>','2','zhangsan','admin','2019-05-30 02:13:57','1','6adc3082a57f4b7cb99a4c4b44041b5a'),('478792a3a91240ac813bfd44ae06084e','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-23 16:56:07','2','81e6aaddeeec4306b04e273fb1ecc866'),('4ba9e13aa890433b8b8df82b39ebae8f','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 14:32:41','2','2e73f1c7bdc84c66a0c19b3be17b5e0f'),('4cc88a0b4ab84559bc8b76b6e2723d16','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','lisi','2019-07-24 16:15:23','2','e4caaee819be40af9bdf0ac0e782a468'),('4ce0af5d45b44154b4bc7d6e94f4e8bc','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 13:28:09','2','6cd21e9dfe674525a4eaf8c2da239353'),('4e991918be364ae8a2f22c793b877383','<p>你好asdadsad</p>','1','zhangsan','lisi','2019-05-30 01:37:26','1','eed31bd2622649fe99fc37ccce4030ab'),('537f0a9c789041b5b4286c4878d512fb','<p><img class=\"loadingclass\" id=\"loading_jyfcheni\" src=\"http://127.0.0.1:8081/plugins/ueditor/themes/default/images/spacer.gif\" title=\"正在上传...\"/>sdfsdfsdfsdfs</p>','2','zhangsan','admin','2019-07-23 12:54:38','2','2171ebafab094f7e98974383687e889a'),('553b53d92cab4de2b394fac6833f912b','<p>你好asdadsad</p>','2','lisi','zhangsan','2019-05-30 01:35:37','2','42e00fbf5de94e45b4d06027e2014bbb'),('595bf3330e3449cab527cd2b85305e67','<p>sdfsdfsdfsdfs</p>','2','zhangsan','admin','2019-05-30 02:14:13','2','96f565735ad740bda4a3da6dc17f18ea'),('5fee616f808e43659cbd5f58bb7c848e','<p>sdf</p>','2','zhangsan','admin','2019-05-30 02:13:47','2','e677eed924e44a88b3821407e9af0f43'),('62ff13d1ec2e4bab84b5188af10be682','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 14:46:40','2','d3d73d031faf46da937f6de5fa05f05a'),('63be16aa946541288c810cc78133e681','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 17:19:30','2','fdee5e5fcf3b431ea0e0b8504eaa5f33'),('73d4625871354878b0017e5aba41514e','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 13:34:20','2','ac0a34f89d4848448b8a49b14cfd9429'),('8436eceda9cb4036a5d268d3c79796e3','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 17:14:54','2','f9e15ca7b20c44d6b31cb6d9a432d3c2'),('844119a451184a59883b658858df0296','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 17:43:44','2','c0c5db451c4e456d80d6dcd83ad6c016'),('88fa22d9dfb04f328d8d43e8372e4e7b','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 17:15:26','2','64f8ca39e9b245c682ca43cf83d5086e'),('8ad068aba6bf481d8a382515f2324b05','您申请的任务已经被作废,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-23 17:01:36','2','0f6e97c7115741c3942fcb58e3451425'),('8be5ef87830d4be7929ddd32b45a7e61','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 16:19:42','2','bfc945faacbc42bb968c51a8f78aa6ea'),('8d30325a8c154bca9e44ea11a6e79c8e','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','lisi','2019-07-24 16:38:17','2','2309dda6ab114ab9a89cd27255334fdb'),('8f130f5b3db6487ba337818c9426215b','<p>你好asdad</p>','1','zhangsan','lisi','2019-05-30 01:34:20','2','138acc9da2184d5c96b16e5098edc872'),('908b1e3a426643cdabb8b6c21476b1f3','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-23 17:21:01','2','74a19d5153f64cb6b22a9d5d2947ce0c'),('96d5a9aedde34ad1a37f6b09455c660f','<p>你好</p>','1','zhangsan','lisi','2019-05-30 01:32:37','2','1ad2fbee5d22492581d1f622799ee5e9'),('9767805ff017409994d230facc90a243','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 14:37:34','2','2c68ab5ecbf64ce09d45bc27d1dc202f'),('98f4b1fbf4ae44d9906666e6d6e0cfc3','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 13:35:28','2','2a9a6bf48c2d4691b7e73639f9bbc29a'),('9912ffba8bd34cb788564aa17454fe32','<p>sdf</p>','1','admin','zhangsan','2019-05-30 02:13:47','2','e677eed924e44a88b3821407e9af0f43'),('a1a2cc6a95e341919f66d6e7dd8b990f','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-23 17:20:57','2','8dc24188d56443bca226622cdbe5366b'),('b7ed71729fff4feb944db6db1f15a698','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 13:36:16','2','a63e7fab0a8345438494eb9df01c684f'),('be014023ca9b46b990dfcaddeefc4e07','<p>你好</p>','1','zhangsan','admin','2019-05-28 23:00:35','2','b81870268db240bd8ed5308876833314'),('be494446f82e4ef29a9d2f366aaa53fd','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 13:29:52','2','419673d4c8074a9b9f3c8e74d16576f9'),('c2c9ae50772a41ee81848639ede7e912','<p>你好</p>','2','lisi','zhangsan','2019-05-30 01:32:37','2','1ad2fbee5d22492581d1f622799ee5e9'),('cc8e69edf2244aa782d26a91003663d5','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 15:00:04','2','bb980e5544004f348afcd005caeaf881'),('d15560eb96f04c779e4c56d8aa6e44b9','<p>你好</p>','2','admin','zhangsan','2019-05-28 23:00:35','2','b81870268db240bd8ed5308876833314'),('d3f62ad4da774e1b8789213d9cc512c6','<p>你好asdadsad</p>','1','zhangsan','lisi','2019-05-30 01:35:37','2','42e00fbf5de94e45b4d06027e2014bbb'),('dfde12e1259d4ba6a9c75e57cb618d81','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-23 16:57:56','2','999c69cb2f3f48e7ac6639060b095971'),('e24b92a2bb244ac9845221a0cfe64e92','<p>你好asdadsad</p>','2','lisi','zhangsan','2019-05-30 01:39:18','1','535545d9addb4f86962b40fef8b33e02'),('e3e79fd11f5949e1b7047a98caa3d214','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 14:12:09','2','31efac1bdf0340d99596ec81ca1d7480'),('ec3034d01bf34ef9b4c33b4f4389d00b','您申请的任务已经被作废,请到已办任务列表查看','1','系统消息','lisi','2019-05-30 02:55:04','2','cd268d4b663a47a385ee18059544c252'),('f3d70a31e587436096e653d6f2100be4','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','zhangsan','2019-07-24 14:13:39','2','627c13cc43044eb4a131124461321470'),('f424df14d5664c61a2ba37a47ac4a566','您申请的任务已经审批完毕,请到已办任务列表查看','1','系统消息','lisi','2019-07-24 16:35:21','2','162f9d3ee98d4548ba73500f898fa187');
/*!40000 ALTER TABLE `sys_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ueditor`
--

DROP TABLE IF EXISTS `sys_ueditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ueditor` (
  `UEDITOR_ID` varchar(100) NOT NULL,
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `CONTENT` longtext COMMENT '文本内容',
  `CONTENT2` longtext COMMENT '类型',
  `TYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UEDITOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ueditor`
--

LOCK TABLES `sys_ueditor` WRITE;
/*!40000 ALTER TABLE `sys_ueditor` DISABLE KEYS */;
INSERT INTO `sys_ueditor` VALUES ('5aa7cf78054045e99cfb887040522cd0','1','admin','<p><img class=\"loadingclass\" id=\"loading_jyfcheni\" src=\"http://127.0.0.1:8081/plugins/ueditor/themes/default/images/spacer.gif\" title=\"正在上传...\"/>sdfsdfsdfsdfs</p>','sdfsdfsdfsdfs','fhsms'),('90a392973f9e49949e3f0b7ddcb12ed6','1','admin','<p><img src=\"../../plugins/ueditor/jsp/upload/image/20190530/1559156162349002920.jpg\" title=\"1559156162349002920.jpg\" alt=\"timg.jpg\"/><img src=\"../../plugins/ueditor/jsp/upload/image/20190530/1559156170108004003.png\" title=\"1559156170108004003.png\" alt=\"1.png\"/></p><p style=\"line-height: 16px;\"><img src=\"http://127.0.0.1:8081/plugins/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"../../plugins/ueditor/jsp/upload/file/20190530/1559156178112000772.rar\" title=\"timg.rar\">timg.rar</a></p>','timg.rar','acthandle'),('9369b63a474344a7995fbc58052d1cbf','62c0aafd97704c3a85ef0fca3048045d','zhangsan','<p>你好asdadsad</p>','你好asdadsad','fhsms'),('b0b220ce7181470fb36a6c8351d7ff63','d7b34acd89d6441da59787477425e91f','wangwu','<p>4242</p>','4242','acthandle'),('b5329fbe8d6b487cbc8a3f9ec8296905','3a6c44458b6243fbb9c2bcf30d422e33','lisi','<p>123</p>','123','acthandle'),('d5b17bacbc2548d8a14f847b956f81b2','62c0aafd97704c3a85ef0fca3048045d','zhangsan','<p>荻花圣殿</p>','荻花圣殿','acthandle');
/*!40000 ALTER TABLE `sys_ueditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL COMMENT '用户ID',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '角色ID',
  `LAST_LOGIN` varchar(255) DEFAULT NULL COMMENT '最近登录时间',
  `IP` varchar(100) DEFAULT NULL COMMENT 'IP',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `SKIN` varchar(500) DEFAULT NULL COMMENT '皮肤',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `NUMBER` varchar(100) DEFAULT NULL COMMENT '编码',
  `PHONE` varchar(32) DEFAULT NULL COMMENT '电话',
  `ROLE_IDS` varchar(2000) DEFAULT NULL COMMENT '副职角色ID组',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('1','admin','223ce7b851123353479d85757fbbf4e320d1e251','系统管理员','1','2019-12-13 11:19:04','127.0.0.1','0','admin','pcoded-navbar navbar-image-3,navbar pcoded-header navbar-expand-lg navbar-light header-dark,','QQ313596790@qq.com','001','18788888888',''),('3a6c44458b6243fbb9c2bcf30d422e33','lisi','2612ade71c1e48cd7150b5f4df152faa699cedfe','李四','e295424edf854dac8329dee5a6b7f016','2019-07-24 17:44:33','127.0.0.1','0','李四','assets/windows/images/bg_01.jpg','123456@qq.com','z002','18788885858','e295424edf854dac8329dee5a6b7f016'),('62c0aafd97704c3a85ef0fca3048045d','zhangsan','5ee5d458d02fde6170b9c3ebfe06af85dacd131d','张三','ebdb884104f24671ad8d30440242adad','2019-07-24 17:39:20','127.0.0.1','0','张三','assets/windows/images/bg_01.jpg','187658888888@qq.con','z001','18765888888',''),('d7b34acd89d6441da59787477425e91f','wangwu','99162695b36d0b7d54bab64468bdbb89c6ad45c5','王五','f1cb1a689f2a4b57bcf8761b350c0ffc','2019-07-24 17:42:51','127.0.0.1','0','王五','assets/windows/images/bg_01.jpg','5555555@qq.com','z003','18756666666','');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_userphoto`
--

DROP TABLE IF EXISTS `sys_userphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_userphoto` (
  `USERPHOTO_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_userphoto`
--

LOCK TABLES `sys_userphoto` WRITE;
/*!40000 ALTER TABLE `sys_userphoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_userphoto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 18:43:01
