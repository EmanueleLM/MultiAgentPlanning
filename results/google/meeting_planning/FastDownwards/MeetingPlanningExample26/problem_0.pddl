(define (problem visit_sarah)
  (:domain visit_planning)
  (:objects
    richmond_district presidio - location

    t0900
    t1308 t1309 t1310 t1311 t1312 t1313 t1314 t1315 t1316 t1317 t1318 t1319 t1320 t1321 t1322 t1323 t1324 t1325 t1326 t1327 t1328 t1329 t1330 t1331 t1332 t1333 t1334 t1335 t1336 t1337 t1338 t1339 t1340 t1341 t1342 t1343 t1344 t1345 t1346 t1347 t1348 t1349 t1350 t1351 t1352 t1353 t1354 t1355 t1356 t1357 t1358 t1359
    t1400 t1401 t1402 t1403 t1404 t1405 t1406 t1407 t1408 t1409 t1410 t1411 t1412 t1413 t1414 t1415 t1416 t1417 t1418 t1419 t1420 t1421 t1422 t1423 t1424 t1425 t1426 t1427 t1428 t1429 t1430 t1431 t1432 t1433 t1434 t1435 t1436 t1437 t1438 t1439 t1440 t1441 t1442 t1443 t1444 t1445 t1446 t1447 t1448 t1449 t1450 t1451 t1452 t1453 t1454 t1455 t1456 t1457 t1458 t1459
    t1500 t1501 t1502 t1503 t1504 t1505 t1506 t1507 t1508 t1509 t1510 t1511 t1512 t1513 t1514 t1515 t1516 t1517 t1518 t1519 t1520 t1521 t1522 - time

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
    c100 c101 c102 c103 c104 c105 c106 c107 c108 c109
    c110 c111 c112 c113 c114 c115 c116 c117 c118 c119
    c120 - count
  )

  (:init
    (at richmond_district)
    (current t0900)
    (met_count c0)

    (jump_allowed t0900 t1308)

    (plus7 t1308 t1315)
    (plus7 t1515 t1522)

    (next t1308 t1309) (next t1309 t1310) (next t1310 t1311) (next t1311 t1312) (next t1312 t1313) (next t1313 t1314) (next t1314 t1315)
    (next t1315 t1316) (next t1316 t1317) (next t1317 t1318) (next t1318 t1319) (next t1319 t1320) (next t1320 t1321) (next t1321 t1322)
    (next t1322 t1323) (next t1323 t1324) (next t1324 t1325) (next t1325 t1326) (next t1326 t1327) (next t1327 t1328) (next t1328 t1329)
    (next t1329 t1330) (next t1330 t1331) (next t1331 t1332) (next t1332 t1333) (next t1333 t1334) (next t1334 t1335) (next t1335 t1336)
    (next t1336 t1337) (next t1337 t1338) (next t1338 t1339) (next t1339 t1340) (next t1340 t1341) (next t1341 t1342) (next t1342 t1343)
    (next t1343 t1344) (next t1344 t1345) (next t1345 t1346) (next t1346 t1347) (next t1347 t1348) (next t1348 t1349) (next t1349 t1350)
    (next t1350 t1351) (next t1351 t1352) (next t1352 t1353) (next t1353 t1354) (next t1354 t1355) (next t1355 t1356) (next t1356 t1357)
    (next t1357 t1358) (next t1358 t1359) (next t1359 t1400)
    (next t1400 t1401) (next t1401 t1402) (next t1402 t1403) (next t1403 t1404) (next t1404 t1405) (next t1405 t1406) (next t1406 t1407)
    (next t1407 t1408) (next t1408 t1409) (next t1409 t1410) (next t1410 t1411) (next t1411 t1412) (next t1412 t1413) (next t1413 t1414)
    (next t1414 t1415) (next t1415 t1416) (next t1416 t1417) (next t1417 t1418) (next t1418 t1419) (next t1419 t1420) (next t1420 t1421)
    (next t1421 t1422) (next t1422 t1423) (next t1423 t1424) (next t1424 t1425) (next t1425 t1426) (next t1426 t1427) (next t1427 t1428)
    (next t1428 t1429) (next t1429 t1430) (next t1430 t1431) (next t1431 t1432) (next t1432 t1433) (next t1433 t1434) (next t1434 t1435)
    (next t1435 t1436) (next t1436 t1437) (next t1437 t1438) (next t1438 t1439) (next t1439 t1440) (next t1440 t1441) (next t1441 t1442)
    (next t1442 t1443) (next t1443 t1444) (next t1444 t1445) (next t1445 t1446) (next t1446 t1447) (next t1447 t1448) (next t1448 t1449)
    (next t1449 t1450) (next t1450 t1451) (next t1451 t1452) (next t1452 t1453) (next t1453 t1454) (next t1454 t1455) (next t1455 t1456)
    (next t1456 t1457) (next t1457 t1458) (next t1458 t1459) (next t1459 t1500)
    (next t1500 t1501) (next t1501 t1502) (next t1502 t1503) (next t1503 t1504) (next t1504 t1505) (next t1505 t1506) (next t1506 t1507)
    (next t1507 t1508) (next t1508 t1509) (next t1509 t1510) (next t1510 t1511) (next t1511 t1512) (next t1512 t1513) (next t1513 t1514)
    (next t1514 t1515) (next t1515 t1516) (next t1516 t1517) (next t1517 t1518) (next t1518 t1519) (next t1519 t1520) (next t1520 t1521)
    (next t1521 t1522)

    (avail_sarah t1315) (avail_sarah t1316) (avail_sarah t1317) (avail_sarah t1318) (avail_sarah t1319)
    (avail_sarah t1320) (avail_sarah t1321) (avail_sarah t1322) (avail_sarah t1323) (avail_sarah t1324)
    (avail_sarah t1325) (avail_sarah t1326) (avail_sarah t1327) (avail_sarah t1328) (avail_sarah t1329)
    (avail_sarah t1330) (avail_sarah t1331) (avail_sarah t1332) (avail_sarah t1333) (avail_sarah t1334)
    (avail_sarah t1335) (avail_sarah t1336) (avail_sarah t1337) (avail_sarah t1338) (avail_sarah t1339)
    (avail_sarah t1340) (avail_sarah t1341) (avail_sarah t1342) (avail_sarah t1343) (avail_sarah t1344)
    (avail_sarah t1345) (avail_sarah t1346) (avail_sarah t1347) (avail_sarah t1348) (avail_sarah t1349)
    (avail_sarah t1350) (avail_sarah t1351) (avail_sarah t1352) (avail_sarah t1353) (avail_sarah t1354)
    (avail_sarah t1355) (avail_sarah t1356) (avail_sarah t1357) (avail_sarah t1358) (avail_sarah t1359)
    (avail_sarah t1400) (avail_sarah t1401) (avail_sarah t1402) (avail_sarah t1403) (avail_sarah t1404)
    (avail_sarah t1405) (avail_sarah t1406) (avail_sarah t1407) (avail_sarah t1408) (avail_sarah t1409)
    (avail_sarah t1410) (avail_sarah t1411) (avail_sarah t1412) (avail_sarah t1413) (avail_sarah t1414)
    (avail_sarah t1415) (avail_sarah t1416) (avail_sarah t1417) (avail_sarah t1418) (avail_sarah t1419)
    (avail_sarah t1420) (avail_sarah t1421) (avail_sarah t1422) (avail_sarah t1423) (avail_sarah t1424)
    (avail_sarah t1425) (avail_sarah t1426) (avail_sarah t1427) (avail_sarah t1428) (avail_sarah t1429)
    (avail_sarah t1430) (avail_sarah t1431) (avail_sarah t1432) (avail_sarah t1433) (avail_sarah t1434)
    (avail_sarah t1435) (avail_sarah t1436) (avail_sarah t1437) (avail_sarah t1438) (avail_sarah t1439)
    (avail_sarah t1440) (avail_sarah t1441) (avail_sarah t1442) (avail_sarah t1443) (avail_sarah t1444)
    (avail_sarah t1445) (avail_sarah t1446) (avail_sarah t1447) (avail_sarah t1448) (avail_sarah t1449)
    (avail_sarah t1450) (avail_sarah t1451) (avail_sarah t1452) (avail_sarah t1453) (avail_sarah t1454)
    (avail_sarah t1455) (avail_sarah t1456) (avail_sarah t1457) (avail_sarah t1458) (avail_sarah t1459)
    (avail_sarah t1500) (avail_sarah t1501) (avail_sarah t1502) (avail_sarah t1503) (avail_sarah t1504)
    (avail_sarah t1505) (avail_sarah t1506) (avail_sarah t1507) (avail_sarah t1508) (avail_sarah t1509)
    (avail_sarah t1510) (avail_sarah t1511) (avail_sarah t1512) (avail_sarah t1513) (avail_sarah t1514)

    (nextcount c0 c1) (nextcount c1 c2) (nextcount c2 c3) (nextcount c3 c4) (nextcount c4 c5)
    (nextcount c5 c6) (nextcount c6 c7) (nextcount c7 c8) (nextcount c8 c9) (nextcount c9 c10)
    (nextcount c10 c11) (nextcount c11 c12) (nextcount c12 c13) (nextcount c13 c14) (nextcount c14 c15)
    (nextcount c15 c16) (nextcount c16 c17) (nextcount c17 c18) (nextcount c18 c19) (nextcount c19 c20)
    (nextcount c20 c21) (nextcount c21 c22) (nextcount c22 c23) (nextcount c23 c24) (nextcount c24 c25)
    (nextcount c25 c26) (nextcount c26 c27) (nextcount c27 c28) (nextcount c28 c29) (nextcount c29 c30)
    (nextcount c30 c31) (nextcount c31 c32) (nextcount c32 c33) (nextcount c33 c34) (nextcount c34 c35)
    (nextcount c35 c36) (nextcount c36 c37) (nextcount c37 c38) (nextcount c38 c39) (nextcount c39 c40)
    (nextcount c40 c41) (nextcount c41 c42) (nextcount c42 c43) (nextcount c43 c44) (nextcount c44 c45)
    (nextcount c45 c46) (nextcount c46 c47) (nextcount c47 c48) (nextcount c48 c49) (nextcount c49 c50)
    (nextcount c50 c51) (nextcount c51 c52) (nextcount c52 c53) (nextcount c53 c54) (nextcount c54 c55)
    (nextcount c55 c56) (nextcount c56 c57) (nextcount c57 c58) (nextcount c58 c59) (nextcount c59 c60)
    (nextcount c60 c61) (nextcount c61 c62) (nextcount c62 c63) (nextcount c63 c64) (nextcount c64 c65)
    (nextcount c65 c66) (nextcount c66 c67) (nextcount c67 c68) (nextcount c68 c69) (nextcount c69 c70)
    (nextcount c70 c71) (nextcount c71 c72) (nextcount c72 c73) (nextcount c73 c74) (nextcount c74 c75)
    (nextcount c75 c76) (nextcount c76 c77) (nextcount c77 c78) (nextcount c78 c79) (nextcount c79 c80)
    (nextcount c80 c81) (nextcount c81 c82) (nextcount c82 c83) (nextcount c83 c84) (nextcount c84 c85)
    (nextcount c85 c86) (nextcount c86 c87) (nextcount c87 c88) (nextcount c88 c89) (nextcount c89 c90)
    (nextcount c90 c91) (nextcount c91 c92) (nextcount c92 c93) (nextcount c93 c94) (nextcount c94 c95)
    (nextcount c95 c96) (nextcount c96 c97) (nextcount c97 c98) (nextcount c98 c99) (nextcount c99 c100)
    (nextcount c100 c101) (nextcount c101 c102) (nextcount c102 c103) (nextcount c103 c104) (nextcount c104 c105)
    (nextcount c105 c106) (nextcount c106 c107) (nextcount c107 c108) (nextcount c108 c109) (nextcount c109 c110)
    (nextcount c110 c111) (nextcount c111 c112) (nextcount c112 c113) (nextcount c113 c114) (nextcount c114 c115)
    (nextcount c115 c116) (nextcount c116 c117) (nextcount c117 c118) (nextcount c118 c119) (nextcount c119 c120)

    (threshold c105) (threshold c106) (threshold c107) (threshold c108) (threshold c109)
    (threshold c110) (threshold c111) (threshold c112) (threshold c113) (threshold c114)
    (threshold c115) (threshold c116) (threshold c117) (threshold c118) (threshold c119) (threshold c120)
  )

  (:goal
    (and
      (done105)
      (at richmond_district)
      (current t1522)
    )
  )
)