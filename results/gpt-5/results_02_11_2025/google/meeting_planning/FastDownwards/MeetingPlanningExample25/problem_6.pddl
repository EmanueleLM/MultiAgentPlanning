(define (problem meeting_planning_example25)
  (:domain day_visit_sf)
  (:objects
    goldengatepark chinatown - location
    david - person
    g1 g2 g3 g6 cf1 cf2 cf3 - friend
    t0900 t0901 t0902 t0903 t0904 t0905 t0906 t0907 t0908 t0909
    t0910 t0911 t0912 t0913 t0914 t0915 t0916 t0917 t0918 t0919
    t0920 t0921 t0922 t0923 t0924 t0925 t0926 t0927 t0928 t0929
    t0930 t0931 t0932 t0933 t0934 t0935 t0936 t0937 t0938 t0939
    t0940 t0941 t0942 t0943 t0944 t0945 t0946 t0947 t0948 t0949
    t0950 t0951 t0952 t0953 t0954 t0955 t0956 t0957 t0958 t0959
    t1000 t1001 t1002 t1003 t1004 t1005 t1006 t1007 t1008 t1009
    t1010 t1011 t1012 t1013 t1014 t1015 t1016 t1017 t1018 t1019
    t1020 t1021 t1022 t1023 t1024 t1025 t1026 t1027 t1028 t1029
    t1030 t1031 t1032 t1033 t1034 t1035 t1036 t1037 t1038 t1039
    t1040 t1041 t1042 t1043 t1044 t1045 t1046 t1047 t1048 t1049
    t1050 t1051 t1052 t1053 t1054 t1055 t1056 t1057 t1058 t1059
    t1100 t1101 t1102 t1103 t1104 t1105 t1106 t1107 t1108 t1109
    t1110 t1111 t1112 t1113 t1114 t1115 t1116 t1117 t1118 t1119
    t1120 t1121 t1122 t1123 t1124 t1125 t1126 t1127 t1128 t1129
    t1130 t1131 t1132 t1133 t1134 t1135 t1136 t1137 t1138 t1139
    t1140 t1141 t1142 t1143 t1144 t1145 t1146 t1147 t1148 t1149
    t1150 t1151 t1152 t1153 t1154 t1155 t1156 t1157 t1158 t1159
    t1200 t1201 t1202 t1203 t1204 t1205 t1206 t1207 t1208 t1209
    t1210 t1211 t1212 t1213 t1214 t1215 t1216 t1217 t1218 t1219
    t1220 t1221 t1222 t1223 t1224 t1225 t1226 t1227 t1228 t1229
    t1230 t1231 t1232 t1233 t1234 t1235 t1236 t1237 t1238 t1239
    t1240 t1241 t1242 t1243 t1244 t1245 t1246 t1247 t1248 t1249
    t1250 t1251 t1252 t1253 t1254 t1255 t1256 t1257 t1258 t1259
    t1300 t1301 t1302 t1303 t1304 t1305 t1306 t1307 t1308 t1309
    t1310 t1311 t1312 t1313 t1314 t1315 t1316 t1317 t1318 t1319
    t1320 t1321 t1322 t1323 t1324 t1325 t1326 t1327 t1328 t1329
    t1330 t1331 t1332 t1333 t1334 t1335 t1336 t1337 t1338 t1339
    t1340 t1341 t1342 t1343 t1344 t1345 t1346 t1347 t1348 t1349
    t1350 t1351 t1352 t1353 t1354 t1355 t1356 t1357 t1358 t1359
    t1400 t1401 t1402 t1403 t1404 t1405 t1406 t1407 t1408 t1409
    t1410 t1411 t1412 t1413 t1414 t1415 t1416 t1417 t1418 t1419
    t1420 t1421 t1422 t1423 t1424 t1425 t1426 t1427 t1428 t1429
    t1430 t1431 t1432 t1433 t1434 t1435 t1436 t1437 t1438 t1439
    t1440 t1441 t1442 t1443 t1444 t1445 t1446 t1447 t1448 t1449
    t1450 t1451 t1452 t1453 t1454 t1455 t1456 t1457 t1458 t1459
    t1500 t1501 t1502 t1503 t1504 t1505 t1506 t1507 t1508 t1509
    t1510 t1511 t1512 t1513 t1514 t1515 t1516 t1517 t1518 t1519
    t1520 t1521 t1522 t1523 t1524 t1525 t1526 t1527 t1528 t1529
    t1530 t1531 t1532 t1533 t1534 t1535 t1536 t1537 t1538 t1539
    t1540 t1541 t1542 t1543 t1544 t1545 t1546 t1547 t1548 t1549
    t1550 t1551 t1552 t1553 t1554 t1555 t1556 t1557 t1558 t1559
    t1600 t1601 t1602 t1603 t1604 t1605 t1606 t1607 t1608 t1609
    t1610 t1611 t1612 t1613 t1614 t1615 t1616 t1617 t1618 t1619
    t1620 t1621 t1622 t1623 t1624 t1625 t1626 t1627 t1628 t1629
    t1630 t1631 t1632 t1633 t1634 t1635 t1636 t1637 t1638 t1639
    t1640 t1641 t1642 t1643 t1644 t1645 t1646 t1647 t1648 t1649
    t1650 t1651 t1652 t1653 t1654 t1655 t1656 t1657 t1658 t1659
    t1700 t1701 t1702 t1703 t1704 t1705 t1706 t1707 t1708 t1709
    t1710 t1711 t1712 t1713 t1714 t1715 t1716 t1717 t1718 t1719
    t1720 t1721 t1722 t1723 t1724 t1725 t1726 t1727 t1728 t1729
    t1730 t1731 t1732 t1733 t1734 t1735 t1736 t1737 t1738 t1739
    t1740 t1741 t1742 t1743 t1744 t1745 t1746 t1747 t1748 t1749
    t1750 t1751 t1752 t1753 t1754 t1755 t1756 t1757 t1758 t1759
    t1800 t1801 t1802 t1803 t1804 t1805 t1806 t1807 t1808 t1809
    t1810 t1811 t1812 t1813 t1814 t1815 t1816 t1817 t1818 t1819
    t1820 t1821 t1822 t1823 t1824 t1825 t1826 t1827 t1828 t1829
    t1830 t1831 t1832 t1833 t1834 t1835 t1836 t1837 t1838 t1839
    t1840 t1841 t1842 t1843 t1844 t1845 t1846 t1847 t1848 t1849
    t1850 t1851 t1852 t1853 t1854 t1855 t1856 t1857 t1858 t1859
    t1900 t1901 t1902 t1903 t1904 t1905 t1906 t1907 t1908 t1909
    t1910 t1911 t1912 t1913 t1914 t1915 t1916 t1917 t1918 t1919
    t1920 t1921 t1922 t1923 t1924 t1925 t1926 t1927 t1928 t1929
    t1930 t1931 t1932 t1933 t1934 t1935 t1936 t1937 t1938 t1939
    t1940 t1941 t1942 t1943 t1944 t1945 t1946 t1947 t1948 t1949
    t1950 t1951 t1952 t1953 t1954 t1955 t1956 t1957 t1958 t1959
    t2000 t2001 t2002 t2003 t2004 t2005 t2006 t2007 t2008 t2009
    t2010 t2011 t2012 t2013 t2014 t2015 t2016 t2017 t2018 t2019
    t2020 t2021 t2022 t2023 t2024 t2025 t2026 t2027 t2028 t2029
    t2030 t2031 t2032 t2033 t2034 t2035 t2036 t2037 t2038 t2039
    t2040 t2041 t2042 t2043 t2044 t2045 t2046 t2047 t2048 t2049
    t2050 t2051 t2052 t2053 t2054 t2055 t2056 t2057 t2058 t2059
    t2100 t2101 t2102 t2103 t2104 t2105 t2106 t2107 t2108 t2109
    t2110 t2111 t2112 t2113 t2114 t2115 t2116 t2117 t2118 t2119
    t2120 t2121 t2122 t2123 t2124 t2125 t2126 t2127 t2128 t2129
    t2130 t2131 t2132 t2133 t2134 t2135 t2136 t2137 t2138 t2139
    t2140 t2141 t2142 t2143 t2144 t2145 - time
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9
    c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
    c20 c21 c22 c23 c24 c25 c26 c27 c28 c29
    c30 c31 c32 c33 c34 c35 c36 c37 c38 c39
    c40 c41 c42 c43 c44 c45 c46 c47 c48 c49
    c50 c51 c52 c53 c54 c55 c56 c57 c58 c59
    c60 c61 c62 c63 c64 c65 c66 c67 c68 c69
    c70 c71 c72 c73 c74 c75 c76 c77 c78 c79
    c80 c81 c82 c83 c84 c85 c86 c87 c88 c89
    c90 c91 c92 c93 c94 c95 c96 c97 c98 c99
    c100 c101 c102 c103 c104 c105 - count
    tc1 tc2 tc3 tc4 tc5 tc6 tc7 tc8 tc9
    tc10 tc11 tc12 tc13 tc14 tc15 tc16 tc17 tc18 tc19
    tc20 tc21 tc22 - tcount
  )
  (:init
    (at goldengatepark)
    (current-time t0900)
    (link goldengatepark chinatown)
    (link chinatown goldengatepark)
    (next t0900 t0901) (next t0901 t0902) (next t0902 t0903) (next t0903 t0904) (next t0904 t0905)
    (next t0905 t0906) (next t0906 t0907) (next t0907 t0908) (next t0908 t0909) (next t0909 t0910)
    (next t0910 t0911) (next t0911 t0912) (next t0912 t0913) (next t0913 t0914) (next t0914 t0915)
    (next t0915 t0916) (next t0916 t0917) (next t0917 t0918) (next t0918 t0919) (next t0919 t0920)
    (next t0920 t0921) (next t0921 t0922) (next t0922 t0923) (next t0923 t0924) (next t0924 t0925)
    (next t0925 t0926) (next t0926 t0927) (next t0927 t0928) (next t0928 t0929) (next t0929 t0930)
    (next t0930 t0931) (next t0931 t0932) (next t0932 t0933) (next t0933 t0934) (next t0934 t0935)
    (next t0935 t0936) (next t0936 t0937) (next t0937 t0938) (next t0938 t0939) (next t0939 t0940)
    (next t0940 t0941) (next t0941 t0942) (next t0942 t0943) (next t0943 t0944) (next t0944 t0945)
    (next t0945 t0946) (next t0946 t0947) (next t0947 t0948) (next t0948 t0949) (next t0949 t0950)
    (next t0950 t0951) (next t0951 t0952) (next t0952 t0953) (next t0953 t0954) (next t0954 t0955)
    (next t0955 t0956) (next t0956 t0957) (next t0957 t0958) (next t0958 t0959) (next t0959 t1000)
    (next t1000 t1001) (next t1001 t1002) (next t1002 t1003) (next t1003 t1004) (next t1004 t1005)
    (next t1005 t1006) (next t1006 t1007) (next t1007 t1008) (next t1008 t1009) (next t1009 t1010)
    (next t1010 t1011) (next t1011 t1012) (next t1012 t1013) (next t1013 t1014) (next t1014 t1015)
    (next t1015 t1016) (next t1016 t1017) (next t1017 t1018) (next t1018 t1019) (next t1019 t1020)
    (next t1020 t1021) (next t1021 t1022) (next t1022 t1023) (next t1023 t1024) (next t1024 t1025)
    (next t1025 t1026) (next t1026 t1027) (next t1027 t1028) (next t1028 t1029) (next t1029 t1030)
    (next t1030 t1031) (next t1031 t1032) (next t1032 t1033) (next t1033 t1034) (next t1034 t1035)
    (next t1035 t1036) (next t1036 t1037) (next t1037 t1038) (next t1038 t1039) (next t1039 t1040)
    (next t1040 t1041) (next t1041 t1042) (next t1042 t1043) (next t1043 t1044) (next t1044 t1045)
    (next t1045 t1046) (next t1046 t1047) (next t1047 t1048) (next t1048 t1049) (next t1049 t1050)
    (next t1050 t1051) (next t1051 t1052) (next t1052 t1053) (next t1053 t1054) (next t1054 t1055)
    (next t1055 t1056) (next t1056 t1057) (next t1057 t1058) (next t1058 t1059) (next t1059 t1100)
    (next t1100 t1101) (next t1101 t1102) (next t1102 t1103) (next t1103 t1104) (next t1104 t1105)
    (next t1105 t1106) (next t1106 t1107) (next t1107 t1108) (next t1108 t1109) (next t1109 t1110)
    (next t1110 t1111) (next t1111 t1112) (next t1112 t1113) (next t1113 t1114) (next t1114 t1115)
    (next t1115 t1116) (next t1116 t1117) (next t1117 t1118) (next t1118 t1119) (next t1119 t1120)
    (next t1120 t1121) (next t1121 t1122) (next t1122 t1123) (next t1123 t1124) (next t1124 t1125)
    (next t1125 t1126) (next t1126 t1127) (next t1127 t1128) (next t1128 t1129) (next t1129 t1130)
    (next t1130 t1131) (next t1131 t1132) (next t1132 t1133) (next t1133 t1134) (next t1134 t1135)
    (next t1135 t1136) (next t1136 t1137) (next t1137 t1138) (next t1138 t1139) (next t1139 t1140)
    (next t1140 t1141) (next t1141 t1142) (next t1142 t1143) (next t1143 t1144) (next t1144 t1145)
    (next t1145 t1146) (next t1146 t1147) (next t1147 t1148) (next t1148 t1149) (next t1149 t1150)
    (next t1150 t1151) (next t1151 t1152) (next t1152 t1153) (next t1153 t1154) (next t1154 t1155)
    (next t1155 t1156) (next t1156 t1157) (next t1157 t1158) (next t1158 t1159) (next t1159 t1200)
    (next t1200 t1201) (next t1201 t1202) (next t1202 t1203) (next t1203 t1204) (next t1204 t1205)
    (next t1205 t1206) (next t1206 t1207) (next t1207 t1208) (next t1208 t1209) (next t1209 t1210)
    (next t1210 t1211) (next t1211 t1212) (next t1212 t1213) (next t1213 t1214) (next t1214 t1215)
    (next t1215 t1216) (next t1216 t1217) (next t1217 t1218) (next t1218 t1219) (next t1219 t1220)
    (next t1220 t1221) (next t1221 t1222) (next t1222 t1223) (next t1223 t1224) (next t1224 t1225)
    (next t1225 t1226) (next t1226 t1227) (next t1227 t1228) (next t1228 t1229) (next t1229 t1230)
    (next t1230 t1231) (next t1231 t1232) (next t1232 t1233) (next t1233 t1234) (next t1234 t1235)
    (next t1235 t1236) (next t1236 t1237) (next t1237 t1238) (next t1238 t1239) (next t1239 t1240)
    (next t1240 t1241) (next t1241 t1242) (next t1242 t1243) (next t1243 t1244) (next t1244 t1245)
    (next t1245 t1246) (next t1246 t1247) (next t1247 t1248) (next t1248 t1249) (next t1249 t1250)
    (next t1250 t1251) (next t1251 t1252) (next t1252 t1253) (next t1253 t1254) (next t1254 t1255)
    (next t1255 t1256) (next t1256 t1257) (next t1257 t1258) (next t1258 t1259) (next t1259 t1300)
    (next t1300 t1301) (next t1301 t1302) (next t1302 t1303) (next t1303 t1304) (next t1304 t1305)
    (next t1305 t1306) (next t1306 t1307) (next t1307 t1308) (next t1308 t1309) (next t1309 t1310)
    (next t1310 t1311) (next t1311 t1312) (next t1312 t1313) (next t1313 t1314) (next t1314 t1315)
    (next t1315 t1316) (next t1316 t1317) (next t1317 t1318) (next t1318 t1319) (next t1319 t1320)
    (next t1320 t1321) (next t1321 t1322) (next t1322 t1323) (next t1323 t1324) (next t1324 t1325)
    (next t1325 t1326) (next t1326 t1327) (next t1327 t1328) (next t1328 t1329) (next t1329 t1330)
    (next t1330 t1331) (next t1331 t1332) (next t1332 t1333) (next t1333 t1334) (next t1334 t1335)
    (next t1335 t1336) (next t1336 t1337) (next t1337 t1338) (next t1338 t1339) (next t1339 t1340)
    (next t1340 t1341) (next t1341 t1342) (next t1342 t1343) (next t1343 t1344) (next t1344 t1345)
    (next t1345 t1346) (next t1346 t1347) (next t1347 t1348) (next t1348 t1349) (next t1349 t1350)
    (next t1350 t1351) (next t1351 t1352) (next t1352 t1353) (next t1353 t1354) (next t1354 t1355)
    (next t1355 t1356) (next t1356 t1357) (next t1357 t1358) (next t1358 t1359) (next t1359 t1400)
    (next t1400 t1401) (next t1401 t1402) (next t1402 t1403) (next t1403 t1404) (next t1404 t1405)
    (next t1405 t1406) (next t1406 t1407) (next t1407 t1408) (next t1408 t1409) (next t1409 t1410)
    (next t1410 t1411) (next t1411 t1412) (next t1412 t1413) (next t1413 t1414) (next t1414 t1415)
    (next t1415 t1416) (next t1416 t1417) (next t1417 t1418) (next t1418 t1419) (next t1419 t1420)
    (next t1420 t1421) (next t1421 t1422) (next t1422 t1423) (next t1423 t1424) (next t1424 t1425)
    (next t1425 t1426) (next t1426 t1427) (next t1427 t1428) (next t1428 t1429) (next t1429 t1430)
    (next t1430 t1431) (next t1431 t1432) (next t1432 t1433) (next t1433 t1434) (next t1434 t1435)
    (next t1435 t1436) (next t1436 t1437) (next t1437 t1438) (next t1438 t1439) (next t1439 t1440)
    (next t1440 t1441) (next t1441 t1442) (next t1442 t1443) (next t1443 t1444) (next t1444 t1445)
    (next t1445 t1446) (next t1446 t1447) (next t1447 t1448) (next t1448 t1449) (next t1449 t1450)
    (next t1450 t1451) (next t1451 t1452) (next t1452 t1453) (next t1453 t1454) (next t1454 t1455)
    (next t1455 t1456) (next t1456 t1457) (next t1457 t1458) (next t1458 t1459) (next t1459 t1500)
    (next t1500 t1501) (next t1501 t1502) (next t1502 t1503) (next t1503 t1504) (next t1504 t1505)
    (next t1505 t1506) (next t1506 t1507) (next t1507 t1508) (next t1508 t1509) (next t1509 t1510)
    (next t1510 t1511) (next t1511 t1512) (next t1512 t1513) (next t1513 t1514) (next t1514 t1515)
    (next t1515 t1516) (next t1516 t1517) (next t1517 t1518) (next t1518 t1519) (next t1519 t1520)
    (next t1520 t1521) (next t1521 t1522) (next t1522 t1523) (next t1523 t1524) (next t1524 t1525)
    (next t1525 t1526) (next t1526 t1527) (next t1527 t1528) (next t1528 t1529) (next t1529 t1530)
    (next t1530 t1531) (next t1531 t1532) (next t1532 t1533) (next t1533 t1534) (next t1534 t1535)
    (next t1535 t1536) (next t1536 t1537) (next t1537 t1538) (next t1538 t1539) (next t1539 t1540)
    (next t1540 t1541) (next t1541 t1542) (next t1542 t1543) (next t1543 t1544) (next t1544 t1545)
    (next t1545 t1546) (next t1546 t1547) (next t1547 t1548) (next t1548 t1549) (next t1549 t1550)
    (next t1550 t1551) (next t1551 t1552) (next t1552 t1553) (next t1553 t1554) (next t1554 t1555)
    (next t1555 t1556) (next t1556 t1557) (next t1557 t1558) (next t1558 t1559) (next t1559 t1600)
    (next t1600 t1601) (next t1601 t1602) (next t1602 t1603) (next t1603 t1604) (next t1604 t1605)
    (next t1605 t1606) (next t1606 t1607) (next t1607 t1608) (next t1608 t1609) (next t1609 t1610)
    (next t1610 t1611) (next t1611 t1612) (next t1612 t1613) (next t1613 t1614) (next t1614 t1615)
    (next t1615 t1616) (next t1616 t1617) (next t1617 t1618) (next t1618 t1619) (next t1619 t1620)
    (next t1620 t1621) (next t1621 t1622) (next t1622 t1623) (next t1623 t1624) (next t1624 t1625)
    (next t1625 t1626) (next t1626 t1627) (next t1627 t1628) (next t1628 t1629) (next t1629 t1630)
    (next t1630 t1631) (next t1631 t1632) (next t1632 t1633) (next t1633 t1634) (next t1634 t1635)
    (next t1635 t1636) (next t1636 t1637) (next t1637 t1638) (next t1638 t1639) (next t1639 t1640)
    (next t1640 t1641) (next t1641 t1642) (next t1642 t1643) (next t1643 t1644) (next t1644 t1645)
    (next t1645 t1646) (next t1646 t1647) (next t1647 t1648) (next t1648 t1649) (next t1649 t1650)
    (next t1650 t1651) (next t1651 t1652) (next t1652 t1653) (next t1653 t1654) (next t1654 t1655)
    (next t1655 t1656) (next t1656 t1657) (next t1657 t1658) (next t1658 t1659) (next t1659 t1700)
    (next t1700 t1701) (next t1701 t1702) (next t1702 t1703) (next t1703 t1704) (next t1704 t1705)
    (next t1705 t1706) (next t1706 t1707) (next t1707 t1708) (next t1708 t1709) (next t1709 t1710)
    (next t1710 t1711) (next t1711 t1712) (next t1712 t1713) (next t1713 t1714) (next t1714 t1715)
    (next t1715 t1716) (next t1716 t1717) (next t1717 t1718) (next t1718 t1719) (next t1719 t1720)
    (next t1720 t1721) (next t1721 t1722) (next t1722 t1723) (next t1723 t1724) (next t1724 t1725)
    (next t1725 t1726) (next t1726 t1727) (next t1727 t1728) (next t1728 t1729) (next t1729 t1730)
    (next t1730 t1731) (next t1731 t1732) (next t1732 t1733) (next t1733 t1734) (next t1734 t1735)
    (next t1735 t1736) (next t1736 t1737) (next t1737 t1738) (next t1738 t1739) (next t1739 t1740)
    (next t1740 t1741) (next t1741 t1742) (next t1742 t1743) (next t1743 t1744) (next t1744 t1745)
    (next t1745 t1746) (next t1746 t1747) (next t1747 t1748) (next t1748 t1749) (next t1749 t1750)
    (next t1750 t1751) (next t1751 t1752) (next t1752 t1753) (next t1753 t1754) (next t1754 t1755)
    (next t1755 t1756) (next t1756 t1757) (next t1757 t1758) (next t1758 t1759) (next t1759 t1800)
    (next t1800 t1801) (next t1801 t1802) (next t1802 t1803) (next t1803 t1804) (next t1804 t1805)
    (next t1805 t1806) (next t1806 t1807) (next t1807 t1808) (next t1808 t1809) (next t1809 t1810)
    (next t1810 t1811) (next t1811 t1812) (next t1812 t1813) (next t1813 t1814) (next t1814 t1815)
    (next t1815 t1816) (next t1816 t1817) (next t1817 t1818) (next t1818 t1819) (next t1819 t1820)
    (next t1820 t1821) (next t1821 t1822) (next t1822 t1823) (next t1823 t1824) (next t1824 t1825)
    (next t1825 t1826) (next t1826 t1827) (next t1827 t1828) (next t1828 t1829) (next t1829 t1830)
    (next t1830 t1831) (next t1831 t1832) (next t1832 t1833) (next t1833 t1834) (next t1834 t1835)
    (next t1835 t1836) (next t1836 t1837) (next t1837 t1838) (next t1838 t1839) (next t1839 t1840)
    (next t1840 t1841) (next t1841 t1842) (next t1842 t1843) (next t1843 t1844) (next t1844 t1845)
    (next t1845 t1846) (next t1846 t1847) (next t1847 t1848) (next t1848 t1849) (next t1849 t1850)
    (next t1850 t1851) (next t1851 t1852) (next t1852 t1853) (next t1853 t1854) (next t1854 t1855)
    (next t1855 t1856) (next t1856 t1857) (next t1857 t1858) (next t1858 t1859) (next t1859 t1900)
    (next t1900 t1901) (next t1901 t1902) (next t1902 t1903) (next t1903 t1904) (next t1904 t1905)
    (next t1905 t1906) (next t1906 t1907) (next t1907 t1908) (next t1908 t1909) (next t1909 t1910)
    (next t1910 t1911) (next t1911 t1912) (next t1912 t1913) (next t1913 t1914) (next t1914 t1915)
    (next t1915 t1916) (next t1916 t1917) (next t1917 t1918) (next t1918 t1919) (next t1919 t1920)
    (next t1920 t1921) (next t1921 t1922) (next t1922 t1923) (next t1923 t1924) (next t1924 t1925)
    (next t1925 t1926) (next t1926 t1927) (next t1927 t1928) (next t1928 t1929) (next t1929 t1930)
    (next t1930 t1931) (next t1931 t1932) (next t1932 t1933) (next t1933 t1934) (next t1934 t1935)
    (next t1935 t1936) (next t1936 t1937) (next t1937 t1938) (next t1938 t1939) (next t1939 t1940)
    (next t1940 t1941) (next t1941 t1942) (next t1942 t1943) (next t1943 t1944) (next t1944 t1945)
    (next t1945 t1946) (next t1946 t1947) (next t1947 t1948) (next t1948 t1949) (next t1949 t1950)
    (next t1950 t1951) (next t1951 t1952) (next t1952 t1953) (next t1953 t1954) (next t1954 t1955)
    (next t1955 t1956) (next t1956 t1957) (next t1957 t1958) (next t1958 t1959) (next t1959 t2000)
    (next t2000 t2001) (next t2001 t2002) (next t2002 t2003) (next t2003 t2004) (next t2004 t2005)
    (next t2005 t2006) (next t2006 t2007) (next t2007 t2008) (next t2008 t2009) (next t2009 t2010)
    (next t2010 t2011) (next t2011 t2012) (next t2012 t2013) (next t2013 t2014) (next t2014 t2015)
    (next t2015 t2016) (next t2016 t2017) (next t2017 t2018) (next t2018 t2019) (next t2019 t2020)
    (next t2020 t2021) (next t2021 t2022) (next t2022 t2023) (next t2023 t2024) (next t2024 t2025)
    (next t2025 t2026) (next t2026 t2027) (next t2027 t2028) (next t2028 t2029) (next t2029 t2030)
    (next t2030 t2031) (next t2031 t2032) (next t2032 t2033) (next t2033 t2034) (next t2034 t2035)
    (next t2035 t2036) (next t2036 t2037) (next t2037 t2038) (next t2038 t2039) (next t2039 t2040)
    (next t2040 t2041) (next t2041 t2042) (next t2042 t2043) (next t2043 t2044) (next t2044 t2045)
    (next t2045 t2046) (next t2046 t2047) (next t2047 t2048) (next t2048 t2049) (next t2049 t2050)
    (next t2050 t2051) (next t2051 t2052) (next t2052 t2053) (next t2053 t2054) (next t2054 t2055)
    (next t2055 t2056) (next t2056 t2057) (next t2057 t2058) (next t2058 t2059) (next t2059 t2100)
    (next t2100 t2101) (next t2101 t2102) (next t2102 t2103) (next t2103 t2104) (next t2104 t2105)
    (next t2105 t2106) (next t2106 t2107) (next t2107 t2108) (next t2108 t2109) (next t2109 t2110)
    (next t2110 t2111) (next t2111 t2112) (next t2112 t2113) (next t2113 t2114) (next t2114 t2115)
    (next t2115 t2116) (next t2116 t2117) (next t2117 t2118) (next t2118 t2119) (next t2119 t2120)
    (next t2120 t2121) (next t2121 t2122) (next t2122 t2123) (next t2123 t2124) (next t2124 t2125)
    (next t2125 t2126) (next t2126 t2127) (next t2127 t2128) (next t2128 t2129) (next t2129 t2130)
    (next t2130 t2131) (next t2131 t2132) (next t2132 t2133) (next t2133 t2134) (next t2134 t2135)
    (next t2135 t2136) (next t2136 t2137) (next t2137 t2138) (next t2138 t2139) (next t2139 t2140)
    (next t2140 t2141) (next t2141 t2142) (next t2142 t2143) (next t2143 t2144) (next t2144 t2145)
    (avail-person david chinatown t1600) (avail-person david chinatown t1601) (avail-person david chinatown t1602) (avail-person david chinatown t1603) (avail-person david chinatown t1604)
    (avail-person david chinatown t1605) (avail-person david chinatown t1606) (avail-person david chinatown t1607) (avail-person david chinatown t1608) (avail-person david chinatown t1609)
    (avail-person david chinatown t1610) (avail-person david chinatown t1611) (avail-person david chinatown t1612) (avail-person david chinatown t1613) (avail-person david chinatown t1614)
    (avail-person david chinatown t1615) (avail-person david chinatown t1616) (avail-person david chinatown t1617) (avail-person david chinatown t1618) (avail-person david chinatown t1619)
    (avail-person david chinatown t1620) (avail-person david chinatown t1621) (avail-person david chinatown t1622) (avail-person david chinatown t1623) (avail-person david chinatown t1624)
    (avail-person david chinatown t1625) (avail-person david chinatown t1626) (avail-person david chinatown t1627) (avail-person david chinatown t1628) (avail-person david chinatown t1629)
    (avail-person david chinatown t1630) (avail-person david chinatown t1631) (avail-person david chinatown t1632) (avail-person david chinatown t1633) (avail-person david chinatown t1634)
    (avail-person david chinatown t1635) (avail-person david chinatown t1636) (avail-person david chinatown t1637) (avail-person david chinatown t1638) (avail-person david chinatown t1639)
    (avail-person david chinatown t1640) (avail-person david chinatown t1641) (avail-person david chinatown t1642) (avail-person david chinatown t1643) (avail-person david chinatown t1644)
    (avail-person david chinatown t1645) (avail-person david chinatown t1646) (avail-person david chinatown t1647) (avail-person david chinatown t1648) (avail-person david chinatown t1649)
    (avail-person david chinatown t1650) (avail-person david chinatown t1651) (avail-person david chinatown t1652) (avail-person david chinatown t1653) (avail-person david chinatown t1654)
    (avail-person david chinatown t1655) (avail-person david chinatown t1656) (avail-person david chinatown t1657) (avail-person david chinatown t1658) (avail-person david chinatown t1659)
    (avail-person david chinatown t1700) (avail-person david chinatown t1701) (avail-person david chinatown t1702) (avail-person david chinatown t1703) (avail-person david chinatown t1704)
    (avail-person david chinatown t1705) (avail-person david chinatown t1706) (avail-person david chinatown t1707) (avail-person david chinatown t1708) (avail-person david chinatown t1709)
    (avail-person david chinatown t1710) (avail-person david chinatown t1711) (avail-person david chinatown t1712) (avail-person david chinatown t1713) (avail-person david chinatown t1714)
    (avail-person david chinatown t1715) (avail-person david chinatown t1716) (avail-person david chinatown t1717) (avail-person david chinatown t1718) (avail-person david chinatown t1719)
    (avail-person david chinatown t1720) (avail-person david chinatown t1721) (avail-person david chinatown t1722) (avail-person david chinatown t1723) (avail-person david chinatown t1724)
    (avail-person david chinatown t1725) (avail-person david chinatown t1726) (avail-person david chinatown t1727) (avail-person david chinatown t1728) (avail-person david chinatown t1729)
    (avail-person david chinatown t1730) (avail-person david chinatown t1731) (avail-person david chinatown t1732) (avail-person david chinatown t1733) (avail-person david chinatown t1734)
    (avail-person david chinatown t1735) (avail-person david chinatown t1736) (avail-person david chinatown t1737) (avail-person david chinatown t1738) (avail-person david chinatown t1739)
    (avail-person david chinatown t1740) (avail-person david chinatown t1741) (avail-person david chinatown t1742) (avail-person david chinatown t1743) (avail-person david chinatown t1744)
    (avail-person david chinatown t1745) (avail-person david chinatown t1746) (avail-person david chinatown t1747) (avail-person david chinatown t1748) (avail-person david chinatown t1749)
    (avail-person david chinatown t1750) (avail-person david chinatown t1751) (avail-person david chinatown t1752) (avail-person david chinatown t1753) (avail-person david chinatown t1754)
    (avail-person david chinatown t1755) (avail-person david chinatown t1756) (avail-person david chinatown t1757) (avail-person david chinatown t1758) (avail-person david chinatown t1759)
    (avail-person david chinatown t1800) (avail-person david chinatown t1801) (avail-person david chinatown t1802) (avail-person david chinatown t1803) (avail-person david chinatown t1804)
    (avail-person david chinatown t1805) (avail-person david chinatown t1806) (avail-person david chinatown t1807) (avail-person david chinatown t1808) (avail-person david chinatown t1809)
    (avail-person david chinatown t1810) (avail-person david chinatown t1811) (avail-person david chinatown t1812) (avail-person david chinatown t1813) (avail-person david chinatown t1814)
    (avail-person david chinatown t1815) (avail-person david chinatown t1816) (avail-person david chinatown t1817) (avail-person david chinatown t1818) (avail-person david chinatown t1819)
    (avail-person david chinatown t1820) (avail-person david chinatown t1821) (avail-person david chinatown t1822) (avail-person david chinatown t1823) (avail-person david chinatown t1824)
    (avail-person david chinatown t1825) (avail-person david chinatown t1826) (avail-person david chinatown t1827) (avail-person david chinatown t1828) (avail-person david chinatown t1829)
    (avail-person david chinatown t1830) (avail-person david chinatown t1831) (avail-person david chinatown t1832) (avail-person david chinatown t1833) (avail-person david chinatown t1834)
    (avail-person david chinatown t1835) (avail-person david chinatown t1836) (avail-person david chinatown t1837) (avail-person david chinatown t1838) (avail-person david chinatown t1839)
    (avail-person david chinatown t1840) (avail-person david chinatown t1841) (avail-person david chinatown t1842) (avail-person david chinatown t1843) (avail-person david chinatown t1844)
    (avail-person david chinatown t1845) (avail-person david chinatown t1846) (avail-person david chinatown t1847) (avail-person david chinatown t1848) (avail-person david chinatown t1849)
    (avail-person david chinatown t1850) (avail-person david chinatown t1851) (avail-person david chinatown t1852) (avail-person david chinatown t1853) (avail-person david chinatown t1854)
    (avail-person david chinatown t1855) (avail-person david chinatown t1856) (avail-person david chinatown t1857) (avail-person david chinatown t1858) (avail-person david chinatown t1859)
    (avail-person david chinatown t1900) (avail-person david chinatown t1901) (avail-person david chinatown t1902) (avail-person david chinatown t1903) (avail-person david chinatown t1904)
    (avail-person david chinatown t1905) (avail-person david chinatown t1906) (avail-person david chinatown t1907) (avail-person david chinatown t1908) (avail-person david chinatown t1909)
    (avail-person david chinatown t1910) (avail-person david chinatown t1911) (avail-person david chinatown t1912) (avail-person david chinatown t1913) (avail-person david chinatown t1914)
    (avail-person david chinatown t1915) (avail-person david chinatown t1916) (avail-person david chinatown t1917) (avail-person david chinatown t1918) (avail-person david chinatown t1919)
    (avail-person david chinatown t1920) (avail-person david chinatown t1921) (avail-person david chinatown t1922) (avail-person david chinatown t1923) (avail-person david chinatown t1924)
    (avail-person david chinatown t1925) (avail-person david chinatown t1926) (avail-person david chinatown t1927) (avail-person david chinatown t1928) (avail-person david chinatown t1929)
    (avail-person david chinatown t1930) (avail-person david chinatown t1931) (avail-person david chinatown t1932) (avail-person david chinatown t1933) (avail-person david chinatown t1934)
    (avail-person david chinatown t1935) (avail-person david chinatown t1936) (avail-person david chinatown t1937) (avail-person david chinatown t1938) (avail-person david chinatown t1939)
    (avail-person david chinatown t1940) (avail-person david chinatown t1941) (avail-person david chinatown t1942) (avail-person david chinatown t1943) (avail-person david chinatown t1944)
    (avail-person david chinatown t1945) (avail-person david chinatown t1946) (avail-person david chinatown t1947) (avail-person david chinatown t1948) (avail-person david chinatown t1949)
    (avail-person david chinatown t1950) (avail-person david chinatown t1951) (avail-person david chinatown t1952) (avail-person david chinatown t1953) (avail-person david chinatown t1954)
    (avail-person david chinatown t1955) (avail-person david chinatown t1956) (avail-person david chinatown t1957) (avail-person david chinatown t1958) (avail-person david chinatown t1959)
    (avail-person david chinatown t2000) (avail-person david chinatown t2001) (avail-person david chinatown t2002) (avail-person david chinatown t2003) (avail-person david chinatown t2004)
    (avail-person david chinatown t2005) (avail-person david chinatown t2006) (avail-person david chinatown t2007) (avail-person david chinatown t2008) (avail-person david chinatown t2009)
    (avail-person david chinatown t2010) (avail-person david chinatown t2011) (avail-person david chinatown t2012) (avail-person david chinatown t2013) (avail-person david chinatown t2014)
    (avail-person david chinatown t2015) (avail-person david chinatown t2016) (avail-person david chinatown t2017) (avail-person david chinatown t2018) (avail-person david chinatown t2019)
    (avail-person david chinatown t2020) (avail-person david chinatown t2021) (avail-person david chinatown t2022) (avail-person david chinatown t2023) (avail-person david chinatown t2024)
    (avail-person david chinatown t2025) (avail-person david chinatown t2026) (avail-person david chinatown t2027) (avail-person david chinatown t2028) (avail-person david chinatown t2029)
    (avail-person david chinatown t2030) (avail-person david chinatown t2031) (avail-person david chinatown t2032) (avail-person david chinatown t2033) (avail-person david chinatown t2034)
    (avail-person david chinatown t2035) (avail-person david chinatown t2036) (avail-person david chinatown t2037) (avail-person david chinatown t2038) (avail-person david chinatown t2039)
    (avail-person david chinatown t2040) (avail-person david chinatown t2041) (avail-person david chinatown t2042) (avail-person david chinatown t2043) (avail-person david chinatown t2044)
    (avail-person david chinatown t2045) (avail-person david chinatown t2046) (avail-person david chinatown t2047) (avail-person david chinatown t2048) (avail-person david chinatown t2049)
    (avail-person david chinatown t2050) (avail-person david chinatown t2051) (avail-person david chinatown t2052) (avail-person david chinatown t2053) (avail-person david chinatown t2054)
    (avail-person david chinatown t2055) (avail-person david chinatown t2056) (avail-person david chinatown t2057) (avail-person david chinatown t2058) (avail-person david chinatown t2059)
    (avail-person david chinatown t2100) (avail-person david chinatown t2101) (avail-person david chinatown t2102) (avail-person david chinatown t2103) (avail-person david chinatown t2104)
    (avail-person david chinatown t2105) (avail-person david chinatown t2106) (avail-person david chinatown t2107) (avail-person david chinatown t2108) (avail-person david chinatown t2109)
    (avail-person david chinatown t2110) (avail-person david chinatown t2111) (avail-person david chinatown t2112) (avail-person david chinatown t2113) (avail-person david chinatown t2114)
    (avail-person david chinatown t2115) (avail-person david chinatown t2116) (avail-person david chinatown t2117) (avail-person david chinatown t2118) (avail-person david chinatown t2119)
    (avail-person david chinatown t2120) (avail-person david chinatown t2121) (avail-person david chinatown t2122) (avail-person david chinatown t2123) (avail-person david chinatown t2124)
    (avail-person david chinatown t2125) (avail-person david chinatown t2126) (avail-person david chinatown t2127) (avail-person david chinatown t2128) (avail-person david chinatown t2129)
    (avail-person david chinatown t2130) (avail-person david chinatown t2131) (avail-person david chinatown t2132) (avail-person david chinatown t2133) (avail-person david chinatown t2134)
    (avail-person david chinatown t2135) (avail-person david chinatown t2136) (avail-person david chinatown t2137) (avail-person david chinatown t2138) (avail-person david chinatown t2139)
    (avail-person david chinatown t2140) (avail-person david chinatown t2141) (avail-person david chinatown t2142) (avail-person david chinatown t2143) (avail-person david chinatown t2144)
    (avail-friend g1 goldengatepark t0910) (avail-friend g1 goldengatepark t0911) (avail-friend g1 goldengatepark t0912) (avail-friend g1 goldengatepark t0913) (avail-friend g1 goldengatepark t0914)
    (avail-friend g1 goldengatepark t0915) (avail-friend g1 goldengatepark t0916) (avail-friend g1 goldengatepark t0917) (avail-friend g1 goldengatepark t0918) (avail-friend g1 goldengatepark t0919)
    (avail-friend g1 goldengatepark t0920) (avail-friend g1 goldengatepark t0921) (avail-friend g1 goldengatepark t0922) (avail-friend g1 goldengatepark t0923) (avail-friend g1 goldengatepark t0924)
    (avail-friend g1 goldengatepark t0925) (avail-friend g1 goldengatepark t0926) (avail-friend g1 goldengatepark t0927) (avail-friend g1 goldengatepark t0928) (avail-friend g1 goldengatepark t0929)
    (avail-friend g1 goldengatepark t0930) (avail-friend g1 goldengatepark t0931) (avail-friend g1 goldengatepark t0932) (avail-friend g1 goldengatepark t0933) (avail-friend g1 goldengatepark t0934)
    (avail-friend g1 goldengatepark t0935) (avail-friend g1 goldengatepark t0936) (avail-friend g1 goldengatepark t0937) (avail-friend g1 goldengatepark t0938) (avail-friend g1 goldengatepark t0939)
    (avail-friend g1 goldengatepark t0940) (avail-friend g1 goldengatepark t0941) (avail-friend g1 goldengatepark t0942) (avail-friend g1 goldengatepark t0943) (avail-friend g1 goldengatepark t0944)
    (avail-friend g1 goldengatepark t0945) (avail-friend g1 goldengatepark t0946) (avail-friend g1 goldengatepark t0947) (avail-friend g1 goldengatepark t0948) (avail-friend g1 goldengatepark t0949)
    (avail-friend g2 goldengatepark t1000) (avail-friend g2 goldengatepark t1001) (avail-friend g2 goldengatepark t1002) (avail-friend g2 goldengatepark t1003) (avail-friend g2 goldengatepark t1004)
    (avail-friend g2 goldengatepark t1005) (avail-friend g2 goldengatepark t1006) (avail-friend g2 goldengatepark t1007) (avail-friend g2 goldengatepark t1008) (avail-friend g2 goldengatepark t1009)
    (avail-friend g2 goldengatepark t1010) (avail-friend g2 goldengatepark t1011) (avail-friend g2 goldengatepark t1012) (avail-friend g2 goldengatepark t1013) (avail-friend g2 goldengatepark t1014)
    (avail-friend g2 goldengatepark t1015) (avail-friend g2 goldengatepark t1016) (avail-friend g2 goldengatepark t1017) (avail-friend g2 goldengatepark t1018) (avail-friend g2 goldengatepark t1019)
    (avail-friend g2 goldengatepark t1020) (avail-friend g2 goldengatepark t1021) (avail-friend g2 goldengatepark t1022) (avail-friend g2 goldengatepark t1023) (avail-friend g2 goldengatepark t1024)
    (avail-friend g2 goldengatepark t1025) (avail-friend g2 goldengatepark t1026) (avail-friend g2 goldengatepark t1027) (avail-friend g2 goldengatepark t1028) (avail-friend g2 goldengatepark t1029)
    (avail-friend g2 goldengatepark t1030) (avail-friend g2 goldengatepark t1031) (avail-friend g2 goldengatepark t1032) (avail-friend g2 goldengatepark t1033) (avail-friend g2 goldengatepark t1034)
    (avail-friend g2 goldengatepark t1035) (avail-friend g2 goldengatepark t1036) (avail-friend g2 goldengatepark t1037) (avail-friend g2 goldengatepark t1038) (avail-friend g2 goldengatepark t1039)
    (avail-friend g2 goldengatepark t1040) (avail-friend g2 goldengatepark t1041) (avail-friend g2 goldengatepark t1042) (avail-friend g2 goldengatepark t1043) (avail-friend g2 goldengatepark t1044)
    (avail-friend g3 goldengatepark t1100) (avail-friend g3 goldengatepark t1101) (avail-friend g3 goldengatepark t1102) (avail-friend g3 goldengatepark t1103) (avail-friend g3 goldengatepark t1104)
    (avail-friend g3 goldengatepark t1105) (avail-friend g3 goldengatepark t1106) (avail-friend g3 goldengatepark t1107) (avail-friend g3 goldengatepark t1108) (avail-friend g3 goldengatepark t1109)
    (avail-friend g3 goldengatepark t1110) (avail-friend g3 goldengatepark t1111) (avail-friend g3 goldengatepark t1112) (avail-friend g3 goldengatepark t1113) (avail-friend g3 goldengatepark t1114)
    (avail-friend g3 goldengatepark t1115) (avail-friend g3 goldengatepark t1116) (avail-friend g3 goldengatepark t1117) (avail-friend g3 goldengatepark t1118) (avail-friend g3 goldengatepark t1119)
    (avail-friend g3 goldengatepark t1120) (avail-friend g3 goldengatepark t1121) (avail-friend g3 goldengatepark t1122) (avail-friend g3 goldengatepark t1123) (avail-friend g3 goldengatepark t1124)
    (avail-friend g3 goldengatepark t1125) (avail-friend g3 goldengatepark t1126) (avail-friend g3 goldengatepark t1127) (avail-friend g3 goldengatepark t1128) (avail-friend g3 goldengatepark t1129)
    (avail-friend g3 goldengatepark t1130) (avail-friend g3 goldengatepark t1131) (avail-friend g3 goldengatepark t1132) (avail-friend g3 goldengatepark t1133) (avail-friend g3 goldengatepark t1134)
    (avail-friend g3 goldengatepark t1135) (avail-friend g3 goldengatepark t1136) (avail-friend g3 goldengatepark t1137) (avail-friend g3 goldengatepark t1138) (avail-friend g3 goldengatepark t1139)
    (avail-friend g3 goldengatepark t1140) (avail-friend g3 goldengatepark t1141) (avail-friend g3 goldengatepark t1142) (avail-friend g3 goldengatepark t1143) (avail-friend g3 goldengatepark t1144)
    (avail-friend g3 goldengatepark t1145) (avail-friend g3 goldengatepark t1146) (avail-friend g3 goldengatepark t1147) (avail-friend g3 goldengatepark t1148) (avail-friend g3 goldengatepark t1149)
    (avail-friend g3 goldengatepark t1150) (avail-friend g3 goldengatepark t1151) (avail-friend g3 goldengatepark t1152) (avail-friend g3 goldengatepark t1153) (avail-friend g3 goldengatepark t1154)
    (avail-friend g3 goldengatepark t1155) (avail-friend g3 goldengatepark t1156) (avail-friend g3 goldengatepark t1157) (avail-friend g3 goldengatepark t1158) (avail-friend g3 goldengatepark t1159)
    (avail-friend g6 goldengatepark t1410) (avail-friend g6 goldengatepark t1411) (avail-friend g6 goldengatepark t1412) (avail-friend g6 goldengatepark t1413) (avail-friend g6 goldengatepark t1414)
    (avail-friend g6 goldengatepark t1415) (avail-friend g6 goldengatepark t1416) (avail-friend g6 goldengatepark t1417) (avail-friend g6 goldengatepark t1418) (avail-friend g6 goldengatepark t1419)
    (avail-friend g6 goldengatepark t1420) (avail-friend g6 goldengatepark t1421) (avail-friend g6 goldengatepark t1422) (avail-friend g6 goldengatepark t1423) (avail-friend g6 goldengatepark t1424)
    (avail-friend g6 goldengatepark t1425) (avail-friend g6 goldengatepark t1426) (avail-friend g6 goldengatepark t1427) (avail-friend g6 goldengatepark t1428) (avail-friend g6 goldengatepark t1429)
    (avail-friend g6 goldengatepark t1430) (avail-friend g6 goldengatepark t1431) (avail-friend g6 goldengatepark t1432) (avail-friend g6 goldengatepark t1433) (avail-friend g6 goldengatepark t1434)
    (avail-friend g6 goldengatepark t1435) (avail-friend g6 goldengatepark t1436) (avail-friend g6 goldengatepark t1437) (avail-friend g6 goldengatepark t1438) (avail-friend g6 goldengatepark t1439)
    (avail-friend g6 goldengatepark t1440) (avail-friend g6 goldengatepark t1441) (avail-friend g6 goldengatepark t1442) (avail-friend g6 goldengatepark t1443) (avail-friend g6 goldengatepark t1444)
    (avail-friend g6 goldengatepark t1445) (avail-friend g6 goldengatepark t1446) (avail-friend g6 goldengatepark t1447) (avail-friend g6 goldengatepark t1448) (avail-friend g6 goldengatepark t1449)
    (avail-friend g6 goldengatepark t1450) (avail-friend g6 goldengatepark t1451) (avail-friend g6 goldengatepark t1452) (avail-friend g6 goldengatepark t1453) (avail-friend g6 goldengatepark t1454)
    (avail-friend g6 goldengatepark t1455) (avail-friend g6 goldengatepark t1456) (avail-friend g6 goldengatepark t1457) (avail-friend g6 goldengatepark t1458) (avail-friend g6 goldengatepark t1459)
    (avail-friend g6 goldengatepark t1500) (avail-friend g6 goldengatepark t1501) (avail-friend g6 goldengatepark t1502) (avail-friend g6 goldengatepark t1503) (avail-friend g6 goldengatepark t1504)
    (avail-friend g6 goldengatepark t1505) (avail-friend g6 goldengatepark t1506) (avail-friend g6 goldengatepark t1507) (avail-friend g6 goldengatepark t1508) (avail-friend g6 goldengatepark t1509)
    (avail-friend g6 goldengatepark t1510) (avail-friend g6 goldengatepark t1511) (avail-friend g6 goldengatepark t1512) (avail-friend g6 goldengatepark t1513) (avail-friend g6 goldengatepark t1514)
    (avail-friend g6 goldengatepark t1515) (avail-friend g6 goldengatepark t1516) (avail-friend g6 goldengatepark t1517) (avail-friend g6 goldengatepark t1518) (avail-friend g6 goldengatepark t1519)
    (avail-friend cf1 chinatown t1750) (avail-friend cf1 chinatown t1751) (avail-friend cf1 chinatown t1752) (avail-friend cf1 chinatown t1753) (avail-friend cf1 chinatown t1754)
    (avail-friend cf1 chinatown t1755) (avail-friend cf1 chinatown t1756) (avail-friend cf1 chinatown t1757) (avail-friend cf1 chinatown t1758) (avail-friend cf1 chinatown t1759)
    (avail-friend cf1 chinatown t1800) (avail-friend cf1 chinatown t1801) (avail-friend cf1 chinatown t1802) (avail-friend cf1 chinatown t1803) (avail-friend cf1 chinatown t1804)
    (avail-friend cf1 chinatown t1805) (avail-friend cf1 chinatown t1806) (avail-friend cf1 chinatown t1807) (avail-friend cf1 chinatown t1808) (avail-friend cf1 chinatown t1809)
    (avail-friend cf1 chinatown t1810) (avail-friend cf1 chinatown t1811) (avail-friend cf1 chinatown t1812) (avail-friend cf1 chinatown t1813) (avail-friend cf1 chinatown t1814)
    (avail-friend cf1 chinatown t1815) (avail-friend cf1 chinatown t1816) (avail-friend cf1 chinatown t1817) (avail-friend cf1 chinatown t1818) (avail-friend cf1 chinatown t1819)
    (avail-friend cf2 chinatown t1835) (avail-friend cf2 chinatown t1836) (avail-friend cf2 chinatown t1837) (avail-friend cf2 chinatown t1838) (avail-friend cf2 chinatown t1839)
    (avail-friend cf2 chinatown t1840) (avail-friend cf2 chinatown t1841) (avail-friend cf2 chinatown t1842) (avail-friend cf2 chinatown t1843) (avail-friend cf2 chinatown t1844)
    (avail-friend cf2 chinatown t1845) (avail-friend cf2 chinatown t1846) (avail-friend cf2 chinatown t1847) (avail-friend cf2 chinatown t1848) (avail-friend cf2 chinatown t1849)
    (avail-friend cf2 chinatown t1850) (avail-friend cf2 chinatown t1851) (avail-friend cf2 chinatown t1852) (avail-friend cf2 chinatown t1853) (avail-friend cf2 chinatown t1854)
    (avail-friend cf2 chinatown t1855) (avail-friend cf2 chinatown t1856) (avail-friend cf2 chinatown t1857) (avail-friend cf2 chinatown t1858) (avail-friend cf2 chinatown t1859)
    (avail-friend cf2 chinatown t1900) (avail-friend cf2 chinatown t1901) (avail-friend cf2 chinatown t1902) (avail-friend cf2 chinatown t1903) (avail-friend cf2 chinatown t1904)
    (avail-friend cf3 chinatown t1920) (avail-friend cf3 chinatown t1921) (avail-friend cf3 chinatown t1922) (avail-friend cf3 chinatown t1923) (avail-friend cf3 chinatown t1924)
    (avail-friend cf3 chinatown t1925) (avail-friend cf3 chinatown t1926) (avail-friend cf3 chinatown t1927) (avail-friend cf3 chinatown t1928) (avail-friend cf3 chinatown t1929)
    (avail-friend cf3 chinatown t1930) (avail-friend cf3 chinatown t1931) (avail-friend cf3 chinatown t1932) (avail-friend cf3 chinatown t1933) (avail-friend cf3 chinatown t1934)
    (avail-friend cf3 chinatown t1935) (avail-friend cf3 chinatown t1936) (avail-friend cf3 chinatown t1937) (avail-friend cf3 chinatown t1938) (avail-friend cf3 chinatown t1939)
    (avail-friend cf3 chinatown t1940) (avail-friend cf3 chinatown t1941) (avail-friend cf3 chinatown t1942) (avail-friend cf3 chinatown t1943) (avail-friend cf3 chinatown t1944)
    (avail-friend cf3 chinatown t1945) (avail-friend cf3 chinatown t1946) (avail-friend cf3 chinatown t1947) (avail-friend cf3 chinatown t1948) (avail-friend cf3 chinatown t1949)
    (next-count c0 c1) (next-count c1 c2) (next-count c2 c3) (next-count c3 c4) (next-count c4 c5)
    (next-count c5 c6) (next-count c6 c7) (next-count c7 c8) (next-count c8 c9) (next-count c9 c10)
    (next-count c10 c11) (next-count c11 c12) (next-count c12 c13) (next-count c13 c14) (next-count c14 c15)
    (next-count c15 c16) (next-count c16 c17) (next-count c17 c18) (next-count c18 c19) (next-count c19 c20)
    (next-count c20 c21) (next-count c21 c22) (next-count c22 c23) (next-count c23 c24) (next-count c24 c25)
    (next-count c25 c26) (next-count c26 c27) (next-count c27 c28) (next-count c28 c29) (next-count c29 c30)
    (next-count c30 c31) (next-count c31 c32) (next-count c32 c33) (next-count c33 c34) (next-count c34 c35)
    (next-count c35 c36) (next-count c36 c37) (next-count c37 c38) (next-count c38 c39) (next-count c39 c40)
    (next-count c40 c41) (next-count c41 c42) (next-count c42 c43) (next-count c43 c44) (next-count c44 c45)
    (next-count c45 c46) (next-count c46 c47) (next-count c47 c48) (next-count c48 c49) (next-count c49 c50)
    (next-count c50 c51) (next-count c51 c52) (next-count c52 c53) (next-count c53 c54) (next-count c54 c55)
    (next-count c55 c56) (next-count c56 c57) (next-count c57 c58) (next-count c58 c59) (next-count c59 c60)
    (next-count c60 c61) (next-count c61 c62) (next-count c62 c63) (next-count c63 c64) (next-count c64 c65)
    (next-count c65 c66) (next-count c66 c67) (next-count c67 c68) (next-count c68 c69) (next-count c69 c70)
    (next-count c70 c71) (next-count c71 c72) (next-count c72 c73) (next-count c73 c74) (next-count c74 c75)
    (next-count c75 c76) (next-count c76 c77) (next-count c77 c78) (next-count c78 c79) (next-count c79 c80)
    (next-count c80 c81) (next-count c81 c82) (next-count c82 c83) (next-count c83 c84) (next-count c84 c85)
    (next-count c85 c86) (next-count c86 c87) (next-count c87 c88) (next-count c88 c89) (next-count c89 c90)
    (next-count c90 c91) (next-count c91 c92) (next-count c92 c93) (next-count c93 c94) (next-count c94 c95)
    (next-count c95 c96) (next-count c96 c97) (next-count c97 c98) (next-count c98 c99) (next-count c99 c100)
    (next-count c100 c101) (next-count c101 c102) (next-count c102 c103) (next-count c103 c104) (next-count c104 c105)
    (is-final-david c105)
    (next-tc tc23 tc22) (next-tc tc22 tc21) (next-tc tc21 tc20) (next-tc tc20 tc19) (next-tc tc19 tc18)
    (next-tc tc18 tc17) (next-tc tc17 tc16) (next-tc tc16 tc15) (next-tc tc15 tc14) (next-tc tc14 tc13)
    (next-tc tc13 tc12) (next-tc tc12 tc11) (next-tc tc11 tc10) (next-tc tc10 tc9) (next-tc tc9 tc8)
    (next-tc tc8 tc7) (next-tc tc7 tc6) (next-tc tc6 tc5) (next-tc tc5 tc4) (next-tc tc4 tc3)
    (next-tc tc3 tc2) (next-tc tc2 tc1) (next-tc tc1 tc0)
    (= (total-cost) 0)
  )
  (:goal (and
    (met-person david)
    (decided g1) (decided g2) (decided g3) (decided g6)
    (decided cf1) (decided cf2) (decided cf3)
  ))
  (:metric minimize (total-cost))
)