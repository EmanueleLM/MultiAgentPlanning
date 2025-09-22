(define (problem combined-meeting-problem)
  (:domain combined-meeting)
  (:objects
    visitor kenneth - agent
    fishermans_wharf nob_hill - location
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9
    t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 t44 t45 t46 t47 t48 t49
    t50 t51 t52 t53 t54 t55 t56 t57 t58 t59
    t60 t61 t62 t63 t64 t65 t66 t67 t68 t69
    t70 t71 t72 t73 t74 t75 t76 t77 t78 t79
    t80 t81 t82 t83 t84 t85 t86 t87 t88 t89
    t90 t91 t92 t93 t94 t95 t96 t97 t98 t99
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
    ;; starting locations at time 0 (t0 corresponds to 9:00 AM)
    (at visitor fishermans_wharf t0)
    (at kenneth fishermans_wharf t0)

    ;; road connectivity
    (road fishermans_wharf nob_hill)
    (road nob_hill fishermans_wharf)

    ;; successor (minute-by-minute) chain t0..t645
    (succ1 t0 t1) (succ1 t1 t2) (succ1 t2 t3) (succ1 t3 t4) (succ1 t4 t5)
    (succ1 t5 t6) (succ1 t6 t7) (succ1 t7 t8) (succ1 t8 t9) (succ1 t9 t10)
    (succ1 t10 t11) (succ1 t11 t12) (succ1 t12 t13) (succ1 t13 t14) (succ1 t14 t15)
    (succ1 t15 t16) (succ1 t16 t17) (succ1 t17 t18) (succ1 t18 t19) (succ1 t19 t20)
    (succ1 t20 t21) (succ1 t21 t22) (succ1 t22 t23) (succ1 t23 t24) (succ1 t24 t25)
    (succ1 t25 t26) (succ1 t26 t27) (succ1 t27 t28) (succ1 t28 t29) (succ1 t29 t30)
    (succ1 t30 t31) (succ1 t31 t32) (succ1 t32 t33) (succ1 t33 t34) (succ1 t34 t35)
    (succ1 t35 t36) (succ1 t36 t37) (succ1 t37 t38) (succ1 t38 t39) (succ1 t39 t40)
    (succ1 t40 t41) (succ1 t41 t42) (succ1 t42 t43) (succ1 t43 t44) (succ1 t44 t45)
    (succ1 t45 t46) (succ1 t46 t47) (succ1 t47 t48) (succ1 t48 t49) (succ1 t49 t50)
    (succ1 t50 t51) (succ1 t51 t52) (succ1 t52 t53) (succ1 t53 t54) (succ1 t54 t55)
    (succ1 t55 t56) (succ1 t56 t57) (succ1 t57 t58) (succ1 t58 t59) (succ1 t59 t60)
    (succ1 t60 t61) (succ1 t61 t62) (succ1 t62 t63) (succ1 t63 t64) (succ1 t64 t65)
    (succ1 t65 t66) (succ1 t66 t67) (succ1 t67 t68) (succ1 t68 t69) (succ1 t69 t70)
    (succ1 t70 t71) (succ1 t71 t72) (succ1 t72 t73) (succ1 t73 t74) (succ1 t74 t75)
    (succ1 t75 t76) (succ1 t76 t77) (succ1 t77 t78) (succ1 t78 t79) (succ1 t79 t80)
    (succ1 t80 t81) (succ1 t81 t82) (succ1 t82 t83) (succ1 t83 t84) (succ1 t84 t85)
    (succ1 t85 t86) (succ1 t86 t87) (succ1 t87 t88) (succ1 t88 t89) (succ1 t89 t90)
    (succ1 t90 t91) (succ1 t91 t92) (succ1 t92 t93) (succ1 t93 t94) (succ1 t94 t95)
    (succ1 t95 t96) (succ1 t96 t97) (succ1 t97 t98) (succ1 t98 t99) (succ1 t99 t100)
    (succ1 t100 t101) (succ1 t101 t102) (succ1 t102 t103) (succ1 t103 t104) (succ1 t104 t105)
    (succ1 t105 t106) (succ1 t106 t107) (succ1 t107 t108) (succ1 t108 t109) (succ1 t109 t110)
    (succ1 t110 t111) (succ1 t111 t112) (succ1 t112 t113) (succ1 t113 t114) (succ1 t114 t115)
    (succ1 t115 t116) (succ1 t116 t117) (succ1 t117 t118) (succ1 t118 t119) (succ1 t119 t120)
    (succ1 t120 t121) (succ1 t121 t122) (succ1 t122 t123) (succ1 t123 t124) (succ1 t124 t125)
    (succ1 t125 t126) (succ1 t126 t127) (succ1 t127 t128) (succ1 t128 t129) (succ1 t129 t130)
    (succ1 t130 t131) (succ1 t131 t132) (succ1 t132 t133) (succ1 t133 t134) (succ1 t134 t135)
    (succ1 t135 t136) (succ1 t136 t137) (succ1 t137 t138) (succ1 t138 t139) (succ1 t139 t140)
    (succ1 t140 t141) (succ1 t141 t142) (succ1 t142 t143) (succ1 t143 t144) (succ1 t144 t145)
    (succ1 t145 t146) (succ1 t146 t147) (succ1 t147 t148) (succ1 t148 t149) (succ1 t149 t150)
    (succ1 t150 t151) (succ1 t151 t152) (succ1 t152 t153) (succ1 t153 t154) (succ1 t154 t155)
    (succ1 t155 t156) (succ1 t156 t157) (succ1 t157 t158) (succ1 t158 t159) (succ1 t159 t160)
    (succ1 t160 t161) (succ1 t161 t162) (succ1 t162 t163) (succ1 t163 t164) (succ1 t164 t165)
    (succ1 t165 t166) (succ1 t166 t167) (succ1 t167 t168) (succ1 t168 t169) (succ1 t169 t170)
    (succ1 t170 t171) (succ1 t171 t172) (succ1 t172 t173) (succ1 t173 t174) (succ1 t174 t175)
    (succ1 t175 t176) (succ1 t176 t177) (succ1 t177 t178) (succ1 t178 t179) (succ1 t179 t180)
    (succ1 t180 t181) (succ1 t181 t182) (succ1 t182 t183) (succ1 t183 t184) (succ1 t184 t185)
    (succ1 t185 t186) (succ1 t186 t187) (succ1 t187 t188) (succ1 t188 t189) (succ1 t189 t190)
    (succ1 t190 t191) (succ1 t191 t192) (succ1 t192 t193) (succ1 t193 t194) (succ1 t194 t195)
    (succ1 t195 t196) (succ1 t196 t197) (succ1 t197 t198) (succ1 t198 t199) (succ1 t199 t200)
    (succ1 t200 t201) (succ1 t201 t202) (succ1 t202 t203) (succ1 t203 t204) (succ1 t204 t205)
    (succ1 t205 t206) (succ1 t206 t207) (succ1 t207 t208) (succ1 t208 t209) (succ1 t209 t210)
    (succ1 t210 t211) (succ1 t211 t212) (succ1 t212 t213) (succ1 t213 t214) (succ1 t214 t215)
    (succ1 t215 t216) (succ1 t216 t217) (succ1 t217 t218) (succ1 t218 t219) (succ1 t219 t220)
    (succ1 t220 t221) (succ1 t221 t222) (succ1 t222 t223) (succ1 t223 t224) (succ1 t224 t225)
    (succ1 t225 t226) (succ1 t226 t227) (succ1 t227 t228) (succ1 t228 t229) (succ1 t229 t230)
    (succ1 t230 t231) (succ1 t231 t232) (succ1 t232 t233) (succ1 t233 t234) (succ1 t234 t235)
    (succ1 t235 t236) (succ1 t236 t237) (succ1 t237 t238) (succ1 t238 t239) (succ1 t239 t240)
    (succ1 t240 t241) (succ1 t241 t242) (succ1 t242 t243) (succ1 t243 t244) (succ1 t244 t245)
    (succ1 t245 t246) (succ1 t246 t247) (succ1 t247 t248) (succ1 t248 t249) (succ1 t249 t250)
    (succ1 t250 t251) (succ1 t251 t252) (succ1 t252 t253) (succ1 t253 t254) (succ1 t254 t255)
    (succ1 t255 t256) (succ1 t256 t257) (succ1 t257 t258) (succ1 t258 t259) (succ1 t259 t260)
    (succ1 t260 t261) (succ1 t261 t262) (succ1 t262 t263) (succ1 t263 t264) (succ1 t264 t265)
    (succ1 t265 t266) (succ1 t266 t267) (succ1 t267 t268) (succ1 t268 t269) (succ1 t269 t270)
    (succ1 t270 t271) (succ1 t271 t272) (succ1 t272 t273) (succ1 t273 t274) (succ1 t274 t275)
    (succ1 t275 t276) (succ1 t276 t277) (succ1 t277 t278) (succ1 t278 t279) (succ1 t279 t280)
    (succ1 t280 t281) (succ1 t281 t282) (succ1 t282 t283) (succ1 t283 t284) (succ1 t284 t285)
    (succ1 t285 t286) (succ1 t286 t287) (succ1 t287 t288) (succ1 t288 t289) (succ1 t289 t290)
    (succ1 t290 t291) (succ1 t291 t292) (succ1 t292 t293) (succ1 t293 t294) (succ1 t294 t295)
    (succ1 t295 t296) (succ1 t296 t297) (succ1 t297 t298) (succ1 t298 t299) (succ1 t299 t300)
    (succ1 t300 t301) (succ1 t301 t302) (succ1 t302 t303) (succ1 t303 t304) (succ1 t304 t305)
    (succ1 t305 t306) (succ1 t306 t307) (succ1 t307 t308) (succ1 t308 t309) (succ1 t309 t310)
    (succ1 t310 t311) (succ1 t311 t312) (succ1 t312 t313) (succ1 t313 t314) (succ1 t314 t315)
    (succ1 t315 t316) (succ1 t316 t317) (succ1 t317 t318) (succ1 t318 t319) (succ1 t319 t320)
    (succ1 t320 t321) (succ1 t321 t322) (succ1 t322 t323) (succ1 t323 t324) (succ1 t324 t325)
    (succ1 t325 t326) (succ1 t326 t327) (succ1 t327 t328) (succ1 t328 t329) (succ1 t329 t330)
    (succ1 t330 t331) (succ1 t331 t332) (succ1 t332 t333) (succ1 t333 t334) (succ1 t334 t335)
    (succ1 t335 t336) (succ1 t336 t337) (succ1 t337 t338) (succ1 t338 t339) (succ1 t339 t340)
    (succ1 t340 t341) (succ1 t341 t342) (succ1 t342 t343) (succ1 t343 t344) (succ1 t344 t345)
    (succ1 t345 t346) (succ1 t346 t347) (succ1 t347 t348) (succ1 t348 t349) (succ1 t349 t350)
    (succ1 t350 t351) (succ1 t351 t352) (succ1 t352 t353) (succ1 t353 t354) (succ1 t354 t355)
    (succ1 t355 t356) (succ1 t356 t357) (succ1 t357 t358) (succ1 t358 t359) (succ1 t359 t360)
    (succ1 t360 t361) (succ1 t361 t362) (succ1 t362 t363) (succ1 t363 t364) (succ1 t364 t365)
    (succ1 t365 t366) (succ1 t366 t367) (succ1 t367 t368) (succ1 t368 t369) (succ1 t369 t370)
    (succ1 t370 t371) (succ1 t371 t372) (succ1 t372 t373) (succ1 t373 t374) (succ1 t374 t375)
    (succ1 t375 t376) (succ1 t376 t377) (succ1 t377 t378) (succ1 t378 t379) (succ1 t379 t380)
    (succ1 t380 t381) (succ1 t381 t382) (succ1 t382 t383) (succ1 t383 t384) (succ1 t384 t385)
    (succ1 t385 t386) (succ1 t386 t387) (succ1 t387 t388) (succ1 t388 t389) (succ1 t389 t390)
    (succ1 t390 t391) (succ1 t391 t392) (succ1 t392 t393) (succ1 t393 t394) (succ1 t394 t395)
    (succ1 t395 t396) (succ1 t396 t397) (succ1 t397 t398) (succ1 t398 t399) (succ1 t399 t400)
    (succ1 t400 t401) (succ1 t401 t402) (succ1 t402 t403) (succ1 t403 t404) (succ1 t404 t405)
    (succ1 t405 t406) (succ1 t406 t407) (succ1 t407 t408) (succ1 t408 t409) (succ1 t409 t410)
    (succ1 t410 t411) (succ1 t411 t412) (succ1 t412 t413) (succ1 t413 t414) (succ1 t414 t415)
    (succ1 t415 t416) (succ1 t416 t417) (succ1 t417 t418) (succ1 t418 t419) (succ1 t419 t420)
    (succ1 t420 t421) (succ1 t421 t422) (succ1 t422 t423) (succ1 t423 t424) (succ1 t424 t425)
    (succ1 t425 t426) (succ1 t426 t427) (succ1 t427 t428) (succ1 t428 t429) (succ1 t429 t430)
    (succ1 t430 t431) (succ1 t431 t432) (succ1 t432 t433) (succ1 t433 t434) (succ1 t434 t435)
    (succ1 t435 t436) (succ1 t436 t437) (succ1 t437 t438) (succ1 t438 t439) (succ1 t439 t440)
    (succ1 t440 t441) (succ1 t441 t442) (succ1 t442 t443) (succ1 t443 t444) (succ1 t444 t445)
    (succ1 t445 t446) (succ1 t446 t447) (succ1 t447 t448) (succ1 t448 t449) (succ1 t449 t450)
    (succ1 t450 t451) (succ1 t451 t452) (succ1 t452 t453) (succ1 t453 t454) (succ1 t454 t455)
    (succ1 t455 t456) (succ1 t456 t457) (succ1 t457 t458) (succ1 t458 t459) (succ1 t459 t460)
    (succ1 t460 t461) (succ1 t461 t462) (succ1 t462 t463) (succ1 t463 t464) (succ1 t464 t465)
    (succ1 t465 t466) (succ1 t466 t467) (succ1 t467 t468) (succ1 t468 t469) (succ1 t469 t470)
    (succ1 t470 t471) (succ1 t471 t472) (succ1 t472 t473) (succ1 t473 t474) (succ1 t474 t475)
    (succ1 t475 t476) (succ1 t476 t477) (succ1 t477 t478) (succ1 t478 t479) (succ1 t479 t480)
    (succ1 t480 t481) (succ1 t481 t482) (succ1 t482 t483) (succ1 t483 t484) (succ1 t484 t485)
    (succ1 t485 t486) (succ1 t486 t487) (succ1 t487 t488) (succ1 t488 t489) (succ1 t489 t490)
    (succ1 t490 t491) (succ1 t491 t492) (succ1 t492 t493) (succ1 t493 t494) (succ1 t494 t495)
    (succ1 t495 t496) (succ1 t496 t497) (succ1 t497 t498) (succ1 t498 t499) (succ1 t499 t500)
    (succ1 t500 t501) (succ1 t501 t502) (succ1 t502 t503) (succ1 t503 t504) (succ1 t504 t505)
    (succ1 t505 t506) (succ1 t506 t507) (succ1 t507 t508) (succ1 t508 t509) (succ1 t509 t510)
    (succ1 t510 t511) (succ1 t511 t512) (succ1 t512 t513) (succ1 t513 t514) (succ1 t514 t515)
    (succ1 t515 t516) (succ1 t516 t517) (succ1 t517 t518) (succ1 t518 t519) (succ1 t519 t520)
    (succ1 t520 t521) (succ1 t521 t522) (succ1 t522 t523) (succ1 t523 t524) (succ1 t524 t525)
    (succ1 t525 t526) (succ1 t526 t527) (succ1 t527 t528) (succ1 t528 t529) (succ1 t529 t530)
    (succ1 t530 t531) (succ1 t531 t532) (succ1 t532 t533) (succ1 t533 t534) (succ1 t534 t535)
    (succ1 t535 t536) (succ1 t536 t537) (succ1 t537 t538) (succ1 t538 t539) (succ1 t539 t540)
    (succ1 t540 t541) (succ1 t541 t542) (succ1 t542 t543) (succ1 t543 t544) (succ1 t544 t545)
    (succ1 t545 t546) (succ1 t546 t547) (succ1 t547 t548) (succ1 t548 t549) (succ1 t549 t550)
    (succ1 t550 t551) (succ1 t551 t552) (succ1 t552 t553) (succ1 t553 t554) (succ1 t554 t555)
    (succ1 t555 t556) (succ1 t556 t557) (succ1 t557 t558) (succ1 t558 t559) (succ1 t559 t560)
    (succ1 t560 t561) (succ1 t561 t562) (succ1 t562 t563) (succ1 t563 t564) (succ1 t564 t565)
    (succ1 t565 t566) (succ1 t566 t567) (succ1 t567 t568) (succ1 t568 t569) (succ1 t569 t570)
    (succ1 t570 t571) (succ1 t571 t572) (succ1 t572 t573) (succ1 t573 t574) (succ1 t574 t575)
    (succ1 t575 t576) (succ1 t576 t577) (succ1 t577 t578) (succ1 t578 t579) (succ1 t579 t580)
    (succ1 t580 t581) (succ1 t581 t582) (succ1 t582 t583) (succ1 t583 t584) (succ1 t584 t585)
    (succ1 t585 t586) (succ1 t586 t587) (succ1 t587 t588) (succ1 t588 t589) (succ1 t589 t590)
    (succ1 t590 t591) (succ1 t591 t592) (succ1 t592 t593) (succ1 t593 t594) (succ1 t594 t595)
    (succ1 t595 t596) (succ1 t596 t597) (succ1 t597 t598) (succ1 t598 t599) (succ1 t599 t600)
    (succ1 t600 t601) (succ1 t601 t602) (succ1 t602 t603) (succ1 t603 t604) (succ1 t604 t605)
    (succ1 t605 t606) (succ1 t606 t607) (succ1 t607 t608) (succ1 t608 t609) (succ1 t609 t610)
    (succ1 t610 t611) (succ1 t611 t612) (succ1 t612 t613) (succ1 t613 t614) (succ1 t614 t615)
    (succ1 t615 t616) (succ1 t616 t617) (succ1 t617 t618) (succ1 t618 t619) (succ1 t619 t620)
    (succ1 t620 t621) (succ1 t621 t622) (succ1 t622 t623) (succ1 t623 t624) (succ1 t624 t625)
    (succ1 t625 t626) (succ1 t626 t627) (succ1 t627 t628) (succ1 t628 t629) (succ1 t629 t630)
    (succ1 t630 t631) (succ1 t631 t632) (succ1 t632 t633) (succ1 t633 t634) (succ1 t634 t635)
    (succ1 t635 t636) (succ1 t636 t637) (succ1 t637 t638) (succ1 t638 t639) (succ1 t639 t640)
    (succ1 t640 t641) (succ1 t641 t642) (succ1 t642 t643) (succ1 t643 t644) (succ1 t644 t645)

    ;; succ11 links for travel (t -> t+11) precomputed
    (succ11 t0 t11) (succ11 t1 t12) (succ11 t2 t13) (succ11 t3 t14) (succ11 t4 t15)
    (succ11 t5 t16) (succ11 t6 t17) (succ11 t7 t18) (succ11 t8 t19) (succ11 t9 t20)
    (succ11 t10 t21) (succ11 t11 t22) (succ11 t12 t23) (succ11 t13 t24) (succ11 t14 t25)
    (succ11 t15 t26) (succ11 t16 t27) (succ11 t17 t28) (succ11 t18 t29) (succ11 t19 t30)
    (succ11 t20 t31) (succ11 t21 t32) (succ11 t22 t33) (succ11 t23 t34) (succ11 t24 t35)
    (succ11 t25 t36) (succ11 t26 t37) (succ11 t27 t38) (succ11 t28 t39) (succ11 t29 t40)
    (succ11 t30 t41) (succ11 t31 t42) (succ11 t32 t43) (succ11 t33 t44) (succ11 t34 t45)
    (succ11 t35 t46) (succ11 t36 t47) (succ11 t37 t48) (succ11 t38 t49) (succ11 t39 t50)
    (succ11 t40 t51) (succ11 t41 t52) (succ11 t42 t53) (succ11 t43 t54) (succ11 t44 t55)
    (succ11 t45 t56) (succ11 t46 t57) (succ11 t47 t58) (succ11 t48 t59) (succ11 t49 t60)
    (succ11 t50 t61) (succ11 t51 t62) (succ11 t52 t63) (succ11 t53 t64) (succ11 t54 t65)
    (succ11 t55 t66) (succ11 t56 t67) (succ11 t57 t68) (succ11 t58 t69) (succ11 t59 t70)
    (succ11 t60 t71) (succ11 t61 t72) (succ11 t62 t73) (succ11 t63 t74) (succ11 t64 t75)
    (succ11 t65 t76) (succ11 t66 t77) (succ11 t67 t78) (succ11 t68 t79) (succ11 t69 t80)
    (succ11 t70 t81) (succ11 t71 t82) (succ11 t72 t83) (succ11 t73 t84) (succ11 t74 t85)
    (succ11 t75 t86) (succ11 t76 t87) (succ11 t77 t88) (succ11 t78 t89) (succ11 t79 t90)
    (succ11 t80 t91) (succ11 t81 t92) (succ11 t82 t93) (succ11 t83 t94) (succ11 t84 t95)
    (succ11 t85 t96) (succ11 t86 t97) (succ11 t87 t98) (succ11 t88 t99) (succ11 t89 t100)
    (succ11 t90 t101) (succ11 t91 t102) (succ11 t92 t103) (succ11 t93 t104) (succ11 t94 t105)
    (succ11 t95 t106) (succ11 t96 t107) (succ11 t97 t108) (succ11 t98 t109) (succ11 t99 t110)
    (succ11 t100 t111) (succ11 t101 t112) (succ11 t102 t113) (succ11 t103 t114) (succ11 t104 t115)
    (succ11 t105 t116) (succ11 t106 t117) (succ11 t107 t118) (succ11 t108 t119) (succ11 t109 t120)
    (succ11 t110 t121) (succ11 t111 t122) (succ11 t112 t123) (succ11 t113 t124) (succ11 t114 t125)
    (succ11 t115 t126) (succ11 t116 t127) (succ11 t117 t128) (succ11 t118 t129) (succ11 t119 t130)
    (succ11 t120 t131) (succ11 t121 t132) (succ11 t122 t133) (succ11 t123 t134) (succ11 t124 t135)
    (succ11 t125 t136) (succ11 t126 t137) (succ11 t127 t138) (succ11 t128 t139) (succ11 t129 t140)
    (succ11 t130 t141) (succ11 t131 t142) (succ11 t132 t143) (succ11 t133 t144) (succ11 t134 t145)
    (succ11 t135 t146) (succ11 t136 t147) (succ11 t137 t148) (succ11 t138 t149) (succ11 t139 t150)
    (succ11 t140 t151) (succ11 t141 t152) (succ11 t142 t153) (succ11 t143 t154) (succ11 t144 t155)
    (succ11 t145 t156) (succ11 t146 t157) (succ11 t147 t158) (succ11 t148 t159) (succ11 t149 t160)
    (succ11 t150 t161) (succ11 t151 t162) (succ11 t152 t163) (succ11 t153 t164) (succ11 t154 t165)
    (succ11 t155 t166) (succ11 t156 t167) (succ11 t157 t168) (succ11 t158 t169) (succ11 t159 t170)
    (succ11 t160 t171) (succ11 t161 t172) (succ11 t162 t173) (succ11 t163 t174) (succ11 t164 t175)
    (succ11 t165 t176) (succ11 t166 t177) (succ11 t167 t178) (succ11 t168 t179) (succ11 t169 t180)
    (succ11 t170 t181) (succ11 t171 t182) (succ11 t172 t183) (succ11 t173 t184) (succ11 t174 t185)
    (succ11 t175 t186) (succ11 t176 t187) (succ11 t177 t188) (succ11 t178 t189) (succ11 t179 t190)
    (succ11 t180 t191) (succ11 t181 t192) (succ11 t182 t193) (succ11 t183 t194) (succ11 t184 t195)
    (succ11 t185 t196) (succ11 t186 t197) (succ11 t187 t198) (succ11 t188 t199) (succ11 t189 t200)
    (succ11 t190 t201) (succ11 t191 t202) (succ11 t192 t203) (succ11 t193 t204) (succ11 t194 t205)
    (succ11 t195 t206) (succ11 t196 t207) (succ11 t197 t208) (succ11 t198 t209) (succ11 t199 t210)
    (succ11 t200 t211) (succ11 t201 t212) (succ11 t202 t213) (succ11 t203 t214) (succ11 t204 t215)
    (succ11 t205 t216) (succ11 t206 t217) (succ11 t207 t218) (succ11 t208 t219) (succ11 t209 t220)
    (succ11 t210 t221) (succ11 t211 t222) (succ11 t212 t223) (succ11 t213 t224) (succ11 t214 t225)
    (succ11 t215 t226) (succ11 t216 t227) (succ11 t217 t228) (succ11 t218 t229) (succ11 t219 t230)
    (succ11 t220 t231) (succ11 t221 t232) (succ11 t222 t233) (succ11 t223 t234) (succ11 t224 t235)
    (succ11 t225 t236) (succ11 t226 t237) (succ11 t227 t238) (succ11 t228 t239) (succ11 t229 t240)
    (succ11 t230 t241) (succ11 t231 t242) (succ11 t232 t243) (succ11 t233 t244) (succ11 t234 t245)
    (succ11 t235 t246) (succ11 t236 t247) (succ11 t237 t248) (succ11 t238 t249) (succ11 t239 t250)
    (succ11 t240 t251) (succ11 t241 t252) (succ11 t242 t253) (succ11 t243 t254) (succ11 t244 t255)
    (succ11 t245 t256) (succ11 t246 t257) (succ11 t247 t258) (succ11 t248 t259) (succ11 t249 t260)
    (succ11 t250 t261) (succ11 t251 t262) (succ11 t252 t263) (succ11 t253 t264) (succ11 t254 t265)
    (succ11 t255 t266) (succ11 t256 t267) (succ11 t257 t268) (succ11 t258 t269) (succ11 t259 t270)
    (succ11 t260 t271) (succ11 t261 t272) (succ11 t262 t273) (succ11 t263 t274) (succ11 t264 t275)
    (succ11 t265 t276) (succ11 t266 t277) (succ11 t267 t278) (succ11 t268 t279) (succ11 t269 t280)
    (succ11 t270 t281) (succ11 t271 t282) (succ11 t272 t283) (succ11 t273 t284) (succ11 t274 t285)
    (succ11 t275 t286) (succ11 t276 t287) (succ11 t277 t288) (succ11 t278 t289) (succ11 t279 t290)
    (succ11 t280 t291) (succ11 t281 t292) (succ11 t282 t293) (succ11 t283 t294) (succ11 t284 t295)
    (succ11 t285 t296) (succ11 t286 t297) (succ11 t287 t298) (succ11 t288 t299) (succ11 t289 t300)
    (succ11 t290 t301) (succ11 t291 t302) (succ11 t292 t303) (succ11 t293 t304) (succ11 t294 t305)
    (succ11 t295 t306) (succ11 t296 t307) (succ11 t297 t308) (succ11 t298 t309) (succ11 t299 t310)
    (succ11 t300 t311) (succ11 t301 t312) (succ11 t302 t313) (succ11 t303 t314) (succ11 t304 t315)
    (succ11 t305 t316) (succ11 t306 t317) (succ11 t307 t318) (succ11 t308 t319) (succ11 t309 t320)
    (succ11 t310 t321) (succ11 t311 t322) (succ11 t312 t323) (succ11 t313 t324) (succ11 t314 t325)
    (succ11 t315 t326) (succ11 t316 t327) (succ11 t317 t328) (succ11 t318 t329) (succ11 t319 t330)
    (succ11 t320 t331) (succ11 t321 t332) (succ11 t322 t333) (succ11 t323 t334) (succ11 t324 t335)
    (succ11 t325 t336) (succ11 t326 t337) (succ11 t327 t338) (succ11 t328 t339) (succ11 t329 t340)
    (succ11 t330 t341) (succ11 t331 t342) (succ11 t332 t343) (succ11 t333 t344) (succ11 t334 t345)
    (succ11 t335 t346) (succ11 t336 t347) (succ11 t337 t348) (succ11 t338 t349) (succ11 t339 t350)
    (succ11 t340 t351) (succ11 t341 t352) (succ11 t342 t353) (succ11 t343 t354) (succ11 t344 t355)
    (succ11 t345 t356) (succ11 t346 t357) (succ11 t347 t358) (succ11 t348 t359) (succ11 t349 t360)
    (succ11 t350 t361) (succ11 t351 t362) (succ11 t352 t363) (succ11 t353 t364) (succ11 t354 t365)
    (succ11 t355 t366) (succ11 t356 t367) (succ11 t357 t368) (succ11 t358 t369) (succ11 t359 t370)
    (succ11 t360 t371) (succ11 t361 t372) (succ11 t362 t373) (succ11 t363 t374) (succ11 t364 t375)
    (succ11 t365 t376) (succ11 t366 t377) (succ11 t367 t378) (succ11 t368 t379) (succ11 t369 t380)
    (succ11 t370 t381) (succ11 t371 t382) (succ11 t372 t383) (succ11 t373 t384) (succ11 t374 t385)
    (succ11 t375 t386) (succ11 t376 t387) (succ11 t377 t388) (succ11 t378 t389) (succ11 t379 t390)
    (succ11 t380 t391) (succ11 t381 t392) (succ11 t382 t393) (succ11 t383 t394) (succ11 t384 t395)
    (succ11 t385 t396) (succ11 t386 t397) (succ11 t387 t398) (succ11 t388 t399) (succ11 t389 t400)
    (succ11 t390 t401) (succ11 t391 t402) (succ11 t392 t403) (succ11 t393 t404) (succ11 t394 t405)
    (succ11 t395 t406) (succ11 t396 t407) (succ11 t397 t408) (succ11 t398 t409) (succ11 t399 t410)
    (succ11 t400 t411) (succ11 t401 t412) (succ11 t402 t413) (succ11 t403 t414) (succ11 t404 t415)
    (succ11 t405 t416) (succ11 t406 t417) (succ11 t407 t418) (succ11 t408 t419) (succ11 t409 t420)
    (succ11 t410 t421) (succ11 t411 t422) (succ11 t412 t423) (succ11 t413 t424) (succ11 t414 t425)
    (succ11 t415 t426) (succ11 t416 t427) (succ11 t417 t428) (succ11 t418 t429) (succ11 t419 t430)
    (succ11 t420 t431) (succ11 t421 t432) (succ11 t422 t433) (succ11 t423 t434) (succ11 t424 t435)
    (succ11 t425 t436) (succ11 t426 t437) (succ11 t427 t438) (succ11 t428 t439) (succ11 t429 t440)
    (succ11 t430 t441) (succ11 t431 t442) (succ11 t432 t443) (succ11 t433 t444) (succ11 t434 t445)
    (succ11 t435 t446) (succ11 t436 t447) (succ11 t437 t448) (succ11 t438 t449) (succ11 t439 t450)
    (succ11 t440 t451) (succ11 t441 t452) (succ11 t442 t453) (succ11 t443 t454) (succ11 t444 t455)
    (succ11 t445 t456) (succ11 t446 t457) (succ11 t447 t458) (succ11 t448 t459) (succ11 t449 t460)
    (succ11 t450 t461) (succ11 t451 t462) (succ11 t452 t463) (succ11 t453 t464) (succ11 t454 t465)
    (succ11 t455 t466) (succ11 t456 t467) (succ11 t457 t468) (succ11 t458 t469) (succ11 t459 t470)
    (succ11 t460 t471) (succ11 t461 t472) (succ11 t462 t473) (succ11 t463 t474) (succ11 t464 t475)
    (succ11 t465 t476) (succ11 t466 t477) (succ11 t467 t478) (succ11 t468 t479) (succ11 t469 t480)
    (succ11 t470 t481) (succ11 t471 t482) (succ11 t472 t483) (succ11 t473 t484) (succ11 t474 t485)
    (succ11 t475 t486) (succ11 t476 t487) (succ11 t477 t488) (succ11 t478 t489) (succ11 t479 t490)
    (succ11 t480 t491) (succ11 t481 t492) (succ11 t482 t493) (succ11 t483 t494) (succ11 t484 t495)
    (succ11 t485 t496) (succ11 t486 t497) (succ11 t487 t498) (succ11 t488 t499) (succ11 t489 t500)
    (succ11 t490 t501) (succ11 t491 t502) (succ11 t492 t503) (succ11 t493 t504) (succ11 t494 t505)
    (succ11 t495 t506) (succ11 t496 t507) (succ11 t497 t508) (succ11 t498 t509) (succ11 t499 t510)
    (succ11 t500 t511) (succ11 t501 t512) (succ11 t502 t513) (succ11 t503 t514) (succ11 t504 t515)
    (succ11 t505 t516) (succ11 t506 t517) (succ11 t507 t518) (succ11 t508 t519) (succ11 t509 t520)
    (succ11 t510 t521) (succ11 t511 t522) (succ11 t512 t523) (succ11 t513 t524) (succ11 t514 t525)
    (succ11 t515 t526) (succ11 t516 t527) (succ11 t517 t528) (succ11 t518 t529) (succ11 t519 t530)
    (succ11 t520 t531) (succ11 t521 t532) (succ11 t522 t533) (succ11 t523 t534) (succ11 t524 t535)
    (succ11 t525 t536) (succ11 t526 t537) (succ11 t527 t538) (succ11 t528 t539) (succ11 t529 t540)
    (succ11 t530 t541) (succ11 t531 t542) (succ11 t532 t543) (succ11 t533 t544) (succ11 t534 t545)
    (succ11 t535 t546) (succ11 t536 t547) (succ11 t537 t548) (succ11 t538 t549) (succ11 t539 t550)
    (succ11 t540 t551) (succ11 t541 t552) (succ11 t542 t553) (succ11 t543 t554) (succ11 t544 t555)
    (succ11 t545 t556) (succ11 t546 t557) (succ11 t547 t558) (succ11 t548 t559) (succ11 t549 t560)
    (succ11 t550 t561) (succ11 t551 t562) (succ11 t552 t563) (succ11 t553 t564) (succ11 t554 t565)
    (succ11 t555 t566) (succ11 t556 t567) (succ11 t557 t568) (succ11 t558 t569) (succ11 t559 t570)
    (succ11 t560 t571) (succ11 t561 t572) (succ11 t562 t573) (succ11 t563 t574) (succ11 t564 t575)
    (succ11 t565 t576) (succ11 t566 t577) (succ11 t567 t578) (succ11 t568 t579) (succ11 t569 t580)
    (succ11 t570 t581) (succ11 t571 t582) (succ11 t572 t583) (succ11 t573 t584) (succ11 t574 t585)
    (succ11 t575 t586) (succ11 t576 t587) (succ11 t577 t588) (succ11 t578 t589) (succ11 t579 t590)
    (succ11 t580 t591) (succ11 t581 t592) (succ11 t582 t593) (succ11 t583 t594) (succ11 t584 t595)
    (succ11 t585 t596) (succ11 t586 t597) (succ11 t587 t598) (succ11 t588 t599) (succ11 t589 t600)
    (succ11 t590 t601) (succ11 t591 t602) (succ11 t592 t603) (succ11 t593 t604) (succ11 t594 t605)
    (succ11 t595 t606) (succ11 t596 t607) (succ11 t597 t608) (succ11 t598 t609) (succ11 t599 t610)
    (succ11 t600 t611) (succ11 t601 t612) (succ11 t602 t613) (succ11 t603 t614) (succ11 t604 t615)
    (succ11 t605 t616) (succ11 t606 t617) (succ11 t607 t618) (succ11 t608 t619) (succ11 t609 t620)
    (succ11 t610 t621) (succ11 t611 t622) (succ11 t612 t623) (succ11 t613 t624) (succ11 t614 t625)
    (succ11 t615 t626) (succ11 t616 t627) (succ11 t617 t628) (succ11 t618 t629) (succ11 t619 t630)
    (succ11 t620 t631) (succ11 t621 t632) (succ11 t622 t633) (succ11 t623 t634) (succ11 t624 t635)
    (succ11 t625 t636) (succ11 t626 t637) (succ11 t627 t638) (succ11 t628 t639) (succ11 t629 t640)
    (succ11 t630 t641) (succ11 t631 t642) (succ11 t632 t643) (succ11 t633 t644) (succ11 t634 t645)

    ;; allowed meeting start times (minutes since 9:00 AM). Kenneth is available 14:15(=315) to 19:45(=645).
    ;; meeting must start between 315 and 555 inclusive (so it ends by 645).
    (start_allowed t315) (start_allowed t316) (start_allowed t317) (start_allowed t318) (start_allowed t319)
    (start_allowed t320) (start_allowed t321) (start_allowed t322) (start_allowed t323) (start_allowed t324)
    (start_allowed t325) (start_allowed t326) (start_allowed t327) (start_allowed t328) (start_allowed t329)
    (start_allowed t330) (start_allowed t331) (start_allowed t332) (start_allowed t333) (start_allowed t334)
    (start_allowed t335) (start_allowed t336) (start_allowed t337) (start_allowed t338) (start_allowed t339)
    (start_allowed t340) (start_allowed t341) (start_allowed t342) (start_allowed t343) (start_allowed t344)
    (start_allowed t345) (start_allowed t346) (start_allowed t347) (start_allowed t348) (start_allowed t349)
    (start_allowed t350) (start_allowed t351) (start_allowed t352) (start_allowed t353) (start_allowed t354)
    (start_allowed t355) (start_allowed t356) (start_allowed t357) (start_allowed t358) (start_allowed t359)
    (start_allowed t360) (start_allowed t361) (start_allowed t362) (start_allowed t363) (start_allowed t364)
    (start_allowed t365) (start_allowed t366) (start_allowed t367) (start_allowed t368) (start_allowed t369)
    (start_allowed t370) (start_allowed t371) (start_allowed t372) (start_allowed t373) (start_allowed t374)
    (start_allowed t375) (start_allowed t376) (start_allowed t377) (start_allowed t378) (start_allowed t379)
    (start_allowed t380) (start_allowed t381) (start_allowed t382) (start_allowed t383) (start_allowed t384)
    (start_allowed t385) (start_allowed t386) (start_allowed t387) (start_allowed t388) (start_allowed t389)
    (start_allowed t390) (start_allowed t391) (start_allowed t392) (start_allowed t393) (start_allowed t394)
    (start_allowed t395) (start_allowed t396) (start_allowed t397) (start_allowed t398) (start_allowed t399)
    (start_allowed t400) (start_allowed t401) (start_allowed t402) (start_allowed t403) (start_allowed t404)
    (start_allowed t405) (start_allowed t406) (start_allowed t407) (start_allowed t408) (start_allowed t409)
    (start_allowed t410) (start_allowed t411) (start_allowed t412) (start_allowed t413) (start_allowed t414)
    (start_allowed t415) (start_allowed t416) (start_allowed t417) (start_allowed t418) (start_allowed t419)
    (start_allowed t420) (start_allowed t421) (start_allowed t422) (start_allowed t423) (start_allowed t424)
    (start_allowed t425) (start_allowed t426) (start_allowed t427) (start_allowed t428) (start_allowed t429)
    (start_allowed t430) (start_allowed t431) (start_allowed t432) (start_allowed t433) (start_allowed t434)
    (start_allowed t435) (start_allowed t436) (start_allowed t437) (start_allowed t438) (start_allowed t439)
    (start_allowed t440) (start_allowed t441) (start_allowed t442) (start_allowed t443) (start_allowed t444)
    (start_allowed t445) (start_allowed t446) (start_allowed t447) (start_allowed t448) (start_allowed t449)
    (start_allowed t450) (start_allowed t451) (start_allowed t452) (start_allowed t453) (start_allowed t454)
    (start_allowed t455) (start_allowed t456) (start_allowed t457) (start_allowed t458) (start_allowed t459)
    (start_allowed t460) (start_allowed t461) (start_allowed t462) (start_allowed t463) (start_allowed t464)
    (start_allowed t465) (start_allowed t466) (start_allowed t467) (start_allowed t468) (start_allowed t469)
    (start_allowed t470) (start_allowed t471) (start_allowed t472) (start_allowed t473) (start_allowed t474)
    (start_allowed t475) (start_allowed t476) (start_allowed t477) (start_allowed t478) (start_allowed t479)
    (start_allowed t480) (start_allowed t481) (start_allowed t482) (start_allowed t483) (start_allowed t484)
    (start_allowed t485) (start_allowed t486) (start_allowed t487) (start_allowed t488) (start_allowed t489)
    (start_allowed t490) (start_allowed t491) (start_allowed t492) (start_allowed t493) (start_allowed t494)
    (start_allowed t495) (start_allowed t496) (start_allowed t497) (start_allowed t498) (start_allowed t499)
    (start_allowed t500) (start_allowed t501) (start_allowed t502) (start_allowed t503) (start_allowed t504)
    (start_allowed t505) (start_allowed t506) (start_allowed t507) (start_allowed t508) (start_allowed t509)
    (start_allowed t510) (start_allowed t511) (start_allowed t512) (start_allowed t513) (start_allowed t514)
    (start_allowed t515) (start_allowed t516) (start_allowed t517) (start_allowed t518) (start_allowed t519)
    (start_allowed t520) (start_allowed t521) (start_allowed t522) (start_allowed t523) (start_allowed t524)
    (start_allowed t525) (start_allowed t526) (start_allowed t527) (start_allowed t528) (start_allowed t529)
    (start_allowed t530) (start_allowed t531) (start_allowed t532) (start_allowed t533) (start_allowed t534)
    (start_allowed t535) (start_allowed t536) (start_allowed t537) (start_allowed t538) (start_allowed t539)
    (start_allowed t540) (start_allowed t541) (start_allowed t542) (start_allowed t543) (start_allowed t544)
    (start_allowed t545) (start_allowed t546) (start_allowed t547) (start_allowed t548) (start_allowed t549)
    (start_allowed t550) (start_allowed t551) (start_allowed t552) (start_allowed t553) (start_allowed t554)
    (start_allowed t555)

    ;; initial total-cost = 0
    (= (total-cost) 0)
  )

  (:goal (met))
  (:metric minimize (total-cost))
)