(define (problem meeting-planning-25-instance)
  (:domain meeting-planning-25)
  (:objects
    golden_gate_park chinatown - location
    t0900 t0901 t0902 t0903 t0904 t0905 t0906 t0907 t0908 t0909 t0910 t0911 t0912 t0913 t0914 t0915 t0916 t0917 t0918 t0919 t0920 t0921 t0922 t0923 t0924 t0925 t0926 t0927 t0928 t0929 t0930 t0931 t0932 t0933 t0934 t0935 t0936 t0937 t0938 t0939 t0940 t0941 t0942 t0943 t0944 t0945 t0946 t0947 t0948 t0949 t0950 t0951 t0952 t0953 t0954 t0955 t0956 t0957 t0958 t0959
    t1000 t1001 t1002 t1003 t1004 t1005 t1006 t1007 t1008 t1009 t1010 t1011 t1012 t1013 t1014 t1015 t1016 t1017 t1018 t1019 t1020 t1021 t1022 t1023 t1024 t1025 t1026 t1027 t1028 t1029 t1030 t1031 t1032 t1033 t1034 t1035 t1036 t1037 t1038 t1039 t1040 t1041 t1042 t1043 t1044 t1045 t1046 t1047 t1048 t1049 t1050 t1051 t1052 t1053 t1054 t1055 t1056 t1057 t1058 t1059
    t1100 t1101 t1102 t1103 t1104 t1105 t1106 t1107 t1108 t1109 t1110 t1111 t1112 t1113 t1114 t1115 t1116 t1117 t1118 t1119 t1120 t1121 t1122 t1123 t1124 t1125 t1126 t1127 t1128 t1129 t1130 t1131 t1132 t1133 t1134 t1135 t1136 t1137 t1138 t1139 t1140 t1141 t1142 t1143 t1144 t1145 t1146 t1147 t1148 t1149 t1150 t1151 t1152 t1153 t1154 t1155 t1156 t1157 t1158 t1159
    t1200 t1201 t1202 t1203 t1204 t1205 t1206 t1207 t1208 t1209 t1210 t1211 t1212 t1213 t1214 t1215 t1216 t1217 t1218 t1219 t1220 t1221 t1222 t1223 t1224 t1225 t1226 t1227 t1228 t1229 t1230 t1231 t1232 t1233 t1234 t1235 t1236 t1237 t1238 t1239 t1240 t1241 t1242 t1243 t1244 t1245 t1246 t1247 t1248 t1249 t1250 t1251 t1252 t1253 t1254 t1255 t1256 t1257 t1258 t1259
    t1300 t1301 t1302 t1303 t1304 t1305 t1306 t1307 t1308 t1309 t1310 t1311 t1312 t1313 t1314 t1315 t1316 t1317 t1318 t1319 t1320 t1321 t1322 t1323 t1324 t1325 t1326 t1327 t1328 t1329 t1330 t1331 t1332 t1333 t1334 t1335 t1336 t1337 t1338 t1339 t1340 t1341 t1342 t1343 t1344 t1345 t1346 t1347 t1348 t1349 t1350 t1351 t1352 t1353 t1354 t1355 t1356 t1357 t1358 t1359
    t1400 t1401 t1402 t1403 t1404 t1405 t1406 t1407 t1408 t1409 t1410 t1411 t1412 t1413 t1414 t1415 t1416 t1417 t1418 t1419 t1420 t1421 t1422 t1423 t1424 t1425 t1426 t1427 t1428 t1429 t1430 t1431 t1432 t1433 t1434 t1435 t1436 t1437 t1438 t1439 t1440 t1441 t1442 t1443 t1444 t1445 t1446 t1447 t1448 t1449 t1450 t1451 t1452 t1453 t1454 t1455 t1456 t1457 t1458 t1459
    t1500 t1501 t1502 t1503 t1504 t1505 t1506 t1507 t1508 t1509 t1510 t1511 t1512 t1513 t1514 t1515 t1516 t1517 t1518 t1519 t1520 t1521 t1522 t1523 t1524 t1525 t1526 t1527 t1528 t1529 t1530 t1531 t1532 t1533 t1534 t1535 t1536 t1537 t1538 t1539 t1540 t1541 t1542 t1543 t1544 t1545 t1546 t1547 t1548 t1549 t1550 t1551 t1552 t1553 t1554 t1555 t1556 t1557 t1558 t1559
    t1600 t1601 t1602 t1603 t1604 t1605 t1606 t1607 t1608 t1609 t1610 t1611 t1612 t1613 t1614 t1615 t1616 t1617 t1618 t1619 t1620 t1621 t1622 t1623 t1624 t1625 t1626 t1627 t1628 t1629 t1630 t1631 t1632 t1633 t1634 t1635 t1636 t1637 t1638 t1639 t1640 t1641 t1642 t1643 t1644 t1645 t1646 t1647 t1648 t1649 t1650 t1651 t1652 t1653 t1654 t1655 t1656 t1657 t1658 t1659
    t1700 t1701 t1702 t1703 t1704 t1705 t1706 t1707 t1708 t1709 t1710 t1711 t1712 t1713 t1714 t1715 t1716 t1717 t1718 t1719 t1720 t1721 t1722 t1723 t1724 t1725 t1726 t1727 t1728 t1729 t1730 t1731 t1732 t1733 t1734 t1735 t1736 t1737 t1738 t1739 t1740 t1741 t1742 t1743 t1744 t1745 t1746 t1747 t1748 t1749 t1750 t1751 t1752 t1753 t1754 t1755 t1756 t1757 t1758 t1759
    t1800 t1801 t1802 t1803 t1804 t1805 t1806 t1807 t1808 t1809 t1810 t1811 t1812 t1813 t1814 t1815 t1816 t1817 t1818 t1819 t1820 t1821 t1822 t1823 t1824 t1825 t1826 t1827 t1828 t1829 t1830 t1831 t1832 t1833 t1834 t1835 t1836 t1837 t1838 t1839 t1840 t1841 t1842 t1843 t1844 t1845 t1846 t1847 t1848 t1849 t1850 t1851 t1852 t1853 t1854 t1855 t1856 t1857 t1858 t1859
    t1900 t1901 t1902 t1903 t1904 t1905 t1906 t1907 t1908 t1909 t1910 t1911 t1912 t1913 t1914 t1915 t1916 t1917 t1918 t1919 t1920 t1921 t1922 t1923 t1924 t1925 t1926 t1927 t1928 t1929 t1930 t1931 t1932 t1933 t1934 t1935 t1936 t1937 t1938 t1939 t1940 t1941 t1942 t1943 t1944 t1945 t1946 t1947 t1948 t1949 t1950 t1951 t1952 t1953 t1954 t1955 t1956 t1957 t1958 t1959
    t2000 t2001 t2002 t2003 t2004 t2005 t2006 t2007 t2008 t2009 t2010 t2011 t2012 t2013 t2014 t2015 t2016 t2017 t2018 t2019 t2020 t2021 t2022 t2023 t2024 t2025 t2026 t2027 t2028 t2029 t2030 t2031 t2032 t2033 t2034 t2035 t2036 t2037 t2038 t2039 t2040 t2041 t2042 t2043 t2044 t2045 t2046 t2047 t2048 t2049 t2050 t2051 t2052 t2053 t2054 t2055 t2056 t2057 t2058 t2059
    t2100 t2101 t2102 t2103 t2104 t2105 t2106 t2107 t2108 t2109 t2110 t2111 t2112 t2113 t2114 t2115 t2116 t2117 t2118 t2119 t2120 t2121 t2122 t2123 t2124 t2125 t2126 t2127 t2128 t2129 t2130 t2131 t2132 t2133 t2134 t2135 t2136 t2137 t2138 t2139 t2140 t2141 t2142 t2143 t2144 t2145 - timepoint
  )
  (:init
    (at golden_gate_park)
    (idle)
    (current_time t0900)
    (edge golden_gate_park chinatown)
    (edge chinatown golden_gate_park)
    (is_chinatown chinatown)

    (succ t0900 t0901) (succ t0901 t0902) (succ t0902 t0903) (succ t0903 t0904) (succ t0904 t0905) (succ t0905 t0906) (succ t0906 t0907) (succ t0907 t0908) (succ t0908 t0909) (succ t0909 t0910)
    (succ t0910 t0911) (succ t0911 t0912) (succ t0912 t0913) (succ t0913 t0914) (succ t0914 t0915) (succ t0915 t0916) (succ t0916 t0917) (succ t0917 t0918) (succ t0918 t0919) (succ t0919 t0920)
    (succ t0920 t0921) (succ t0921 t0922) (succ t0922 t0923) (succ t0923 t0924) (succ t0924 t0925) (succ t0925 t0926) (succ t0926 t0927) (succ t0927 t0928) (succ t0928 t0929) (succ t0929 t0930)
    (succ t0930 t0931) (succ t0931 t0932) (succ t0932 t0933) (succ t0933 t0934) (succ t0934 t0935) (succ t0935 t0936) (succ t0936 t0937) (succ t0937 t0938) (succ t0938 t0939) (succ t0939 t0940)
    (succ t0940 t0941) (succ t0941 t0942) (succ t0942 t0943) (succ t0943 t0944) (succ t0944 t0945) (succ t0945 t0946) (succ t0946 t0947) (succ t0947 t0948) (succ t0948 t0949) (succ t0949 t0950)
    (succ t0950 t0951) (succ t0951 t0952) (succ t0952 t0953) (succ t0953 t0954) (succ t0954 t0955) (succ t0955 t0956) (succ t0956 t0957) (succ t0957 t0958) (succ t0958 t0959) (succ t0959 t1000)

    (succ t1000 t1001) (succ t1001 t1002) (succ t1002 t1003) (succ t1003 t1004) (succ t1004 t1005) (succ t1005 t1006) (succ t1006 t1007) (succ t1007 t1008) (succ t1008 t1009) (succ t1009 t1010)
    (succ t1010 t1011) (succ t1011 t1012) (succ t1012 t1013) (succ t1013 t1014) (succ t1014 t1015) (succ t1015 t1016) (succ t1016 t1017) (succ t1017 t1018) (succ t1018 t1019) (succ t1019 t1020)
    (succ t1020 t1021) (succ t1021 t1022) (succ t1022 t1023) (succ t1023 t1024) (succ t1024 t1025) (succ t1025 t1026) (succ t1026 t1027) (succ t1027 t1028) (succ t1028 t1029) (succ t1029 t1030)
    (succ t1030 t1031) (succ t1031 t1032) (succ t1032 t1033) (succ t1033 t1034) (succ t1034 t1035) (succ t1035 t1036) (succ t1036 t1037) (succ t1037 t1038) (succ t1038 t1039) (succ t1039 t1040)
    (succ t1040 t1041) (succ t1041 t1042) (succ t1042 t1043) (succ t1043 t1044) (succ t1044 t1045) (succ t1045 t1046) (succ t1046 t1047) (succ t1047 t1048) (succ t1048 t1049) (succ t1049 t1050)
    (succ t1050 t1051) (succ t1051 t1052) (succ t1052 t1053) (succ t1053 t1054) (succ t1054 t1055) (succ t1055 t1056) (succ t1056 t1057) (succ t1057 t1058) (succ t1058 t1059) (succ t1059 t1100)

    (succ t1100 t1101) (succ t1101 t1102) (succ t1102 t1103) (succ t1103 t1104) (succ t1104 t1105) (succ t1105 t1106) (succ t1106 t1107) (succ t1107 t1108) (succ t1108 t1109) (succ t1109 t1110)
    (succ t1110 t1111) (succ t1111 t1112) (succ t1112 t1113) (succ t1113 t1114) (succ t1114 t1115) (succ t1115 t1116) (succ t1116 t1117) (succ t1117 t1118) (succ t1118 t1119) (succ t1119 t1120)
    (succ t1120 t1121) (succ t1121 t1122) (succ t1122 t1123) (succ t1123 t1124) (succ t1124 t1125) (succ t1125 t1126) (succ t1126 t1127) (succ t1127 t1128) (succ t1128 t1129) (succ t1129 t1130)
    (succ t1130 t1131) (succ t1131 t1132) (succ t1132 t1133) (succ t1133 t1134) (succ t1134 t1135) (succ t1135 t1136) (succ t1136 t1137) (succ t1137 t1138) (succ t1138 t1139) (succ t1139 t1140)
    (succ t1140 t1141) (succ t1141 t1142) (succ t1142 t1143) (succ t1143 t1144) (succ t1144 t1145) (succ t1145 t1146) (succ t1146 t1147) (succ t1147 t1148) (succ t1148 t1149) (succ t1149 t1150)
    (succ t1150 t1151) (succ t1151 t1152) (succ t1152 t1153) (succ t1153 t1154) (succ t1154 t1155) (succ t1155 t1156) (succ t1156 t1157) (succ t1157 t1158) (succ t1158 t1159) (succ t1159 t1200)

    (succ t1200 t1201) (succ t1201 t1202) (succ t1202 t1203) (succ t1203 t1204) (succ t1204 t1205) (succ t1205 t1206) (succ t1206 t1207) (succ t1207 t1208) (succ t1208 t1209) (succ t1209 t1210)
    (succ t1210 t1211) (succ t1211 t1212) (succ t1212 t1213) (succ t1213 t1214) (succ t1214 t1215) (succ t1215 t1216) (succ t1216 t1217) (succ t1217 t1218) (succ t1218 t1219) (succ t1219 t1220)
    (succ t1220 t1221) (succ t1221 t1222) (succ t1222 t1223) (succ t1223 t1224) (succ t1224 t1225) (succ t1225 t1226) (succ t1226 t1227) (succ t1227 t1228) (succ t1228 t1229) (succ t1229 t1230)
    (succ t1230 t1231) (succ t1231 t1232) (succ t1232 t1233) (succ t1233 t1234) (succ t1234 t1235) (succ t1235 t1236) (succ t1236 t1237) (succ t1237 t1238) (succ t1238 t1239) (succ t1239 t1240)
    (succ t1240 t1241) (succ t1241 t1242) (succ t1242 t1243) (succ t1243 t1244) (succ t1244 t1245) (succ t1245 t1246) (succ t1246 t1247) (succ t1247 t1248) (succ t1248 t1249) (succ t1249 t1250)
    (succ t1250 t1251) (succ t1251 t1252) (succ t1252 t1253) (succ t1253 t1254) (succ t1254 t1255) (succ t1255 t1256) (succ t1256 t1257) (succ t1257 t1258) (succ t1258 t1259) (succ t1259 t1300)

    (succ t1300 t1301) (succ t1301 t1302) (succ t1302 t1303) (succ t1303 t1304) (succ t1304 t1305) (succ t1305 t1306) (succ t1306 t1307) (succ t1307 t1308) (succ t1308 t1309) (succ t1309 t1310)
    (succ t1310 t1311) (succ t1311 t1312) (succ t1312 t1313) (succ t1313 t1314) (succ t1314 t1315) (succ t1315 t1316) (succ t1316 t1317) (succ t1317 t1318) (succ t1318 t1319) (succ t1319 t1320)
    (succ t1320 t1321) (succ t1321 t1322) (succ t1322 t1323) (succ t1323 t1324) (succ t1324 t1325) (succ t1325 t1326) (succ t1326 t1327) (succ t1327 t1328) (succ t1328 t1329) (succ t1329 t1330)
    (succ t1330 t1331) (succ t1331 t1332) (succ t1332 t1333) (succ t1333 t1334) (succ t1334 t1335) (succ t1335 t1336) (succ t1336 t1337) (succ t1337 t1338) (succ t1338 t1339) (succ t1339 t1340)
    (succ t1340 t1341) (succ t1341 t1342) (succ t1342 t1343) (succ t1343 t1344) (succ t1344 t1345) (succ t1345 t1346) (succ t1346 t1347) (succ t1347 t1348) (succ t1348 t1349) (succ t1349 t1350)
    (succ t1350 t1351) (succ t1351 t1352) (succ t1352 t1353) (succ t1353 t1354) (succ t1354 t1355) (succ t1355 t1356) (succ t1356 t1357) (succ t1357 t1358) (succ t1358 t1359) (succ t1359 t1400)

    (succ t1400 t1401) (succ t1401 t1402) (succ t1402 t1403) (succ t1403 t1404) (succ t1404 t1405) (succ t1405 t1406) (succ t1406 t1407) (succ t1407 t1408) (succ t1408 t1409) (succ t1409 t1410)
    (succ t1410 t1411) (succ t1411 t1412) (succ t1412 t1413) (succ t1413 t1414) (succ t1414 t1415) (succ t1415 t1416) (succ t1416 t1417) (succ t1417 t1418) (succ t1418 t1419) (succ t1419 t1420)
    (succ t1420 t1421) (succ t1421 t1422) (succ t1422 t1423) (succ t1423 t1424) (succ t1424 t1425) (succ t1425 t1426) (succ t1426 t1427) (succ t1427 t1428) (succ t1428 t1429) (succ t1429 t1430)
    (succ t1430 t1431) (succ t1431 t1432) (succ t1432 t1433) (succ t1433 t1434) (succ t1434 t1435) (succ t1435 t1436) (succ t1436 t1437) (succ t1437 t1438) (succ t1438 t1439) (succ t1439 t1440)
    (succ t1440 t1441) (succ t1441 t1442) (succ t1442 t1443) (succ t1443 t1444) (succ t1444 t1445) (succ t1445 t1446) (succ t1446 t1447) (succ t1447 t1448) (succ t1448 t1449) (succ t1449 t1450)
    (succ t1450 t1451) (succ t1451 t1452) (succ t1452 t1453) (succ t1453 t1454) (succ t1454 t1455) (succ t1455 t1456) (succ t1456 t1457) (succ t1457 t1458) (succ t1458 t1459) (succ t1459 t1500)

    (succ t1500 t1501) (succ t1501 t1502) (succ t1502 t1503) (succ t1503 t1504) (succ t1504 t1505) (succ t1505 t1506) (succ t1506 t1507) (succ t1507 t1508) (succ t1508 t1509) (succ t1509 t1510)
    (succ t1510 t1511) (succ t1511 t1512) (succ t1512 t1513) (succ t1513 t1514) (succ t1514 t1515) (succ t1515 t1516) (succ t1516 t1517) (succ t1517 t1518) (succ t1518 t1519) (succ t1519 t1520)
    (succ t1520 t1521) (succ t1521 t1522) (succ t1522 t1523) (succ t1523 t1524) (succ t1524 t1525) (succ t1525 t1526) (succ t1526 t1527) (succ t1527 t1528) (succ t1528 t1529) (succ t1529 t1530)
    (succ t1530 t1531) (succ t1531 t1532) (succ t1532 t1533) (succ t1533 t1534) (succ t1534 t1535) (succ t1535 t1536) (succ t1536 t1537) (succ t1537 t1538) (succ t1538 t1539) (succ t1539 t1540)
    (succ t1540 t1541) (succ t1541 t1542) (succ t1542 t1543) (succ t1543 t1544) (succ t1544 t1545) (succ t1545 t1546) (succ t1546 t1547) (succ t1547 t1548) (succ t1548 t1549) (succ t1549 t1550)
    (succ t1550 t1551) (succ t1551 t1552) (succ t1552 t1553) (succ t1553 t1554) (succ t1554 t1555) (succ t1555 t1556) (succ t1556 t1557) (succ t1557 t1558) (succ t1558 t1559) (succ t1559 t1600)

    (succ t1600 t1601) (succ t1601 t1602) (succ t1602 t1603) (succ t1603 t1604) (succ t1604 t1605) (succ t1605 t1606) (succ t1606 t1607) (succ t1607 t1608) (succ t1608 t1609) (succ t1609 t1610)
    (succ t1610 t1611) (succ t1611 t1612) (succ t1612 t1613) (succ t1613 t1614) (succ t1614 t1615) (succ t1615 t1616) (succ t1616 t1617) (succ t1617 t1618) (succ t1618 t1619) (succ t1619 t1620)
    (succ t1620 t1621) (succ t1621 t1622) (succ t1622 t1623) (succ t1623 t1624) (succ t1624 t1625) (succ t1625 t1626) (succ t1626 t1627) (succ t1627 t1628) (succ t1628 t1629) (succ t1629 t1630)
    (succ t1630 t1631) (succ t1631 t1632) (succ t1632 t1633) (succ t1633 t1634) (succ t1634 t1635) (succ t1635 t1636) (succ t1636 t1637) (succ t1637 t1638) (succ t1638 t1639) (succ t1639 t1640)
    (succ t1640 t1641) (succ t1641 t1642) (succ t1642 t1643) (succ t1643 t1644) (succ t1644 t1645) (succ t1645 t1646) (succ t1646 t1647) (succ t1647 t1648) (succ t1648 t1649) (succ t1649 t1650)
    (succ t1650 t1651) (succ t1651 t1652) (succ t1652 t1653) (succ t1653 t1654) (succ t1654 t1655) (succ t1655 t1656) (succ t1656 t1657) (succ t1657 t1658) (succ t1658 t1659) (succ t1659 t1700)

    (succ t1700 t1701) (succ t1701 t1702) (succ t1702 t1703) (succ t1703 t1704) (succ t1704 t1705) (succ t1705 t1706) (succ t1706 t1707) (succ t1707 t1708) (succ t1708 t1709) (succ t1709 t1710)
    (succ t1710 t1711) (succ t1711 t1712) (succ t1712 t1713) (succ t1713 t1714) (succ t1714 t1715) (succ t1715 t1716) (succ t1716 t1717) (succ t1717 t1718) (succ t1718 t1719) (succ t1719 t1720)
    (succ t1720 t1721) (succ t1721 t1722) (succ t1722 t1723) (succ t1723 t1724) (succ t1724 t1725) (succ t1725 t1726) (succ t1726 t1727) (succ t1727 t1728) (succ t1728 t1729) (succ t1729 t1730)
    (succ t1730 t1731) (succ t1731 t1732) (succ t1732 t1733) (succ t1733 t1734) (succ t1734 t1735) (succ t1735 t1736) (succ t1736 t1737) (succ t1737 t1738) (succ t1738 t1739) (succ t1739 t1740)
    (succ t1740 t1741) (succ t1741 t1742) (succ t1742 t1743) (succ t1743 t1744) (succ t1744 t1745) (succ t1745 t1746) (succ t1746 t1747) (succ t1747 t1748) (succ t1748 t1749) (succ t1749 t1750)
    (succ t1750 t1751) (succ t1751 t1752) (succ t1752 t1753) (succ t1753 t1754) (succ t1754 t1755) (succ t1755 t1756) (succ t1756 t1757) (succ t1757 t1758) (succ t1758 t1759) (succ t1759 t1800)

    (succ t1800 t1801) (succ t1801 t1802) (succ t1802 t1803) (succ t1803 t1804) (succ t1804 t1805) (succ t1805 t1806) (succ t1806 t1807) (succ t1807 t1808) (succ t1808 t1809) (succ t1809 t1810)
    (succ t1810 t1811) (succ t1811 t1812) (succ t1812 t1813) (succ t1813 t1814) (succ t1814 t1815) (succ t1815 t1816) (succ t1816 t1817) (succ t1817 t1818) (succ t1818 t1819) (succ t1819 t1820)
    (succ t1820 t1821) (succ t1821 t1822) (succ t1822 t1823) (succ t1823 t1824) (succ t1824 t1825) (succ t1825 t1826) (succ t1826 t1827) (succ t1827 t1828) (succ t1828 t1829) (succ t1829 t1830)
    (succ t1830 t1831) (succ t1831 t1832) (succ t1832 t1833) (succ t1833 t1834) (succ t1834 t1835) (succ t1835 t1836) (succ t1836 t1837) (succ t1837 t1838) (succ t1838 t1839) (succ t1839 t1840)
    (succ t1840 t1841) (succ t1841 t1842) (succ t1842 t1843) (succ t1843 t1844) (succ t1844 t1845) (succ t1845 t1846) (succ t1846 t1847) (succ t1847 t1848) (succ t1848 t1849) (succ t1849 t1850)
    (succ t1850 t1851) (succ t1851 t1852) (succ t1852 t1853) (succ t1853 t1854) (succ t1854 t1855) (succ t1855 t1856) (succ t1856 t1857) (succ t1857 t1858) (succ t1858 t1859) (succ t1859 t1900)

    (succ t1900 t1901) (succ t1901 t1902) (succ t1902 t1903) (succ t1903 t1904) (succ t1904 t1905) (succ t1905 t1906) (succ t1906 t1907) (succ t1907 t1908) (succ t1908 t1909) (succ t1909 t1910)
    (succ t1910 t1911) (succ t1911 t1912) (succ t1912 t1913) (succ t1913 t1914) (succ t1914 t1915) (succ t1915 t1916) (succ t1916 t1917) (succ t1917 t1918) (succ t1918 t1919) (succ t1919 t1920)
    (succ t1920 t1921) (succ t1921 t1922) (succ t1922 t1923) (succ t1923 t1924) (succ t1924 t1925) (succ t1925 t1926) (succ t1926 t1927) (succ t1927 t1928) (succ t1928 t1929) (succ t1929 t1930)
    (succ t1930 t1931) (succ t1931 t1932) (succ t1932 t1933) (succ t1933 t1934) (succ t1934 t1935) (succ t1935 t1936) (succ t1936 t1937) (succ t1937 t1938) (succ t1938 t1939) (succ t1939 t1940)
    (succ t1940 t1941) (succ t1941 t1942) (succ t1942 t1943) (succ t1943 t1944) (succ t1944 t1945) (succ t1945 t1946) (succ t1946 t1947) (succ t1947 t1948) (succ t1948 t1949) (succ t1949 t1950)
    (succ t1950 t1951) (succ t1951 t1952) (succ t1952 t1953) (succ t1953 t1954) (succ t1954 t1955) (succ t1955 t1956) (succ t1956 t1957) (succ t1957 t1958) (succ t1958 t1959) (succ t1959 t2000)

    (succ t2000 t2001) (succ t2001 t2002) (succ t2002 t2003) (succ t2003 t2004) (succ t2004 t2005) (succ t2005 t2006) (succ t2006 t2007) (succ t2007 t2008) (succ t2008 t2009) (succ t2009 t2010)
    (succ t2010 t2011) (succ t2011 t2012) (succ t2012 t2013) (succ t2013 t2014) (succ t2014 t2015) (succ t2015 t2016) (succ t2016 t2017) (succ t2017 t2018) (succ t2018 t2019) (succ t2019 t2020)
    (succ t2020 t2021) (succ t2021 t2022) (succ t2022 t2023) (succ t2023 t2024) (succ t2024 t2025) (succ t2025 t2026) (succ t2026 t2027) (succ t2027 t2028) (succ t2028 t2029) (succ t2029 t2030)
    (succ t2030 t2031) (succ t2031 t2032) (succ t2032 t2033) (succ t2033 t2034) (succ t2034 t2035) (succ t2035 t2036) (succ t2036 t2037) (succ t2037 t2038) (succ t2038 t2039) (succ t2039 t2040)
    (succ t2040 t2041) (succ t2041 t2042) (succ t2042 t2043) (succ t2043 t2044) (succ t2044 t2045) (succ t2045 t2046) (succ t2046 t2047) (succ t2047 t2048) (succ t2048 t2049) (succ t2049 t2050)
    (succ t2050 t2051) (succ t2051 t2052) (succ t2052 t2053) (succ t2053 t2054) (succ t2054 t2055) (succ t2055 t2056) (succ t2056 t2057) (succ t2057 t2058) (succ t2058 t2059) (succ t2059 t2100)

    (succ t2100 t2101) (succ t2101 t2102) (succ t2102 t2103) (succ t2103 t2104) (succ t2104 t2105) (succ t2105 t2106) (succ t2106 t2107) (succ t2107 t2108) (succ t2108 t2109) (succ t2109 t2110)
    (succ t2110 t2111) (succ t2111 t2112) (succ t2112 t2113) (succ t2113 t2114) (succ t2114 t2115) (succ t2115 t2116) (succ t2116 t2117) (succ t2117 t2118) (succ t2118 t2119) (succ t2119 t2120)
    (succ t2120 t2121) (succ t2121 t2122) (succ t2122 t2123) (succ t2123 t2124) (succ t2124 t2125) (succ t2125 t2126) (succ t2126 t2127) (succ t2127 t2128) (succ t2128 t2129) (succ t2129 t2130)
    (succ t2130 t2131) (succ t2131 t2132) (succ t2132 t2133) (succ t2133 t2134) (succ t2134 t2135) (succ t2135 t2136) (succ t2136 t2137) (succ t2137 t2138) (succ t2138 t2139) (succ t2139 t2140)
    (succ t2140 t2141) (succ t2141 t2142) (succ t2142 t2143) (succ t2143 t2144) (succ t2144 t2145)

    (available-david t1600) (available-david t1601) (available-david t1602) (available-david t1603) (available-david t1604) (available-david t1605) (available-david t1606) (available-david t1607) (available-david t1608) (available-david t1609)
    (available-david t1610) (available-david t1611) (available-david t1612) (available-david t1613) (available-david t1614) (available-david t1615) (available-david t1616) (available-david t1617) (available-david t1618) (available-david t1619)
    (available-david t1620) (available-david t1621) (available-david t1622) (available-david t1623) (available-david t1624) (available-david t1625) (available-david t1626) (available-david t1627) (available-david t1628) (available-david t1629)
    (available-david t1630) (available-david t1631) (available-david t1632) (available-david t1633) (available-david t1634) (available-david t1635) (available-david t1636) (available-david t1637) (available-david t1638) (available-david t1639)
    (available-david t1640) (available-david t1641) (available-david t1642) (available-david t1643) (available-david t1644) (available-david t1645) (available-david t1646) (available-david t1647) (available-david t1648) (available-david t1649)
    (available-david t1650) (available-david t1651) (available-david t1652) (available-david t1653) (available-david t1654) (available-david t1655) (available-david t1656) (available-david t1657) (available-david t1658) (available-david t1659)

    (available-david t1700) (available-david t1701) (available-david t1702) (available-david t1703) (available-david t1704) (available-david t1705) (available-david t1706) (available-david t1707) (available-david t1708) (available-david t1709)
    (available-david t1710) (available-david t1711) (available-david t1712) (available-david t1713) (available-david t1714) (available-david t1715) (available-david t1716) (available-david t1717) (available-david t1718) (available-david t1719)
    (available-david t1720) (available-david t1721) (available-david t1722) (available-david t1723) (available-david t1724) (available-david t1725) (available-david t1726) (available-david t1727) (available-david t1728) (available-david t1729)
    (available-david t1730) (available-david t1731) (available-david t1732) (available-david t1733) (available-david t1734) (available-david t1735) (available-david t1736) (available-david t1737) (available-david t1738) (available-david t1739)
    (available-david t1740) (available-david t1741) (available-david t1742) (available-david t1743) (available-david t1744) (available-david t1745) (available-david t1746) (available-david t1747) (available-david t1748) (available-david t1749)
    (available-david t1750) (available-david t1751) (available-david t1752) (available-david t1753) (available-david t1754) (available-david t1755) (available-david t1756) (available-david t1757) (available-david t1758) (available-david t1759)

    (available-david t1800) (available-david t1801) (available-david t1802) (available-david t1803) (available-david t1804) (available-david t1805) (available-david t1806) (available-david t1807) (available-david t1808) (available-david t1809)
    (available-david t1810) (available-david t1811) (available-david t1812) (available-david t1813) (available-david t1814) (available-david t1815) (available-david t1816) (available-david t1817) (available-david t1818) (available-david t1819)
    (available-david t1820) (available-david t1821) (available-david t1822) (available-david t1823) (available-david t1824) (available-david t1825) (available-david t1826) (available-david t1827) (available-david t1828) (available-david t1829)
    (available-david t1830) (available-david t1831) (available-david t1832) (available-david t1833) (available-david t1834) (available-david t1835) (available-david t1836) (available-david t1837) (available-david t1838) (available-david t1839)
    (available-david t1840) (available-david t1841) (available-david t1842) (available-david t1843) (available-david t1844) (available-david t1845) (available-david t1846) (available-david t1847) (available-david t1848) (available-david t1849)
    (available-david t1850) (available-david t1851) (available-david t1852) (available-david t1853) (available-david t1854) (available-david t1855) (available-david t1856) (available-david t1857) (available-david t1858) (available-david t1859)

    (available-david t1900) (available-david t1901) (available-david t1902) (available-david t1903) (available-david t1904) (available-david t1905) (available-david t1906) (available-david t1907) (available-david t1908) (available-david t1909)
    (available-david t1910) (available-david t1911) (available-david t1912) (available-david t1913) (available-david t1914) (available-david t1915) (available-david t1916) (available-david t1917) (available-david t1918) (available-david t1919)
    (available-david t1920) (available-david t1921) (available-david t1922) (available-david t1923) (available-david t1924) (available-david t1925) (available-david t1926) (available-david t1927) (available-david t1928) (available-david t1929)
    (available-david t1930) (available-david t1931) (available-david t1932) (available-david t1933) (available-david t1934) (available-david t1935) (available-david t1936) (available-david t1937) (available-david t1938) (available-david t1939)
    (available-david t1940) (available-david t1941) (available-david t1942) (available-david t1943) (available-david t1944) (available-david t1945) (available-david t1946) (available-david t1947) (available-david t1948) (available-david t1949)
    (available-david t1950) (available-david t1951) (available-david t1952) (available-david t1953) (available-david t1954) (available-david t1955) (available-david t1956) (available-david t1957) (available-david t1958) (available-david t1959)

    (available-david t2000) (available-david t2001) (available-david t2002) (available-david t2003) (available-david t2004) (available-david t2005) (available-david t2006) (available-david t2007) (available-david t2008) (available-david t2009)
    (available-david t2010) (available-david t2011) (available-david t2012) (available-david t2013) (available-david t2014) (available-david t2015) (available-david t2016) (available-david t2017) (available-david t2018) (available-david t2019)
    (available-david t2020) (available-david t2021) (available-david t2022) (available-david t2023) (available-david t2024) (available-david t2025) (available-david t2026) (available-david t2027) (available-david t2028) (available-david t2029)
    (available-david t2030) (available-david t2031) (available-david t2032) (available-david t2033) (available-david t2034) (available-david t2035) (available-david t2036) (available-david t2037) (available-david t2038) (available-david t2039)
    (available-david t2040) (available-david t2041) (available-david t2042) (available-david t2043) (available-david t2044) (available-david t2045) (available-david t2046) (available-david t2047) (available-david t2048) (available-david t2049)
    (available-david t2050) (available-david t2051) (available-david t2052) (available-david t2053) (available-david t2054) (available-david t2055) (available-david t2056) (available-david t2057) (available-david t2058) (available-david t2059)

    (available-david t2100) (available-david t2101) (available-david t2102) (available-david t2103) (available-david t2104) (available-david t2105) (available-david t2106) (available-david t2107) (available-david t2108) (available-david t2109)
    (available-david t2110) (available-david t2111) (available-david t2112) (available-david t2113) (available-david t2114) (available-david t2115) (available-david t2116) (available-david t2117) (available-david t2118) (available-david t2119)
    (available-david t2120) (available-david t2121) (available-david t2122) (available-david t2123) (available-david t2124) (available-david t2125) (available-david t2126) (available-david t2127) (available-david t2128) (available-david t2129)
    (available-david t2130) (available-david t2131) (available-david t2132) (available-david t2133) (available-david t2134) (available-david t2135) (available-david t2136) (available-david t2137) (available-david t2138) (available-david t2139)
    (available-david t2140) (available-david t2141) (available-david t2142) (available-david t2143) (available-david t2144)

    (met_david_min_0)
  )

  (:goal
    (and (met_david_min_105))
  )
)