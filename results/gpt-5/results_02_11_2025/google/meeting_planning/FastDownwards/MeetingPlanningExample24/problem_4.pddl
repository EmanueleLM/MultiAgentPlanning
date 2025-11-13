(define (problem MeetingPlanningExample24-problem)
  (:domain MeetingPlanningExample24)
  (:objects
    nob_hill presidio - location
    matthew - person
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
    t640 t641 t642 t643 t644 t645 t646 t647 t648 t649
    t650 t651 t652 t653 t654 t655 t656 t657 t658 t659
    t660 - time
    c00 c01 c02 c03 c04 c05 c06 c07 c08 c09
    c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
    c20 c21 c22 c23 c24 c25 c26 c27 c28 c29
    c30 - count
  )
  (:init
    (at nob_hill)
    (current-time t000)
    (= (total-cost) 0)
    (meeting-spot matthew presidio)
    (travel17 nob_hill presidio)
    (travel18 presidio nob_hill)

    (plus1 t000 t001) (plus1 t001 t002) (plus1 t002 t003) (plus1 t003 t004) (plus1 t004 t005)
    (plus1 t005 t006) (plus1 t006 t007) (plus1 t007 t008) (plus1 t008 t009) (plus1 t009 t010)
    (plus1 t010 t011) (plus1 t011 t012) (plus1 t012 t013) (plus1 t013 t014) (plus1 t014 t015)
    (plus1 t015 t016) (plus1 t016 t017) (plus1 t017 t018) (plus1 t018 t019) (plus1 t019 t020)
    (plus1 t020 t021) (plus1 t021 t022) (plus1 t022 t023) (plus1 t023 t024) (plus1 t024 t025)
    (plus1 t025 t026) (plus1 t026 t027) (plus1 t027 t028) (plus1 t028 t029) (plus1 t029 t030)
    (plus1 t030 t031) (plus1 t031 t032) (plus1 t032 t033) (plus1 t033 t034) (plus1 t034 t035)
    (plus1 t035 t036) (plus1 t036 t037) (plus1 t037 t038) (plus1 t038 t039) (plus1 t039 t040)
    (plus1 t040 t041) (plus1 t041 t042) (plus1 t042 t043) (plus1 t043 t044) (plus1 t044 t045)
    (plus1 t045 t046) (plus1 t046 t047) (plus1 t047 t048) (plus1 t048 t049) (plus1 t049 t050)
    (plus1 t050 t051) (plus1 t051 t052) (plus1 t052 t053) (plus1 t053 t054) (plus1 t054 t055)
    (plus1 t055 t056) (plus1 t056 t057) (plus1 t057 t058) (plus1 t058 t059) (plus1 t059 t060)
    (plus1 t060 t061) (plus1 t061 t062) (plus1 t062 t063) (plus1 t063 t064) (plus1 t064 t065)
    (plus1 t065 t066) (plus1 t066 t067) (plus1 t067 t068) (plus1 t068 t069) (plus1 t069 t070)
    (plus1 t070 t071) (plus1 t071 t072) (plus1 t072 t073) (plus1 t073 t074) (plus1 t074 t075)
    (plus1 t075 t076) (plus1 t076 t077) (plus1 t077 t078) (plus1 t078 t079) (plus1 t079 t080)
    (plus1 t080 t081) (plus1 t081 t082) (plus1 t082 t083) (plus1 t083 t084) (plus1 t084 t085)
    (plus1 t085 t086) (plus1 t086 t087) (plus1 t087 t088) (plus1 t088 t089) (plus1 t089 t090)
    (plus1 t090 t091) (plus1 t091 t092) (plus1 t092 t093) (plus1 t093 t094) (plus1 t094 t095)
    (plus1 t095 t096) (plus1 t096 t097) (plus1 t097 t098) (plus1 t098 t099) (plus1 t099 t100)
    (plus1 t100 t101) (plus1 t101 t102) (plus1 t102 t103) (plus1 t103 t104) (plus1 t104 t105)
    (plus1 t105 t106) (plus1 t106 t107) (plus1 t107 t108) (plus1 t108 t109) (plus1 t109 t110)
    (plus1 t110 t111) (plus1 t111 t112) (plus1 t112 t113) (plus1 t113 t114) (plus1 t114 t115)
    (plus1 t115 t116) (plus1 t116 t117) (plus1 t117 t118) (plus1 t118 t119) (plus1 t119 t120)
    (plus1 t120 t121) (plus1 t121 t122) (plus1 t122 t123) (plus1 t123 t124) (plus1 t124 t125)
    (plus1 t125 t126) (plus1 t126 t127) (plus1 t127 t128) (plus1 t128 t129) (plus1 t129 t130)
    (plus1 t130 t131) (plus1 t131 t132) (plus1 t132 t133) (plus1 t133 t134) (plus1 t134 t135)
    (plus1 t135 t136) (plus1 t136 t137) (plus1 t137 t138) (plus1 t138 t139) (plus1 t139 t140)
    (plus1 t140 t141) (plus1 t141 t142) (plus1 t142 t143) (plus1 t143 t144) (plus1 t144 t145)
    (plus1 t145 t146) (plus1 t146 t147) (plus1 t147 t148) (plus1 t148 t149) (plus1 t149 t150)
    (plus1 t150 t151) (plus1 t151 t152) (plus1 t152 t153) (plus1 t153 t154) (plus1 t154 t155)
    (plus1 t155 t156) (plus1 t156 t157) (plus1 t157 t158) (plus1 t158 t159) (plus1 t159 t160)
    (plus1 t160 t161) (plus1 t161 t162) (plus1 t162 t163) (plus1 t163 t164) (plus1 t164 t165)
    (plus1 t165 t166) (plus1 t166 t167) (plus1 t167 t168) (plus1 t168 t169) (plus1 t169 t170)
    (plus1 t170 t171) (plus1 t171 t172) (plus1 t172 t173) (plus1 t173 t174) (plus1 t174 t175)
    (plus1 t175 t176) (plus1 t176 t177) (plus1 t177 t178) (plus1 t178 t179) (plus1 t179 t180)
    (plus1 t180 t181) (plus1 t181 t182) (plus1 t182 t183) (plus1 t183 t184) (plus1 t184 t185)
    (plus1 t185 t186) (plus1 t186 t187) (plus1 t187 t188) (plus1 t188 t189) (plus1 t189 t190)
    (plus1 t190 t191) (plus1 t191 t192) (plus1 t192 t193) (plus1 t193 t194) (plus1 t194 t195)
    (plus1 t195 t196) (plus1 t196 t197) (plus1 t197 t198) (plus1 t198 t199) (plus1 t199 t200)
    (plus1 t200 t201) (plus1 t201 t202) (plus1 t202 t203) (plus1 t203 t204) (plus1 t204 t205)
    (plus1 t205 t206) (plus1 t206 t207) (plus1 t207 t208) (plus1 t208 t209) (plus1 t209 t210)
    (plus1 t210 t211) (plus1 t211 t212) (plus1 t212 t213) (plus1 t213 t214) (plus1 t214 t215)
    (plus1 t215 t216) (plus1 t216 t217) (plus1 t217 t218) (plus1 t218 t219) (plus1 t219 t220)
    (plus1 t220 t221) (plus1 t221 t222) (plus1 t222 t223) (plus1 t223 t224) (plus1 t224 t225)
    (plus1 t225 t226) (plus1 t226 t227) (plus1 t227 t228) (plus1 t228 t229) (plus1 t229 t230)
    (plus1 t230 t231) (plus1 t231 t232) (plus1 t232 t233) (plus1 t233 t234) (plus1 t234 t235)
    (plus1 t235 t236) (plus1 t236 t237) (plus1 t237 t238) (plus1 t238 t239) (plus1 t239 t240)
    (plus1 t240 t241) (plus1 t241 t242) (plus1 t242 t243) (plus1 t243 t244) (plus1 t244 t245)
    (plus1 t245 t246) (plus1 t246 t247) (plus1 t247 t248) (plus1 t248 t249) (plus1 t249 t250)
    (plus1 t250 t251) (plus1 t251 t252) (plus1 t252 t253) (plus1 t253 t254) (plus1 t254 t255)
    (plus1 t255 t256) (plus1 t256 t257) (plus1 t257 t258) (plus1 t258 t259) (plus1 t259 t260)
    (plus1 t260 t261) (plus1 t261 t262) (plus1 t262 t263) (plus1 t263 t264) (plus1 t264 t265)
    (plus1 t265 t266) (plus1 t266 t267) (plus1 t267 t268) (plus1 t268 t269) (plus1 t269 t270)
    (plus1 t270 t271) (plus1 t271 t272) (plus1 t272 t273) (plus1 t273 t274) (plus1 t274 t275)
    (plus1 t275 t276) (plus1 t276 t277) (plus1 t277 t278) (plus1 t278 t279) (plus1 t279 t280)
    (plus1 t280 t281) (plus1 t281 t282) (plus1 t282 t283) (plus1 t283 t284) (plus1 t284 t285)
    (plus1 t285 t286) (plus1 t286 t287) (plus1 t287 t288) (plus1 t288 t289) (plus1 t289 t290)
    (plus1 t290 t291) (plus1 t291 t292) (plus1 t292 t293) (plus1 t293 t294) (plus1 t294 t295)
    (plus1 t295 t296) (plus1 t296 t297) (plus1 t297 t298) (plus1 t298 t299) (plus1 t299 t300)
    (plus1 t300 t301) (plus1 t301 t302) (plus1 t302 t303) (plus1 t303 t304) (plus1 t304 t305)
    (plus1 t305 t306) (plus1 t306 t307) (plus1 t307 t308) (plus1 t308 t309) (plus1 t309 t310)
    (plus1 t310 t311) (plus1 t311 t312) (plus1 t312 t313) (plus1 t313 t314) (plus1 t314 t315)
    (plus1 t315 t316) (plus1 t316 t317) (plus1 t317 t318) (plus1 t318 t319) (plus1 t319 t320)
    (plus1 t320 t321) (plus1 t321 t322) (plus1 t322 t323) (plus1 t323 t324) (plus1 t324 t325)
    (plus1 t325 t326) (plus1 t326 t327) (plus1 t327 t328) (plus1 t328 t329) (plus1 t329 t330)
    (plus1 t330 t331) (plus1 t331 t332) (plus1 t332 t333) (plus1 t333 t334) (plus1 t334 t335)
    (plus1 t335 t336) (plus1 t336 t337) (plus1 t337 t338) (plus1 t338 t339) (plus1 t339 t340)
    (plus1 t340 t341) (plus1 t341 t342) (plus1 t342 t343) (plus1 t343 t344) (plus1 t344 t345)
    (plus1 t345 t346) (plus1 t346 t347) (plus1 t347 t348) (plus1 t348 t349) (plus1 t349 t350)
    (plus1 t350 t351) (plus1 t351 t352) (plus1 t352 t353) (plus1 t353 t354) (plus1 t354 t355)
    (plus1 t355 t356) (plus1 t356 t357) (plus1 t357 t358) (plus1 t358 t359) (plus1 t359 t360)
    (plus1 t360 t361) (plus1 t361 t362) (plus1 t362 t363) (plus1 t363 t364) (plus1 t364 t365)
    (plus1 t365 t366) (plus1 t366 t367) (plus1 t367 t368) (plus1 t368 t369) (plus1 t369 t370)
    (plus1 t370 t371) (plus1 t371 t372) (plus1 t372 t373) (plus1 t373 t374) (plus1 t374 t375)
    (plus1 t375 t376) (plus1 t376 t377) (plus1 t377 t378) (plus1 t378 t379) (plus1 t379 t380)
    (plus1 t380 t381) (plus1 t381 t382) (plus1 t382 t383) (plus1 t383 t384) (plus1 t384 t385)
    (plus1 t385 t386) (plus1 t386 t387) (plus1 t387 t388) (plus1 t388 t389) (plus1 t389 t390)
    (plus1 t390 t391) (plus1 t391 t392) (plus1 t392 t393) (plus1 t393 t394) (plus1 t394 t395)
    (plus1 t395 t396) (plus1 t396 t397) (plus1 t397 t398) (plus1 t398 t399) (plus1 t399 t400)
    (plus1 t400 t401) (plus1 t401 t402) (plus1 t402 t403) (plus1 t403 t404) (plus1 t404 t405)
    (plus1 t405 t406) (plus1 t406 t407) (plus1 t407 t408) (plus1 t408 t409) (plus1 t409 t410)
    (plus1 t410 t411) (plus1 t411 t412) (plus1 t412 t413) (plus1 t413 t414) (plus1 t414 t415)
    (plus1 t415 t416) (plus1 t416 t417) (plus1 t417 t418) (plus1 t418 t419) (plus1 t419 t420)
    (plus1 t420 t421) (plus1 t421 t422) (plus1 t422 t423) (plus1 t423 t424) (plus1 t424 t425)
    (plus1 t425 t426) (plus1 t426 t427) (plus1 t427 t428) (plus1 t428 t429) (plus1 t429 t430)
    (plus1 t430 t431) (plus1 t431 t432) (plus1 t432 t433) (plus1 t433 t434) (plus1 t434 t435)
    (plus1 t435 t436) (plus1 t436 t437) (plus1 t437 t438) (plus1 t438 t439) (plus1 t439 t440)
    (plus1 t440 t441) (plus1 t441 t442) (plus1 t442 t443) (plus1 t443 t444) (plus1 t444 t445)
    (plus1 t445 t446) (plus1 t446 t447) (plus1 t447 t448) (plus1 t448 t449) (plus1 t449 t450)
    (plus1 t450 t451) (plus1 t451 t452) (plus1 t452 t453) (plus1 t453 t454) (plus1 t454 t455)
    (plus1 t455 t456) (plus1 t456 t457) (plus1 t457 t458) (plus1 t458 t459) (plus1 t459 t460)
    (plus1 t460 t461) (plus1 t461 t462) (plus1 t462 t463) (plus1 t463 t464) (plus1 t464 t465)
    (plus1 t465 t466) (plus1 t466 t467) (plus1 t467 t468) (plus1 t468 t469) (plus1 t469 t470)
    (plus1 t470 t471) (plus1 t471 t472) (plus1 t472 t473) (plus1 t473 t474) (plus1 t474 t475)
    (plus1 t475 t476) (plus1 t476 t477) (plus1 t477 t478) (plus1 t478 t479) (plus1 t479 t480)
    (plus1 t480 t481) (plus1 t481 t482) (plus1 t482 t483) (plus1 t483 t484) (plus1 t484 t485)
    (plus1 t485 t486) (plus1 t486 t487) (plus1 t487 t488) (plus1 t488 t489) (plus1 t489 t490)
    (plus1 t490 t491) (plus1 t491 t492) (plus1 t492 t493) (plus1 t493 t494) (plus1 t494 t495)
    (plus1 t495 t496) (plus1 t496 t497) (plus1 t497 t498) (plus1 t498 t499) (plus1 t499 t500)
    (plus1 t500 t501) (plus1 t501 t502) (plus1 t502 t503) (plus1 t503 t504) (plus1 t504 t505)
    (plus1 t505 t506) (plus1 t506 t507) (plus1 t507 t508) (plus1 t508 t509) (plus1 t509 t510)
    (plus1 t510 t511) (plus1 t511 t512) (plus1 t512 t513) (plus1 t513 t514) (plus1 t514 t515)
    (plus1 t515 t516) (plus1 t516 t517) (plus1 t517 t518) (plus1 t518 t519) (plus1 t519 t520)
    (plus1 t520 t521) (plus1 t521 t522) (plus1 t522 t523) (plus1 t523 t524) (plus1 t524 t525)
    (plus1 t525 t526) (plus1 t526 t527) (plus1 t527 t528) (plus1 t528 t529) (plus1 t529 t530)
    (plus1 t530 t531) (plus1 t531 t532) (plus1 t532 t533) (plus1 t533 t534) (plus1 t534 t535)
    (plus1 t535 t536) (plus1 t536 t537) (plus1 t537 t538) (plus1 t538 t539) (plus1 t539 t540)
    (plus1 t540 t541) (plus1 t541 t542) (plus1 t542 t543) (plus1 t543 t544) (plus1 t544 t545)
    (plus1 t545 t546) (plus1 t546 t547) (plus1 t547 t548) (plus1 t548 t549) (plus1 t549 t550)
    (plus1 t550 t551) (plus1 t551 t552) (plus1 t552 t553) (plus1 t553 t554) (plus1 t554 t555)
    (plus1 t555 t556) (plus1 t556 t557) (plus1 t557 t558) (plus1 t558 t559) (plus1 t559 t560)
    (plus1 t560 t561) (plus1 t561 t562) (plus1 t562 t563) (plus1 t563 t564) (plus1 t564 t565)
    (plus1 t565 t566) (plus1 t566 t567) (plus1 t567 t568) (plus1 t568 t569) (plus1 t569 t570)
    (plus1 t570 t571) (plus1 t571 t572) (plus1 t572 t573) (plus1 t573 t574) (plus1 t574 t575)
    (plus1 t575 t576) (plus1 t576 t577) (plus1 t577 t578) (plus1 t578 t579) (plus1 t579 t580)
    (plus1 t580 t581) (plus1 t581 t582) (plus1 t582 t583) (plus1 t583 t584) (plus1 t584 t585)
    (plus1 t585 t586) (plus1 t586 t587) (plus1 t587 t588) (plus1 t588 t589) (plus1 t589 t590)
    (plus1 t590 t591) (plus1 t591 t592) (plus1 t592 t593) (plus1 t593 t594) (plus1 t594 t595)
    (plus1 t595 t596) (plus1 t596 t597) (plus1 t597 t598) (plus1 t598 t599) (plus1 t599 t600)
    (plus1 t600 t601) (plus1 t601 t602) (plus1 t602 t603) (plus1 t603 t604) (plus1 t604 t605)
    (plus1 t605 t606) (plus1 t606 t607) (plus1 t607 t608) (plus1 t608 t609) (plus1 t609 t610)
    (plus1 t610 t611) (plus1 t611 t612) (plus1 t612 t613) (plus1 t613 t614) (plus1 t614 t615)
    (plus1 t615 t616) (plus1 t616 t617) (plus1 t617 t618) (plus1 t618 t619) (plus1 t619 t620)
    (plus1 t620 t621) (plus1 t621 t622) (plus1 t622 t623) (plus1 t623 t624) (plus1 t624 t625)
    (plus1 t625 t626) (plus1 t626 t627) (plus1 t627 t628) (plus1 t628 t629) (plus1 t629 t630)
    (plus1 t630 t631) (plus1 t631 t632) (plus1 t632 t633) (plus1 t633 t634) (plus1 t634 t635)
    (plus1 t635 t636) (plus1 t636 t637) (plus1 t637 t638) (plus1 t638 t639) (plus1 t639 t640)
    (plus1 t640 t641) (plus1 t641 t642) (plus1 t642 t643) (plus1 t643 t644) (plus1 t644 t645)
    (plus1 t645 t646) (plus1 t646 t647) (plus1 t647 t648) (plus1 t648 t649) (plus1 t649 t650)
    (plus1 t650 t651) (plus1 t651 t652) (plus1 t652 t653) (plus1 t653 t654) (plus1 t654 t655)
    (plus1 t655 t656) (plus1 t656 t657) (plus1 t657 t658) (plus1 t658 t659) (plus1 t659 t660)

    (dec1 c30 c29) (dec1 c29 c28) (dec1 c28 c27) (dec1 c27 c26) (dec1 c26 c25)
    (dec1 c25 c24) (dec1 c24 c23) (dec1 c23 c22) (dec1 c22 c21) (dec1 c21 c20)
    (dec1 c20 c19) (dec1 c19 c18) (dec1 c18 c17) (dec1 c17 c16) (dec1 c16 c15)
    (dec1 c15 c14) (dec1 c14 c13) (dec1 c13 c12) (dec1 c12 c11) (dec1 c11 c10)
    (dec1 c10 c09) (dec1 c09 c08) (dec1 c08 c07) (dec1 c07 c06) (dec1 c06 c05)
    (dec1 c05 c04) (dec1 c04 c03) (dec1 c03 c02) (dec1 c02 c01) (dec1 c01 c00)

    (start-ok matthew t120) (start-ok matthew t121) (start-ok matthew t122) (start-ok matthew t123) (start-ok matthew t124)
    (start-ok matthew t125) (start-ok matthew t126) (start-ok matthew t127) (start-ok matthew t128) (start-ok matthew t129)
    (start-ok matthew t130) (start-ok matthew t131) (start-ok matthew t132) (start-ok matthew t133) (start-ok matthew t134)
    (start-ok matthew t135) (start-ok matthew t136) (start-ok matthew t137) (start-ok matthew t138) (start-ok matthew t139)
    (start-ok matthew t140) (start-ok matthew t141) (start-ok matthew t142) (start-ok matthew t143) (start-ok matthew t144)
    (start-ok matthew t145) (start-ok matthew t146) (start-ok matthew t147) (start-ok matthew t148) (start-ok matthew t149)
    (start-ok matthew t150) (start-ok matthew t151) (start-ok matthew t152) (start-ok matthew t153) (start-ok matthew t154)
    (start-ok matthew t155) (start-ok matthew t156) (start-ok matthew t157) (start-ok matthew t158) (start-ok matthew t159)
    (start-ok matthew t160) (start-ok matthew t161) (start-ok matthew t162) (start-ok matthew t163) (start-ok matthew t164)
    (start-ok matthew t165) (start-ok matthew t166) (start-ok matthew t167) (start-ok matthew t168) (start-ok matthew t169)
    (start-ok matthew t170) (start-ok matthew t171) (start-ok matthew t172) (start-ok matthew t173) (start-ok matthew t174)
    (start-ok matthew t175) (start-ok matthew t176) (start-ok matthew t177) (start-ok matthew t178) (start-ok matthew t179)
    (start-ok matthew t180) (start-ok matthew t181) (start-ok matthew t182) (start-ok matthew t183) (start-ok matthew t184)
    (start-ok matthew t185) (start-ok matthew t186) (start-ok matthew t187) (start-ok matthew t188) (start-ok matthew t189)
    (start-ok matthew t190) (start-ok matthew t191) (start-ok matthew t192) (start-ok matthew t193) (start-ok matthew t194)
    (start-ok matthew t195) (start-ok matthew t196) (start-ok matthew t197) (start-ok matthew t198) (start-ok matthew t199)
    (start-ok matthew t200) (start-ok matthew t201) (start-ok matthew t202) (start-ok matthew t203) (start-ok matthew t204)
    (start-ok matthew t205) (start-ok matthew t206) (start-ok matthew t207) (start-ok matthew t208) (start-ok matthew t209)
    (start-ok matthew t210) (start-ok matthew t211) (start-ok matthew t212) (start-ok matthew t213) (start-ok matthew t214)
    (start-ok matthew t215) (start-ok matthew t216) (start-ok matthew t217) (start-ok matthew t218) (start-ok matthew t219)
    (start-ok matthew t220) (start-ok matthew t221) (start-ok matthew t222) (start-ok matthew t223) (start-ok matthew t224)
    (start-ok matthew t225) (start-ok matthew t226) (start-ok matthew t227) (start-ok matthew t228) (start-ok matthew t229)
    (start-ok matthew t230) (start-ok matthew t231) (start-ok matthew t232) (start-ok matthew t233) (start-ok matthew t234)
    (start-ok matthew t235) (start-ok matthew t236) (start-ok matthew t237) (start-ok matthew t238) (start-ok matthew t239)
    (start-ok matthew t240) (start-ok matthew t241) (start-ok matthew t242) (start-ok matthew t243) (start-ok matthew t244)
    (start-ok matthew t245) (start-ok matthew t246) (start-ok matthew t247) (start-ok matthew t248) (start-ok matthew t249)
    (start-ok matthew t250) (start-ok matthew t251) (start-ok matthew t252) (start-ok matthew t253) (start-ok matthew t254)
    (start-ok matthew t255) (start-ok matthew t256) (start-ok matthew t257) (start-ok matthew t258) (start-ok matthew t259)
    (start-ok matthew t260) (start-ok matthew t261) (start-ok matthew t262) (start-ok matthew t263) (start-ok matthew t264)
    (start-ok matthew t265) (start-ok matthew t266) (start-ok matthew t267) (start-ok matthew t268) (start-ok matthew t269)
    (start-ok matthew t270) (start-ok matthew t271) (start-ok matthew t272) (start-ok matthew t273) (start-ok matthew t274)
    (start-ok matthew t275) (start-ok matthew t276) (start-ok matthew t277) (start-ok matthew t278) (start-ok matthew t279)
    (start-ok matthew t280) (start-ok matthew t281) (start-ok matthew t282) (start-ok matthew t283) (start-ok matthew t284)
    (start-ok matthew t285) (start-ok matthew t286) (start-ok matthew t287) (start-ok matthew t288) (start-ok matthew t289)
    (start-ok matthew t290) (start-ok matthew t291) (start-ok matthew t292) (start-ok matthew t293) (start-ok matthew t294)
    (start-ok matthew t295) (start-ok matthew t296) (start-ok matthew t297) (start-ok matthew t298) (start-ok matthew t299)
    (start-ok matthew t300) (start-ok matthew t301) (start-ok matthew t302) (start-ok matthew t303) (start-ok matthew t304)
    (start-ok matthew t305) (start-ok matthew t306) (start-ok matthew t307) (start-ok matthew t308) (start-ok matthew t309)
    (start-ok matthew t310) (start-ok matthew t311) (start-ok matthew t312) (start-ok matthew t313) (start-ok matthew t314)
    (start-ok matthew t315) (start-ok matthew t316) (start-ok matthew t317) (start-ok matthew t318) (start-ok matthew t319)
    (start-ok matthew t320) (start-ok matthew t321) (start-ok matthew t322) (start-ok matthew t323) (start-ok matthew t324)
    (start-ok matthew t325) (start-ok matthew t326) (start-ok matthew t327) (start-ok matthew t328) (start-ok matthew t329)
    (start-ok matthew t330) (start-ok matthew t331) (start-ok matthew t332) (start-ok matthew t333) (start-ok matthew t334)
    (start-ok matthew t335) (start-ok matthew t336) (start-ok matthew t337) (start-ok matthew t338) (start-ok matthew t339)
    (start-ok matthew t340) (start-ok matthew t341) (start-ok matthew t342) (start-ok matthew t343) (start-ok matthew t344)
    (start-ok matthew t345)
  )
  (:goal (and (met matthew)))
  (:metric minimize (total-cost))
)