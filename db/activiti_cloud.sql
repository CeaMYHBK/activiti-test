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

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('12502',1,'ÁÆÄÂçïËØ∑ÂÅá.bpmn20.xml','12501','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"leave\" name=\"ÁÆÄÂçïËØ∑ÂÅá\" isExecutable=\"true\">\n    <startEvent id=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" name=\"ÂºÄËµ∑\"/>\n    <userTask id=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" name=\"ÁªèÁêÜÂÆ°Êâπ\"/>\n    <sequenceFlow id=\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\" sourceRef=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" targetRef=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\"/>\n    <exclusiveGateway id=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" default=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\"/>\n    <sequenceFlow id=\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\" sourceRef=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" targetRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\"/>\n    <userTask id=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" name=\"‰∫∫‰∫ãÂÆ°Êâπ\"/>\n    <endEvent id=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\" name=\"ÁªìÊùü\"/>\n    <sequenceFlow id=\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\" sourceRef=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" targetRef=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"/>\n    <sequenceFlow id=\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\" name=\"È©≥Âõû\" sourceRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" targetRef=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${result==3}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\" name=\"ÂêåÊÑè\" sourceRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" targetRef=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" id=\"BPMNShape_sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"90.0\" y=\"124.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" id=\"BPMNShape_sid-9303BF19-09A3-4A06-922E-AD606B184621\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"172.0\" y=\"99.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" id=\"BPMNShape_sid-85402145-EF96-4306-917B-333141E9C7C3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"317.0\" y=\"119.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" id=\"BPMNShape_sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"99.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\" id=\"BPMNShape_sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"615.0\" y=\"125.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\" id=\"BPMNEdge_sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\">\n        <omgdi:waypoint x=\"356.5719696969697\" y=\"139.4280303030303\"/>\n        <omgdi:waypoint x=\"420.0\" y=\"139.18867924528303\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\" id=\"BPMNEdge_sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\">\n        <omgdi:waypoint x=\"272.0\" y=\"139.2164502164502\"/>\n        <omgdi:waypoint x=\"317.4130434782609\" y=\"139.41304347826087\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\" id=\"BPMNEdge_sid-517A0CBE-25A5-49A2-B197-0850747E8041\">\n        <omgdi:waypoint x=\"337.5\" y=\"119.5\"/>\n        <omgdi:waypoint x=\"337.5\" y=\"69.0\"/>\n        <omgdi:waypoint x=\"629.0\" y=\"69.0\"/>\n        <omgdi:waypoint x=\"629.0\" y=\"115.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\" id=\"BPMNEdge_sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\">\n        <omgdi:waypoint x=\"520.0\" y=\"139.0\"/>\n        <omgdi:waypoint x=\"615.0\" y=\"139.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\" id=\"BPMNEdge_sid-6960AC02-AE8C-4579-B007-9805DF708A4E\">\n        <omgdi:waypoint x=\"120.0\" y=\"139.0\"/>\n        <omgdi:waypoint x=\"172.0\" y=\"139.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('12503',1,'ÁÆÄÂçïËØ∑ÂÅá.leave.png','12501','âPNG\r\n\Z\n\0\0\0\rIHDR\0\08\0\0\0}\0\0\0Ø\0\0\0aIDATx⁄Ìù}pÂ«OÎK})£√X∆ó:î·∆±v(cÍ0+÷W&ò¬D&Qä¨2° cP4*Œtp®E©•(E$o-»\0ÂÕPﬁÑH≈\0ë`≤}~À>q≥Ÿ{›ΩÀÌÒ˘Ã¸Êˆn˜róÀ}ø˘ÓÔyv7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÄKì°Cá\ZEQÈR∏2\0¯p¯¿gÆVUÆj†™ﬂ™⁄•Í◊∂ıÚùõmªﬂK’ü≠öi´Å÷Û¯é‚G\0\0\n§7´˙ÅPˆYèıW’§Íàc[˘˛&ÃœπÜÄÉ\0`(ê.µBÀbUo©Ídï>™F;Bã,wW’S’_C;7r;ùÄÉ\0`(êNË–\"∑∑´:°Í:k]\'+Ë8∑≠±ÇM»\nGˇ\"‡‡G\0\0\n§[¿…∑n◊™Íb*ÁC;;ŒÄ3DUmËbG—l~\0Ä°@:qã#¿Ù¥LgÎ˛`óÄ≥I’Î±;Uı&‡‡G\0\0\n§?]úX,!•èP∫ÿ¬ t«ˆL2¸\007XÂfÎ6œ∫Ω√∂ÕU´Bá¶úáâKßÁ#~\0Ä°@∫êcÖ9\'éO]c=~ãı¯xÎæ,˜Û3Æ—¡¡è\0\00\0¿è\0\0C¡P\0\0?\0\0\0?\0\0\0?\0\0#\0\0\0#\0\0\0#\0¿P\0\0#\0¿P\0\0#\0¿P\0\0#\0¿P\0\0?\0¿P\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0#\0\0\0#\0¿P\0\0#\0¿P\0\0#\0¿P\0\0£Ãƒ0åŒ\\∞yÛÊÔ*++çU´VQ)Æää\nc›∫uˇSïÀ7CAﬂË#1øÍÍj£ææﬁhnn¶:®Nú8a¨]ªˆ¥2√\'0}£o¿è¿#≤gá˘•ç	6´=æΩ\nÜÇæ—7‡G‡i[c>ÈS \0[0}£o¿è¿#2FåÒ§ï\Z\nÜÇæ—7‡Gê\"¸˙‘q„‡ñŸ∆Óä…f…≤<ÜiaÄ\n˙¶–7~Å4¿∆ÜZc◊äâ∆ée„⁄î<&Î0.CAﬂ˙∆è pxt˜?⁄ôüÆcªób\\ ÜÇæ)ÙçApÔöia\rP÷a\\ ÜÇæ)ÙçA‡p◊™Ia\rP÷a\\ ÜÇæ)ÙçHaÄ\n˙FﬂÄAG†UŒ\0e∆Öb(ËõBﬂ¯Œ\0˜ox7¨ :åƒP–7ÖæÒ#úû¨›iÏZY“æ}≠ìuà°†o\n}„G8î:¥un;î«0-CAﬂ˙∆è ò¯Õ7∆˛çlﬂæVè…:åƒP–7ÖæÒ#î ôLk6Ã;F/Î8€)à°†o\n}gÄ˜,ˇâR[¯§ÇnÄjœÌ¯˛’∆ ÷¸t…6≤-{{ }SË;¿ﬁs∑™ñH\'++k0üTÄ\r0⁄^{{ }SË;C˝gyÑÄ≥i¿Äù˘îlÄ±Ï’E⁄€√»0@˙¶–wÄª8ÆÁ…\'ü|ÑO(‡ò®˘È¬»0@≤Œ ‘âæ—7tP»qõã≥ÖÓM ÖvU5®*≥nÎFﬂË:™ã”¬‹ê¬\0˝7⁄D§ÉsÇêÉæ—7t*–,¢{ÉR†ﬂ·&⁄„Äæ—7$;‡¸¬6˜Ü!sê¬\0„fPî£◊c0Ë}CJ—sq“≤{c∆ï;wÓ,ö3gŒ⁄“““”œ=˜\\À·√ÕDñõõ{·ôgûi~È•óNõ6mû™übÄÿ!·&Zx°ìÉæ—7$ùúúúgeeçTaÅ™˝™ŒZ]ús™Y√Vceª\r6.ú;e îñ—£G3gŒ46oﬁl‘÷÷\ZÁŒù3π≠ØØ7>˝ÙSC „˘Áüø¬/.,,ÅR`“gg&ﬁÌ}£oà	9¸[’*UÕ1ú…X◊\Zµ}nJﬂ®\n2ØºÚ 7„∆ç3√À˘ÛÁçXŸæ}ª1a¬ÑÛEEE{árHaÄI\r7Éx^#!}£oiÍVR „5nUùÙº†ÚIÁ%Kñ¨~˙Èßç•Kó∆lúîóóMóB7ƒ\0nÆBﬂË|#++khvvˆWˆ∞íììcº˙Í´∆Í’´çœ?ˇ‹8sÊåô	Œû=ké\0mÿ∞¡(++3ÚÚÚú!ß1i›	7UUUˇ5jîQSSc¯¡·√á\rñöFåÒ;ê¬\0}!⁄Ñ‚TˇÖæ/Õp3XíÛˆ`3oﬁ<s⁄J,444ò€ÀÛg:ˆø)\"ù	7±æπXëüWXXÿòÚq6Ã‹p„◊ùÙçæ!°Œç=‹õ›öDêÁ…tG»Ò//»úñÚ´s„÷…6lXÉz”=1@\nÙFt∏πLUæuŒÁ1Ò}£oàôscñ*))iÜJæö:u™s∏ {^ê£•&Oû‹,sní…≤eÀörrr6aÄËπ”\"·‰O\"_Î6÷êÓyÑÙçæ!&T∏©∞wnºÜ{»qtr™=øŸEã}(?Ù€oø5íÕ≥œ>[óâCU ò¬p≤:0Ü≠b	9ˆp£kòÀ√UË}É+r(∏}ŒM¢√RëÜ´Ïsr<ÂÈﬁ»yn‰PT∞c«éÊLÏ‚`Ä`í:‹¬J§ê„∂˝,óÌôìÉæ—7D\n8´t¯ê	¬…`˛¸˘˛tq‰≈2±ÿÀ·‡ÒRPPP\'cxA˘c™˙%à&˚;!‹ä#¥∏ÖúX√M(û·™ºººfÇY£oÙ\r±iAŒ<¨\'KóÂ‰…ìI…rtï„ÚƒÚÇ\\~a÷¨YF*)++€.ßi¬›÷&[%\r√\01¿d}á	1Ñúx√ç˝ı√^Ö\\¬çúr]˝N˝ÉlÍË}CÏZ∞.ø`n˜⁄kØ%;\'ÿNbyAÆ-%ó_H%7n<,ﬂ\n“›VÀ›R.àz˝y&\nr:%n¢\rèÈ=æ˛Íw©r»AﬂËb◊Çum)s}UUURsÇú–ˆ^Àr·Ã„«èß4‡‘’’’´7|4†Ù÷îkˇ„cÄ†◊ÔPÇ·&R»˘ÃC∏âÈ˝=‰†oÙ\r±k¡∫p¶˘∏ﬂìãù»èmÔ#±º W◊ŒLÚzrU— ˇ—Ì)W⁄y Ëı;Ú~ì[»Ònb\Z.r»AﬂËb◊Ç™&}ﬂØC√#2n{Ìs	ˇRÅ«ãr•]aÄÈUA˚˛<ˆÿc:àîyÙ©N.ùõœ¨«ΩPñiöEﬂËõJºRùr≠¸¸¸©Ó‡455’e@gã\\ác¿Äù;¢ÖΩrÂJÛüó§‹eÀñ…Y¢ç%Kñ>¯†!]9?_K^g˙ÙÈQ∑;v¨π¸Ò«õ]:˝∏JH\'˙w(‰˝2ë:8Òú0ÆéOùú_YÔq¶K\r¥~;’÷„É≠ur[ÆÍ√L–∑S[ŸŸŸ1o/>–£GÙ\ræ˚îú]8PúQ£F5ßzŒ_|ÒYÄÁ‡8ˇ)u»ΩÀõoæi~	¥ŸË«_|Ò≈÷˚uuu∆}˜›göûQﬂæ}ÕﬂCÓÎP4wÓ\\„™´Æj}Œ⁄µk€¨Ô÷≠õ—Ø_?sYj·¬Ö∆m∑›÷Ó˝»—xzY~¶^C$‡DˇŸ¬DcíÊ‡$r‚ö‰!‰ú±Bé[∞È‚pÑn÷„◊Y∑3EﬂNmâÜ›÷âˆ˚ÙÈcñ]ØRZØÔøˇæ˘3é;Üæ¡ì7g‚ƒâ˚S}’ä+>	‡QTõ‰éa˛)•‘\0-Z‘⁄2É?~|ÎÚ£è>⁄n{	A≤N:=z;mzbr|∫wÔﬁ∆ÃÏ¶%˜ßLô“zˇÚÀ/o\rQá2MQ∂π˜ﬁ{M„ìÂ}˚ˆµ>wÁŒùÊÌ€oø}©úàﬂ°x;&Q¬Õ¨ê˚QTÒÑúÑÊY!Á‡C=tuOkR5GU∏œFˇ=Ø∂:5Â÷Á¥…ÑZÔYño	™æ›ŒM7›vΩË{ˇ˛˝∆˝˜ﬂﬂ.‡,X∞¿ËŸ≥gªüáæ!-Ó(™◊_}V™œÉSRR≤,@Á¡â¥∑ùr‘f\"{Yˆnç,/_æ‹4.Y^≥fM;S£“ÀªvÌ2o?˙Ë#È®ôÀGè5◊766\Zïïï≠{t≤Æ††¿\\ñ\0%°»ÕÑÌ{x]ªvmFìΩAŸkºÑ;81}áÏúD;œMºg<÷‹äpúhƒnÏÁvUS5ﬂ˙j\'dÖ†æ÷z{∑GBO^êıÌ÷°ëﬂ˝ä+Æà∏ùôkØΩ∂]¿πÒ∆€ÌÙ†oHTÅ;ŒÀ/ø¸ìë#G~ó¬3üÀŒŒ>î3«J™PŒ(!g”¶M∆]w›eïÎØøﬁºØ∑9r‰ài<“È9}˙t´ââAÕò1√\\C◊¡—&&€8√ëÑ(y=7î=º≠[∑öÀ˙˝»≤º&-ÏÑà÷Aâı$~ÒÜ=LˆH\nW	8˝T˝›\n:¬5é!(gGÁG¿9•Í≠ Î€Y¢#˘]ªtÈ“f(⁄Y¢_)g¿È›ª∑kW}C\"»ôå’ˇÓñTú…877˜ÇÁ3≈≈≈ˇM’µ®V¨X1œó+Ñ^¢GJBçíÑ1iÂÈΩ1)Ÿ€”{[zèMåHˆ∏¥)ÈÆçtpdΩ¥∏ùÜvœ=˜¥€√„|¯·á€tîdÚ°lÛﬁ{Ôπö\'cÙû◊…â˜≈±Ü˝zè§¯˜‘G^˜´–˜àøtÈ‡D\n8ÔfR¿	YÛo§#+ÀëÜ©Ù≤Ñ\Z)=·XûÁGË%P◊¢ûzÍ©!c∆åiIAß!;;{W˜nzR’’’¶qisãd6ˆΩ4	:⁄ÿ‰*c˜Œ∂t¨(ìò8–nÃnÄzXMOrƒ\0Í‰8áãÚCÒüÁ&ùØ&Æá®˙®Ím=v•ı;ª	4]CﬂO4Ób›ˇy¶=<%ÛÂ¥ñJKK€l#sdx‡≥‹&Oú8—=ztÎ∞4˙N“Ø&Ær¬_Æ&Æ)**⁄πtÈ“§¶ôÔ#i,ŒπúÛqÏGWD\n8“‚ñ!-+óŒèﬁ^:8n€K´⁄-…‰¬={ˆD£ó˜¶€Ÿb¬bàëZÏ`Ã√UÉ\\¬J<\'Ò˜ºx\'6\'+‡Ñ√p,˜∞noP’Àzº∑-Ù∫æı≤æø}˚ˆ6G0È$e?UD¥98Ëº¢˛èØ—§∏∏ÿ∑C∆eg}Ãò1ÁÌ›_ÚÇåq©ﬂTSSìîp£±DΩ∆qï∆zf‚<U®Á◊ÙÍ’À4ª±…„è?˛xÎ≤ÑΩ˜%Á≈êa)	D˙∞qm†zY&.GÎ˛8KÜ∑Ùÿ|–¶√§˜@KJJ⁄æé˙2\\uô’Åâ˜–oÁÛºû«‰Ôıó«Ô¥÷ï[˜;Ö⁄:æ\'tqbqûuˇ\Z´ìËòPò#\"•„*ÎîÈ∑ñ“AGüßFwX§k„X–7xÕ™NË \"ﬂØ!GæœSßNµœªiÙ5/‰ÊÊÊù≠ØØ˜5‹;vl}vvˆëLöÍ»=<ml—∂Éäg˚xPJ—eüxhüÙÃ©‹ì\Zrí1¸§o9íQéPí¬m#›—òÛ=IgV∆-G∏†oH&YYYCıÑc›…It∏JûÁË‹I…999ÖÖÖç~ur§s#·F}0@\nL´ê„wXBﬂ˙æ¥:9√Ì!GÊ‰HóQéÇäıh)ôPlüs#ï‘º …,77˜Ù‚≈ãøˆ0Ò∏·ç7ﬁò-√RÚ!`ÄË+^áï“aX\n}SË;:9™\ZÏEÇétÂdÄ“ù—√W2%g(ñ#ﬂyÁ#??ˇ;«ŸìSídåM•™ ¢¢¢∫m€∂5≈sûõï+WŒWiãL ‘97 òF!\'ﬁLGO(Fﬂ˙Œ¨NŒ≠ˆ√«¨‘Áı¢OH–>|x}iiÈÓıÎ◊Q	Ï∏æ@ß\\8SÆ-UQQÒœIì&-W…Ì†ºQIaôx¥à|∏äa)Ùçæ!iy¡\n:-ÒõœrCı∆G[◊¢8$W˜‘W˘îa…µ\"‰t ôvÜbÃ†ê#ó_Hıä—7Öæ/1» Ö˙=\\’aÿI-E∏AﬂË\00@0#:9K°oÙ\r\0 òQ!ápÉæ—7\0`Ä`FÖú2¬\r˙Fﬂ\0ÄbÄôÑÃπ1B\néæ—7\0`Ä`ÜÒ#>Ùçæ\0ƒ\0–7˙\0ÙM°o\0ê¬\0}SË\0§0@@ﬂ˙¿\0)–7˙\0@ﬂË\00@–7Öæ0@\nÙM°o\0ê¬\0}SË\0§0@@ﬂË\00@\0}£o\0¿\01@@ﬂË}`ÄËõBﬂ\0 Ö˙¶–7\0HaÄÄæ—7\0§Ç  Jå\'}Íú2¿æïÄæ—7\0xd›∫u«ÎÎÎ1ü4®⁄⁄⁄ø(‹À∑–7˙\0è¨^Ω˙·™™™S_~˘e&‘q{vb~GT=¡∑–7˙\0P¢¨ˆ,∂H˚T∆à©îó|Ó{1?@ﬂË\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‰ˇëÅh·nÍFr\0\0\0\0IENDÆB`Ç',1),('5002',6,'source',NULL,'{\"resourceId\":\"5001\",\"properties\":{\"process_id\":\"leave\",\"name\":\"ÁÆÄÂçïËØ∑ÂÅá\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\",\"properties\":{\"overrideid\":\"\",\"name\":\"ÂºÄËµ∑\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\"}],\"bounds\":{\"lowerRight\":{\"x\":120,\"y\":154},\"upperLeft\":{\"x\":90,\"y\":124}},\"dockers\":[]},{\"resourceId\":\"sid-9303BF19-09A3-4A06-922E-AD606B184621\",\"properties\":{\"overrideid\":\"\",\"name\":\"ÁªèÁêÜÂÆ°Êâπ\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\"}],\"bounds\":{\"lowerRight\":{\"x\":272,\"y\":179},\"upperLeft\":{\"x\":172,\"y\":99}},\"dockers\":[]},{\"resourceId\":\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9303BF19-09A3-4A06-922E-AD606B184621\"}],\"bounds\":{\"lowerRight\":{\"x\":171.640625,\"y\":139},\"upperLeft\":{\"x\":120.625,\"y\":139}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9303BF19-09A3-4A06-922E-AD606B184621\"}},{\"resourceId\":\"sid-85402145-EF96-4306-917B-333141E9C7C3\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\"},{\"resourceId\":\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\"}],\"bounds\":{\"lowerRight\":{\"x\":357,\"y\":159},\"upperLeft\":{\"x\":317,\"y\":119}},\"dockers\":[]},{\"resourceId\":\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-85402145-EF96-4306-917B-333141E9C7C3\"}],\"bounds\":{\"lowerRight\":{\"x\":316.64844687000755,\"y\":139.4097335362338},\"upperLeft\":{\"x\":272.62889687999245,\"y\":139.2191727137662}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20.5,\"y\":20.5}],\"target\":{\"resourceId\":\"sid-85402145-EF96-4306-917B-333141E9C7C3\"}},{\"resourceId\":\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\",\"properties\":{\"overrideid\":\"\",\"name\":\"‰∫∫‰∫ãÂÆ°Êâπ\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\"}],\"bounds\":{\"lowerRight\":{\"x\":520,\"y\":179},\"upperLeft\":{\"x\":420,\"y\":99}},\"dockers\":[]},{\"resourceId\":\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\",\"properties\":{\"overrideid\":\"\",\"name\":\"ÁªìÊùü\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":643,\"y\":153},\"upperLeft\":{\"x\":615,\"y\":125}},\"dockers\":[]},{\"resourceId\":\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"}],\"bounds\":{\"lowerRight\":{\"x\":614.3359375,\"y\":139},\"upperLeft\":{\"x\":520.6875,\"y\":139}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"}},{\"resourceId\":\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\",\"properties\":{\"overrideid\":\"\",\"name\":\"È©≥Âõû\",\"documentation\":\"\",\"conditionsequenceflow\":\"${result==3}\",\"executionlisteners\":\"\",\"defaultflow\":false,\"showdiamondmarker\":false},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"}],\"bounds\":{\"lowerRight\":{\"x\":629,\"y\":124.25},\"upperLeft\":{\"x\":337.5,\"y\":69}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":337.5,\"y\":69},{\"x\":629,\"y\":69},{\"x\":14,\"y\":4}],\"target\":{\"resourceId\":\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"}},{\"resourceId\":\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\",\"properties\":{\"overrideid\":\"\",\"name\":\"ÂêåÊÑè\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":true},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\"}],\"bounds\":{\"lowerRight\":{\"x\":419.3125071198955,\"y\":139.42591394196188},\"upperLeft\":{\"x\":357.1328053801045,\"y\":139.19127355803812}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('5003',5,'source-extra',NULL,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0µ\0\0\0Â\0\0\0M±ü\0\0\0 cHRM\0\0z&\0\0ÄÑ\0\0˙\0\0\0ÄË\0\0u0\0\0Í`\0\0:ò\0\0pú∫Q<\0\0\0gAMA\0\0±é|˚Qì\0\0\0sRGB\0ÆŒÈ\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\0ƒ\0\0ƒï+\0\0 \0IDATx⁄Ì›	xT’˘¯Ò3ŸŸ *≈íä\n(ä*µ(TÇ¨⁄VÍQñÇJ-bAAAQÎïU¬&®†l*?ãà,íj› Ï  $ˇ˜ΩsoºI»:ôô|?œsûŸÓL&Áﬁ3ÁΩÔ=˜\\c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ä–Ê°\n\0†p‚„„ÎÀM/j@\0ôíêêêTˇÒ÷=\0ö¥œR\r\0Ã0ÇZ\0@a=G\0(Ee~õ†\0ä!†MHHF5\0(-ÒÒÒe>∞\rc3\0\0\0\0A-\0\0\0@P\0\0\0‘\0\0Ä†\0\0\0 ®\0\0\0j\0\0\0ÇZ\0\0\0‘\0\0\0µ\0\0\0\0A-\0\0\0@P\0\0\0ÇZ\0\0\0Ä†\0\0\0 ®\0\0\0\n+Ç*\0PÜ=$Â?ÁYÊÑîÌT\062µ\0 ≤›R2Ú(ı§DRM\0¯»‘(À~í≤5áﬂ≈˚~fØ\0j  =-•≥ÎÒf)=©\0 ®Ä`2[ H˚~CCv\0Çcj\0\0Ù»‘Ä1Õ§Ãq=˛NJw™\0j ò| Â=~Ä†\0Ç—ÂR ÁÒzC˚ıD™\n\0j P˝`ﬂf‰ZòÎu\0\0A-\0¨ˇQ\0\Zò˝\0\0Ú÷Ö*\0Ä¿G¶A/+++f€∂mè•••u;~¸x„c«é≈dffR1E‰Òx≤¢££FEE≠;}˙ÙÿV≠Z}¢øÅ:Ù`¨îO•ÏíÚçœéˇd)≥ÿ\"hﬂ¥oÄ†(1“Ÿ˝u˝˙ı„“””À◊¨Y”h©T©í	„ DQI‡‡ë@¢˙ë#G⁄Ì€∑ØÕÁü˛›â\'∫µm€6TNö∫^ D)K9*Â#)oJπ] ∆;4a°ÒN˜⁄7Ìp·TÇ’é;&%%\r¨U´Vd\\\\ú©R•äâââ—ïS¥£££Mll¨©]ªv∏5è=˙Pœû=ßNù˙}¸ãöïù!eµî˚ÏÁIyYJ)§ì≤1∑∏¸ÚÀ[ÀçñUâââ+Ÿjhﬂ¥oî~èSã Ó§¥o“§â©SßùH«gö6mZN:øÈ+V¨∏+D˛≠ RÆ3ﬁ!ÕÃ^-•ßîªYÛ¥o⁄7@Pî=$πuÎ÷ˆç7∂≤æN¶Ì7ª6M7?|ˆOÛ˝ß√Ãé\rÔòÙ#ª©∏bP°BsÂïWVí c˙“•K/ÅIá\ZÏóÚ¢îã•42ﬁiº∫\ZÔÉe∆;W-hﬂ¥oÄ†(>z“HrrÚ∏zıÍÂ⁄·Ì‹oìñ¸Ω…<s defò„á~6;æûL«Wå_˝˙ı3√√√_	Åg™}´Å¨fe€oñˆ)QRVHÈ«Zß}”æÇZ†XÈY–z“à*À…°Ì´M∆©cÁ<Ø`Ú∂ïT`1©[∑n’àààKó/_~]ˇ-•l≤À4f2ﬁq∂\Z5ëÚânrR∆±∆iﬂ¥o 1˚ÇäNÎ£g@Á6∆ÓDŸ\ZÕÚ†¯\\t—E˚vÔﬁ›AÓÆ\r“·K)Ì•l∑+Ôes∑JyN M∆;$aäî?∞∆iﬂ¥o ∞ë©EP—y*+WÆúÎÎYgNÁ˛Ê,Ê∂,N’´WØcºg⁄ªw§ƒI©hºS{©IˆÔceZ⁄7Ì ®äùNºÆÛT¢Ù…z®eÇW›òû—xJ RŸ∑IRÙpÊÏ§}”æÅ ¡ΩíØ»±w=˚oào–⁄’æ=l∫†}”æp:wÓ¸î«„ôÀÀœ∆««?Î~\"!!°LÃã«ØBJdπrﬂÉã&Ñ9@–æÅ\0›ÈÿD-‘\"ƒU≠wÉâà™pŒÛ·ëÂL’KZQA\0Ìz≥fÕZ\"7©˘\\|A-Ñ*^¯;S°z„üØtQ*†}!!++kÓy9a/∑Ñ†RgNü8ÁπåìG©Äˆ\rÑRP;˚<ãXSÇx<ûôµ@ê9uÏÄue°¥ﬂùÛ⁄±É?öÎﬂ∂ñ@˚Ç]˘ÚÂ◊H¿z0èEt¨NÚæ}˚÷‘A$uœÈ&ô„á∑Â∫ÃÒîÌ&i›øÃ·_».sZ¥o xMô2%]nÁÚ≤5©sVV÷¬ï+Wfîï:a∫5ÕÃÏˇ·#+Sìz9M]˛ËÅÔÃEømgb¨©–æÅ‡#A´^<¶GœgÍï˘¬¬¬Êó•˙ Sã†¶ôô¸vxnöÒŸ˛’õT @˚Çñ-ê\06Õ˜y	h£Âf◊ﬁΩ{W‘AB33Öﬁ√ÕÃ†⁄7¥thÅ∞S|ûvÜ,)KC√‘‚⁄å†Pjj◊Æù≤gœSØ^=Nøß}•BÇ◊•ÿ>ñ√Küîµ∫ S\0Ö0tË–.áw«wòå2dH/jÄøÌﬂøâ∂Ó©?\"•$gff.\"®\0‰i–†AvÏÿ1˝±«Î—£áy‚â\'¬§cô‘øˇ˝Ù\ZI©ËÛ\\u)ıÌ\'•EÔèóR◊æœ; àÈÉ∞∞∞è}û^2wÓ‹4ÇZ\0@Æ4Cõúú<ßoﬂæ·W]uïı\\”¶M5∞\r?|¯4?∂zMÿøKiÌ*óªÇ⁄fR˛‰Ûû6ˆr˜JâëÚÄ]∆ú\'\0‡ÏY≤y<û˘e±j üû{Óπû;wÓú°Z\'†u\\q≈¶_ø~V`€ßOü˚¸uæó≤“ßl2ﬁåÌZ)˚}ñ_a/Û)•Ãêr£îß•¨7Áf~âòòòµÓ«———+Àb=pÿ)∞ˆ¥b∂lŸ“s„∆çÓ›ª∑Ÿû={ 9r$\"==›DDDdU™TÈt’™Uw«∆∆~!ãÚ…\'øß÷\0ˇ¥IIIˇ÷°öôÕâ>?`¿Äq„∆ÕÓ—£G«i”¶Ω_¬_´uœ%˚¸∂«ÿÀ•€èıV3¥5•¸◊¸:°öîARò6\0]ªv≠õëëqØ«„πE‚=:£W—deñ<ﬁÿπsÁMÚ⁄ˇÖáá\'Ãú9sA-¸Ãæ˜ﬁ{oç1¢À¡É#~˜ªﬂô÷≠[õã/æÿH´{`F6Pœ—£G£vÓ‹Ÿ 11±¡Ü\rÏﬂøˇéc«éçxÎ≠∑&Qã@â¥]œ–:4c;p‡¿»±c«ŒÈŸ≥Á˝SßN]\\_)√˛˝NîÚG)Ná•cmó¯¸∂ß€œ›e∏Œ˜˘…æm/ÂE)˚X”@‡Î“•ã!Íìôôy≥≠Q9,‚ëR_^´/∑˜û9sfL||¸Jy<y÷¨Y3jQb÷Æ]˚Ûœ?ˇzjjj¥ltV¶Gˆ™ŒYN[-^x°—√û=zÙlﬁº˘íÑÑÑ7z˜Ó=–°Cwœù;˜\'j(^˝˙ıªw€∂mS˚ˆÌ{ﬁÄ÷ÿ˛Ìoã\Z3fÃÈÄÓëédI1-Õ∆j¶5ÕJπTZê”PñP≈~Ø[-¯$F–@ıç¨¨¨∂Öx{ky_k˘åﬁ‰>™ÒAm)ëç+‚É>X6e îﬂﬂyÁùFß )òÕãv∞R¬ó.]\Z7gŒúoy‰ë«…⁄≈G3¥v@Ó;Ü6?ÅÌ†AÉ\"5∞Ì‹πs«Ÿ≥gÁÙ:Ó°\Zÿ&ŸèSMﬁcc˜πñM∂ﬂ€ì5\r6˘\râ{=33ÛÁ9ç.ø¸r”≤eK”®Q#S•JS©R%s¸¯qìííbíííÃ∫uÎÃÜ\rÃÈ”ßù∑µí˜mîùÌGC1kKP[JÌ™U´æX±b≈50ó^zië>Øm€∂&..Æ‹®Q£^˘Ûüˇ=i“§◊®e†h˛ÒètìN¡ –4†u∂å7n‹‹lö±mmﬂø‰<Ì-∆;A3=:1{Ü!Kz@{ó¥3$†\rwÇYMÑ›~˚Ì÷—[_ÂÀó∑JÌ⁄µÕ\r7‹`∏ã/6¸±9sÊå.RQ‚êÈÿ∆H`Râ0f?(ö°ù?˛5“i9†u\\r…%Êüˇ¸g9ŸG…Ü⁄çZä–Ó⁄µk™é°-l@Î–#*É\räâää“¿ˆÆ¯∫œõ_g?–˚…π$0úq∏:C¬ÀR\ZKô\"EwÇ«Ôx\\\0Å–jÜv°°V@´ÅÍ»ë#ı$±⁄úhWó◊˜Èπ:˘Ã∑C-^ ®ı3C+{KøÔ€∑oæ7»¸“œ2dH≈»»»â≤°∆Q€@¡Èê\'†ÕÔ⁄Û±á\"ƒH€ú#mÛè≈¸ï◊∏Ó\'€¡i]üeû2ﬁa	«å73ª÷ÄïŒo´\'äΩÕ⁄áé°\r›	h7nlÜ\rvV`Z˙>}ø˛π€ÖRº¿?“YÜ˛/C[\\Z_ö±ï=ªËwﬂ}W\'bæûZÚ/ßì¬Ù–›£è>zŒ≤ØºÚ Y;¶:éÌO˙”9ÀΩˆ⁄k÷,&⁄ë<∏‹Ë—£ÁK\'“°à\'èÈêÉîûO±_.•ØÎy\rdŸ∑Ì‡÷˝ö~óél@‡õ‰å°’Ì¿Å≠1≥E°√‰wŒ\nnwÓ‹©OÈP›°Ω)$ÍåÕ∆.\\8YßÂ“1∞%©]ªvÂ*WÆ‹Äa@˛iÜVÿyæ\'ÖÈ°;\rjµ3pu6Êç7ﬁ8Î˝oΩıñâååÃ~|¡òn›∫Y≠√û°ºº^á\"$Ô,9—\0ı\Z„Õ∆:t‹\\Ü˝úŒî0ÃUú$ô≠\0:mó¥z°k≠¢E\rh›Å≠-vùúﬁ*T‚ÇZ?—,mbbb\'ù∂À›ÒïîﬁΩ{_ gü@´˘ˇü—∆⁄∫uké `∂!˚¬\n”rõÂ‡Êõo6µj’ ~,ùçŸ∂mõYø~Ωı¯˚Ôø7[∂l…>√8\"\"¬ƒ∆∆ö?˛Ò‹ëö<xp§,ìPBcliﬂ@∑ÖÏ˛[O\n+ÏêÉ‹ËÁ›u◊]Ó•7A-ÚMØˆÀ/øD◊ΩÛπÚ +£¢££Ëòú\0´ä·“x‘®Q#Uæ€l_ÿ±c«ÄΩ<Áæ}˚≤∑åås‡¿Åﬁ©Sßr}m“§IyæÓ,Û›wﬂY˜7oﬁú˝¸é; Rsr∂°dŸÜ¶ur_),Øì¬{Ï±≥≤µ\'Nú∞÷«—£GÕƒâ≠·ÓL»#è<íÎ4}⁄>ù¿ˆ|clÂı~Úˇ’,ãÎ∆üfÕöU†vÙ≈_òeÀñùıúÓÏ–æ·n5k÷Lëù◊iz•0π˘Ωﬁwf:(	∫”ÌJ≤µ\n¿x°¿ÿõˆΩÙmnV()W\\q≈æ/ø¸R/á96–Í√„Òht–I\Z}\'©ì4i:ﬁo™^Øz î)ÈÅÚ=gÃòa\Z4h`]bÊÃô¶Zµj÷°Ái”¶YW}”¿E<x0ª“‡FÎ‹Ä˙cÙ„è?Zcù5¯—1LO=ıîµ‹Æ]ªL›∫øûœS°B+Ä÷)XæÀh6P≥˝™ˇ˛f…í%&**J/∆a>˝ÙSÎªï≤\rUñõn≤\ruìmË†‘ÀáÚ‹ÏÇlCCáÌíﬂ+ÖIÁdu:-é¥Œ∫~˛˘ÁÕë#G≤ó”CÑ◊_Ωiÿ∞·yw<\r\ZtfÃò1≥§”Îû€t_Úˇ•Àˇ7FÓv/KÎ∆ﬂ¥}k;≠WØ^éØÙ—GgµØµk◊û»Íú†\Z‰&$$Xmíˆ\rg’À∂ﬂU⁄BWiGd˝æ/èﬂÕ´-ÿóæµÇ˝]ra*N:¥J˚6âúß2^ ®\r@{˜Óm¶Aê?µlŸ≤äl¨∑¡F™’ıó<>==˝§4˙˘“†ÁJù-Zπre©]á^≥*Út§Y±bÖfÃ¨√ ö5©^Ωzv@´4ÿçãã3ã-2:t∞ÌÙ4“\0˜∆o¥ñ”N °ùﬂeó]ñ›Q˝ÚÀ/¶rÂ ŸÀ¨Zµ ˙\\˝˚öñ∫±n˛˘gÎ3Î‘©cuxJ%ïÒØöî^≤ıíz:&€–\\ŸÜﬁœkíÄ≤É¨ÀÈπRÿ˝˜ﬂo≠\'®’·∫=»ﬂ˝ıGU∂ëNù:ÂÎÛ‰Ôñ8p`Êÿ±cﬂï¿ˆ¡ú[Ωj†º÷[˛ß÷reYX7•·á~∞N\nÃMªvÌ¨ tÎ÷≠V[”+<Z?^+ZsÍÂÕˇ˙◊ø“æëóX›9ï∂–]÷w∫Ù)s‰Òﬂ∂ Ì„Á˛µ◊^[¢_H?ﬂ‘Cº@PˆÏŸS^≥\0˛‘∞aCÕÜ6≤™äñÚ†4˙k‘®qT\ZΩNˇfidx‰Ôôgûy∆>|ÿ:	®yÛÊFæáŒajup⁄i\0„–≥SıPé.£ùë≈⁄Å}ÛÕ7ŸùSN•;k£ùó3›äNﬂ¢Yb•ﬁ˛˝˚≠¨êûÄ§œøÛŒ;÷wsè—÷†kÚ‰…÷2e93‚Q5k÷<(€–r„s@3¥v@[†+ÖÈë=¡bÃò1Êÿ1ÔÓÄV3?¸Y√ŒG∂´\nÉN=ztÆÅ≠xTßﬁë„k),âuSZ¥=k{ ã3©Mõ6f˜Ó›÷˝fÕöôœ?ˇ‹jø∑‹rÌ˘#Ì†á‹ˆê∂†‹eÃN÷∂ €C3W?^¢_¢~˝˙ÓáÕÇΩR	j˝‰»ë#⁄·˘”È”ß/îFì!çeX0÷ô4JÚ˝Ôïª˜Íèæ¸[3éµ04À™©v´WØ6Øæ˙™9yÚ§5=”Ñ	¨ŒßOü>Ê÷[o’)‘¨«⁄)jÊN≥ªzë≤N¶VóSÓL≠fh^x·„U:ñN3¿⁄YÍ°L=§-¡Nv6Hã~¶ä“e¥√”ÔÊÏ,Èg\r2ƒo^rr≤5ƒ\"¿∑ØjÆ£\0∫Æ~íù•ô;wÓ¸GaØ¶¡à&z˘I˜JÕ§È°‰-Z¯3õ6mZq–†Aá$∞ù%Åﬁ˚Úùœπ.ª<óY´V≠ERﬂkC‰gÒúu„ØˆÌKw@uΩπáë‰Ê€oøµ≤¥ŒÿWÕæÍéÎïW^y÷r¥oÄfpêˆÄ∂ëÈﬁQ.I>ü_ù†˘¢™s∏ _40ì¿P◊Ò≥!Rç\r5ê–√˚%Ì∫ÎÆ≥Í8∂|–:)L‰áöΩÃõoæiÕ®A≠4:ûNj`£?˘…‘ÍÚ⁄Q)\rÜ5§ù€ö5kÃˆÌ€œZV_ÍÚÔæ˚Æ5Uîvn˜‹sOˆ{ı˚$CXT⁄·n‹∏—”ˆ%Ì°ë‘„≥:÷π(W\n”˙w≤sÇNsﬂ}˜˙3õ5kVµNù:GvÌ⁄’5óÔÓdÖ€ö§Î∆_Ì€ó∂s*†;¶⁄Œ.∫Ë¢ó”ﬂpÕÃ˙“¨fZiﬂ(&ŸcMäk\ZØ‹¯lS1¡^qµ~ù%Å≠«üÅÌµ◊^õ<oﬁº*“Y<@Uëü»LÕJŸπª”€⁄¢EãÜ˛˙¢õ6m≤ÇQÌ\\4@’=ÙdΩØÎÒ≥œ>;´÷ÈQ4¯’Èü¥„“ÒyÓL≠˛8i«Â¶ù®ìΩMLL¥˛ñ~∂ﬁwO!•ù†vj˙∫Ÿæùõ.ÎœO›t”MV«,ﬂs∏\rÂ8m≠V≠⁄{+WÆ–¥i”B_1LWêÈÌÖd«Ê˝˜ﬂ∑Ç£¬êz‹ø{˜n=©dfNôZõ¶Åunü˙SóØu#ˇ_ñG+–g›H¿ÿ∞4æÙ\'ü|bçô◊ìu˛a˜Œ´õ{ä6g&}NÉb\r<gœûmÌ‰“æëœ∂p∆næ}ùˆÅV`´\'ód`ÎûµE§{•‘˙IllÏi	r¢ÙG”_\"##I„HOHH(ıˇl]Ü›∏√‰6Lß»Ì\nÌ‰eß`âéπ{¯·á≥¸Ò=ı∞≤\Z‘ÃJ«éœ∫¨`˜Ó›ÕÙÈ”súÉ‘yØéΩ”˜j«ÁK–ô4¿uüÌ¨crùœqgr¥∏39≠Zµ≤ O<ëÁ˜÷†∫∏/øú=î™ŸŒ\'ü|rX†lC9lSÁlC˙¸ê!Cæ\Z?~¸¨«º¿CtNZÕæ˚Nﬂ§\'È:”u_–!\Z–é3¶ú|fó‹fApH–¥Q˛üïÅx“ÿy÷M¶ìÅ“Ä∂4€∑õÊ◊·BŒv†mTg,q_ıQOtvrzh^Ès˙ö~éûÍnÉ¥Ô≤+∑∂†˝ú∂ŸÓuc\n∑wéœjÈÈÈ[å˜r◊Vr§$ÉZüì#É˛,µ~R•JïÚ#÷»üAÌñ-[~÷æ6Ä´E˜FOKCé∂;:›”å˜äH≥Àï+∑B:∫î“¯böus¶–—†TœTˆ=	ƒÕj†}èf}4∏—Ω`=´Z30⁄ë˘éè“3¶s ‰h\'´c7œG3ø:>œÒ’W_ùurJuﬁmËÖ^ò”Ø_øS\'Nú\'∑·˘Õÿj‡™„´”““‹YïÏåmjj™uÇèfkÛõYìÌdˇK/Ω§m◊Û¥∂`:iLúy√•}ªÈ…†/æ¯bˆ„øˇ˝Ô¶}˚ˆV÷›Ü†”|i—YP4®‘v™\'~)]◊∫ﬁu∂g∏\0Ìæ]Ñ› π≤≤π∂	à79A≠Œ∂Q‹^pso_bA-Ú%66vï¸®5jŸ≤•ﬂ˛Ê_|°=Ì™\0Æñ0;†’∆=O b˘¡_ÛXj¶f‘®Q÷·Hùs4∑¨¨Œ+©Y\\=D§¡Î€oøù=ıé3•éµ”éNﬂ£ÀªÈ…$w&\'ßlíûmoüD`e	5;4˛|ÎÆ˙˜ïv¥öA* x— d¥\rMò0a°¥»Ìº¸ŒÇﬁ{Ôùu∏NœL◊Y/ˆÏŸì}51Ωù3géÈ’´◊y?O∂ôΩ„«èè)@@´á∏◊vÓ‹y}≠Zµ”#¿◊Kx ∂o«à#¨#/ø˘Õo≤ü”@v¯·÷∏zùÈDè‘8mR€ß∂=m„\Z†Í˙◊`W≥µ9]xÅˆ\r[TA~ßdßuïÙç:g¨uBj^	ï¢“œwYÏMPÎ\'≤\'?r˚ˆÌù9s&ÃO`Hó¿,Œ∏.µHÙpã‹¨îŒ¡ôŒ\'%êæüz‘é3ÂŒ|`J‘ŒL«—:ŸÌàj‘®auÑN¶á/uÏ≠sòPiÜ≈ﬁ¨≥•sö‡]É!=Î9ßé3É€Nß®Ÿ%\'k£ÛcjÜPß+…Ω˙P€Ü4∞Ì”ßO«W^yeˆ„è?ôW∞†Wó”ıÓjÀï+geˆÙÇ\Zá≤û”\0DO“‘±’yM«£C∆é[Y\'eœo@õΩ7ˆ¥‹tÂuSí4™W”ÄQw6}i©ÌIOtvV≤˜û““¨`ÛπÁû3ã/∂ûÀœ8⁄wŸTò∂ }ÕBâ∆Î]Ω®è˛∂îƒtË¡◊_≠…/g|˚º`Øoõúˇ0‡ßÆ]ª˛∆{ŸÀñ-õ)?Çó$$$‹Hu†◊√ñ=–$i‹Û\nì±Yæ|yñ°Há0‰6KB†“˘9oªÌ6O0mC9È‘©Sõòòò≈O<ÒDTnÌsÿ∞a÷ŸÈ:E9ó¬’£/:]”Ë—£≥3m∫ugg‰»ë9^E–C+w{Œö5ka®l√e©};[⁄7J¢-ËŒ∑—˚z≤ƒ≈˛uÜfc[hÒBaê©ı£‘‘‘ßﬂMõ6ç(·lm ‘©S/ìıR†’Å4öl	9∂/î∂°9sÊ¨êN§˝ƒâÙÌ€7∆7∞’±“zË◊	hïŒÍ\'“±ì:O©é£÷`GÕ‚Î4oæ◊m/ƒ⁄2ΩnUAØE˚Êw™Ä^ìbµzin›Ÿ+Œ,Ωû∏¸·áfgi%^x3$⁄%õûˇLû<ynZZ⁄w∫Åñ§±c«ŒóÛÿﬁΩ{®u fÕöµ‰‰…ì˜Mò0!]˘eÔ!¶§X›pÆ Êp_&YıÓ›˚¨qïz»p⁄¥iŸ√îfh5†ïªùC-†P¨øGzg•ﬁ◊Tı¢?ŒÿÍ¢“!T/ø¸Ú˘Ωr≤kB%^ SÎg©©©˜,X∞‡€∆çósOS\\∂lŸÚ¡◊_}ßÏu˝>»/ß	îJ`€©Sßª«ç˜aø~˝¨å≠ŒX!œü˜Ω:!ØÂú≠¥˙w®m\0ÁÒê=!£∫ûå*øK÷ä2≈ó¥ gÌﬁΩ€9\\ú&Ò¬_B%^ SÎg			IßNù˙ãlú«ã˚íê≤ë˛ﬂ®Q£ö…:H:ÕˇQ€@¡ÈPÑì\'Oﬁ≠[ŸA,ñ)Ò4†?~|î9 †êﬂx!++´Ø‹µNù#[«ˆÎ–Å¬–˜\r:ÙÃñ-[≤«IKºh(≈µ•`∆å3”““˙>ÛÃ3iz∂kq–Ì‡¡É/>sÊÃødùA-≈ÿû,j`Î9ê∂ŸÉ!\0\nB~3tX¿_ú¿V3∂O?˝¥ô9s¶ÔÖr•ÀÈIaO=ıî;C´33<jÒB8õLÈê tc£Fç∂≠Y≥ÊˆåK/Ω4™†\'8€´tò	≤·ﬂ\"Ë3r˚j(◊[è=ÜÈ	:zU§È”ßá‰e4ˇ˚ﬂˇnm“§…ÜuÎ÷uhÿ∞aXÕö5‹@5C;n‹8k»Åt*±≈–æiﬂ(®ƒƒƒMÚ[§∞6è\'F/ˆ¢Û¢ÎÉŒå,zÚπ∆:Ìõ1–#¡:/˙¬Öu:∏L˘=”´¯9Zù/∑w(∆å©-Â=∞¯¯¯µsÊÃô¸Ò«7È›ªwlÛÊÕÀÂÛÌÈÀó/_8m⁄¥F≤A7“1¥9\0äóË“•Ká±c«ŒÎﬂø‰’W_ùÔSÿ›\'Ö1‰\0@qƒ“◊øÌLı•\'êÈ≈8úK6Á¡ΩCæF«–Üjº@P[ tÃå‹¸A6÷§„|4**Íä∏∏∏≠ZµYÉe˝\0\0ÏIDAT™ÿ†AÉ®™U´÷‘À*û8qbJJJÍ∑ﬂ~˚„ö5k¬¸Ò«∆≤A◊ï˜æ∂oﬂæúî\\`€©Sß{«èøP[ìü¿÷ôá÷û∂ãÄ@q≈∑iº Åio	n[ é[#er®«µÅ≥±Íï<ÊuÌ⁄µÓÊÕõÿ¥i”çÚ∏Öù¥9FJe)ziùWÓ)è⁄8Ä¶cl5∞}È•óH`{∫Eãr[V/}´W\nìª]C†$„Ÿq~@Ç[\'^®i«\Z7$KŸdºóæùWV‚Ç⁄\03sÊÃ]∆{=˜	‘XÅmó.]:é?~˛¿Åè\\u’U±æÀÿ≥Ëò∑Æ°t•0\0ƒ¡ÄŸ\0 üt(BFFF˚q„∆yæ˙Í´#Ó◊‹≥–\0A-\04ÕÿJ`{ˇÑ	<Î÷≠;Ï¥Æ1¥9\0P:KqO¢G€GÁ„}K JºGP∏~+Â∆ûŒz&∞\r˝ı◊w–Éõ§lw=÷æ €˜ùXuLÌ’vÎîSR.v=~^ °XAå©-˝\rTØww´Õ¯l¥7»á•º.Â®œ∫“`6UJC{Cé4ﬁ¡‡z€U\nÛ	~lªtÈ“yıÍ’{<û;òÂ\0@	j&Â„Mx˝÷~.SJ})Ì§\\c«\rz©“ØÌ·∏Ω‹1W0\\C ﬂCµíjK◊j˚∂öîΩRVH©hπæµ«ŸÀÈ4^µ§îÚçÎı©N¿øtåmØ^Ω.ò2eJ\nµ†Ñh∂πîô∆;‹`§î˝ˆkÌÏx¡7f¯P 8˚~m{9’KJº‘¬Ô≤6–Ìˆs◊ÿ{a7o&◊Ÿ∞í\0îZ\0%,∆Lüñ2ﬂxìZùÌ@≥±˜\ZÔQﬂÈÆ˜¸‚\ntªªÓ_™-AmÈ∫ÃxáË∆’TJ=;à’ç∑æΩW’^ 0„ö–J I)7H˘÷ﬁòªÔÑ Í?T)\0\0!GgZ˘∑+¨∂cÖèÌÁù`’˜hÌEv·ƒoÏ˙PÆ(Ç⁄“Û≠]îéè—ÒxzŸ:˜˜·Ñ(;®›c?kÔq9C~¢J\0I3§,êrèÒUd~Mf≈ÿÒÄ˚º\ZzïÒftwÔQﬂèLà\'¿8döÿm^‚Ï\rSÈÄÒÊ>Ø7ß\Z\0Im•ºj¶zîwØ˘5˘µL VüÂ?ï2B \0˚±.3J âPÆ$2µ•Oß’ÿìèÂÍÔ%‘&˚ˆn„+£Ù0Éé≥˘í*\0 dT≥ÉSn†Á‘h¶ˆ>)mÏ◊c|ñ◊°ñÚîÒ_T:+¬[∆;lAﬁIv`LPãbıàîÛ±‹ˇÏı•„c‚Ï«sΩ>ù™\0 ‰h¬j∂9{∆£]vp´tÿ‚5Æ\0XcÑëÆeOŸ∑öÕΩ”é#ˆÜbE‘ñÓûWK)/KIw=_¡¸:”Å£ôΩAÎÜ}õîéRû¥◊_¥}´„müÕ·Ω\0\0 ∏}„Û¯◊˝4)üπ‡’>À>‰∫Ø≥%ÑÏ∏ZÇ⁄“›Û˙(áÁıÏƒW|û€‰∫ØtCf\0\0ú_fY˘G9Q\0\0\0µÄ_7ÿ∞∞¨ÃÃL*\"v˝33ı≤ã‘hﬂ¥oÄ†(†òòò_é=JEÄ√á\'ö≥á∆\0¥o⁄7@P‰Gdd‰ö‘‘T*\"\0Ï€∑OßóYIMÄˆM˚jÅJOOΩwÔﬁ”YYYTFÈJ:tËêN3ü™\0Ìõˆ\r‘tÛÕ7ØìÔõ={ˆP•(11qπ¨á=∑›v€Zj¥o⁄7@PBzzz∑§§§„Gé°2JAJJ ˚á∫;33≥?µ⁄7Ì·TÇÕå3íªwÔæÓ‡¡ÉÌ+WÆM•¯±√€≤eÀèÁˇ›~˚Ìk®–æiﬂ\0A-P”¶M€⁄≠[∑ı˚˜ÔøW~Äè≈∆∆ñì[*¶‰$%&&ŒMJJ∫U;º6m⁄,¢J@˚¶}ÅÑ_	µ•Kó∆ÖÖÖΩ—¸¬/‹UΩzıZï+WÆ)œQ9E§ÛTÍ¥>z¥û4¢cÏÙêd€∂m©–æiﬂ\0A-Pñ-[÷Ã„Òtêª≠•¥êC≠ôNºÆÛTÆî2üìF@˚¶}\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0†¸FÜÈ™≥ÉÓ\0\0\0\0IENDÆB`Ç',NULL),('5013',1,'ÁÆÄÂçïËØ∑ÂÅá.bpmn20.xml','5012','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"leave\" name=\"ÁÆÄÂçïËØ∑ÂÅá\" isExecutable=\"true\">\n    <startEvent id=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" name=\"ÂºÄËµ∑\"/>\n    <userTask id=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" name=\"ÁªèÁêÜÂÆ°Êâπ\"/>\n    <sequenceFlow id=\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\" sourceRef=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" targetRef=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\"/>\n    <exclusiveGateway id=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" default=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\"/>\n    <sequenceFlow id=\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\" sourceRef=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" targetRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\"/>\n    <userTask id=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" name=\"‰∫∫‰∫ãÂÆ°Êâπ\"/>\n    <endEvent id=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\" name=\"ÁªìÊùü\"/>\n    <sequenceFlow id=\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\" sourceRef=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" targetRef=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\"/>\n    <sequenceFlow id=\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\" name=\"È©≥Âõû\" sourceRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" targetRef=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${result==3}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\" name=\"ÂêåÊÑè\" sourceRef=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" targetRef=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\" id=\"BPMNShape_sid-B08433FD-66AF-4E93-ACA0-E82871E25B72\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"90.0\" y=\"124.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9303BF19-09A3-4A06-922E-AD606B184621\" id=\"BPMNShape_sid-9303BF19-09A3-4A06-922E-AD606B184621\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"172.0\" y=\"99.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-85402145-EF96-4306-917B-333141E9C7C3\" id=\"BPMNShape_sid-85402145-EF96-4306-917B-333141E9C7C3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"317.0\" y=\"119.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\" id=\"BPMNShape_sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"99.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\" id=\"BPMNShape_sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"615.0\" y=\"125.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\" id=\"BPMNEdge_sid-89E42CF4-43FF-4D21-8175-52532CEC04C7\">\n        <omgdi:waypoint x=\"356.5719696969697\" y=\"139.4280303030303\"/>\n        <omgdi:waypoint x=\"420.0\" y=\"139.18867924528303\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\" id=\"BPMNEdge_sid-C1B9BC85-73E1-4517-9FCD-C1A1E69D3264\">\n        <omgdi:waypoint x=\"272.0\" y=\"139.2164502164502\"/>\n        <omgdi:waypoint x=\"317.4130434782609\" y=\"139.41304347826087\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-517A0CBE-25A5-49A2-B197-0850747E8041\" id=\"BPMNEdge_sid-517A0CBE-25A5-49A2-B197-0850747E8041\">\n        <omgdi:waypoint x=\"337.5\" y=\"119.5\"/>\n        <omgdi:waypoint x=\"337.5\" y=\"69.0\"/>\n        <omgdi:waypoint x=\"629.0\" y=\"69.0\"/>\n        <omgdi:waypoint x=\"629.0\" y=\"115.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\" id=\"BPMNEdge_sid-6E69BCE1-EA04-4737-BEFC-B6146CD54C25\">\n        <omgdi:waypoint x=\"520.0\" y=\"139.0\"/>\n        <omgdi:waypoint x=\"615.0\" y=\"139.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6960AC02-AE8C-4579-B007-9805DF708A4E\" id=\"BPMNEdge_sid-6960AC02-AE8C-4579-B007-9805DF708A4E\">\n        <omgdi:waypoint x=\"120.0\" y=\"139.0\"/>\n        <omgdi:waypoint x=\"172.0\" y=\"139.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5014',1,'ÁÆÄÂçïËØ∑ÂÅá.leave.png','5012','âPNG\r\n\Z\n\0\0\0\rIHDR\0\08\0\0\0}\0\0\0Ø\0\0\0aIDATx⁄Ìù}pÂ«OÎK})£√X∆ó:î·∆±v(cÍ0+÷W&ò¬D&Qä¨2° cP4*Œtp®E©•(E$o-»\0ÂÕPﬁÑH≈\0ë`≤}~À>q≥Ÿ{›ΩÀÌÒ˘Ã¸Êˆn˜róÀ}ø˘ÓÔyv7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÄKì°Cá\ZEQÈR∏2\0¯p¯¿gÆVUÆj†™ﬂ™⁄•Í◊∂ıÚùõmªﬂK’ü≠öi´Å÷Û¯é‚G\0\0\n§7´˙ÅPˆYèıW’§Íàc[˘˛&ÃœπÜÄÉ\0`(ê.µBÀbUo©Ídï>™F;Bã,wW’S’_C;7r;ùÄÉ\0`(êNË–\"∑∑´:°Í:k]\'+Ë8∑≠±ÇM»\nGˇ\"‡‡G\0\0\n§[¿…∑n◊™Íb*ÁC;;ŒÄ3DUmËbG—l~\0Ä°@:qã#¿Ù¥LgÎ˛`óÄ≥I’Î±;Uı&‡‡G\0\0\n§?]úX,!•èP∫ÿ¬ t«ˆL2¸\007XÂfÎ6œ∫Ω√∂ÕU´Bá¶úáâKßÁ#~\0Ä°@∫êcÖ9\'éO]c=~ãı¯xÎæ,˜Û3Æ—¡¡è\0\00\0¿è\0\0C¡P\0\0?\0\0\0?\0\0\0?\0\0#\0\0\0#\0\0\0#\0¿P\0\0#\0¿P\0\0#\0¿P\0\0#\0¿P\0\0?\0¿P\0\0?\0\0\0?\0\0\0?\0\0\0?\0\0#\0\0\0#\0¿P\0\0#\0¿P\0\0#\0¿P\0\0£Ãƒ0åŒ\\∞yÛÊÔ*++çU´VQ)Æää\nc›∫uˇSïÀ7CAﬂË#1øÍÍj£ææﬁhnn¶:®Nú8a¨]ªˆ¥2√\'0}£o¿è¿#≤gá˘•ç	6´=æΩ\nÜÇæ—7‡G‡i[c>ÈS \0[0}£o¿è¿#2FåÒ§ï\Z\nÜÇæ—7‡Gê\"¸˙‘q„‡ñŸ∆Óä…f…≤<ÜiaÄ\n˙¶–7~Å4¿∆ÜZc◊äâ∆ée„⁄î<&Î0.CAﬂ˙∆è pxt˜?⁄ôüÆcªób\\ ÜÇæ)ÙçApÔöia\rP÷a\\ ÜÇæ)ÙçA‡p◊™Ia\rP÷a\\ ÜÇæ)ÙçHaÄ\n˙FﬂÄAG†UŒ\0e∆Öb(ËõBﬂ¯Œ\0˜ox7¨ :åƒP–7ÖæÒ#úû¨›iÏZY“æ}≠ìuà°†o\n}„G8î:¥un;î«0-CAﬂ˙∆è ò¯Õ7∆˛çlﬂæVè…:åƒP–7ÖæÒ#î ôLk6Ã;F/Î8€)à°†o\n}gÄ˜,ˇâR[¯§ÇnÄjœÌ¯˛’∆ ÷¸t…6≤-{{ }SË;¿ﬁs∑™ñH\'++k0üTÄ\r0⁄^{{ }SË;C˝gyÑÄ≥i¿Äù˘îlÄ±Ï’E⁄€√»0@˙¶–wÄª8ÆÁ…\'ü|ÑO(‡ò®˘È¬»0@≤Œ ‘âæ—7tP»qõã≥ÖÓM ÖvU5®*≥nÎFﬂË:™ã”¬‹ê¬\0˝7⁄D§ÉsÇêÉæ—7t*–,¢{ÉR†ﬂ·&⁄„Äæ—7$;‡¸¬6˜Ü!sê¬\0„fPî£◊c0Ë}CJ—sq“≤{c∆ï;wÓ,ö3gŒ⁄“““”œ=˜\\À·√ÕDñõõ{·ôgûi~È•óNõ6mû™übÄÿ!·&Zx°ìÉæ—7$ùúúúgeeçTaÅ™˝™ŒZ]ús™Y√Vceª\r6.ú;e îñ—£G3gŒ46oﬁl‘÷÷\ZÁŒù3π≠ØØ7>˝ÙSC „˘Áüø¬/.,,ÅR`“gg&ﬁÌ}£oà	9¸[’*UÕ1ú…X◊\Zµ}nJﬂ®\n2ØºÚ 7„∆ç3√À˘ÛÁçXŸæ}ª1a¬ÑÛEEE{árHaÄI\r7Éx^#!}£oiÍVR „5nUùÙº†ÚIÁ%Kñ¨~˙Èßç•Kó∆lúîóóMóB7ƒ\0nÆBﬂË|#++khvvˆWˆ∞íììcº˙Í´∆Í’´çœ?ˇ‹8sÊåô	Œû=ké\0mÿ∞¡(++3ÚÚÚú!ß1i›	7UUUˇ5jîQSSc¯¡·√á\rñöFåÒ;ê¬\0}!⁄Ñ‚TˇÖæ/Õp3XíÛˆ`3oﬁ<s⁄J,444ò€ÀÛg:ˆø)\"ù	7±æπXëüWXXÿòÚq6Ã‹p„◊ùÙçæ!°Œç=‹õ›öDêÁ…tG»Ò//»úñÚ´s„÷…6lXÉz”=1@\nÙFt∏πLUæuŒÁ1Ò}£oàôscñ*))iÜJæö:u™s∏ {^ê£•&Oû‹,sní…≤eÀörrr6aÄËπ”\"·‰O\"_Î6÷êÓyÑÙçæ!&T∏©∞wnºÜ{»qtr™=øŸEã}(?Ù€oø5íÕ≥œ>[óâCU ò¬p≤:0Ü≠b	9ˆp£kòÀ√UË}É+r(∏}ŒM¢√RëÜ´Ïsr<ÂÈﬁ»yn‰PT∞c«éÊLÏ‚`Ä`í:‹¬J§ê„∂˝,óÌôìÉæ—7D\n8´t¯ê	¬…`˛¸˘˛tq‰≈2±ÿÀ·‡ÒRPPP\'cxA˘c™˙%à&˚;!‹ä#¥∏ÖúX√M(û·™ºººfÇY£oÙ\r±iAŒ<¨\'KóÂ‰…ìI…rtï„ÚƒÚÇ\\~a÷¨YF*)++€.ßi¬›÷&[%\r√\01¿d}á	1Ñúx√ç˝ı√^Ö\\¬çúr]˝N˝ÉlÍË}CÏZ∞.ø`n˜⁄kØ%;\'ÿNbyAÆ-%ó_H%7n<,ﬂ\n“›VÀ›R.àz˝y&\nr:%n¢\rèÈ=æ˛Íw©r»AﬂËb◊Çum)s}UUURsÇú–ˆ^Àr·Ã„«èß4‡‘’’’´7|4†Ù÷îkˇ„cÄ†◊ÔPÇ·&R»˘ÃC∏âÈ˝=‰†oÙ\r±k¡∫p¶˘∏ﬂìãù»èmÔ#±º W◊ŒLÚzrU— ˇ—Ì)W⁄y Ëı;Ú~ì[»Ònb\Z.r»AﬂËb◊Ç™&}ﬂØC√#2n{Ìs	ˇRÅ«ãr•]aÄÈUA˚˛<ˆÿc:àîyÙ©N.ùõœ¨«ΩPñiöEﬂËõJºRùr≠¸¸¸©Ó‡455’e@gã\\ác¿Äù;¢ÖΩrÂJÛüó§‹eÀñ…Y¢ç%Kñ>¯†!]9?_K^g˙ÙÈQ∑;v¨π¸Ò«õ]:˝∏JH\'˙w(‰˝2ë:8Òú0ÆéOùú_YÔq¶K\r¥~;’÷„É≠ur[ÆÍ√L–∑S[ŸŸŸ1o/>–£GÙ\ræ˚îú]8PúQ£F5ßzŒ_|ÒYÄÁ‡8ˇ)u»ΩÀõoæi~	¥ŸË«_|Ò≈÷˚uuu∆}˜›göûQﬂæ}ÕﬂCÓÎP4wÓ\\„™´Æj}Œ⁄µk€¨Ô÷≠õ—Ø_?sYj·¬Ö∆m∑›÷Ó˝»—xzY~¶^C$‡DˇŸ¬DcíÊ‡$r‚ö‰!‰ú±Bé[∞È‚pÑn÷„◊Y∑3EﬂNmâÜ›÷âˆ˚ÙÈcñ]ØRZØÔøˇæ˘3é;Üæ¡ì7g‚ƒâ˚S}’ä+>	‡QTõ‰éa˛)•‘\0-Z‘⁄2É?~|ÎÚ£è>⁄n{	A≤N:=z;mzbr|∫wÔﬁ∆ÃÏ¶%˜ßLô“zˇÚÀ/o\rQá2MQ∂π˜ﬁ{M„ìÂ}˚ˆµ>wÁŒùÊÌ€oø}©úàﬂ°x;&Q¬Õ¨ê˚QTÒÑúÑÊY!Á‡C=tuOkR5GU∏œFˇ=Ø∂:5Â÷Á¥…ÑZÔYño	™æ›ŒM7›vΩË{ˇ˛˝∆˝˜ﬂﬂ.‡,X∞¿ËŸ≥gªüáæ!-Ó(™◊_}V™œÉSRR≤,@Á¡â¥∑ùr‘f\"{Yˆnç,/_æ‹4.Y^≥fM;S£“ÀªvÌ2o?˙Ë#È®ôÀGè5◊766\Zïïï≠{t≤Æ††¿\\ñ\0%°»ÕÑÌ{x]ªvmFìΩAŸkºÑ;81}áÏúD;œMºg<÷‹äpúhƒnÏÁvUS5ﬂ˙j\'dÖ†æ÷z{∑GBO^êıÌ÷°ëﬂ˝ä+Æà∏ùôkØΩ∂]¿πÒ∆€ÌÙ†oHTÅ;ŒÀ/ø¸ìë#G~ó¬3üÀŒŒ>î3«J™PŒ(!g”¶M∆]w›eïÎØøﬁºØ∑9r‰ài<“È9}˙t´ââAÕò1√\\C◊¡—&&€8√ëÑ(y=7î=º≠[∑öÀ˙˝»≤º&-ÏÑà÷Aâı$~ÒÜ=LˆH\nW	8˝T˝›\n:¬5é!(gGÁG¿9•Í≠ Î€Y¢#˘]ªtÈ“f(⁄Y¢_)g¿È›ª∑kW}C\"»ôå’ˇÓñTú…877˜ÇÁ3≈≈≈ˇM’µ®V¨X1œó+Ñ^¢GJBçíÑ1iÂÈΩ1)Ÿ€”{[zèMåHˆ∏¥)ÈÆçtpdΩ¥∏ùÜvœ=˜¥€√„|¯·á€tîdÚ°lÛﬁ{Ôπö\'cÙû◊…â˜≈±Ü˝zè§¯˜‘G^˜´–˜àøtÈ‡D\n8ÔfR¿	YÛo§#+ÀëÜ©Ù≤Ñ\Z)=·XûÁGË%P◊¢ûzÍ©!c∆åiIAß!;;{W˜nzR’’’¶qisãd6ˆΩ4	:⁄ÿ‰*c˜Œ∂t¨(ìò8–nÃnÄzXMOrƒ\0Í‰8áãÚCÒüÁ&ùØ&Æá®˙®Ím=v•ı;ª	4]CﬂO4Ób›ˇy¶=<%ÛÂ¥ñJKK€l#sdx‡≥‹&Oú8—=ztÎ∞4˙N“Ø&Ær¬_Æ&Æ)**⁄πtÈ“§¶ôÔ#i,ŒπúÛqÏGWD\n8“‚ñ!-+óŒèﬁ^:8n€K´⁄-…‰¬={ˆD£ó˜¶€Ÿb¬bàëZÏ`Ã√UÉ\\¬J<\'Ò˜ºx\'6\'+‡Ñ√p,˜∞noP’Àzº∑-Ù∫æı≤æø}˚ˆ6G0È$e?UD¥98Ëº¢˛èØ—§∏∏ÿ∑C∆eg}Ãò1ÁÌ›_ÚÇåq©ﬂTSSìîp£±DΩ∆qï∆zf‚<U®Á◊ÙÍ’À4ª±…„è?˛xÎ≤ÑΩ˜%Á≈êa)	D˙∞qm†zY&.GÎ˛8KÜ∑Ùÿ|–¶√§˜@KJJ⁄æé˙2\\uô’Åâ˜–oÁÛºû«‰Ôıó«Ô¥÷ï[˜;Ö⁄:æ\'tqbqûuˇ\Z´ìËòPò#\"•„*ÎîÈ∑ñ“AGüßFwX§k„X–7xÕ™NË \"ﬂØ!GæœSßNµœªiÙ5/‰ÊÊÊù≠ØØ˜5‹;vl}vvˆëLöÍ»=<ml—∂Éäg˚xPJ—eüxhüÙÃ©‹ì\Zrí1¸§o9íQéPí¬m#›—òÛ=IgV∆-G∏†oH&YYYCıÑc›…It∏JûÁË‹I…999ÖÖÖç~ur§s#·F}0@\nL´ê„wXBﬂ˙æ¥:9√Ì!GÊ‰HóQéÇäıh)ôPlüs#ï‘º …,77˜Ù‚≈ãøˆ0Ò∏·ç7ﬁò-√RÚ!`ÄË+^áï“aX\n}SË;:9™\ZÏEÇétÂdÄ“ù—√W2%g(ñ#ﬂyÁ#??ˇ;«ŸìSídåM•™ ¢¢¢∫m€∂5≈sûõï+WŒWiãL ‘97 òF!\'ﬁLGO(Fﬂ˙Œ¨NŒ≠ˆ√«¨‘Áı¢OH–>|x}iiÈÓıÎ◊Q	Ï∏æ@ß\\8SÆ-UQQÒœIì&-W…Ì†ºQIaôx¥à|∏äa)Ùçæ!iy¡\n:-ÒõœrCı∆G[◊¢8$W˜‘W˘îa…µ\"‰t ôvÜbÃ†ê#ó_Hıä—7Öæ/1» Ö˙=\\’aÿI-E∏AﬂË\00@0#:9K°oÙ\r\0 òQ!ápÉæ—7\0`Ä`FÖú2¬\r˙Fﬂ\0ÄbÄôÑÃπ1B\néæ—7\0`Ä`ÜÒ#>Ùçæ\0ƒ\0–7˙\0ÙM°o\0ê¬\0}SË\0§0@@ﬂ˙¿\0)–7˙\0@ﬂË\00@–7Öæ0@\nÙM°o\0ê¬\0}SË\0§0@@ﬂË\00@\0}£o\0¿\01@@ﬂË}`ÄËõBﬂ\0 Ö˙¶–7\0HaÄÄæ—7\0§Ç  Jå\'}Íú2¿æïÄæ—7\0xd›∫u«ÎÎÎ1ü4®⁄⁄⁄ø(‹À∑–7˙\0è¨^Ω˙·™™™S_~˘e&‘q{vb~GT=¡∑–7˙\0P¢¨ˆ,∂H˚T∆à©îó|Ó{1?@ﬂË\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‰ˇëÅh·nÍFr\0\0\0\0IENDÆB`Ç',1);

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

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20003','leave:2:12504','20001','20001','sid-B08433FD-66AF-4E93-ACA0-E82871E25B72',NULL,NULL,'ÂºÄËµ∑','startEvent',NULL,'2020-10-12 09:33:31.826','2020-10-12 09:33:31.835',9,''),('20005','leave:2:12504','20001','20001','sid-9303BF19-09A3-4A06-922E-AD606B184621','20006',NULL,'ÁªèÁêÜÂÆ°Êâπ','userTask',NULL,'2020-10-12 09:33:31.836','2020-10-12 11:19:05.245',6333409,''),('22502','leave:2:12504','20001','20001','sid-85402145-EF96-4306-917B-333141E9C7C3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-10-12 11:19:05.246','2020-10-12 11:19:05.257',11,''),('22503','leave:2:12504','20001','20001','sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD','22504',NULL,'‰∫∫‰∫ãÂÆ°Êâπ','userTask',NULL,'2020-10-12 11:19:05.257','2020-10-12 11:45:34.893',1589636,''),('25001','leave:2:12504','20001','20001','sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C',NULL,NULL,'ÁªìÊùü','endEvent',NULL,'2020-10-12 11:45:34.900','2020-10-12 11:45:34.900',0,'');

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

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('20001','20001','1','leave:2:12504','2020-10-12 09:33:31.826','2020-10-12 11:45:34.901',7923075,'1','sid-B08433FD-66AF-4E93-ACA0-E82871E25B72','sid-E080B8F2-D5D8-45A6-8BCD-FC010195497C',NULL,NULL,'','ËØ∑ÂÅá');

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

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('20006','leave:2:12504','sid-9303BF19-09A3-4A06-922E-AD606B184621','20001','20001','ÁªèÁêÜÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2020-10-12 09:33:31.838',NULL,'2020-10-12 11:19:05.235',6333397,'completed',50,NULL,NULL,NULL,''),('22504','leave:2:12504','sid-E4DB0127-D80D-4F64-877D-1BC0C0A4A7CD','20001','20001','‰∫∫‰∫ãÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2020-10-12 11:19:05.257',NULL,'2020-10-12 11:45:34.885',1589628,'completed',50,NULL,NULL,NULL,'');

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

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('12501','ÁÆÄÂçïËØ∑ÂÅá',NULL,'','2020-10-10 11:25:56.052'),('5012','ÁÆÄÂçïËØ∑ÂÅá',NULL,'','2020-09-22 15:49:46.801');

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

insert  into `act_re_model`(`ID_`,`REV_`,`NAME_`,`KEY_`,`CATEGORY_`,`CREATE_TIME_`,`LAST_UPDATE_TIME_`,`VERSION_`,`META_INFO_`,`DEPLOYMENT_ID_`,`EDITOR_SOURCE_VALUE_ID_`,`EDITOR_SOURCE_EXTRA_VALUE_ID_`,`TENANT_ID_`) values ('5001',12,'ÁÆÄÂçïËØ∑ÂÅá','process',NULL,'2020-09-22 15:27:08.421','2020-10-10 11:25:56.264',1,'{\"name\":\"ÁÆÄÂçïËØ∑ÂÅá\",\"description\":\"\",\"revision\":1}','12501','5002','5003','');

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

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('leave:1:5015',3,'http://www.activiti.org/processdef','ÁÆÄÂçïËØ∑ÂÅá','leave',1,'5012','ÁÆÄÂçïËØ∑ÂÅá.bpmn20.xml','ÁÆÄÂçïËØ∑ÂÅá.leave.png',NULL,0,1,1,''),('leave:2:12504',1,'http://www.activiti.org/processdef','ÁÆÄÂçïËØ∑ÂÅá','leave',2,'12501','ÁÆÄÂçïËØ∑ÂÅá.bpmn20.xml','ÁÆÄÂçïËØ∑ÂÅá.leave.png',NULL,0,1,1,'');

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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '‰∏ªÈîÆ',
  `task_id` varchar(255) NOT NULL COMMENT '‰ªªÂä°ÁºñÂè∑',
  `result` tinyint(3) unsigned NOT NULL COMMENT 'ÂÆ°Ê†∏ÁªìÊûú 2ÈÄöËøá 3È©≥Âõû',
  `comment` varchar(255) DEFAULT NULL COMMENT 'ÂÆ°Ê†∏ÊÑèËßÅ',
  `proc_name` varchar(255) NOT NULL COMMENT 'ÊµÅÁ®ãÂêçÁß∞',
  `proc_def_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Ë∑ØÁî± ÊµÅÁ®ãÂÆö‰πâkey',
  `applyer` varchar(255) DEFAULT NULL COMMENT 'Áî≥ËØ∑‰∫∫',
  `auditor` varchar(255) DEFAULT NULL COMMENT 'ÂÆ°Êâπ‰∫∫',
  `auditor_id` bigint(20) unsigned NOT NULL COMMENT 'ÂÆ°Êâπ‰∫∫ÁºñÂè∑',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'ÂàõÂª∫Êó∂Èó¥',
  `del_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Âà†Èô§Ê†áËÆ∞',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='‰∏öÂä°ÂÆ°Ê†∏ËÆ∞ÂΩï';

/*Data for the table `biz_audit` */

insert  into `biz_audit`(`id`,`task_id`,`result`,`comment`,`proc_name`,`proc_def_key`,`applyer`,`auditor`,`auditor_id`,`create_time`,`del_flag`) values (1,'20006',2,'ÈÄöËøá1','ÁÆÄÂçïËØ∑ÂÅá','leave','Ë∂ÖÁ∫ßÁÆ°ÁêÜÂëò','Êµ∑Âï¶-ceam',2,'2020-10-12 11:19:05','\0'),(2,'22504',3,NULL,'ÁÆÄÂçïËØ∑ÂÅá','leave','Ë∂ÖÁ∫ßÁÆ°ÁêÜÂëò','ÊùéÂõõ-lisi',5,'2020-10-12 11:45:34','\0');

/*Table structure for table `biz_business` */

DROP TABLE IF EXISTS `biz_business`;

CREATE TABLE `biz_business` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '‰∏ªÈîÆ',
  `proc_def_id` varchar(255) DEFAULT NULL COMMENT 'ÊµÅÁ®ãÂÆö‰πâÁºñÂè∑',
  `proc_def_key` varchar(255) DEFAULT NULL COMMENT 'ÊµÅÁ®ãÂÆö‰πâkey Ë∑ØÁî±Ê†áËÆ∞',
  `proc_inst_id` varchar(255) DEFAULT NULL COMMENT 'ÊµÅÁ®ãÂÆû‰æãÁºñÂè∑',
  `proc_name` varchar(255) DEFAULT NULL COMMENT 'ÊµÅÁ®ãÂêçÁß∞',
  `current_task` varchar(255) DEFAULT NULL COMMENT 'ÂΩìÂâç‰ªªÂä°ËäÇÁÇπÂêçÁß∞',
  `result` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'ÁªìÊûúÁä∂ÊÄÅ  1Â§ÑÁêÜ‰∏≠ 2ÈÄöËøá 3È©≥Âõû',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Áä∂ÊÄÅ 1Â§ÑÁêÜ‰∏≠ 2ÁªìÊùü',
  `table_id` varchar(255) DEFAULT NULL COMMENT 'ÂÖ≥ËÅîË°®id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Áî≥ËØ∑Ê†áÈ¢ò',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ÂàõÂª∫Áî®Êà∑id',
  `applyer` varchar(255) DEFAULT NULL COMMENT 'Áî≥ËØ∑‰∫∫',
  `apply_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Áî≥ËØ∑Êó∂Èó¥',
  `del_flag` bit(1) DEFAULT b'0' COMMENT 'Âà†Èô§Ê†áËÆ∞',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_business` */

insert  into `biz_business`(`id`,`proc_def_id`,`proc_def_key`,`proc_inst_id`,`proc_name`,`current_task`,`result`,`status`,`table_id`,`title`,`user_id`,`applyer`,`apply_time`,`del_flag`) values (1,'leave:2:12504','leave','20001','ÁÆÄÂçïËØ∑ÂÅá','ÂÆ°ÊâπÁªìÊùü',3,2,'1','ËØ∑ÂÅá',1,'Ë∂ÖÁ∫ßÁÆ°ÁêÜÂëò','2020-10-12 09:33:32','\0');

/*Table structure for table `biz_leave` */

DROP TABLE IF EXISTS `biz_leave`;

CREATE TABLE `biz_leave` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '‰∏ªÈîÆ',
  `title` varchar(255) DEFAULT NULL COMMENT 'Ê†áÈ¢ò',
  `description` varchar(255) DEFAULT NULL COMMENT 'ÊèèËø∞',
  `start_date` datetime DEFAULT NULL COMMENT 'ÂºÄÂßãÊó∂Èó¥',
  `end_date` datetime DEFAULT NULL COMMENT 'ÁªìÊùüÊó∂Èó¥',
  `duration` double(11,2) DEFAULT NULL COMMENT 'Êó∂Èïø(Â∞èÊó∂)',
  `type` tinyint(3) DEFAULT NULL COMMENT 'ËØ∑ÂÅáÁ±ªÂûã',
  `del_flag` bit(1) DEFAULT b'0' COMMENT 'Âà†Èô§Ê†áËÆ∞',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='ËØ∑ÂÅá';

/*Data for the table `biz_leave` */

insert  into `biz_leave`(`id`,`title`,`description`,`start_date`,`end_date`,`duration`,`type`,`del_flag`,`create_time`) values (1,'ËØ∑ÂÅá','yy','2020-10-08 09:33:00','2020-11-18 09:33:00',984.00,1,'\0',NULL);

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
