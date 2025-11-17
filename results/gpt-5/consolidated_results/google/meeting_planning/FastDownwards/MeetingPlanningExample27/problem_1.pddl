(define (problem sf-meet-margaret-problem)
  (:domain sf-meet-margaret)
  (:objects
    you - agent
    marina pacific - location
    margaret - person
    t000 t001 t002 t003 t004 t005 t006 t007 t008 t009
    t010 t011 t012 t013 t014 t015 t016 t017 t018 t019
    t020 t021 t022 t023 t024 t025 t026 t027 t028 t029
    t030 t031 t032 t033 t034 t035 t036 t037 t038 t039
    t040 t041 t042 t043 t044 t045 t046 t047 t048 t049
    t050 t051 t052 t053 t054 t055 t056 t057 t058 t059
    t060 t061 t062 t063 t064 t065 t066 t067 t068 t069
    t070 t071 t072 t073 t074 t075 t076 t077 t078 t079
    t080 t081 t082 t083 t084 t085 t086 t087 t088 t089
    t090 t091 t092 t093 t094 t095 t096 t097 t098 t099
    t100 t101 t102 t103 t104 t105 t106 t107 t108 t109
    t110 t111 t112 t113 t114 t115 t116 t117 t118 t119
    t120 t121 t122 t123 t124 t125 t126 t127 t128 t129
    t130 t131 t132 t133 t134 t135 t136 t137 t138 t139
    t140 t141 t142 t143 t144 t145 t146 t147 t148 t149
    t150 t151 t152 t153 t154 t155 t156 t157 t158 t159
    t160 t161 t162 t163 t164 t165 t166 t167 t168 t169
    t170 t171 t172 t173 t174 t175 t176 t177 t178 t179
    t180 t181 t182 t183 t184 t185 t186 t187 t188 t189
    t190 t191 t192 t193 t194 t195 t196 t197 t198 t199
    t200 t201 t202 t203 t204 t205 t206 t207 t208 t209
    t210 t211 t212 t213 t214 t215 t216 t217 t218 t219
    t220 t221 t222 t223 t224 t225 t226 t227 t228 t229
    t230 t231 t232 t233 t234 t235 t236 t237 t238 t239
    t240 t241 t242 t243 t244 t245 t246 t247 t248 t249
    t250 t251 t252 t253 t254 t255 t256 t257 t258 t259
    t260 t261 t262 t263 t264 t265 t266 t267 t268 t269
    t270 t271 t272 t273 t274 t275 t276 t277 t278 t279
    t280 t281 t282 t283 t284 t285 t286 t287 t288 t289
    t290 t291 t292 t293 t294 t295 t296 t297 t298 t299
    t300 t301 t302 t303 t304 t305 t306 t307 t308 t309
    t310 t311 t312 t313 t314 t315 t316 t317 t318 t319
    t320 t321 t322 t323 t324 t325 t326 t327 t328 t329
    t330 t331 t332 t333 t334 t335 t336 t337 t338 t339
    t340 t341 t342 t343 t344 t345 t346 t347 t348 t349
    t350 t351 t352 t353 t354 t355 t356 t357 t358 t359
    t360 t361 t362 t363 t364 t365 t366 t367 t368 t369
    t370 t371 t372 t373 t374 t375 t376 t377 t378 t379
    t380 t381 t382 t383 t384 t385 t386 t387 t388 t389
    t390 t391 t392 t393 t394 t395 t396 t397 t398 t399
    t400 t401 t402 t403 t404 t405 t406 t407 t408 t409
    t410 t411 t412 t413 t414 t415 t416 t417 t418 t419
    t420 t421 t422 t423 t424 t425 t426 t427 t428 t429
    t430 t431 t432 t433 t434 t435 t436 t437 t438 t439
    t440 t441 t442 t443 t444 t445 t446 t447 t448 t449
    t450 t451 t452 t453 t454 t455 t456 t457 t458 t459
    t460 t461 t462 t463 t464 t465 t466 t467 t468 t469
    t470 t471 t472 t473 t474 t475 t476 t477 t478 t479
    t480 t481 t482 t483 t484 t485 t486 t487 t488 t489
    t490 t491 t492 t493 t494 t495 t496 t497 t498 t499
    t500 t501 t502 t503 t504 t505 t506 t507 t508 t509
    t510 t511 t512 t513 t514 t515 t516 t517 t518 t519
    t520 t521 t522 t523 t524 t525 t526 t527 t528 t529
    t530 t531 t532 t533 t534 t535 t536 t537 t538 t539
    t540 t541 t542 t543 t544 t545 t546 t547 t548 t549
    t550 t551 t552 t553 t554 t555 t556 t557 t558 t559
    t560 t561 t562 t563 t564 t565 t566 t567 t568 t569
    t570 t571 t572 t573 t574 t575 t576 t577 t578 t579
    t580 t581 t582 t583 t584 t585 t586 t587 t588 t589
    t590 t591 t592 t593 t594 t595 t596 t597 t598 t599
    t600 t601 t602 t603 t604 t605 t606 t607 t608 t609
    t610 t611 t612 t613 t614 t615 t616 t617 t618 t619
    t620 t621 t622 t623 t624 t625 t626 t627 t628 t629
    t630 t631 t632 t633 t634 t635 t636 t637 t638 t639
    t640 t641 t642 t643 t644 t645 - time
  )

  (:init
    (friend margaret)
    (friend-at margaret pacific)
    (at you marina)
    (at-time t000)
    (free)
    (= (total-cost) 0)

    ; minute successors 0..645
    (succ t000 t001) (succ t001 t002) (succ t002 t003) (succ t003 t004) (succ t004 t005)
    (succ t005 t006) (succ t006 t007) (succ t007 t008) (succ t008 t009) (succ t009 t010)
    (succ t010 t011) (succ t011 t012) (succ t012 t013) (succ t013 t014) (succ t014 t015)
    (succ t015 t016) (succ t016 t017) (succ t017 t018) (succ t018 t019) (succ t019 t020)
    (succ t020 t021) (succ t021 t022) (succ t022 t023) (succ t023 t024) (succ t024 t025)
    (succ t025 t026) (succ t026 t027) (succ t027 t028) (succ t028 t029) (succ t029 t030)
    (succ t030 t031) (succ t031 t032) (succ t032 t033) (succ t033 t034) (succ t034 t035)
    (succ t035 t036) (succ t036 t037) (succ t037 t038) (succ t038 t039) (succ t039 t040)
    (succ t040 t041) (succ t041 t042) (succ t042 t043) (succ t043 t044) (succ t044 t045)
    (succ t045 t046) (succ t046 t047) (succ t047 t048) (succ t048 t049) (succ t049 t050)
    (succ t050 t051) (succ t051 t052) (succ t052 t053) (succ t053 t054) (succ t054 t055)
    (succ t055 t056) (succ t056 t057) (succ t057 t058) (succ t058 t059) (succ t059 t060)
    (succ t060 t061) (succ t061 t062) (succ t062 t063) (succ t063 t064) (succ t064 t065)
    (succ t065 t066) (succ t066 t067) (succ t067 t068) (succ t068 t069) (succ t069 t070)
    (succ t070 t071) (succ t071 t072) (succ t072 t073) (succ t073 t074) (succ t074 t075)
    (succ t075 t076) (succ t076 t077) (succ t077 t078) (succ t078 t079) (succ t079 t080)
    (succ t080 t081) (succ t081 t082) (succ t082 t083) (succ t083 t084) (succ t084 t085)
    (succ t085 t086) (succ t086 t087) (succ t087 t088) (succ t088 t089) (succ t089 t090)
    (succ t090 t091) (succ t091 t092) (succ t092 t093) (succ t093 t094) (succ t094 t095)
    (succ t095 t096) (succ t096 t097) (succ t097 t098) (succ t098 t099) (succ t099 t100)
    (succ t100 t101) (succ t101 t102) (succ t102 t103) (succ t103 t104) (succ t104 t105)
    (succ t105 t106) (succ t106 t107) (succ t107 t108) (succ t108 t109) (succ t109 t110)
    (succ t110 t111) (succ t111 t112) (succ t112 t113) (succ t113 t114) (succ t114 t115)
    (succ t115 t116) (succ t116 t117) (succ t117 t118) (succ t118 t119) (succ t119 t120)
    (succ t120 t121) (succ t121 t122) (succ t122 t123) (succ t123 t124) (succ t124 t125)
    (succ t125 t126) (succ t126 t127) (succ t127 t128) (succ t128 t129) (succ t129 t130)
    (succ t130 t131) (succ t131 t132) (succ t132 t133) (succ t133 t134) (succ t134 t135)
    (succ t135 t136) (succ t136 t137) (succ t137 t138) (succ t138 t139) (succ t139 t140)
    (succ t140 t141) (succ t141 t142) (succ t142 t143) (succ t143 t144) (succ t144 t145)
    (succ t145 t146) (succ t146 t147) (succ t147 t148) (succ t148 t149) (succ t149 t150)
    (succ t150 t151) (succ t151 t152) (succ t152 t153) (succ t153 t154) (succ t154 t155)
    (succ t155 t156) (succ t156 t157) (succ t157 t158) (succ t158 t159) (succ t159 t160)
    (succ t160 t161) (succ t161 t162) (succ t162 t163) (succ t163 t164) (succ t164 t165)
    (succ t165 t166) (succ t166 t167) (succ t167 t168) (succ t168 t169) (succ t169 t170)
    (succ t170 t171) (succ t171 t172) (succ t172 t173) (succ t173 t174) (succ t174 t175)
    (succ t175 t176) (succ t176 t177) (succ t177 t178) (succ t178 t179) (succ t179 t180)
    (succ t180 t181) (succ t181 t182) (succ t182 t183) (succ t183 t184) (succ t184 t185)
    (succ t185 t186) (succ t186 t187) (succ t187 t188) (succ t188 t189) (succ t189 t190)
    (succ t190 t191) (succ t191 t192) (succ t192 t193) (succ t193 t194) (succ t194 t195)
    (succ t195 t196) (succ t196 t197) (succ t197 t198) (succ t198 t199) (succ t199 t200)
    (succ t200 t201) (succ t201 t202) (succ t202 t203) (succ t203 t204) (succ t204 t205)
    (succ t205 t206) (succ t206 t207) (succ t207 t208) (succ t208 t209) (succ t209 t210)
    (succ t210 t211) (succ t211 t212) (succ t212 t213) (succ t213 t214) (succ t214 t215)
    (succ t215 t216) (succ t216 t217) (succ t217 t218) (succ t218 t219) (succ t219 t220)
    (succ t220 t221) (succ t221 t222) (succ t222 t223) (succ t223 t224) (succ t224 t225)
    (succ t225 t226) (succ t226 t227) (succ t227 t228) (succ t228 t229) (succ t229 t230)
    (succ t230 t231) (succ t231 t232) (succ t232 t233) (succ t233 t234) (succ t234 t235)
    (succ t235 t236) (succ t236 t237) (succ t237 t238) (succ t238 t239) (succ t239 t240)
    (succ t240 t241) (succ t241 t242) (succ t242 t243) (succ t243 t244) (succ t244 t245)
    (succ t245 t246) (succ t246 t247) (succ t247 t248) (succ t248 t249) (succ t249 t250)
    (succ t250 t251) (succ t251 t252) (succ t252 t253) (succ t253 t254) (succ t254 t255)
    (succ t255 t256) (succ t256 t257) (succ t257 t258) (succ t258 t259) (succ t259 t260)
    (succ t260 t261) (succ t261 t262) (succ t262 t263) (succ t263 t264) (succ t264 t265)
    (succ t265 t266) (succ t266 t267) (succ t267 t268) (succ t268 t269) (succ t269 t270)
    (succ t270 t271) (succ t271 t272) (succ t272 t273) (succ t273 t274) (succ t274 t275)
    (succ t275 t276) (succ t276 t277) (succ t277 t278) (succ t278 t279) (succ t279 t280)
    (succ t280 t281) (succ t281 t282) (succ t282 t283) (succ t283 t284) (succ t284 t285)
    (succ t285 t286) (succ t286 t287) (succ t287 t288) (succ t288 t289) (succ t289 t290)
    (succ t290 t291) (succ t291 t292) (succ t292 t293) (succ t293 t294) (succ t294 t295)
    (succ t295 t296) (succ t296 t297) (succ t297 t298) (succ t298 t299) (succ t299 t300)
    (succ t300 t301) (succ t301 t302) (succ t302 t303) (succ t303 t304) (succ t304 t305)
    (succ t305 t306) (succ t306 t307) (succ t307 t308) (succ t308 t309) (succ t309 t310)
    (succ t310 t311) (succ t311 t312) (succ t312 t313) (succ t313 t314) (succ t314 t315)
    (succ t315 t316) (succ t316 t317) (succ t317 t318) (succ t318 t319) (succ t319 t320)
    (succ t320 t321) (succ t321 t322) (succ t322 t323) (succ t323 t324) (succ t324 t325)
    (succ t325 t326) (succ t326 t327) (succ t327 t328) (succ t328 t329) (succ t329 t330)
    (succ t330 t331) (succ t331 t332) (succ t332 t333) (succ t333 t334) (succ t334 t335)
    (succ t335 t336) (succ t336 t337) (succ t337 t338) (succ t338 t339) (succ t339 t340)
    (succ t340 t341) (succ t341 t342) (succ t342 t343) (succ t343 t344) (succ t344 t345)
    (succ t345 t346) (succ t346 t347) (succ t347 t348) (succ t348 t349) (succ t349 t350)
    (succ t350 t351) (succ t351 t352) (succ t352 t353) (succ t353 t354) (succ t354 t355)
    (succ t355 t356) (succ t356 t357) (succ t357 t358) (succ t358 t359) (succ t359 t360)
    (succ t360 t361) (succ t361 t362) (succ t362 t363) (succ t363 t364) (succ t364 t365)
    (succ t365 t366) (succ t366 t367) (succ t367 t368) (succ t368 t369) (succ t369 t370)
    (succ t370 t371) (succ t371 t372) (succ t372 t373) (succ t373 t374) (succ t374 t375)
    (succ t375 t376) (succ t376 t377) (succ t377 t378) (succ t378 t379) (succ t379 t380)
    (succ t380 t381) (succ t381 t382) (succ t382 t383) (succ t383 t384) (succ t384 t385)
    (succ t385 t386) (succ t386 t387) (succ t387 t388) (succ t388 t389) (succ t389 t390)
    (succ t390 t391) (succ t391 t392) (succ t392 t393) (succ t393 t394) (succ t394 t395)
    (succ t395 t396) (succ t396 t397) (succ t397 t398) (succ t398 t399) (succ t399 t400)
    (succ t400 t401) (succ t401 t402) (succ t402 t403) (succ t403 t404) (succ t404 t405)
    (succ t405 t406) (succ t406 t407) (succ t407 t408) (succ t408 t409) (succ t409 t410)
    (succ t410 t411) (succ t411 t412) (succ t412 t413) (succ t413 t414) (succ t414 t415)
    (succ t415 t416) (succ t416 t417) (succ t417 t418) (succ t418 t419) (succ t419 t420)
    (succ t420 t421) (succ t421 t422) (succ t422 t423) (succ t423 t424) (succ t424 t425)
    (succ t425 t426) (succ t426 t427) (succ t427 t428) (succ t428 t429) (succ t429 t430)
    (succ t430 t431) (succ t431 t432) (succ t432 t433) (succ t433 t434) (succ t434 t435)
    (succ t435 t436) (succ t436 t437) (succ t437 t438) (succ t438 t439) (succ t439 t440)
    (succ t440 t441) (succ t441 t442) (succ t442 t443) (succ t443 t444) (succ t444 t445)
    (succ t445 t446) (succ t446 t447) (succ t447 t448) (succ t448 t449) (succ t449 t450)
    (succ t450 t451) (succ t451 t452) (succ t452 t453) (succ t453 t454) (succ t454 t455)
    (succ t455 t456) (succ t456 t457) (succ t457 t458) (succ t458 t459) (succ t459 t460)
    (succ t460 t461) (succ t461 t462) (succ t462 t463) (succ t463 t464) (succ t464 t465)
    (succ t465 t466) (succ t466 t467) (succ t467 t468) (succ t468 t469) (succ t469 t470)
    (succ t470 t471) (succ t471 t472) (succ t472 t473) (succ t473 t474) (succ t474 t475)
    (succ t475 t476) (succ t476 t477) (succ t477 t478) (succ t478 t479) (succ t479 t480)
    (succ t480 t481) (succ t481 t482) (succ t482 t483) (succ t483 t484) (succ t484 t485)
    (succ t485 t486) (succ t486 t487) (succ t487 t488) (succ t488 t489) (succ t489 t490)
    (succ t490 t491) (succ t491 t492) (succ t492 t493) (succ t493 t494) (succ t494 t495)
    (succ t495 t496) (succ t496 t497) (succ t497 t498) (succ t498 t499) (succ t499 t500)
    (succ t500 t501) (succ t501 t502) (succ t502 t503) (succ t503 t504) (succ t504 t505)
    (succ t505 t506) (succ t506 t507) (succ t507 t508) (succ t508 t509) (succ t509 t510)
    (succ t510 t511) (succ t511 t512) (succ t512 t513) (succ t513 t514) (succ t514 t515)
    (succ t515 t516) (succ t516 t517) (succ t517 t518) (succ t518 t519) (succ t519 t520)
    (succ t520 t521) (succ t521 t522) (succ t522 t523) (succ t523 t524) (succ t524 t525)
    (succ t525 t526) (succ t526 t527) (succ t527 t528) (succ t528 t529) (succ t529 t530)
    (succ t530 t531) (succ t531 t532) (succ t532 t533) (succ t533 t534) (succ t534 t535)
    (succ t535 t536) (succ t536 t537) (succ t537 t538) (succ t538 t539) (succ t539 t540)
    (succ t540 t541) (succ t541 t542) (succ t542 t543) (succ t543 t544) (succ t544 t545)
    (succ t545 t546) (succ t546 t547) (succ t547 t548) (succ t548 t549) (succ t549 t550)
    (succ t550 t551) (succ t551 t552) (succ t552 t553) (succ t553 t554) (succ t554 t555)
    (succ t555 t556) (succ t556 t557) (succ t557 t558) (succ t558 t559) (succ t559 t560)
    (succ t560 t561) (succ t561 t562) (succ t562 t563) (succ t563 t564) (succ t564 t565)
    (succ t565 t566) (succ t566 t567) (succ t567 t568) (succ t568 t569) (succ t569 t570)
    (succ t570 t571) (succ t571 t572) (succ t572 t573) (succ t573 t574) (succ t574 t575)
    (succ t575 t576) (succ t576 t577) (succ t577 t578) (succ t578 t579) (succ t579 t580)
    (succ t580 t581) (succ t581 t582) (succ t582 t583) (succ t583 t584) (succ t584 t585)
    (succ t585 t586) (succ t586 t587) (succ t587 t588) (succ t588 t589) (succ t589 t590)
    (succ t590 t591) (succ t591 t592) (succ t592 t593) (succ t593 t594) (succ t594 t595)
    (succ t595 t596) (succ t596 t597) (succ t597 t598) (succ t598 t599) (succ t599 t600)
    (succ t600 t601) (succ t601 t602) (succ t602 t603) (succ t603 t604) (succ t604 t605)
    (succ t605 t606) (succ t606 t607) (succ t607 t608) (succ t608 t609) (succ t609 t610)
    (succ t610 t611) (succ t611 t612) (succ t612 t613) (succ t613 t614) (succ t614 t615)
    (succ t615 t616) (succ t616 t617) (succ t617 t618) (succ t618 t619) (succ t619 t620)
    (succ t620 t621) (succ t621 t622) (succ t622 t623) (succ t623 t624) (succ t624 t625)
    (succ t625 t626) (succ t626 t627) (succ t627 t628) (succ t628 t629) (succ t629 t630)
    (succ t630 t631) (succ t631 t632) (succ t632 t633) (succ t633 t634) (succ t634 t635)
    (succ t635 t636) (succ t636 t637) (succ t637 t638) (succ t638 t639) (succ t639 t640)
    (succ t640 t641) (succ t641 t642) (succ t642 t643) (succ t643 t644) (succ t644 t645)

    ; Margaret's availability window: minutes 600..644 inclusive
    (in-window t600) (in-window t601) (in-window t602) (in-window t603) (in-window t604)
    (in-window t605) (in-window t606) (in-window t607) (in-window t608) (in-window t609)
    (in-window t610) (in-window t611) (in-window t612) (in-window t613) (in-window t614)
    (in-window t615) (in-window t616) (in-window t617) (in-window t618) (in-window t619)
    (in-window t620) (in-window t621) (in-window t622) (in-window t623) (in-window t624)
    (in-window t625) (in-window t626) (in-window t627) (in-window t628) (in-window t629)
    (in-window t630) (in-window t631) (in-window t632) (in-window t633) (in-window t634)
    (in-window t635) (in-window t636) (in-window t637) (in-window t638) (in-window t639)
    (in-window t640) (in-window t641) (in-window t642) (in-window t643) (in-window t644)
  )

  (:goal (and
    (met margaret)
  ))

  (:metric minimize (total-cost))
)