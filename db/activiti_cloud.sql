/*
SQLyog Enterprise v12.08 (32 bit)
MySQL - 5.6.46-log : Database - activiti_cloud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`activiti_cloud` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `activiti_cloud`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

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

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('12502',1,'简单请假.bpmn20.xml','12501','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"leave\" name=\"简单请假\" isExecutable=\"true\">\n    <startEvent id=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" name=\"开起\"/>\n    <userTask id=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" name=\"经理审批\"/>\n    <sequenceFlow id=\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\" sourceRef=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" targetRef=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\"/>\n    <exclusiveGateway id=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" default=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\"/>\n    <sequenceFlow id=\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\" sourceRef=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" targetRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\"/>\n    <userTask id=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" name=\"人事审批\"/>\n    <endEvent id=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\" name=\"结束\"/>\n    <sequenceFlow id=\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\" sourceRef=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" targetRef=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"/>\n    <sequenceFlow id=\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\" name=\"驳回\" sourceRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" targetRef=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${result==3}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\" name=\"同意\" sourceRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" targetRef=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" id=\"BPMNShape_sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"90.0\" y=\"124.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" id=\"BPMNShape_sid-9303BF19-09A3-4A06-922E-AD606B184621\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"172.0\" y=\"99.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" id=\"BPMNShape_sid-85402145-EF96-4306-917B-333141E9C7C3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"317.0\" y=\"119.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" id=\"BPMNShape_sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"99.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\" id=\"BPMNShape_sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"615.0\" y=\"125.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\" id=\"BPMNEdge_sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\">\n        <omgdi:waypoint x=\"356.5719696969697\" y=\"139.4280303030303\"/>\n        <omgdi:waypoint x=\"420.0\" y=\"139.18867924528303\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\" id=\"BPMNEdge_sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\">\n        <omgdi:waypoint x=\"272.0\" y=\"139.2164502164502\"/>\n        <omgdi:waypoint x=\"317.4130434782609\" y=\"139.41304347826087\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\" id=\"BPMNEdge_sid-517A0CBE-25A5-49A2-B197-0850747E8041\">\n        <omgdi:waypoint x=\"337.5\" y=\"119.5\"/>\n        <omgdi:waypoint x=\"337.5\" y=\"69.0\"/>\n        <omgdi:waypoint x=\"629.0\" y=\"69.0\"/>\n        <omgdi:waypoint x=\"629.0\" y=\"115.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\" id=\"BPMNEdge_sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\">\n        <omgdi:waypoint x=\"520.0\" y=\"139.0\"/>\n        <omgdi:waypoint x=\"615.0\" y=\"139.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\" id=\"BPMNEdge_sid-6960AC02-AE8C-4579-B007-9805DF708A4E\">\n        <omgdi:waypoint x=\"120.0\" y=\"139.0\"/>\n        <omgdi:waypoint x=\"172.0\" y=\"139.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('12503',1,'简单请假.leave.png','12501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\08\0\0\0}\0\0\0�\0\0\0aIDATx��}p��O�K})��XƗ:��Ʊv(c�0+�W&��D&Q��2� cP4*�tp�E��(E$o-�\0��PބH�\0�`�}~�>q��{ݽ��������n�r��}����yv7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�K��C�\ZEQ�R�2\0�p��g�VU�j��ߪڥ�׶��m��K՟��i�������G\0\0\n�7���P�Y��Wդ�c[��&�Ϲ���\0`(�.�B�bUo��d�>�F;B�,wW�S�_C;7r;���\0`(�N��\"���:��:k]\'+�8����M�\nG�\"��G\0\0\n�[�ɷnת�b*�C;;΀3DUm�bG�l~\0��@:q�#���Lg��`���I��;U�&��G\0\0\n�?]�X,!��P����t��L2�\007X�f�6Ϻ�ö�U�B�����K��#~\0��@��c�9\'�O]c=~���x�,��3�����\0\00\0��\0\0C�P\0\0?\0\0\0?\0\0\0?\0\0�#\0\0\0�#\0\0\0�#\0�P\0\0�#\0�P\0\0�#\0�P\0\0�#\0�P\0\0?\0�P\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0�#\0\0\0�#\0�P\0\0�#\0�P\0\0�#\0�P\0\0���0��\\�y���*++�U�VQ)���\ncݺu�S��7CA���#�1���j����hnn�:�N�8a�]���2�\'0}�o���#�g����	6�=��\n����7�G�i[c>�S�\0[0}�o���#2F��\Z\n����7�G�\"���q�������fɲ<�ia�\n���7~�4�ƆZc׊�Ǝe�ڔ<&�0.CA��Ə pxt�?ڙ��c��b\\ ���)�A�p�ia\rP�a\\ ���)�A�pתIa\rP�a\\ ���)�Ha�\n�F߀AG�U�\0eƅb(�B���\0�ox7��:��P�7���#����i�ZYҾ}��u���o\n}�G8�:�un;��0-CA��Ə ���7���l߾V��:��P�7���#�ʙLk6�;F/�8�)���o\n}g��,��R[���n�j���������t�6�-{{ }S�;��s���H\'++k0�T�\r0�^{{ }S�;C�gy���i�����l����E����0@���w��8���\'�|�O(�������0@�� ԉ��7tP�q�����M �vU5�*�n�F��:�������\0�7�D��s�����7t*�,�{�R���&�〾�7$;���6��!s��\0�fP���c0�}CJ�sqҲ{cƕ;w�,�3g�������=�\\�����D���{�g�i~饗N�6m���b��!�&Zx�����7$����gee�Ta�����Z]�s�Y�Vce�\r6.�;eʔ�ѣG3g�46o�l���\Z�Ν3����7>��SC ��矿��/.,,�R`�gg&��}�o�	9�[�*U�1��X�\Z�}nJߨ\n2����7�ƍ3�����Xپ}�1a�EEE{�rHa�I\r7�x^#!}�o�i�VR��5nU�����I�%K��~�駍�K��l����M�B7�\0n�B��|#++khvv�W�����c�����ի��?��8s挙	Ξ=k�\0mذ�(++3���!�1i�	7UUU�5j�QSSc���Ç\r��F��;��\0}!ڄ�T���/�p3X���`3o�<s�J,444����g:��)\"�	7���X��WXXؘ�q6��p�����!�΍=��ݚD���tG��//Ȝ��s���6lX�z�=1@\n�Ft��LU�u��1�}�o��sc�*))i�J��:u�s��{^���&O��,sn�ɲe˚rrr6a���\"��O\"_�6֐�y��!&T���wn��{�qtr�=��E�}(?��o�5�ͳ�>[��CU ��p�:0��b	9�p�k����U�}�+r(�}�M��R����sr<����yn�P�T�cǎ�L��`�`�:��J����,�홓���7D\n8�t��	��`����tq��2������RPPP\'cxA�c��%�&�;!��#����X�M(�᪼��f�Y�o�\r�iA�<�\'K���ɓI�rt�����\\~a֬YF*)++�.�i���&[%\r�\01�d}�	1��xÍ���^�\\�r]�N��l��}C�Z�.�`n��k�%;\'�NbyA�-%�_H%7n<,�\n��V��R.�z�y&\nr:%n�\r��=���w�r�A��bׂum)s}UUURs����^�r���Ǐ�4����ի7|4��֔k��c����P��&R���C����=�o�\r�k��p���ߓ����m�#�� W��L�zrU� ���)W�y ��;�~�[��nb\Z.r�A��bׂ�&}߯C�#2n{�s	�R�ǋr�]a��UA��<��c:��y��N.��ϬǽP�i�E��J�R�r�������455�e@g�\\�c���;���r�J󟗤�e˖�Y��%K�>��!]9?_K^g���Q�;v������]:��JH\'�w(��2�:8�0��O��_Y�q�K\r�~;��ロur[���LзS[���1o/>УG�\r����]8P�Q�F5�z�_|�Y���8�)u��˛o�i~	����_|����uuu�}��g��Q߾}��C��P4w�\\㪫�j}�ڵk۬�֭�ѯ_?sYj��m�������xzY~�^C$�D���Dc���$r��!䜱B�[���p�n���Y�3E�Nm���։����c�]�RZ�����3�;����7g�ĉ�S}Պ+>	�QT���a�)��\0-Z��2�?~|��>�n{	A�N:=z;mzbr|�w�����%��L��z���/o\rQ�2MQ����{M��}���>w�Ν���o�}���ߡx;&Q�ͬ��QT񄜄�Y!��C=tuOkR5GU��F�=��:5�����Z�Y�o	����M7�v��{��������.�,X���ٳg����!-�(��_}V�σSRR�,@������r�f\"{Y�n�,/_��4.Y^�fM;S��˻v�2o?��#騙�G�5�766\Z����{t�����\\�\0%��̈́�{x]�vmF��A�k��;81}��D;�M�g<���p�h�n��vUS5��j\'d����z{�GBO^���֡����+�����k���]��������oHT�;��/����#G~��3����>�3�J�P��(!gӦM�]w�e�믿޼��9r�i<��9}�t���A͘1�\\C���&&�8Ñ�(y=7�=��[�����Ȳ�&-섈�A��$~�=L�H\nW	8�T��\n:�5�!(gG�G�9�� ��Y�#�]�t��f(�Y�_)g��ݻ�kW}C\"ș����T��877���3����Mյ�V�X1ϗ+�^�GJB���1i��1)���{[z�M�H���)鮍tpd�����v�=�����|���t�d�l��{﹚\'c���ɉ�ű��z�����G^������t��D\n8�fR�	Y�o�#+ˑ�����\Z)=�X��G�%Pע�z�!cƌiIA�!;;{W�nzR��զqis�d6��4	:���*c�ζt�(��8�n�n�zXMOr�\0��8���C��&��&������m=v��;�	4]C�O4�b��y�=<%�崖JKK�l#sdx���&O�8�=zt�4�Nү&�r�_�&�)**ڹt�Ҥ���#i,ι��q�GWD\n8��!-+�Ώ�^:8n�K��-���={�D������b�b��Z�`��U�\\�J<\'���x\'6\'+���p,��noP��z��-��������}��6G0�$e?UD�98����������طC�eg}̘1���_�q��TSS��p��D��q��zf�<U�������4����?�x버��%�Őa)	D��qm�zY&.G��8K����|Цä�@KJJ����2\\u�Ձ���o���������֕[�;��:�\'tqbq�u�\Z����P�#\"��*����AG��FwX�k�X�7x��N� \"��!G��S�N�ϻi�5/���������5�;vl}vv��L���=<mlѶ��g�xPJ�e�xh��̩ܓ\Zr�1��o9�Q�P��m#�ј�=IgV�-G��oH&YYYC��c��It�J����I�999����~ur�s#�F}0@\nL���wXB����:9��!G��H�Q����h)�Pl�s#�Լ �,77���ŋ��0��7ޘ-�R�!`��+^���aX\n}S�;:9�\Z�E��t�d�ҝ��W2%g(�#�y�#??�;�ٓS�d�M��ʢ���m۶5�s���+W�Wi�L��97 �F!\'�LGO(F��άNέ��������OH�>|x}ii�����Q	츾@�\\8S�-UQQ��I�&-W��QIa�x��|��a)�!iy�\n:-���rC��G[ע8$W��W��aɵ\"�tʙv�b̠�#�_H���7��/1� ��=\\�a�I-E�A��\00@0#:9K�o�\r\0 �Q!�p���7\0`�`F��2�\r�F�\0�b���̹1B\n���7\0`�`��#>�\0�\0�7�\0�M�o\0��\0}S�\0�0@@���\0)�7�\0@��\00@�7��0@\n�M�o\0��\0}S�\0�0@@��\00@\0}�o\0�\01@@��}`��B�\0 ����7\0Ha����7\0����J�\'}�2������7\0xdݺu����1�4���ڿ(�˷�7�\0��^��᪪�S_~�e&�q{vb~GT=���7�\0P���,�H�Tƈ���|�{1?@��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����h�n�Fr\0\0\0\0IEND�B`�',1),('5002',6,'source',NULL,'{\"resourceId\":\"5001\",\"properties\":{\"process_id\":\"leave\",\"name\":\"简单请假\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\",\"properties\":{\"overrideid\":\"\",\"name\":\"开起\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\"}],\"bounds\":{\"lowerRight\":{\"x\":120,\"y\":154},\"upperLeft\":{\"x\":90,\"y\":124}},\"dockers\":[]},{\"resourceId\":\"sid-9303BF19-09A3-4A06-922E-AD606B184621\",\"properties\":{\"overrideid\":\"\",\"name\":\"经理审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\"}],\"bounds\":{\"lowerRight\":{\"x\":272,\"y\":179},\"upperLeft\":{\"x\":172,\"y\":99}},\"dockers\":[]},{\"resourceId\":\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9303BF19-09A3-4A06-922E-AD606B184621\"}],\"bounds\":{\"lowerRight\":{\"x\":171.640625,\"y\":139},\"upperLeft\":{\"x\":120.625,\"y\":139}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9303BF19-09A3-4A06-922E-AD606B184621\"}},{\"resourceId\":\"sid-85402145-EF96-4306-917B-333141E9C7C3\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\"},{\"resourceId\":\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\"}],\"bounds\":{\"lowerRight\":{\"x\":357,\"y\":159},\"upperLeft\":{\"x\":317,\"y\":119}},\"dockers\":[]},{\"resourceId\":\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-85402145-EF96-4306-917B-333141E9C7C3\"}],\"bounds\":{\"lowerRight\":{\"x\":316.64844687000755,\"y\":139.4097335362338},\"upperLeft\":{\"x\":272.62889687999245,\"y\":139.2191727137662}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20.5,\"y\":20.5}],\"target\":{\"resourceId\":\"sid-85402145-EF96-4306-917B-333141E9C7C3\"}},{\"resourceId\":\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\",\"properties\":{\"overrideid\":\"\",\"name\":\"人事审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\"}],\"bounds\":{\"lowerRight\":{\"x\":520,\"y\":179},\"upperLeft\":{\"x\":420,\"y\":99}},\"dockers\":[]},{\"resourceId\":\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\",\"properties\":{\"overrideid\":\"\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":643,\"y\":153},\"upperLeft\":{\"x\":615,\"y\":125}},\"dockers\":[]},{\"resourceId\":\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"}],\"bounds\":{\"lowerRight\":{\"x\":614.3359375,\"y\":139},\"upperLeft\":{\"x\":520.6875,\"y\":139}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"}},{\"resourceId\":\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\",\"properties\":{\"overrideid\":\"\",\"name\":\"驳回\",\"documentation\":\"\",\"conditionsequenceflow\":\"${result==3}\",\"executionlisteners\":\"\",\"defaultflow\":false,\"showdiamondmarker\":false},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"}],\"bounds\":{\"lowerRight\":{\"x\":629,\"y\":124.25},\"upperLeft\":{\"x\":337.5,\"y\":69}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":337.5,\"y\":69},{\"x\":629,\"y\":69},{\"x\":14,\"y\":4}],\"target\":{\"resourceId\":\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"}},{\"resourceId\":\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\",\"properties\":{\"overrideid\":\"\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":true},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\"}],\"bounds\":{\"lowerRight\":{\"x\":419.3125071198955,\"y\":139.42591394196188},\"upperLeft\":{\"x\":357.1328053801045,\"y\":139.19127355803812}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('5003',5,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0M��\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0��\0\0u0\0\0�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0�\0\0��+\0\0 \0IDATx���	xT����3���*Œ�\n(�*�(T���V�Q��J-bAAAQ��U�&��l*?��,�j� �  $���so�I�:��|?�s���L&��3��=�\\c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���\n\0�p�����M/j@\0�����T���=\0���R\r\0�0�Z\0@a=G\0(Ee~��\0�!�MHHF5\0(-���e>�\rc3\0\0\0\0A-\0\0\0@P\0\0\0�\0\0��\0\0\0 �\0\0\0j\0\0\0�Z\0\0\0�\0\0\0�\0\0\0\0A-\0\0\0@P\0\0\0�Z\0\0\0��\0\0\0 �\0\0\0\n+�*\0P�=$�?�Y愔�T\062�\0ʲ�R2�(��DRM\0���(�~��5����~f�\0j  =-����f)=�\0 ��`2[�H�~CCv\0�cj\0\0����1ͤ�q=�NJw�\0j �| �=~��\0���R���zC��D�\n\0j P�`�f��Z��u\0\0A-\0��Q\0\Z��\0\0�օ*\0��G�A/+++f۶m����u;~�x�cǎ�dffR1E��x����FEE�;}���V�Z}���:�`��O���ώ�d)��\"hߴo��(1���u��������׬Y�h�T��	� DQI���@���#G��۷����݉\'��m�6TN��^�D)K9*�#)oJ�]��;4a��N��7�p�T�Վ;&%%\r�U�Vd\\\\��R�������S����Mll��]�v�5�=�PϞ=�N��}�����!e�����IyYJ)���1�����[ˍ�U���+�jhߴo�~�S� ��oҤ��S��H�g�6mZN:��+V��+D���R�3�!��^-����Y�o�7@P�=$�u����7���N��7�6M7?|�O����̎\r��#���bP�Bs�WV� c�ҥK/�I�\Z�򢔋�42�i��\Z���e�;W-hߴo��(>z�Hrr�z��������o�����<s�def��~6;��L�W�_���3���_	�g�}���fe�o��)QRVH��Z�}Ӿ�Z�X�Y�z҈*�ɡ�MƩc�<�`�T`1�[�nՈ��K�/_~]�-�l��4f2�q�\Z5��nrRƱ�iߴo �1���N�g@�6��D�\Z���\\t�E�v���A�\r��K)�l�+�es�JyN�M�;$a��?��iߴo ���EP�y*+W����YgN���,�,NիW�c�g��w��I�h�S{�I��ceZ�7� ���N���T���z�e�Wݘ��xJ�RٷIR�p��}Ӿ� �������w=�o�o��վ=l��}Ӿp:w������������?�~\"!!�L̋ǯBJd�r߃�&�9@о�\0���D-�\"�U�w����p����L�KZQA\0�z�f�Z\"7��\\|A-�*^�;S�z���tQ*�}!!++k�y9a/���RgN�8繌�G���\r�RP;�<�XS�x<���@�9u�ue��ߝ�ڱ�?��߶�@��]����H�z0�Et�N�}���A$u���&�ㇷ����&iݿ��_�.sZ�o xM�2%]n��5�sVV�+Wf��:a�5�����#+S�z9M]����E�mgb��о��#A�^<�G�g�����日� S������vxn����՛T @���-�\06��y	h��f�޽{W�AB33����̠�7�th��S|�v�,)KC���ڌ�Pjj׮��g�S�^=N��}�B�ץ�>��K���� S\0�0t��.�w�w��2dH/j���߿���?\"�$gff.\"�\0�iРAv��1����ѣ�y�\'¤c�Կ���\ZI���\\u)��\'�ER׾�; �������}�^2w��4�Z\0@�4C���<�o߾�W]u��\\ӦM5�\r?|��4?�zMؿKi�*����fR���6�r�J���]Ɯ\'\0��Y�y<��e�j ��{;wZ\'�u\\q��_�~V`ۧO����u���ҧl2ތ�Z)�}�_a/�)�̐r�����7�f~����������+�b=p�)���b�l��s�ƍ�ݻ�ٞ={�9r$\"==�DDDdU�T�tժUw���~!���\'���\0��III�֡��͉>?`���q����ѣG�iӦ�_�_�u�%�����˥ۏ�V3�5����:���AR�6\0]�v����q���E�=:�W�de�<�عs�M������\'̜9sA-�̾��{o�1����#~��ߙ֭[��/��H�{`F6P�ѣG�v��� 11���\r�߿��cǎ�x뭷&Q�@��]��:4c;p��ȱc���ٳ��S�N]\\_)���N��G)N��cm��������e����ɾm/�E)�X�@��ҥ�!ꓙ�y��Q9,�R_^�/���9sfL||�Jy<y֬Y3jQb֮]����?�zjjj�ltV�G���YN[-^x��Þ=z��l޼�����7z��=�СCwϝ;�\'j(^����w۶mS���{ހ����o�\Z3f��dI1-��j�5�J�TZ��P�P�~�[-�$F�@�������x{ky_k����>��Am)��+�>X6eʔ��y�F��)�͋v�R.]\Z7gΜoy�����G3�v@�;�6?��A�\"5��ܹs�ٳg��:�\Z�&ُSM�cc���M��ۓ5\r6�\r�{=33��9�.��rӲeKӨQ#S�JS�R%s��q���b���̺u�̆\r��ӧ�����m���GC1kKP[J�U��X�b�50�^zi�>�m۶&..�ܨQ�^���=iҤרe�h��t�N���4�u��7n��l��mm߿�<�-�;A3=:1{�!Kz@{��3$�\rw�YM��~����[_�˗�J�ڵ�\r7�`��/6��9s�.RQ����H`R�0f?(���?�5�i9�u\\r�%���g9��GɆڍZ���ڵk���-l@��#*�\r����������ϛ_g?��ɹ$0�q�:C��R\ZK�\"Ew���x\\\0��j�v��V@���ȑ#�$�ڜhW����:�̷C-^ ��3C+{K��۷o�7����2dH���ȉ���Q�@��\'�����\"�Hۜ#m����׸�\'��i]�e�2�a	ǌ73�����o�\'�������\r�	h7nl�\rvV`Z�>}�����R���?�Y��/C[\\Z_���=��w�}W\'b��Z�/�����ݣ�>zβ����Y;�:��O��9˽��k�,&ڑ<���ѣ�K\'ҡ�\'�鐃��O�_.���y\rdٷ�����~��l@��䌡�����1�E���w�\nnw�ܩO�Pݡ�)$���.\\8Y���1�%�]�v�*W�܀a@�i�V�y�\'��;\rj�3pu6�7�8��o�������~|��nݺY�Þ���^�\"$�,9�\0�\Z���:t�\\���Δ0�U�$��\0:m��z�k��E\rh݁�-v���*T��Z?�,mbbb\'�����޽{_ g�@������ںuk� `�!��\n�r����o6�j��~,��ٶm�Y�~�����7[�l�>�8\"\"���ƚ?��ܑ�<xp�,�PBcli�@���[O\n+쐃����u�]��7A-�M���/�D�����+����蘜\0����xԨQ#U��l_رcǀ�<�}�����s���ީS�r}mҤIy��,��w�Y�7oޜ���;�Rsr��dن�ur_),���{챳��\'N����ѣG�ĉ���L�#�<��4}�>���|cl��~���,��Ɵf͚U�v��_�e˖�����о�n5k�L���iz�0����wf:(	���J��\n�x��؛���mnV()W\\qž/��R/�96�����ht�I\Z}\'��4i�:�o�^�zʔ)��=g̘a\Z4h`]�b�̙�Z�j֡�iӦYW}��E<x0���F�܀�c��?Zc�5��1LO=���ܮ]�Lݺ���S�B+��)X��h6P�����fɒ%&**J/�a>��S뻕�\rU��n�\ru�m��ˇ���lCC���+�I�du:-��κ~���͑#G���C��_�iذ�yw<\r\Ztf̘1�����t_�����7F�v/K��ߴ}k;�W�^����Gg���kמ�꜠\Z�&$$Xm��\rg�˶�U�BWiGd��/��ͫ-ؗ����]ra*N:�J�6���2^ �\r@{��m�A�?�lٲ�l���F����<>==��4��Ҡ�J�-Z�re�]�^�*�t�Y�b�f̬�ʚ5�^�zv@�4؍��3�-2:t���4�\0��o���Nʡ��e�]��Q���/�r���ˬZ���\\������n��g�3�ԩcuxJ%�����^���z:&��\\ن��k��������R����o�\'����=����GU��N�:�����8p`�رcߕ����[�j���[���reYX7��~�N\n�M�v� t�֭V[�+<Z?^+Zs�����׿Ҿ��X�9���]�w��)s��߶ ������^[�_H?��C�@P���S^�\0�԰aC͆6�����4�kԨqT\Z�N�fidx��g�y�>|�:	�y��F���ajup�i\0�гS�P�.����ځ}��7ٝSN�;k���3݊NߢYb�����������Ͽ��;�ws��֠k����2e93�Q5k�<(��r�s@3�v@[�+��=�b̘1��1��V3?��Y��G��\n�N=zt���xT�ޑ�k),�uSZ�=k{ʋ3�M�6f�����f͚��?��j���r��#�������e�Nֶ �C3W?^�_�~���͂�R	j��ȑ#�����ӧ/�F�!�eX0֙4�J���ꏾ�[3��04˪�v�W�6����9y�5=ӄ	�ΧO�>��[o�)Ԭ��)j�N��z��N�V�S�L�fh^x��U:�N3��Y�L=�-�Nv6H�~���e������,�g\r2�o^rr�5�\"���j��\0��~����;w��Ga����&z�I�Jͤ��-Z�3�6mZqРA�$��%����Ϲ.�<�Y�V�ER�kC�g�u���Kw@u�������o������W;��W^y�r�o�fp��������Q.I>�_�����s��_40��P��!R�\r5����%�뮳�8�|�:)L���̛o�i��A�4:�Nj`�?������Q)\r�5��ۚ5k�����ZV_�����5U�vn��sO�{��$CXT��nܸ���%���:ֹ(W\n��w�s�Ns�}��3�5kV�N�:Gv���5���d�ۚ���_�ۗ�s*�;���.�����p�����fZi�(&�cM�k\Z���lS1�^q�~�%��ǟ���^�<o޼*�Y<@U���L�J�����ڢE������6m��Q�\\4@�=�d�����>;���Q4��韴���y�L��8i�妝���MLL���~��wO!���vj��پ��.��O�t�MV�,�s�\r�8m�V��{+W�дi�B_1LW���d����߷��zܿ{�n=�dfN�Z���un��S��u#�_�G+�g�H�ذ4��\'�|b��דu�a�Ϋ�{�6g&}N�b\r<gϞm��Ҿ�϶p�n�}���V`�\'�d`략E�{���Ill�i	r��G�_\"##I�HOHH(��l]�ݸ��6L���\n��e�`���{�ᇳ��=���\Z��JǎϺ�`�������s���y�����j��KЙ4�u��cr��qgr��39�Z���O<���֠��/��=����\'�|rX�lC9lS�lC���!C�\Z?~�����CtNZ;�Nߤ\'�:�u_�!\ZЎ3��|f��fApHдQ����x��y�M���Ҁ�4۷����B�v�mTg,q_�QOtvrzh^�s��~���n���+��������uc\n�w��j���[��r�Vr�$�Z��#��,�~R�J��#�ȟA�-[~־6��E�FOKC��;:�ӌ��H�˕+�B:����b�us��ѠT�T�=	��j�}�f}4�ѽ`=�Z30ڑ����3�s��h\'�c7�G3�:>���W_�urJu�m�^�ӯ_�S\'N�\'�����j������Y��mjj�u��fk�Y��d�K/��m����`:iL�y��}��ɠ/��b�����}��V�����|i�YP4��v�\'~)]׺�u�g�\0��]��ʹ����	�79A�ζQ�^pso_bA-�%66v���5jٲ����_|�=�\0��0;���=O�b��_�Xj�fԨQ��H�s4����+�Y\\=D����o��=��3�����Nߣ˻��$w&\'�l��mo�D`e	5;4�|�����v��A*�x� d�\rM�0a�����΂��{�u�N�L�Y/��ٓ}51��3g��ի�y?O����Ǐ�)@@����v��y}�Z��#��Kx �oǈ#�#/���o���@v���ָz��D��8mRۧ�=m�\Z����`W��9]x��\r[TA~�d�u��:g�uBj^	����wY�MP�\'�\'?r����9s&�O`H��,θ.�H�p�ܬ�����\'%���z��3��|`J��L��:��jԨau�N��/u�s�Pi������s��]�!=�9��3��N���%\'k��cj�P�+ɽ�Pۆ4��ӧO�W^ye��?�W��W����j˕+ge��\Z����\0DO�Ա�yMǣCƎ[Y\'e�o@��7���t�uS�4�WӀQw6}i��IOtvV����Ҭ`��3�/����8�w�T�� }�B���]�������t���_��/g|��`�o���0৮]���{�˖-�)?��$$$�Hu��Ö=�$i��\n��Y�|y��H�0�6KB���9o��6O0mC9�ԩS�����O<�DTn�sذa���:E9��գ/:]��ѣ�3m�ugg�ȑ9^E�C+w{Κ5ka�l�e�};[�7J�-�����z����u�fc[h�Ba������ԧ�M�6�(�lm�ԩS/��R�Ձ4�l	9�/���9s欐N��ĉ���7�7�ձ�z��	h���\'ұ�:O����`G���4o��m/��2�nUA��E��w��^�b�zin��+�,�����fgi%^x3$�%���L�<ynZZ�w�����c�Η��޽{�u f͚���ɓ�M�0!]�e�!��X�p� �p_&Y�����q�z�pڴi���fh5����C-�P��Gzg���T��?����!T/�����r��kB%^ S�g����,X���ƍ�sOS\\�l����_}��u�>�/�	�J`۩S��Ǎ�a�~�����X!ϟ��:!�����w�m\0��=!����*�K��2ŗ� g�޽�9\\�&��_B%^ S�g			I�N���l�ǋ������ߨQ���:H:��Q�@��P��\'Oޭ[�A,�)�4�?~|�9 ���x!++��ܵN�#[���Ё���\r:�̖-[��IK��h(���`ƌ3����>��3iz�kq�����/>s�̿d�A-�؞,j`�9��ك!\0\nB~3tX�_��V3�O?���9s��r���IaO=��;C�33<j�B8�L� tc�F���Y�������K/�4��\'8۫t�	���\"�3r�j(�[�=��	:zU��ӧ��e4����nmҤɆu��uhذaX͚5�@5C;n�8kȁt*��оi�(����M�[��6�\'F/�����Ό,z��:�1�#�:/�u:�L�=ӫ�9Z�/�w(���-�=�����s�̙���7�ݻwl��������˗/_8mڴF�A7�1�9\0���ҥK��c���߿��W_��S��\'�1�\0@q��׿�L��\'���8�K6���C�F�Іj�@P[�ť��A6���|4**ꊸ���Z�Y�e�\0\0�IDAT�ؠA���U����*�8qbJJJ��~��5k����ƲAו���o߾��\\`۩S�{Ǐ�P[���֙�֞���@q��i� �io	n[ �[#er�������<�u�ڵ��͛شiӍ���9FJe)zi�W�)��8��cl5�}饗H`{�E�r[V/}�W\n��]C�$��q~@�[\'^�i�\Z7$K�d����WV���\03s��]�{=�	�X�m�.]:�?~����\\u�U���س蘷��t�0\0����\0 �t(BFFF�q��y���#��ܳ�\0A-\04��J`{��	<�֭;���1�9\0P:KqO�G�G��}K�J�GP�~+����z&�\r���w�����lw=������XuL��v��SR.v=~^��XA��-�\rT�ww���l�7ȇ��.�Ϻ�`6UJC{C�4���z�U\n�	~l�t��y���{<�;��\0@	j&��Mx��~.SJ})�\\c�\rz�ү�ḽ�1W0\\C��C��jK�j�����RVH�h�������4^�������N��t�m�^�.�2eJ\n���h�����;�`����k��x�7f�P�8�~m{9�KJ�����6���s��{a7o&�ٰ�\0�Z\0%,�L��2�x�Z��@���\Z�Q�����\nt���_�-Am��x����TJ=;�Ս���W�^�0���J�I)7H��ޘ����?T)\0\0!GgZ��+��c����`��h�Ev��o��P�(����]�����xz�:����(;��c?k�q9C~�J\0I3�,�r��Ud~Mf�����\Zz��ftw�QߏL�\'�8d��m^��\rS���>�7�\Z\0Im��j�z�w��5��L�V��?�2B�\0��.3JʉP�$2��O��ؓ����%��&��n�+��0�����*\0 dT��Sn���h��>)m��c|�ס���_T:+�[�;lA�Iv`LP�b����������c���s�>��\0 �h�j�9{ƣ]vp�t��5�\0Xc���eOٷ�ͽӎ#��bEԖ�WK)/KIw=_��:Ӂ���A�}���R���_�}��m���\0\0 �}�����4)����>�>亯�%��Z������(�����W|��亯�tCf\0\0�_fY�G9Q\0\0\0��_7ذ����L*\"v�33����hߴo��(����_�=JE�Ç\'����\0�o�7@P�Gdd���T*\"\0�۷O��YIM��M�j�JOO�w���YYYTF�J:t�N3��\0��\r�t��7���={�P�(11q���=��v�Zj�o�7@PBzzz�����G��2JAJJ����;33�?��7��T�͌3��w������+W�M����۲e�����~��k�оi�\0A-PӦM�ڭ[�����W~����Ɩ�[*��$%&&�MJJ�U;�6m�,�J@��}��_	��K�ƅ������/�U�z�Z�+W�)�Q9E��T�>z��4�c���d۶m�оi�\0A-P�-[����t������C��N���T��2��F@��}\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��F�骳��\0\0\0\0IEND�B`�',NULL),('5013',1,'简单请假.bpmn20.xml','5012','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"leave\" name=\"简单请假\" isExecutable=\"true\">\n    <startEvent id=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" name=\"开起\"/>\n    <userTask id=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" name=\"经理审批\"/>\n    <sequenceFlow id=\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\" sourceRef=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" targetRef=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\"/>\n    <exclusiveGateway id=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" default=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\"/>\n    <sequenceFlow id=\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\" sourceRef=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" targetRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\"/>\n    <userTask id=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" name=\"人事审批\"/>\n    <endEvent id=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\" name=\"结束\"/>\n    <sequenceFlow id=\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\" sourceRef=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" targetRef=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"/>\n    <sequenceFlow id=\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\" name=\"驳回\" sourceRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" targetRef=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${result==3}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\" name=\"同意\" sourceRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" targetRef=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" id=\"BPMNShape_sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"90.0\" y=\"124.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" id=\"BPMNShape_sid-9303BF19-09A3-4A06-922E-AD606B184621\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"172.0\" y=\"99.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" id=\"BPMNShape_sid-85402145-EF96-4306-917B-333141E9C7C3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"317.0\" y=\"119.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" id=\"BPMNShape_sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"99.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\" id=\"BPMNShape_sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"615.0\" y=\"125.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\" id=\"BPMNEdge_sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\">\n        <omgdi:waypoint x=\"356.5719696969697\" y=\"139.4280303030303\"/>\n        <omgdi:waypoint x=\"420.0\" y=\"139.18867924528303\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\" id=\"BPMNEdge_sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\">\n        <omgdi:waypoint x=\"272.0\" y=\"139.2164502164502\"/>\n        <omgdi:waypoint x=\"317.4130434782609\" y=\"139.41304347826087\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\" id=\"BPMNEdge_sid-517A0CBE-25A5-49A2-B197-0850747E8041\">\n        <omgdi:waypoint x=\"337.5\" y=\"119.5\"/>\n        <omgdi:waypoint x=\"337.5\" y=\"69.0\"/>\n        <omgdi:waypoint x=\"629.0\" y=\"69.0\"/>\n        <omgdi:waypoint x=\"629.0\" y=\"115.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\" id=\"BPMNEdge_sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\">\n        <omgdi:waypoint x=\"520.0\" y=\"139.0\"/>\n        <omgdi:waypoint x=\"615.0\" y=\"139.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\" id=\"BPMNEdge_sid-6960AC02-AE8C-4579-B007-9805DF708A4E\">\n        <omgdi:waypoint x=\"120.0\" y=\"139.0\"/>\n        <omgdi:waypoint x=\"172.0\" y=\"139.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5014',1,'简单请假.leave.png','5012','�PNG\r\n\Z\n\0\0\0\rIHDR\0\08\0\0\0}\0\0\0�\0\0\0aIDATx��}p��O�K})��XƗ:��Ʊv(c�0+�W&��D&Q��2� cP4*�tp�E��(E$o-�\0��PބH�\0�`�}~�>q��{ݽ��������n�r��}����yv7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�K��C�\ZEQ�R�2\0�p��g�VU�j��ߪڥ�׶��m��K՟��i�������G\0\0\n�7���P�Y��Wդ�c[��&�Ϲ���\0`(�.�B�bUo��d�>�F;B�,wW�S�_C;7r;���\0`(�N��\"���:��:k]\'+�8����M�\nG�\"��G\0\0\n�[�ɷnת�b*�C;;΀3DUm�bG�l~\0��@:q�#���Lg��`���I��;U�&��G\0\0\n�?]�X,!��P����t��L2�\007X�f�6Ϻ�ö�U�B�����K��#~\0��@��c�9\'�O]c=~���x�,��3�����\0\00\0��\0\0C�P\0\0?\0\0\0?\0\0\0?\0\0�#\0\0\0�#\0\0\0�#\0�P\0\0�#\0�P\0\0�#\0�P\0\0�#\0�P\0\0?\0�P\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0�#\0\0\0�#\0�P\0\0�#\0�P\0\0�#\0�P\0\0���0��\\�y���*++�U�VQ)���\ncݺu�S��7CA���#�1���j����hnn�:�N�8a�]���2�\'0}�o���#�g����	6�=��\n����7�G�i[c>�S�\0[0}�o���#2F��\Z\n����7�G�\"���q�������fɲ<�ia�\n���7~�4�ƆZc׊�Ǝe�ڔ<&�0.CA��Ə pxt�?ڙ��c��b\\ ���)�A�p�ia\rP�a\\ ���)�A�pתIa\rP�a\\ ���)�Ha�\n�F߀AG�U�\0eƅb(�B���\0�ox7��:��P�7���#����i�ZYҾ}��u���o\n}�G8�:�un;��0-CA��Ə ���7���l߾V��:��P�7���#�ʙLk6�;F/�8�)���o\n}g��,��R[���n�j���������t�6�-{{ }S�;��s���H\'++k0�T�\r0�^{{ }S�;C�gy���i�����l����E����0@���w��8���\'�|�O(�������0@�� ԉ��7tP�q�����M �vU5�*�n�F��:�������\0�7�D��s�����7t*�,�{�R���&�〾�7$;���6��!s��\0�fP���c0�}CJ�sqҲ{cƕ;w�,�3g�������=�\\�����D���{�g�i~饗N�6m���b��!�&Zx�����7$����gee�Ta�����Z]�s�Y�Vce�\r6.�;eʔ�ѣG3g�46o�l���\Z�Ν3����7>��SC ��矿��/.,,�R`�gg&��}�o�	9�[�*U�1��X�\Z�}nJߨ\n2����7�ƍ3�����Xپ}�1a�EEE{�rHa�I\r7�x^#!}�o�i�VR��5nU�����I�%K��~�駍�K��l����M�B7�\0n�B��|#++khvv�W�����c�����ի��?��8s挙	Ξ=k�\0mذ�(++3���!�1i�	7UUU�5j�QSSc���Ç\r��F��;��\0}!ڄ�T���/�p3X���`3o�<s�J,444����g:��)\"�	7���X��WXXؘ�q6��p�����!�΍=��ݚD���tG��//Ȝ��s���6lX�z�=1@\n�Ft��LU�u��1�}�o��sc�*))i�J��:u�s��{^���&O��,sn�ɲe˚rrr6a���\"��O\"_�6֐�y��!&T���wn��{�qtr�=��E�}(?��o�5�ͳ�>[��CU ��p�:0��b	9�p�k����U�}�+r(�}�M��R����sr<����yn�P�T�cǎ�L��`�`�:��J����,�홓���7D\n8�t��	��`����tq��2������RPPP\'cxA�c��%�&�;!��#����X�M(�᪼��f�Y�o�\r�iA�<�\'K���ɓI�rt�����\\~a֬YF*)++�.�i���&[%\r�\01�d}�	1��xÍ���^�\\�r]�N��l��}C�Z�.�`n��k�%;\'�NbyA�-%�_H%7n<,�\n��V��R.�z�y&\nr:%n�\r��=���w�r�A��bׂum)s}UUURs����^�r���Ǐ�4����ի7|4��֔k��c����P��&R���C����=�o�\r�k��p���ߓ����m�#�� W��L�zrU� ���)W�y ��;�~�[��nb\Z.r�A��bׂ�&}߯C�#2n{�s	�R�ǋr�]a��UA��<��c:��y��N.��ϬǽP�i�E��J�R�r�������455�e@g�\\�c���;���r�J󟗤�e˖�Y��%K�>��!]9?_K^g���Q�;v������]:��JH\'�w(��2�:8�0��O��_Y�q�K\r�~;��ロur[���LзS[���1o/>УG�\r����]8P�Q�F5�z�_|�Y���8�)u��˛o�i~	����_|����uuu�}��g��Q߾}��C��P4w�\\㪫�j}�ڵk۬�֭�ѯ_?sYj��m�������xzY~�^C$�D���Dc���$r��!䜱B�[���p�n���Y�3E�Nm���։����c�]�RZ�����3�;����7g�ĉ�S}Պ+>	�QT���a�)��\0-Z��2�?~|��>�n{	A�N:=z;mzbr|�w�����%��L��z���/o\rQ�2MQ����{M��}���>w�Ν���o�}���ߡx;&Q�ͬ��QT񄜄�Y!��C=tuOkR5GU��F�=��:5�����Z�Y�o	����M7�v��{��������.�,X���ٳg����!-�(��_}V�σSRR�,@������r�f\"{Y�n�,/_��4.Y^�fM;S��˻v�2o?��#騙�G�5�766\Z����{t�����\\�\0%��̈́�{x]�vmF��A�k��;81}��D;�M�g<���p�h�n��vUS5��j\'d����z{�GBO^���֡����+�����k���]��������oHT�;��/����#G~��3����>�3�J�P��(!gӦM�]w�e�믿޼��9r�i<��9}�t���A͘1�\\C���&&�8Ñ�(y=7�=��[�����Ȳ�&-섈�A��$~�=L�H\nW	8�T��\n:�5�!(gG�G�9�� ��Y�#�]�t��f(�Y�_)g��ݻ�kW}C\"ș����T��877���3����Mյ�V�X1ϗ+�^�GJB���1i��1)���{[z�M�H���)鮍tpd�����v�=�����|���t�d�l��{﹚\'c���ɉ�ű��z�����G^������t��D\n8�fR�	Y�o�#+ˑ�����\Z)=�X��G�%Pע�z�!cƌiIA�!;;{W�nzR��զqis�d6��4	:���*c�ζt�(��8�n�n�zXMOr�\0��8���C��&��&������m=v��;�	4]C�O4�b��y�=<%�崖JKK�l#sdx���&O�8�=zt�4�Nү&�r�_�&�)**ڹt�Ҥ���#i,ι��q�GWD\n8��!-+�Ώ�^:8n�K��-���={�D������b�b��Z�`��U�\\�J<\'���x\'6\'+���p,��noP��z��-��������}��6G0�$e?UD�98����������طC�eg}̘1���_�q��TSS��p��D��q��zf�<U�������4����?�x버��%�Őa)	D��qm�zY&.G��8K����|Цä�@KJJ����2\\u�Ձ���o���������֕[�;��:�\'tqbq�u�\Z����P�#\"��*����AG��FwX�k�X�7x��N� \"��!G��S�N�ϻi�5/���������5�;vl}vv��L���=<mlѶ��g�xPJ�e�xh��̩ܓ\Zr�1��o9�Q�P��m#�ј�=IgV�-G��oH&YYYC��c��It�J����I�999����~ur�s#�F}0@\nL���wXB����:9��!G��H�Q����h)�Pl�s#�Լ �,77���ŋ��0��7ޘ-�R�!`��+^���aX\n}S�;:9�\Z�E��t�d�ҝ��W2%g(�#�y�#??�;�ٓS�d�M��ʢ���m۶5�s���+W�Wi�L��97 �F!\'�LGO(F��άNέ��������OH�>|x}ii�����Q	츾@�\\8S�-UQQ��I�&-W��QIa�x��|��a)�!iy�\n:-���rC��G[ע8$W��W��aɵ\"�tʙv�b̠�#�_H���7��/1� ��=\\�a�I-E�A��\00@0#:9K�o�\r\0 �Q!�p���7\0`�`F��2�\r�F�\0�b���̹1B\n���7\0`�`��#>�\0�\0�7�\0�M�o\0��\0}S�\0�0@@���\0)�7�\0@��\00@�7��0@\n�M�o\0��\0}S�\0�0@@��\00@\0}�o\0�\01@@��}`��B�\0 ����7\0Ha����7\0����J�\'}�2������7\0xdݺu����1�4���ڿ(�˷�7�\0��^��᪪�S_~�e&�q{vb~GT=���7�\0P���,�H�Tƈ���|�{1?@��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����h�n�Fr\0\0\0\0IEND�B`�',1);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','30001',13),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

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
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20003','leave:2:12504','20001','20001','sid-B08433FD-66AF-4E93-ACA0-E82871E25B72',NULL,NULL,'开起','startEvent',NULL,'2020-10-12 09:33:31.826','2020-10-12 09:33:31.835',9,''),('20005','leave:2:12504','20001','20001','sid-9303BF19-09A3-4A06-922E-AD606B184621','20006',NULL,'经理审批','userTask',NULL,'2020-10-12 09:33:31.836','2020-10-12 11:19:05.245',6333409,''),('22502','leave:2:12504','20001','20001','sid-85402145-EF96-4306-917B-333141E9C7C3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-10-12 11:19:05.246','2020-10-12 11:19:05.257',11,''),('22503','leave:2:12504','20001','20001','sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD','22504',NULL,'人事审批','userTask',NULL,'2020-10-12 11:19:05.257','2020-10-12 11:45:34.893',1589636,''),('25001','leave:2:12504','20001','20001','sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C',NULL,NULL,'结束','endEvent',NULL,'2020-10-12 11:45:34.900','2020-10-12 11:45:34.900',0,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

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

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

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

/*Data for the table `act_hi_comment` */

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('20009','event','2020-10-12 09:33:31.890','1','20006',NULL,'AddUserLink','2_|_candidate',NULL),('22507','event','2020-10-12 11:19:05.300',NULL,'22504',NULL,'AddUserLink','5_|_candidate',NULL);

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

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

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

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

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('20002',NULL,'starter','1',NULL,'20001'),('20007',NULL,'candidate','2','20006',NULL),('20008',NULL,'participant','2',NULL,'20001'),('22505',NULL,'candidate','5','22504',NULL),('22506',NULL,'participant','5',NULL,'20001');

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

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

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('20001','20001','1','leave:2:12504','2020-10-12 09:33:31.826','2020-10-12 11:45:34.901',7923075,'1','sid-B08433FD-66AF-4E93-ACA0-E82871E25B72','sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C',NULL,NULL,'','请假');

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

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

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('20006','leave:2:12504','sid-9303BF19-09A3-4A06-922E-AD606B184621','20001','20001','经理审批',NULL,NULL,NULL,NULL,'2020-10-12 09:33:31.838',NULL,'2020-10-12 11:19:05.235',6333397,'completed',50,NULL,NULL,NULL,''),('22504','leave:2:12504','sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD','20001','20001','人事审批',NULL,NULL,NULL,NULL,'2020-10-12 11:19:05.257',NULL,'2020-10-12 11:45:34.885',1589628,'completed',50,NULL,NULL,NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

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

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('20004','20001','20001',NULL,'duration','double',1,NULL,984,NULL,NULL,NULL,'2020-10-12 09:33:31.827','2020-10-12 11:45:34.902'),('22501','20001','20001',NULL,'result','integer',1,NULL,NULL,3,'3',NULL,'2020-10-12 11:19:05.157','2020-10-12 11:45:34.902');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

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

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

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

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('12501','简单请假',NULL,'','2020-10-10 11:25:56.052'),('5012','简单请假',NULL,'','2020-09-22 15:49:46.801');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

insert  into `act_re_model`(`ID_`,`REV_`,`NAME_`,`KEY_`,`CATEGORY_`,`CREATE_TIME_`,`LAST_UPDATE_TIME_`,`VERSION_`,`META_INFO_`,`DEPLOYMENT_ID_`,`EDITOR_SOURCE_VALUE_ID_`,`EDITOR_SOURCE_EXTRA_VALUE_ID_`,`TENANT_ID_`) values ('5001',12,'简单请假','process',NULL,'2020-09-22 15:27:08.421','2020-10-10 11:25:56.264',1,'{\"name\":\"简单请假\",\"description\":\"\",\"revision\":1}','12501','5002','5003','');

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

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
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('leave:1:5015',3,'http://www.activiti.org/processdef','简单请假','leave',1,'5012','简单请假.bpmn20.xml','简单请假.leave.png',NULL,0,1,1,''),('leave:2:12504',1,'http://www.activiti.org/processdef','简单请假','leave',2,'12501','简单请假.bpmn20.xml','简单请假.leave.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

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
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

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
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

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
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

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
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

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
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `biz_audit` */

DROP TABLE IF EXISTS `biz_audit`;

CREATE TABLE `biz_audit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_id` varchar(255) NOT NULL COMMENT '任务编号',
  `result` tinyint(3) unsigned NOT NULL COMMENT '审核结果 2通过 3驳回',
  `comment` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `proc_name` varchar(255) NOT NULL COMMENT '流程名称',
  `proc_def_key` varchar(255) NOT NULL DEFAULT '' COMMENT '路由 流程定义key',
  `applyer` varchar(255) DEFAULT NULL COMMENT '申请人',
  `auditor` varchar(255) DEFAULT NULL COMMENT '审批人',
  `auditor_id` bigint(20) unsigned NOT NULL COMMENT '审批人编号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `del_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='业务审核记录';

/*Data for the table `biz_audit` */

insert  into `biz_audit`(`id`,`task_id`,`result`,`comment`,`proc_name`,`proc_def_key`,`applyer`,`auditor`,`auditor_id`,`create_time`,`del_flag`) values (1,'20006',2,'通过1','简单请假','leave','超级管理员','海啦-ceam',2,'2020-10-12 11:19:05','\0'),(2,'22504',3,NULL,'简单请假','leave','超级管理员','李四-lisi',5,'2020-10-12 11:45:34','\0');

/*Table structure for table `biz_business` */

DROP TABLE IF EXISTS `biz_business`;

CREATE TABLE `biz_business` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `proc_def_id` varchar(255) DEFAULT NULL COMMENT '流程定义编号',
  `proc_def_key` varchar(255) DEFAULT NULL COMMENT '流程定义key 路由标记',
  `proc_inst_id` varchar(255) DEFAULT NULL COMMENT '流程实例编号',
  `proc_name` varchar(255) DEFAULT NULL COMMENT '流程名称',
  `current_task` varchar(255) DEFAULT NULL COMMENT '当前任务节点名称',
  `result` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '结果状态  1处理中 2通过 3驳回',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1处理中 2结束',
  `table_id` varchar(255) DEFAULT NULL COMMENT '关联表id',
  `title` varchar(255) DEFAULT NULL COMMENT '申请标题',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建用户id',
  `applyer` varchar(255) DEFAULT NULL COMMENT '申请人',
  `apply_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_business` */

insert  into `biz_business`(`id`,`proc_def_id`,`proc_def_key`,`proc_inst_id`,`proc_name`,`current_task`,`result`,`status`,`table_id`,`title`,`user_id`,`applyer`,`apply_time`,`del_flag`) values (1,'leave:2:12504','leave','20001','简单请假','审批结束',3,2,'1','请假',1,'超级管理员','2020-10-12 09:33:32','\0');

/*Table structure for table `biz_leave` */

DROP TABLE IF EXISTS `biz_leave`;

CREATE TABLE `biz_leave` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `duration` double(11,2) DEFAULT NULL COMMENT '时长(小时)',
  `type` tinyint(3) DEFAULT NULL COMMENT '请假类型',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '删除标记',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='请假';

/*Data for the table `biz_leave` */

insert  into `biz_leave`(`id`,`title`,`description`,`start_date`,`end_date`,`duration`,`type`,`del_flag`,`create_time`) values (1,'请假','yy','2020-10-08 09:33:00','2020-11-18 09:33:00',984.00,1,'\0',NULL);

/*Table structure for table `biz_node` */

DROP TABLE IF EXISTS `biz_node`;

CREATE TABLE `biz_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` varchar(255) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `auditor` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `biz_node` */

insert  into `biz_node`(`id`,`node_id`,`type`,`auditor`) values (1,'sid-9303BF19-09A3-4A06-922E-AD606B184621',3,2),(2,'sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD',3,5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
