(define (problem sokoban-instance)
  (:domain sokoban)
  
  (:objects
    player - player
    box_1 - box
    goal_1 - goal
    loc_00 loc_01 loc_02 loc_03 loc_04 loc_05 loc_06 loc_07 loc_08 loc_09 loc_10
    loc_11 loc_12 loc_13 loc_14 loc_15 loc_16 loc_17 loc_18 loc_19 loc_20
    loc_21 loc_22 loc_23 loc_24 loc_25 loc_26 loc_27 loc_28 loc_29 loc_30
    loc_31 loc_32 loc_33 loc_34 loc_35 loc_36 loc_37 loc_38 loc_39 loc_40
    loc_41 loc_42 loc_43 loc_44 loc_45 loc_46 loc_47 loc_48 loc_49 loc_50
    loc_51 loc_52 loc_53 loc_54 loc_55 loc_56 loc_57 loc_58 loc_59 loc_60
    loc_61 loc_62 loc_63 loc_64 loc_65 loc_66 loc_67 loc_68 loc_69 loc_70
    loc_71 loc_72 loc_73 loc_74 loc_75 loc_76 loc_77 loc_78 loc_79 loc_80
    loc_81 loc_82 loc_83 loc_84 loc_85 loc_86 loc_87 loc_88 loc_89 loc_90
    loc_91 loc_92 loc_93 loc_94 loc_95 loc_96 loc_97 loc_98 loc_99 loc_100
    loc_101 loc_102 loc_103 loc_104 loc_105 loc_106 loc_107 loc_108 loc_109 loc_110
    loc_111 loc_112 loc_113 loc_114 loc_115 loc_116 loc_117 loc_118 loc_119 loc_120
    loc_121 loc_122 loc_123 loc_124 loc_125 loc_126 loc_127 loc_128 loc_129 loc_130
    loc_131 loc_132 loc_133 loc_134 loc_135 loc_136 loc_137 loc_138 loc_139 loc_140
    loc_141 loc_142 loc_143 loc_144 loc_145 loc_146 loc_147 loc_148 loc_149 loc_150
    loc_151 loc_152 loc_153 loc_154 loc_155 loc_156 loc_157 loc_158 loc_159 loc_160
    loc_161 loc_162 loc_163 loc_164 loc_165 loc_166 loc_167 loc_168 loc_169 loc_170
    loc_171 loc_172 loc_173 loc_174 loc_175 loc_176 loc_177 loc_178 loc_179 loc_180
    loc_181 loc_182 loc_183 loc_184 loc_185 loc_186 loc_187 loc_188 loc_189 loc_190
    loc_191 loc_192 loc_193 loc_194 loc_195 loc_196 loc_197 loc_198 loc_199 loc_200
    loc_201 loc_202 loc_203 loc_204 loc_205 loc_206 loc_207 loc_208 loc_209 loc_210
    loc_211 loc_212 loc_213 loc_214 loc_215 loc_216 loc_217 loc_218 loc_219 loc_220
    loc_221 loc_222 loc_223 loc_224 loc_225 loc_226 loc_227 loc_228 loc_229 loc_230
    loc_231 loc_232 loc_233 loc_234 loc_235 loc_236 loc_237 loc_238 loc_239 loc_240
    loc_241 loc_242 loc_243 loc_244 loc_245 loc_246 loc_247 loc_248 loc_249 loc_250
    loc_251 loc_252 loc_253 loc_254 loc_255 loc_256 loc_257 loc_258 loc_259 loc_260
    loc_261 loc_262 loc_263 loc_264 loc_265 loc_266 loc_267 loc_268 loc_269 loc_270
    loc_271 loc_272 loc_273 loc_274 loc_275 loc_276 loc_277 loc_278 loc_279 loc_280
    loc_281 loc_282 loc_283 loc_284 loc_285 loc_286 loc_287 loc_288 loc_289 loc_290
    loc_291 loc_292 loc_293 loc_294 loc_295 loc_296 loc_297 loc_298 loc_299 loc_300
    loc_301 loc_302 loc_303 loc_304 loc_305 loc_306 loc_307 loc_308 loc_309 loc_310
    loc_311 loc_312 loc_313 loc_314 loc_315 loc_316 loc_317 loc_318 loc_319 loc_320
    loc_321 loc_322 loc_323 loc_324 loc_325 loc_326 loc_327 loc_328 loc_329 loc_330
    loc_331 loc_332 loc_333 loc_334 loc_335 loc_336 loc_337 loc_338 loc_339 loc_340
    loc_341 loc_342 loc_343 loc_344 loc_345 loc_346 loc_347 loc_348 loc_349 loc_350
    loc_351 loc_352 loc_353 loc_354 loc_355 loc_356 loc_357 loc_358 loc_359 loc_360
    loc_361 loc_362 loc_363 loc_364 loc_365 loc_366 loc_367 loc_368 loc_369 loc_370
    loc_371 loc_372 loc_373 loc_374 loc_375 loc_376 loc_377 loc_378 loc_379 loc_380
    loc_381 loc_382 loc_383 loc_384 loc_385 loc_386 loc_387 loc_388 loc_389 loc_390
    loc_391 loc_392 loc_393 loc_394 loc_395 loc_396 loc_397 loc_398 loc_399 loc_400
    loc_401 loc_402 loc_403 loc_404 loc_405 loc_406 loc_407 loc_408 loc_409 loc_410
    loc_411 loc_412 loc_413 loc_414 loc_415 loc_416 loc_417 loc_418 loc_419 loc_420
    loc_421 loc_422 loc_423 loc_424 loc_425 loc_426 loc_427 loc_428 loc_429 loc_430
    loc_431 loc_432 loc_433 loc_434 loc_435 loc_436 loc_437 loc_438 loc_439 loc_440
    loc_441 loc_442 loc_443 loc_444 loc_445 loc_446 loc_447 loc_448 loc_449 loc_450
    loc_451 loc_452 loc_453 loc_454 loc_455 loc_456 loc_457 loc_458 loc_459 loc_460
    loc_461 loc_462 loc_463 loc_464 loc_465 loc_466 loc_467 loc_468 loc_469 loc_470
    loc_471 loc_472 loc_473 loc_474 loc_475 loc_476 loc_477 loc_478 loc_479 loc_480
    loc_481 loc_482 loc_483 loc_484 loc_485 loc_486 loc_487 loc_488 loc_489 loc_490
    loc_491 loc_492 loc_493 loc_494 loc_495 loc_496 loc_497 loc_498 loc_499 loc_500
    loc_501 loc_502 loc_503 loc_504 loc_505 loc_506 loc_507 loc_508 loc_509 loc_510
    loc_511 loc_512 loc_513 loc_514 loc_515 loc_516 loc_517 loc_518 loc_519 loc_520
    loc_521 loc_522 loc_523 loc_524 loc_525 loc_526 loc_527 loc_528 loc_529 loc_530
    loc_531 loc_532 loc_533 loc_534 loc_535 loc_536 loc_537 loc_538 loc_539 loc_540
    loc_541 loc_542 loc_543 loc_544 loc_545 loc_546 loc_547 loc_548 loc_549 loc_550
    loc_551 loc_552 loc_553 loc_554 loc_555 loc_556 loc_557 loc_558 loc_559 loc_560
    loc_561 loc_562 loc_563 loc_564 loc_565 loc_566 loc_567 loc_568 loc_569 loc_570
    loc_571 loc_572 loc_573 loc_574 loc_575 loc_576 loc_577 loc_578 loc_579 loc_580
    loc_581 loc_582 loc_583 loc_584 loc_585 loc_586 loc_587 loc_588 loc_589 loc_590
    loc_591 loc_592 loc_593 loc_594 loc_595 loc_596 loc_597 loc_598 loc_599 loc_600
    loc_601 loc_602 loc_603 loc_604 loc_605 loc_606 loc_607 loc_608 loc_609 loc_610
    loc_611 loc_612 loc_613 loc_614 loc_615 loc_616 loc_617 loc_618 loc_619 loc_620
    loc_621 loc_622 loc_623 loc_624 loc_625 loc_626 loc_627 loc_628 loc_629 loc_630
    loc_631 loc_632 loc_633 loc_634 loc_635 loc_636 loc_637 loc_638 loc_639 loc_640
    loc_641 loc_642 loc_643 loc_644 loc_645 loc_646 loc_647 loc_648 loc_649 loc_650
    loc_651 loc_652 loc_653 loc_654 loc_655 loc_656 loc_657 loc_658 loc_659 loc_660
    loc_661 loc_662 loc_663 loc_664 loc_665 loc_666 loc_667 loc_668 loc_669 loc_670
    loc_671 loc_672 loc_673 loc_674 loc_675 loc_676 loc_677 loc_678 loc_679 loc_680
    loc_681 loc_682 loc_683 loc_684 loc_685 loc_686 loc_687 loc_688 loc_689 loc_690
    loc_691 loc_692 loc_693 loc_694 loc_695 loc_696 loc_697 loc_698 loc_699 loc_700
    loc_701 loc_702 loc_703 loc_704 loc_705 loc_706 loc_707 loc_708 loc_709 loc_710
    loc_711 loc_712 loc_713 loc_714 loc_715 loc_716 loc_717 loc_718 loc_719 loc_720
    loc_721 loc_722 loc_723 loc_724 loc_725 loc_726 loc_727 loc_728 loc_729 loc_730
    loc_731 loc_732 loc_733 loc_734 loc_735 loc_736 loc_737 loc_738 loc_739 loc_740
    loc_741 loc_742 loc_743 loc_744 loc_745 loc_746 loc_747 loc_748 loc_749 loc_750
    loc_751 loc_752 loc_753 loc_754 loc_755 loc_756 loc_757 loc_758 loc_759 loc_760
    loc_761 loc_762 loc_763 loc_764 loc_765 loc_766 loc_767 loc_768 loc_769 loc_770
    loc_771 loc_772 loc_773 loc_774 loc_775 loc_776 loc_777 loc_778 loc_779 loc_780
    loc_781 loc_782 loc_783 loc_784 loc_785 loc_786 loc_787 loc_788 loc_789 loc_790
    loc_791 loc_792 loc_793 loc_794 loc_795 loc_796 loc_797 loc_798 loc_799 loc_800
    loc_801 loc_802 loc_803 loc_804 loc_805 loc_806 loc_807 loc_808 loc_809 loc_810
    loc_811 loc_812 loc_813 loc_814 loc_815 loc_816 loc_817 loc_818 loc_819 loc_820
    loc_821 loc_822 loc_823 loc_824 loc_825 loc_826 loc_827 loc_828 loc_829 loc_830
    loc_831 loc_832 loc_833 loc_834 loc_835 loc_836 loc_837 loc_838 loc_839 loc_840
    loc_841 loc_842 loc_843 loc_844 loc_845 loc_846 loc_847 loc_848 loc_849 loc_850
    loc_851 loc_852 loc_853 loc_854 loc_855 loc_856 loc_857 loc_858 loc_859 loc_860
    loc_861 loc_862 loc_863 loc_864 loc_865 loc_866 loc_867 loc_868 loc_869 loc_870
    loc_871 loc_872 loc_873 loc_874 loc_875 loc_876 loc_877 loc_878 loc_879 loc_880
    loc_881 loc_882 loc_883 loc_884 loc_885 loc_886 loc_887 loc_888 loc_889 loc_890
    loc_891 loc_892 loc_893 loc_894 loc_895 loc_896 loc_897 loc_898 loc_899 loc_900
    loc_901 loc_902 loc_903 loc_904 loc_905 loc_906 loc_907 loc_908 loc_909 loc_910
    loc_911 loc_912 loc_913 loc_914 loc_915 loc_916 loc_917 loc_918 loc_919 loc_920
    loc_921 loc_922 loc_923 loc_924 loc_925 loc_926 loc_927 loc_928 loc_929 loc_930
    loc_931 loc_932 loc_933 loc_934 loc_935 loc_936 loc_937 loc_938 loc_939 loc_940
    loc_941 loc_942 loc_943 loc_944 loc_945 loc_946 loc_947 loc_948 loc_949 loc_950
    loc_951 loc_952 loc_953 loc_954 loc_955 loc_956 loc_957 loc_958 loc_959 loc_960
    loc_961 loc_962 loc_963 loc_964 loc_965 loc_966 loc_967 loc_968 loc_969 loc_970
    loc_971 loc_972 loc_973 loc_974 loc_975 loc_976 loc_977 loc_978 loc_979 loc_980
    loc_981 loc_982 loc_983 loc_984 loc_985 loc_986 loc_987 loc_988 loc_989 loc_990
    loc_991 loc_992 loc_993 loc_994 loc_995 loc_996 loc_997 loc_998 loc_999 loc_1000
    loc_1001 loc_1002 loc_1003 loc_1004 loc_1005 loc_1006 loc_1007 loc_1008 loc_1009 loc_1010
    loc_1011 loc_1012 loc_1013 loc_1014 loc_1015 loc_1016 loc_1017 loc_1018 loc_1019 loc_1020
    loc_1021 loc_1022 loc_1023 loc_1024 loc_1025 loc_1026 loc_1027 loc_1028 loc_1029 loc_1030
    loc_1031 loc_1032 loc_1033 loc_1034 loc_1035 loc_1036 loc_1037 loc_1038 loc_1039 loc_1040
    loc_1041 loc_1042 loc_1043 loc_1044 loc_1045 loc_1046 loc_1047 loc_1048 loc_1049 loc_1050
    loc_1051 loc_1052 loc_1053 loc_1054 loc_1055 loc_1056 loc_1057 loc_1058 loc_1059 loc_1060
    loc_1061 loc_1062 loc_1063 loc_1064 loc_1065 loc_1066 loc_1067 loc_1068 loc_1069 loc_1070
    loc_1071 loc_1072 loc_1073 loc_1074 loc_1075 loc_1076 loc_1077 loc_1078 loc_1079 loc_1080
    loc_1081 loc_1082 loc_1083 loc_1084 loc_1085 loc_1086 loc_1087 loc_1088 loc_1089 loc_1090
    loc_1091 loc_1092 loc_1093 loc_1094 loc_1095 loc_1096 loc_1097 loc_1098 loc_1099 loc_1100
    loc_1101 loc_1102 loc_1103 loc_1104 loc_1105 loc_1106 loc_1107 loc_1108 loc_1109 loc_1110
    loc_1111 loc_1112 loc_1113 loc_1114 loc_1115 loc_1116 loc_1117 loc_1118 loc_1119 loc_1120
    loc_1121 loc_1122 loc_1123 loc_1124 loc_1125 loc_1126 loc_1127 loc_1128 loc_1129 loc_1130
    loc_1131 loc_1132 loc_1133 loc_1134 loc_1135 loc_1136 loc_1137 loc_1138 loc_1139 loc_1140
    loc_1141 loc_1142 loc_1143 loc_1144 loc_1145 loc_1146 loc_1147 loc_1148 loc_1149 loc_1150
    loc_1151 loc_1152 loc_1153 loc_1154 loc_1155 loc_1156 loc_1157 loc_1158 loc_1159 loc_1160
    loc_1161 loc_1162 loc_1163 loc_1164 loc_1165 loc_1166 loc_1167 loc_1168 loc_1169 loc_1170
    loc_1171 loc_1172 loc_1173 loc_1174 loc_1175 loc_1176 loc_1177 loc_1178 loc_1179 loc_1180
    loc_1181 loc_1182 loc_1183 loc_1184 loc_1185 loc_1186 loc_1187 loc_1188 loc_1189 loc_1190
    loc_1191 loc_1192 loc_1193 loc_1194 loc_1195 loc_1196 loc_1197 loc_1198 loc_1199 loc_1200
    loc_1201 loc_1202 loc_1203 loc_1204 loc_1205 loc_1206 loc_1207 loc_1208 loc_1209 loc_1210
    loc_1211 loc_1212 loc_1213 loc_1214 loc_1215 loc_1216 loc_1217 loc_1218 loc_1219 loc_1220
    loc_1221 loc_1222 loc_1223 loc_1224 loc_1225 loc_1226 loc_1227 loc_1228 loc_1229 loc_1230
    loc_1231 loc_1232 loc_1233 loc_1234 loc_1235 loc_1236 loc_1237 loc_1238 loc_1239 loc_1240
    loc_1241 loc_1242 loc_1243 loc_1244 loc_1245 loc_1246 loc_1247 loc_1248 loc_1249 loc_1250
    loc_1251 loc_1252 loc_1253 loc_1254 loc_1255 loc_1256 loc_1257 loc_1258 loc_1259 loc_1260
    loc_1261 loc_1262 loc_1263 loc_1264 loc_1265 loc_1266 loc_1267 loc_1268 loc_1269 loc_1270
    loc_1271 loc_1272 loc_1273 loc_1274 loc_1275 loc_1276 loc_1277 loc_1278 loc_1279 loc_1280
    loc_1281 loc_1282 loc_1283 loc_1284 loc_1285 loc_1286 loc_1287 loc_1288 loc_1289 loc_1290
    loc_1291 loc_1292 loc_1293 loc_1294 loc_1295 loc_1296 loc_1297 loc_1298 loc_1299 loc_1300
    loc_1301 loc_1302 loc_1303 loc_1304 loc_1305 loc_1306 loc_1307 loc_1308 loc_1309 loc_1310
    loc_1311 loc_1312 loc_1313 loc_1314 loc_1315 loc_1316 loc_1317 loc_1318 loc_1319 loc_1320
    loc_1321 loc_1322 loc_1323 loc_1324 loc_1325 loc_1326 loc_1327 loc_1328 loc_1329 loc_1330
    loc_1331 loc_1332 loc_1333 loc_1334 loc_1335 loc_1336 loc_1337 loc_1338 loc_1339 loc_1340
    loc_1341 loc_1342 loc_1343 loc_1344 loc_1345 loc_1346 loc_1347 loc_1348 loc_1349 loc_1350
    loc_1351 loc_1352 loc_1353 loc_1354 loc_1355 loc_1356 loc_1357 loc_1358 loc_1359 loc_1360
    loc_1361 loc_1362 loc_1363 loc_1364 loc_1365 loc_1366 loc_1367 loc_1368 loc_1369 loc_1370
    loc_1371 loc_1372 loc_1373 loc_1374 loc_1375 loc_1376 loc_1377 loc_1378 loc_1379 loc_1380
    loc_1381 loc_1382 loc_1383 loc_1384 loc_1385 loc_1386 loc_1387 loc_1388 loc_1389 loc_1390
    loc_1391 loc_1392 loc_1393 loc_1394 loc_1395 loc_1396 loc_1397 loc_1398 loc_1399 loc_1400
    loc_1401 loc_1402 loc_1403 loc_1404 loc_1405 loc_1406 loc_1407 loc_1408 loc_1409 loc_1410
    loc_1411 loc_1412 loc_1413 loc_1414 loc_1415 loc_1416 loc_1417 loc_1418 loc_1419 loc_1420
    loc_1421 loc_1422 loc_1423 loc_1424 loc_1425 loc_1426 loc_1427 loc_1428 loc_1429 loc_1430
    loc_1431 loc_1432 loc_1433 loc_1434 loc_1435 loc_1436 loc_1437 loc_1438 loc_1439 loc_1440
    loc_1441 loc_1442 loc_1443 loc_1444 loc_1445 loc_1446 loc_1447 loc_1448 loc_1449 loc_1450
    loc_1451 loc_1452 loc_1453 loc_1454 loc_1455 loc_1456 loc_1457 loc_1458 loc_1459 loc_1460
    loc_1461 loc_1462 loc_1463 loc_1464 loc_1465 loc_1466 loc_1467 loc_1468 loc_1469 loc_1470
    loc_1471 loc_1472 loc_1473 loc_1474 loc_1475 loc_1476 loc_1477 loc_1478 loc_1479 loc_1480
    loc_1481 loc_1482 loc_1483 loc_1484 loc_1485 loc_1486 loc_1487 loc_1488 loc_1489 loc_1490
    loc_1491 loc_1492 loc_1493 loc_1494 loc_1495 loc_1496 loc_1497 loc_1498 loc_1499 
    wall_0 wall_1 wall_2 wall_3 wall_4 wall_5 wall_6 wall_7 wall_8 wall_9 wall_10
    wall_11 wall_12 wall_13 wall_14 wall_15 wall_16 wall_17 wall_18 wall_19 wall_20 
    - location
  )
  
  (:init
    (at_player loc_00)
    (at_box box_1 loc_150)
    (at_goal loc_1499)
    (clear loc_02)
    (adjacent loc_00 loc_01)
    (adjacent loc_00 loc_10)
    (adjacent loc_50 loc_51)
    (adjacent loc_50 loc_40)
    ; Specify all the clear locations and adjacency relations logically...
  )
  
  (:goal
    (box_on_goal box_1)
  )
)