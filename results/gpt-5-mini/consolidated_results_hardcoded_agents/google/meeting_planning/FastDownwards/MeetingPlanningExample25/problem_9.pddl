(define (problem meet_david_problem)
  (:domain meeting_discretized)
  (:objects
    golden_gate_park chinatown - loc
    ;; time steps t0 .. t765 (09:00 .. 21:45 inclusive)
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
    t640 t641 t642 t643 t644 t645 t646 t647 t648 t649
    t650 t651 t652 t653 t654 t655 t656 t657 t658 t659
    t660 t661 t662 t663 t664 t665 t666 t667 t668 t669
    t670 t671 t672 t673 t674 t675 t676 t677 t678 t679
    t680 t681 t682 t683 t684 t685 t686 t687 t688 t689
    t690 t691 t692 t693 t694 t695 t696 t697 t698 t699
    t700 t701 t702 t703 t704 t705 t706 t707 t708 t709
    t710 t711 t712 t713 t714 t715 t716 t717 t718 t719
    t720 t721 t722 t723 t724 t725 t726 t727 t728 t729
    t730 t731 t732 t733 t734 t735 t736 t737 t738 t739
    t740 t741 t742 t743 t744 t745 t746 t747 t748 t749
    t750 t751 t752 t753 t754 t755 t756 t757 t758 t759
    t760 t761 t762 t763 t764 t765 - time
  )
  (:init
    ;; start at 09:00 -> t0
    (current_time t0)
    (at golden_gate_park)
    (met_david_min_0)
    ;; David available from 16:00 to 21:45 inclusive.
    ;; 16:00 = 9:00 + 420 minutes -> t420 is 16:00
    ;; allow meeting minutes starting at t420 through t764 (minute beginning times)
    (available_david t420) (available_david t421) (available_david t422) (available_david t423)
    (available_david t424) (available_david t425) (available_david t426) (available_david t427)
    (available_david t428) (available_david t429) (available_david t430) (available_david t431)
    (available_david t432) (available_david t433) (available_david t434) (available_david t435)
    (available_david t436) (available_david t437) (available_david t438) (available_david t439)
    (available_david t440) (available_david t441) (available_david t442) (available_david t443)
    (available_david t444) (available_david t445) (available_david t446) (available_david t447)
    (available_david t448) (available_david t449) (available_david t450) (available_david t451)
    (available_david t452) (available_david t453) (available_david t454) (available_david t455)
    (available_david t456) (available_david t457) (available_david t458) (available_david t459)
    (available_david t460) (available_david t461) (available_david t462) (available_david t463)
    (available_david t464) (available_david t465) (available_david t466) (available_david t467)
    (available_david t468) (available_david t469) (available_david t470) (available_david t471)
    (available_david t472) (available_david t473) (available_david t474) (available_david t475)
    (available_david t476) (available_david t477) (available_david t478) (available_david t479)
    (available_david t480) (available_david t481) (available_david t482) (available_david t483)
    (available_david t484) (available_david t485) (available_david t486) (available_david t487)
    (available_david t488) (available_david t489) (available_david t490) (available_david t491)
    (available_david t492) (available_david t493) (available_david t494) (available_david t495)
    (available_david t496) (available_david t497) (available_david t498) (available_david t499)
    (available_david t500) (available_david t501) (available_david t502) (available_david t503)
    (available_david t504) (available_david t505) (available_david t506) (available_david t507)
    (available_david t508) (available_david t509) (available_david t510) (available_david t511)
    (available_david t512) (available_david t513) (available_david t514) (available_david t515)
    (available_david t516) (available_david t517) (available_david t518) (available_david t519)
    (available_david t520) (available_david t521) (available_david t522) (available_david t523)
    (available_david t524) (available_david t525) (available_david t526) (available_david t527)
    (available_david t528) (available_david t529) (available_david t530) (available_david t531)
    (available_david t532) (available_david t533) (available_david t534) (available_david t535)
    (available_david t536) (available_david t537) (available_david t538) (available_david t539)
    (available_david t540) (available_david t541) (available_david t542) (available_david t543)
    (available_david t544) (available_david t545) (available_david t546) (available_david t547)
    (available_david t548) (available_david t549) (available_david t550) (available_david t551)
    (available_david t552) (available_david t553) (available_david t554) (available_david t555)
    (available_david t556) (available_david t557) (available_david t558) (available_david t559)
    (available_david t560) (available_david t561) (available_david t562) (available_david t563)
    (available_david t564) (available_david t565) (available_david t566) (available_david t567)
    (available_david t568) (available_david t569) (available_david t570) (available_david t571)
    (available_david t572) (available_david t573) (available_david t574) (available_david t575)
    (available_david t576) (available_david t577) (available_david t578) (available_david t579)
    (available_david t580) (available_david t581) (available_david t582) (available_david t583)
    (available_david t584) (available_david t585) (available_david t586) (available_david t587)
    (available_david t588) (available_david t589) (available_david t590) (available_david t591)
    (available_david t592) (available_david t593) (available_david t594) (available_david t595)
    (available_david t596) (available_david t597) (available_david t598) (available_david t599)
    (available_david t600) (available_david t601) (available_david t602) (available_david t603)
    (available_david t604) (available_david t605) (available_david t606) (available_david t607)
    (available_david t608) (available_david t609) (available_david t610) (available_david t611)
    (available_david t612) (available_david t613) (available_david t614) (available_david t615)
    (available_david t616) (available_david t617) (available_david t618) (available_david t619)
    (available_david t620) (available_david t621) (available_david t622) (available_david t623)
    (available_david t624) (available_david t625) (available_david t626) (available_david t627)
    (available_david t628) (available_david t629) (available_david t630) (available_david t631)
    (available_david t632) (available_david t633) (available_david t634) (available_david t635)
    (available_david t636) (available_david t637) (available_david t638) (available_david t639)
    (available_david t640) (available_david t641) (available_david t642) (available_david t643)
    (available_david t644) (available_david t645) (available_david t646) (available_david t647)
    (available_david t648) (available_david t649) (available_david t650) (available_david t651)
    (available_david t652) (available_david t653) (available_david t654) (available_david t655)
    (available_david t656) (available_david t657) (available_david t658) (available_david t659)
    (available_david t660) (available_david t661) (available_david t662) (available_david t663)
    (available_david t664) (available_david t665) (available_david t666) (available_david t667)
    (available_david t668) (available_david t669) (available_david t670) (available_david t671)
    (available_david t672) (available_david t673) (available_david t674) (available_david t675)
    (available_david t676) (available_david t677) (available_david t678) (available_david t679)
    (available_david t680) (available_david t681) (available_david t682) (available_david t683)
    (available_david t684) (available_david t685) (available_david t686) (available_david t687)
    (available_david t688) (available_david t689) (available_david t690) (available_david t691)
    (available_david t692) (available_david t693) (available_david t694) (available_david t695)
    (available_david t696) (available_david t697) (available_david t698) (available_david t699)
    (available_david t700) (available_david t701) (available_david t702) (available_david t703)
    (available_david t704) (available_david t705) (available_david t706) (available_david t707)
    (available_david t708) (available_david t709) (available_david t710) (available_david t711)
    (available_david t712) (available_david t713) (available_david t714) (available_david t715)
    (available_david t716) (available_david t717) (available_david t718) (available_david t719)
    (available_david t720) (available_david t721) (available_david t722) (available_david t723)
    (available_david t724) (available_david t725) (available_david t726) (available_david t727)
    (available_david t728) (available_david t729) (available_david t730) (available_david t731)
    (available_david t732) (available_david t733) (available_david t734) (available_david t735)
    (available_david t736) (available_david t737) (available_david t738) (available_david t739)
    (available_david t740) (available_david t741) (available_david t742) (available_david t743)
    (available_david t744) (available_david t745) (available_david t746) (available_david t747)
    (available_david t748) (available_david t749) (available_david t750) (available_david t751)
    (available_david t752) (available_david t753) (available_david t754) (available_david t755)
    (available_david t756) (available_david t757) (available_david t758) (available_david t759)
    (available_david t760) (available_david t761) (available_david t762) (available_david t763)
    (available_david t764)
    ;; successor relations: t0->t1 ... t764->t765
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5)
    (succ t5 t6) (succ t6 t7) (succ t7 t8) (succ t8 t9) (succ t9 t10)
    (succ t10 t11) (succ t11 t12) (succ t12 t13) (succ t13 t14) (succ t14 t15)
    (succ t15 t16) (succ t16 t17) (succ t17 t18) (succ t18 t19) (succ t19 t20)
    (succ t20 t21) (succ t21 t22) (succ t22 t23) (succ t23 t24) (succ t24 t25)
    (succ t25 t26) (succ t26 t27) (succ t27 t28) (succ t28 t29) (succ t29 t30)
    (succ t30 t31) (succ t31 t32) (succ t32 t33) (succ t33 t34) (succ t34 t35)
    (succ t35 t36) (succ t36 t37) (succ t37 t38) (succ t38 t39) (succ t39 t40)
    (succ t40 t41) (succ t41 t42) (succ t42 t43) (succ t43 t44) (succ t44 t45)
    (succ t45 t46) (succ t46 t47) (succ t47 t48) (succ t48 t49) (succ t49 t50)
    (succ t50 t51) (succ t51 t52) (succ t52 t53) (succ t53 t54) (succ t54 t55)
    (succ t55 t56) (succ t56 t57) (succ t57 t58) (succ t58 t59) (succ t59 t60)
    (succ t60 t61) (succ t61 t62) (succ t62 t63) (succ t63 t64) (succ t64 t65)
    (succ t65 t66) (succ t66 t67) (succ t67 t68) (succ t68 t69) (succ t69 t70)
    (succ t70 t71) (succ t71 t72) (succ t72 t73) (succ t73 t74) (succ t74 t75)
    (succ t75 t76) (succ t76 t77) (succ t77 t78) (succ t78 t79) (succ t79 t80)
    (succ t80 t81) (succ t81 t82) (succ t82 t83) (succ t83 t84) (succ t84 t85)
    (succ t85 t86) (succ t86 t87) (succ t87 t88) (succ t88 t89) (succ t89 t90)
    (succ t90 t91) (succ t91 t92) (succ t92 t93) (succ t93 t94) (succ t94 t95)
    (succ t95 t96) (succ t96 t97) (succ t97 t98) (succ t98 t99) (succ t99 t100)
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
    (succ t645 t646) (succ t646 t647) (succ t647 t648) (succ t648 t649) (succ t649 t650)
    (succ t650 t651) (succ t651 t652) (succ t652 t653) (succ t653 t654) (succ t654 t655)
    (succ t655 t656) (succ t656 t657) (succ t657 t658) (succ t658 t659) (succ t659 t660)
    (succ t660 t661) (succ t661 t662) (succ t662 t663) (succ t663 t664) (succ t664 t665)
    (succ t665 t666) (succ t666 t667) (succ t667 t668) (succ t668 t669) (succ t669 t670)
    (succ t670 t671) (succ t671 t672) (succ t672 t673) (succ t673 t674) (succ t674 t675)
    (succ t675 t676) (succ t676 t677) (succ t677 t678) (succ t678 t679) (succ t679 t680)
    (succ t680 t681) (succ t681 t682) (succ t682 t683) (succ t683 t684) (succ t684 t685)
    (succ t685 t686) (succ t686 t687) (succ t687 t688) (succ t688 t689) (succ t689 t690)
    (succ t690 t691) (succ t691 t692) (succ t692 t693) (succ t693 t694) (succ t694 t695)
    (succ t695 t696) (succ t696 t697) (succ t697 t698) (succ t698 t699) (succ t699 t700)
    (succ t700 t701) (succ t701 t702) (succ t702 t703) (succ t703 t704) (succ t704 t705)
    (succ t705 t706) (succ t706 t707) (succ t707 t708) (succ t708 t709) (succ t709 t710)
    (succ t710 t711) (succ t711 t712) (succ t712 t713) (succ t713 t714) (succ t714 t715)
    (succ t715 t716) (succ t716 t717) (succ t717 t718) (succ t718 t719) (succ t719 t720)
    (succ t720 t721) (succ t721 t722) (succ t722 t723) (succ t723 t724) (succ t724 t725)
    (succ t725 t726) (succ t726 t727) (succ t727 t728) (succ t728 t729) (succ t729 t730)
    (succ t730 t731) (succ t731 t732) (succ t732 t733) (succ t733 t734) (succ t734 t735)
    (succ t735 t736) (succ t736 t737) (succ t737 t738) (succ t738 t739) (succ t739 t740)
    (succ t740 t741) (succ t741 t742) (succ t742 t743) (succ t743 t744) (succ t744 t745)
    (succ t745 t746) (succ t746 t747) (succ t747 t748) (succ t748 t749) (succ t749 t750)
    (succ t750 t751) (succ t751 t752) (succ t752 t753) (succ t753 t754) (succ t754 t755)
    (succ t755 t756) (succ t756 t757) (succ t757 t758) (succ t758 t759) (succ t759 t760)
    (succ t760 t761) (succ t761 t762) (succ t762 t763) (succ t763 t764) (succ t764 t765)
  )
  (:goal (and (met_david_min_105)))
)