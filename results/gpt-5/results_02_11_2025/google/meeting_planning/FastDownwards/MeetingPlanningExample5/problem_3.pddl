(define (problem sf-meet-william-prob)
  (:domain sf-meet-william)
  (:objects
    traveler - agent
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
    t760 t761 t762 t763 t764 t765 t766 t767 t768 t769
    t770 t771 t772 t773 t774 t775 t776 t777 t778 t779
    t780 - time
  )
  (:init
    (at traveler nob_hill)
    (current-time t0)
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5) (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
    (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20)
    (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24) (next t24 t25) (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29) (next t29 t30)
    (next t30 t31) (next t31 t32) (next t32 t33) (next t33 t34) (next t34 t35) (next t35 t36) (next t36 t37) (next t37 t38) (next t38 t39) (next t39 t40)
    (next t40 t41) (next t41 t42) (next t42 t43) (next t43 t44) (next t44 t45) (next t45 t46) (next t46 t47) (next t47 t48) (next t48 t49) (next t49 t50)
    (next t50 t51) (next t51 t52) (next t52 t53) (next t53 t54) (next t54 t55) (next t55 t56) (next t56 t57) (next t57 t58) (next t58 t59) (next t59 t60)
    (next t60 t61) (next t61 t62) (next t62 t63) (next t63 t64) (next t64 t65) (next t65 t66) (next t66 t67) (next t67 t68) (next t68 t69) (next t69 t70)
    (next t70 t71) (next t71 t72) (next t72 t73) (next t73 t74) (next t74 t75) (next t75 t76) (next t76 t77) (next t77 t78) (next t78 t79) (next t79 t80)
    (next t80 t81) (next t81 t82) (next t82 t83) (next t83 t84) (next t84 t85) (next t85 t86) (next t86 t87) (next t87 t88) (next t88 t89) (next t89 t90)
    (next t90 t91) (next t91 t92) (next t92 t93) (next t93 t94) (next t94 t95) (next t95 t96) (next t96 t97) (next t97 t98) (next t98 t99) (next t99 t100)
    (next t100 t101) (next t101 t102) (next t102 t103) (next t103 t104) (next t104 t105) (next t105 t106) (next t106 t107) (next t107 t108) (next t108 t109) (next t109 t110)
    (next t110 t111) (next t111 t112) (next t112 t113) (next t113 t114) (next t114 t115) (next t115 t116) (next t116 t117) (next t117 t118) (next t118 t119) (next t119 t120)
    (next t120 t121) (next t121 t122) (next t122 t123) (next t123 t124) (next t124 t125) (next t125 t126) (next t126 t127) (next t127 t128) (next t128 t129) (next t129 t130)
    (next t130 t131) (next t131 t132) (next t132 t133) (next t133 t134) (next t134 t135) (next t135 t136) (next t136 t137) (next t137 t138) (next t138 t139) (next t139 t140)
    (next t140 t141) (next t141 t142) (next t142 t143) (next t143 t144) (next t144 t145) (next t145 t146) (next t146 t147) (next t147 t148) (next t148 t149) (next t149 t150)
    (next t150 t151) (next t151 t152) (next t152 t153) (next t153 t154) (next t154 t155) (next t155 t156) (next t156 t157) (next t157 t158) (next t158 t159) (next t159 t160)
    (next t160 t161) (next t161 t162) (next t162 t163) (next t163 t164) (next t164 t165) (next t165 t166) (next t166 t167) (next t167 t168) (next t168 t169) (next t169 t170)
    (next t170 t171) (next t171 t172) (next t172 t173) (next t173 t174) (next t174 t175) (next t175 t176) (next t176 t177) (next t177 t178) (next t178 t179) (next t179 t180)
    (next t180 t181) (next t181 t182) (next t182 t183) (next t183 t184) (next t184 t185) (next t185 t186) (next t186 t187) (next t187 t188) (next t188 t189) (next t189 t190)
    (next t190 t191) (next t191 t192) (next t192 t193) (next t193 t194) (next t194 t195) (next t195 t196) (next t196 t197) (next t197 t198) (next t198 t199) (next t199 t200)
    (next t200 t201) (next t201 t202) (next t202 t203) (next t203 t204) (next t204 t205) (next t205 t206) (next t206 t207) (next t207 t208) (next t208 t209) (next t209 t210)
    (next t210 t211) (next t211 t212) (next t212 t213) (next t213 t214) (next t214 t215) (next t215 t216) (next t216 t217) (next t217 t218) (next t218 t219) (next t219 t220)
    (next t220 t221) (next t221 t222) (next t222 t223) (next t223 t224) (next t224 t225) (next t225 t226) (next t226 t227) (next t227 t228) (next t228 t229) (next t229 t230)
    (next t230 t231) (next t231 t232) (next t232 t233) (next t233 t234) (next t234 t235) (next t235 t236) (next t236 t237) (next t237 t238) (next t238 t239) (next t239 t240)
    (next t240 t241) (next t241 t242) (next t242 t243) (next t243 t244) (next t244 t245) (next t245 t246) (next t246 t247) (next t247 t248) (next t248 t249) (next t249 t250)
    (next t250 t251) (next t251 t252) (next t252 t253) (next t253 t254) (next t254 t255) (next t255 t256) (next t256 t257) (next t257 t258) (next t258 t259) (next t259 t260)
    (next t260 t261) (next t261 t262) (next t262 t263) (next t263 t264) (next t264 t265) (next t265 t266) (next t266 t267) (next t267 t268) (next t268 t269) (next t269 t270)
    (next t270 t271) (next t271 t272) (next t272 t273) (next t273 t274) (next t274 t275) (next t275 t276) (next t276 t277) (next t277 t278) (next t278 t279) (next t279 t280)
    (next t280 t281) (next t281 t282) (next t282 t283) (next t283 t284) (next t284 t285) (next t285 t286) (next t286 t287) (next t287 t288) (next t288 t289) (next t289 t290)
    (next t290 t291) (next t291 t292) (next t292 t293) (next t293 t294) (next t294 t295) (next t295 t296) (next t296 t297) (next t297 t298) (next t298 t299) (next t299 t300)
    (next t300 t301) (next t301 t302) (next t302 t303) (next t303 t304) (next t304 t305) (next t305 t306) (next t306 t307) (next t307 t308) (next t308 t309) (next t309 t310)
    (next t310 t311) (next t311 t312) (next t312 t313) (next t313 t314) (next t314 t315) (next t315 t316) (next t316 t317) (next t317 t318) (next t318 t319) (next t319 t320)
    (next t320 t321) (next t321 t322) (next t322 t323) (next t323 t324) (next t324 t325) (next t325 t326) (next t326 t327) (next t327 t328) (next t328 t329) (next t329 t330)
    (next t330 t331) (next t331 t332) (next t332 t333) (next t333 t334) (next t334 t335) (next t335 t336) (next t336 t337) (next t337 t338) (next t338 t339) (next t339 t340)
    (next t340 t341) (next t341 t342) (next t342 t343) (next t343 t344) (next t344 t345) (next t345 t346) (next t346 t347) (next t347 t348) (next t348 t349) (next t349 t350)
    (next t350 t351) (next t351 t352) (next t352 t353) (next t353 t354) (next t354 t355) (next t355 t356) (next t356 t357) (next t357 t358) (next t358 t359) (next t359 t360)
    (next t360 t361) (next t361 t362) (next t362 t363) (next t363 t364) (next t364 t365) (next t365 t366) (next t366 t367) (next t367 t368) (next t368 t369) (next t369 t370)
    (next t370 t371) (next t371 t372) (next t372 t373) (next t373 t374) (next t374 t375) (next t375 t376) (next t376 t377) (next t377 t378) (next t378 t379) (next t379 t380)
    (next t380 t381) (next t381 t382) (next t382 t383) (next t383 t384) (next t384 t385) (next t385 t386) (next t386 t387) (next t387 t388) (next t388 t389) (next t389 t390)
    (next t390 t391) (next t391 t392) (next t392 t393) (next t393 t394) (next t394 t395) (next t395 t396) (next t396 t397) (next t397 t398) (next t398 t399) (next t399 t400)
    (next t400 t401) (next t401 t402) (next t402 t403) (next t403 t404) (next t404 t405) (next t405 t406) (next t406 t407) (next t407 t408) (next t408 t409) (next t409 t410)
    (next t410 t411) (next t411 t412) (next t412 t413) (next t413 t414) (next t414 t415) (next t415 t416) (next t416 t417) (next t417 t418) (next t418 t419) (next t419 t420)
    (next t420 t421) (next t421 t422) (next t422 t423) (next t423 t424) (next t424 t425) (next t425 t426) (next t426 t427) (next t427 t428) (next t428 t429) (next t429 t430)
    (next t430 t431) (next t431 t432) (next t432 t433) (next t433 t434) (next t434 t435) (next t435 t436) (next t436 t437) (next t437 t438) (next t438 t439) (next t439 t440)
    (next t440 t441) (next t441 t442) (next t442 t443) (next t443 t444) (next t444 t445) (next t445 t446) (next t446 t447) (next t447 t448) (next t448 t449) (next t449 t450)
    (next t450 t451) (next t451 t452) (next t452 t453) (next t453 t454) (next t454 t455) (next t455 t456) (next t456 t457) (next t457 t458) (next t458 t459) (next t459 t460)
    (next t460 t461) (next t461 t462) (next t462 t463) (next t463 t464) (next t464 t465) (next t465 t466) (next t466 t467) (next t467 t468) (next t468 t469) (next t469 t470)
    (next t470 t471) (next t471 t472) (next t472 t473) (next t473 t474) (next t474 t475) (next t475 t476) (next t476 t477) (next t477 t478) (next t478 t479) (next t479 t480)
    (next t480 t481) (next t481 t482) (next t482 t483) (next t483 t484) (next t484 t485) (next t485 t486) (next t486 t487) (next t487 t488) (next t488 t489) (next t489 t490)
    (next t490 t491) (next t491 t492) (next t492 t493) (next t493 t494) (next t494 t495) (next t495 t496) (next t496 t497) (next t497 t498) (next t498 t499) (next t499 t500)
    (next t500 t501) (next t501 t502) (next t502 t503) (next t503 t504) (next t504 t505) (next t505 t506) (next t506 t507) (next t507 t508) (next t508 t509) (next t509 t510)
    (next t510 t511) (next t511 t512) (next t512 t513) (next t513 t514) (next t514 t515) (next t515 t516) (next t516 t517) (next t517 t518) (next t518 t519) (next t519 t520)
    (next t520 t521) (next t521 t522) (next t522 t523) (next t523 t524) (next t524 t525) (next t525 t526) (next t526 t527) (next t527 t528) (next t528 t529) (next t529 t530)
    (next t530 t531) (next t531 t532) (next t532 t533) (next t533 t534) (next t534 t535) (next t535 t536) (next t536 t537) (next t537 t538) (next t538 t539) (next t539 t540)
    (next t540 t541) (next t541 t542) (next t542 t543) (next t543 t544) (next t544 t545) (next t545 t546) (next t546 t547) (next t547 t548) (next t548 t549) (next t549 t550)
    (next t550 t551) (next t551 t552) (next t552 t553) (next t553 t554) (next t554 t555) (next t555 t556) (next t556 t557) (next t557 t558) (next t558 t559) (next t559 t560)
    (next t560 t561) (next t561 t562) (next t562 t563) (next t563 t564) (next t564 t565) (next t565 t566) (next t566 t567) (next t567 t568) (next t568 t569) (next t569 t570)
    (next t570 t571) (next t571 t572) (next t572 t573) (next t573 t574) (next t574 t575) (next t575 t576) (next t576 t577) (next t577 t578) (next t578 t579) (next t579 t580)
    (next t580 t581) (next t581 t582) (next t582 t583) (next t583 t584) (next t584 t585) (next t585 t586) (next t586 t587) (next t587 t588) (next t588 t589) (next t589 t590)
    (next t590 t591) (next t591 t592) (next t592 t593) (next t593 t594) (next t594 t595) (next t595 t596) (next t596 t597) (next t597 t598) (next t598 t599) (next t599 t600)
    (next t600 t601) (next t601 t602) (next t602 t603) (next t603 t604) (next t604 t605) (next t605 t606) (next t606 t607) (next t607 t608) (next t608 t609) (next t609 t610)
    (next t610 t611) (next t611 t612) (next t612 t613) (next t613 t614) (next t614 t615) (next t615 t616) (next t616 t617) (next t617 t618) (next t618 t619) (next t619 t620)
    (next t620 t621) (next t621 t622) (next t622 t623) (next t623 t624) (next t624 t625) (next t625 t626) (next t626 t627) (next t627 t628) (next t628 t629) (next t629 t630)
    (next t630 t631) (next t631 t632) (next t632 t633) (next t633 t634) (next t634 t635) (next t635 t636) (next t636 t637) (next t637 t638) (next t638 t639) (next t639 t640)
    (next t640 t641) (next t641 t642) (next t642 t643) (next t643 t644) (next t644 t645) (next t645 t646) (next t646 t647) (next t647 t648) (next t648 t649) (next t649 t650)
    (next t650 t651) (next t651 t652) (next t652 t653) (next t653 t654) (next t654 t655) (next t655 t656) (next t656 t657) (next t657 t658) (next t658 t659) (next t659 t660)
    (next t660 t661) (next t661 t662) (next t662 t663) (next t663 t664) (next t664 t665) (next t665 t666) (next t666 t667) (next t667 t668) (next t668 t669) (next t669 t670)
    (next t670 t671) (next t671 t672) (next t672 t673) (next t673 t674) (next t674 t675) (next t675 t676) (next t676 t677) (next t677 t678) (next t678 t679) (next t679 t680)
    (next t680 t681) (next t681 t682) (next t682 t683) (next t683 t684) (next t684 t685) (next t685 t686) (next t686 t687) (next t687 t688) (next t688 t689) (next t689 t690)
    (next t690 t691) (next t691 t692) (next t692 t693) (next t693 t694) (next t694 t695) (next t695 t696) (next t696 t697) (next t697 t698) (next t698 t699) (next t699 t700)
    (next t700 t701) (next t701 t702) (next t702 t703) (next t703 t704) (next t704 t705) (next t705 t706) (next t706 t707) (next t707 t708) (next t708 t709) (next t709 t710)
    (next t710 t711) (next t711 t712) (next t712 t713) (next t713 t714) (next t714 t715) (next t715 t716) (next t716 t717) (next t717 t718) (next t718 t719) (next t719 t720)
    (next t720 t721) (next t721 t722) (next t722 t723) (next t723 t724) (next t724 t725) (next t725 t726) (next t726 t727) (next t727 t728) (next t728 t729) (next t729 t730)
    (next t730 t731) (next t731 t732) (next t732 t733) (next t733 t734) (next t734 t735) (next t735 t736) (next t736 t737) (next t737 t738) (next t738 t739) (next t739 t740)
    (next t740 t741) (next t741 t742) (next t742 t743) (next t743 t744) (next t744 t745) (next t745 t746) (next t746 t747) (next t747 t748) (next t748 t749) (next t749 t750)
    (next t750 t751) (next t751 t752) (next t752 t753) (next t753 t754) (next t754 t755) (next t755 t756) (next t756 t757) (next t757 t758) (next t758 t759) (next t759 t760)
    (next t760 t761) (next t761 t762) (next t762 t763) (next t763 t764) (next t764 t765) (next t765 t766) (next t766 t767) (next t767 t768) (next t768 t769) (next t769 t770)
    (next t770 t771) (next t771 t772) (next t772 t773) (next t773 t774) (next t774 t775) (next t775 t776) (next t776 t777) (next t777 t778) (next t778 t779) (next t779 t780)
    (william-available t195) (william-available t196) (william-available t197) (william-available t198) (william-available t199)
    (william-available t200) (william-available t201) (william-available t202) (william-available t203) (william-available t204)
    (william-available t205) (william-available t206) (william-available t207) (william-available t208) (william-available t209)
    (william-available t210) (william-available t211) (william-available t212) (william-available t213) (william-available t214)
    (william-available t215) (william-available t216) (william-available t217) (william-available t218) (william-available t219)
    (william-available t220) (william-available t221) (william-available t222) (william-available t223) (william-available t224)
    (william-available t225) (william-available t226) (william-available t227) (william-available t228) (william-available t229)
    (william-available t230) (william-available t231) (william-available t232) (william-available t233) (william-available t234)
    (william-available t235) (william-available t236) (william-available t237) (william-available t238) (william-available t239)
    (william-available t240) (william-available t241) (william-available t242) (william-available t243) (william-available t244)
    (william-available t245) (william-available t246) (william-available t247) (william-available t248) (william-available t249)
    (william-available t250) (william-available t251) (william-available t252) (william-available t253) (william-available t254)
    (william-available t255) (william-available t256) (william-available t257) (william-available t258) (william-available t259)
    (william-available t260) (william-available t261) (william-available t262) (william-available t263) (william-available t264)
    (william-available t265) (william-available t266) (william-available t267) (william-available t268) (william-available t269)
    (william-available t270) (william-available t271) (william-available t272) (william-available t273) (william-available t274)
    (william-available t275) (william-available t276) (william-available t277) (william-available t278) (william-available t279)
    (william-available t280) (william-available t281) (william-available t282) (william-available t283) (william-available t284)
    (william-available t285) (william-available t286) (william-available t287) (william-available t288) (william-available t289)
    (william-available t290) (william-available t291) (william-available t292) (william-available t293) (william-available t294)
    (william-available t295) (william-available t296) (william-available t297) (william-available t298) (william-available t299)
    (william-available t300) (william-available t301) (william-available t302) (william-available t303) (william-available t304)
    (william-available t305) (william-available t306) (william-available t307) (william-available t308) (william-available t309)
    (william-available t310) (william-available t311) (william-available t312) (william-available t313) (william-available t314)
    (william-available t315) (william-available t316) (william-available t317) (william-available t318) (william-available t319)
    (william-available t320) (william-available t321) (william-available t322) (william-available t323) (william-available t324)
    (william-available t325) (william-available t326) (william-available t327) (william-available t328) (william-available t329)
    (william-available t330) (william-available t331) (william-available t332) (william-available t333) (william-available t334)
    (william-available t335) (william-available t336) (william-available t337) (william-available t338) (william-available t339)
    (william-available t340) (william-available t341) (william-available t342) (william-available t343) (william-available t344)
    (william-available t345) (william-available t346) (william-available t347) (william-available t348) (william-available t349)
    (william-available t350) (william-available t351) (william-available t352) (william-available t353) (william-available t354)
    (william-available t355) (william-available t356) (william-available t357) (william-available t358) (william-available t359)
    (william-available t360) (william-available t361) (william-available t362) (william-available t363) (william-available t364)
    (william-available t365) (william-available t366) (william-available t367) (william-available t368) (william-available t369)
    (william-available t370) (william-available t371) (william-available t372) (william-available t373) (william-available t374)
    (william-available t375) (william-available t376) (william-available t377) (william-available t378) (william-available t379)
    (william-available t380) (william-available t381) (william-available t382) (william-available t383) (william-available t384)
    (william-available t385) (william-available t386) (william-available t387) (william-available t388) (william-available t389)
    (william-available t390) (william-available t391) (william-available t392) (william-available t393) (william-available t394)
    (william-available t395) (william-available t396) (william-available t397) (william-available t398) (william-available t399)
    (william-available t400) (william-available t401) (william-available t402) (william-available t403) (william-available t404)
    (william-available t405) (william-available t406) (william-available t407) (william-available t408) (william-available t409)
    (william-available t410) (william-available t411) (william-available t412) (william-available t413) (william-available t414)
    (william-available t415) (william-available t416) (william-available t417) (william-available t418) (william-available t419)
    (william-available t420) (william-available t421) (william-available t422) (william-available t423) (william-available t424)
    (william-available t425) (william-available t426) (william-available t427) (william-available t428) (william-available t429)
    (william-available t430) (william-available t431) (william-available t432) (william-available t433) (william-available t434)
    (william-available t435) (william-available t436) (william-available t437) (william-available t438) (william-available t439)
    (william-available t440) (william-available t441) (william-available t442) (william-available t443) (william-available t444)
    (william-available t445) (william-available t446) (william-available t447) (william-available t448) (william-available t449)
    (william-available t450) (william-available t451) (william-available t452) (william-available t453) (william-available t454)
    (william-available t455) (william-available t456) (william-available t457) (william-available t458) (william-available t459)
    (william-available t460) (william-available t461) (william-available t462) (william-available t463) (william-available t464)
    (william-available t465) (william-available t466) (william-available t467) (william-available t468) (william-available t469)
    (william-available t470) (william-available t471) (william-available t472) (william-available t473) (william-available t474)
    (william-available t475) (william-available t476) (william-available t477) (william-available t478) (william-available t479)
    (william-available t480) (william-available t481) (william-available t482) (william-available t483) (william-available t484)
    (william-available t485) (william-available t486) (william-available t487) (william-available t488) (william-available t489)
    (william-available t490) (william-available t491) (william-available t492) (william-available t493) (william-available t494)
    (william-available t495) (william-available t496) (william-available t497) (william-available t498) (william-available t499)
    (william-available t500) (william-available t501) (william-available t502) (william-available t503) (william-available t504)
    (william-available t505) (william-available t506) (william-available t507) (william-available t508) (william-available t509)
    (william-available t510) (william-available t511) (william-available t512) (william-available t513) (william-available t514)
    (william-available t515) (william-available t516) (william-available t517) (william-available t518) (william-available t519)
    (william-available t520) (william-available t521) (william-available t522) (william-available t523) (william-available t524)
    (william-available t525) (william-available t526) (william-available t527) (william-available t528) (william-available t529)
    (william-available t530) (william-available t531) (william-available t532) (william-available t533) (william-available t534)
    (william-available t535) (william-available t536) (william-available t537) (william-available t538) (william-available t539)
    (william-available t540) (william-available t541) (william-available t542) (william-available t543) (william-available t544)
    (william-available t545) (william-available t546) (william-available t547) (william-available t548) (william-available t549)
    (william-available t550) (william-available t551) (william-available t552) (william-available t553) (william-available t554)
    (william-available t555) (william-available t556) (william-available t557) (william-available t558) (william-available t559)
    (william-available t560) (william-available t561) (william-available t562) (william-available t563) (william-available t564)
    (william-available t565) (william-available t566) (william-available t567) (william-available t568) (william-available t569)
    (william-available t570) (william-available t571) (william-available t572) (william-available t573) (william-available t574)
    (william-available t575) (william-available t576) (william-available t577) (william-available t578) (william-available t579)
    (william-available t580) (william-available t581) (william-available t582) (william-available t583) (william-available t584)
    (william-available t585) (william-available t586) (william-available t587) (william-available t588) (william-available t589)
    (william-available t590) (william-available t591) (william-available t592) (william-available t593) (william-available t594)
    (william-available t595) (william-available t596) (william-available t597) (william-available t598) (william-available t599)
    (william-available t600) (william-available t601) (william-available t602) (william-available t603) (william-available t604)
    (william-available t605) (william-available t606) (william-available t607) (william-available t608) (william-available t609)
    (william-available t610) (william-available t611) (william-available t612) (william-available t613) (william-available t614)
    (william-available t615) (william-available t616) (william-available t617) (william-available t618) (william-available t619)
    (william-available t620) (william-available t621) (william-available t622) (william-available t623) (william-available t624)
    (william-available t625) (william-available t626) (william-available t627) (william-available t628) (william-available t629)
    (william-available t630) (william-available t631) (william-available t632) (william-available t633) (william-available t634)
    (william-available t635) (william-available t636) (william-available t637) (william-available t638) (william-available t639)
    (william-available t640) (william-available t641) (william-available t642) (william-available t643) (william-available t644)
    (william-available t645) (william-available t646) (william-available t647) (william-available t648) (william-available t649)
    (william-available t650) (william-available t651) (william-available t652) (william-available t653) (william-available t654)
    (william-available t655) (william-available t656) (william-available t657) (william-available t658) (william-available t659)
    (william-available t660) (william-available t661) (william-available t662) (william-available t663) (william-available t664)
    (william-available t665) (william-available t666) (william-available t667) (william-available t668) (william-available t669)
    (william-available t670) (william-available t671) (william-available t672) (william-available t673) (william-available t674)
    (william-available t675) (william-available t676) (william-available t677) (william-available t678) (william-available t679)
    (william-available t680) (william-available t681) (william-available t682) (william-available t683) (william-available t684)
    (william-available t685) (william-available t686) (william-available t687) (william-available t688) (william-available t689)
    (william-available t690) (william-available t691) (william-available t692) (william-available t693) (william-available t694)
    (william-available t695) (william-available t696) (william-available t697) (william-available t698) (william-available t699)
    (william-available t700) (william-available t701) (william-available t702) (william-available t703) (william-available t704)
    (william-available t705) (william-available t706) (william-available t707) (william-available t708) (william-available t709)
    (william-available t710) (william-available t711) (william-available t712) (william-available t713) (william-available t714)
    (william-available t715) (william-available t716) (william-available t717) (william-available t718) (william-available t719)
    (william-available t720) (william-available t721) (william-available t722) (william-available t723) (william-available t724)
    (william-available t725) (william-available t726) (william-available t727) (william-available t728) (william-available t729)
    (william-available t730) (william-available t731) (william-available t732) (william-available t733) (william-available t734)
    (william-available t735) (william-available t736) (william-available t737) (william-available t738) (william-available t739)
    (william-available t740) (william-available t741) (william-available t742) (william-available t743) (william-available t744)
    (william-available t745) (william-available t746) (william-available t747) (william-available t748) (william-available t749)
    (william-available t750) (william-available t751) (william-available t752) (william-available t753) (william-available t754)
    (william-available t755) (william-available t756) (william-available t757) (william-available t758) (william-available t759)
    (william-available t760) (william-available t761) (william-available t762) (william-available t763) (william-available t764)
    (william-available t765) (william-available t766) (william-available t767) (william-available t768) (william-available t769)
    (william-available t770) (william-available t771) (william-available t772) (william-available t773) (william-available t774)
    (william-available t775) (william-available t776) (william-available t777) (william-available t778) (william-available t779)
    (= (total-cost) 0)
  )
  (:goal (met-william))
  (:metric minimize (total-cost))
)