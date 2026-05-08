(define (problem MeetingPlanningExample16-select)
  (:domain schedule-selection)

  (:objects
    schedule_early105 schedule_full375 - schedule
    t375 t376 t377 t378 t379
    t380 t381 t382 t383 t384
    t385 t386 t387 t388 t389
    t390 t391 t392 t393 t394
    t395 t396 t397 t398 t399
    t400 t401 t402 t403 t404
    t405 t406 t407 t408 t409
    t410 t411 t412 t413 t414
    t415 t416 t417 t418 t419
    t420 t421 t422 t423 t424
    t425 t426 t427 t428 t429
    t430 t431 t432 t433 t434
    t435 t436 t437 t438 t439
    t440 t441 t442 t443 t444
    t445 t446 t447 t448 t449
    t450 t451 t452 t453 t454
    t455 t456 t457 t458 t459
    t460 t461 t462 t463 t464
    t465 t466 t467 t468 t469
    t470 t471 t472 t473 t474
    t475 t476 t477 t478 t479
    t480 t481 t482 t483 t484
    t485 t486 t487 t488 t489
    t490 t491 t492 t493 t494
    t495 t496 t497 t498 t499
    t500 t501 t502 t503 t504
    t505 t506 t507 t508 t509
    t510 t511 t512 t513 t514
    t515 t516 t517 t518 t519
    t520 t521 t522 t523 t524
    t525 t526 t527 t528 t529
    t530 t531 t532 t533 t534
    t535 t536 t537 t538 t539
    t540 t541 t542 t543 t544
    t545 t546 t547 t548 t549
    t550 t551 t552 t553 t554
    t555 t556 t557 t558 t559
    t560 t561 t562 t563 t564
    t565 t566 t567 t568 t569
    t570 t571 t572 t573 t574
    t575 t576 t577 t578 t579
    t580 t581 t582 t583 t584
    t585 t586 t587 t588 t589
    t590 t591 t592 t593 t594
    t595 t596 t597 t598 t599
    t600 t601 t602 t603 t604
    t605 t606 t607 t608 t609
    t610 t611 t612 t613 t614
    t615 t616 t617 t618 t619
    t620 t621 t622 t623 t624
    t625 t626 t627 t628 t629
    t630 t631 t632 t633 t634
    t635 t636 t637 t638 t639
    t640 t641 t642 t643 t644
    t645 t646 t647 t648 t649
    t650 t651 t652 t653 t654
    t655 t656 t657 t658 t659
    t660 t661 t662 t663 t664
    t665 t666 t667 t668 t669
    t670 t671 t672 t673 t674
    t675 t676 t677 t678 t679
    t680 t681 t682 t683 t684
    t685 t686 t687 t688 t689
    t690 t691 t692 t693 t694
    t695 t696 t697 t698 t699
    t700 t701 t702 t703 t704
    t705 t706 t707 t708 t709
    t710 t711 t712 t713 t714
    t715 t716 t717 t718 t719
    t720 t721 t722 t723 t724
    t725 t726 t727 t728 t729
    t730 t731 t732 t733 t734
    t735 t736 t737 t738 t739
    t740 t741 t742 t743 t744
    t745 t746 t747 t748 t749 - timepoint
  )

  (:init
    (feasible schedule_early105)
    (feasible schedule_full375)
    (best schedule_full375)
    (choice-open)

    ;; Ronald availability: t375..t749 inclusive
    (in-availability t375) (in-availability t376) (in-availability t377) (in-availability t378) (in-availability t379)
    (in-availability t380) (in-availability t381) (in-availability t382) (in-availability t383) (in-availability t384)
    (in-availability t385) (in-availability t386) (in-availability t387) (in-availability t388) (in-availability t389)
    (in-availability t390) (in-availability t391) (in-availability t392) (in-availability t393) (in-availability t394)
    (in-availability t395) (in-availability t396) (in-availability t397) (in-availability t398) (in-availability t399)
    (in-availability t400) (in-availability t401) (in-availability t402) (in-availability t403) (in-availability t404)
    (in-availability t405) (in-availability t406) (in-availability t407) (in-availability t408) (in-availability t409)
    (in-availability t410) (in-availability t411) (in-availability t412) (in-availability t413) (in-availability t414)
    (in-availability t415) (in-availability t416) (in-availability t417) (in-availability t418) (in-availability t419)
    (in-availability t420) (in-availability t421) (in-availability t422) (in-availability t423) (in-availability t424)
    (in-availability t425) (in-availability t426) (in-availability t427) (in-availability t428) (in-availability t429)
    (in-availability t430) (in-availability t431) (in-availability t432) (in-availability t433) (in-availability t434)
    (in-availability t435) (in-availability t436) (in-availability t437) (in-availability t438) (in-availability t439)
    (in-availability t440) (in-availability t441) (in-availability t442) (in-availability t443) (in-availability t444)
    (in-availability t445) (in-availability t446) (in-availability t447) (in-availability t448) (in-availability t449)
    (in-availability t450) (in-availability t451) (in-availability t452) (in-availability t453) (in-availability t454)
    (in-availability t455) (in-availability t456) (in-availability t457) (in-availability t458) (in-availability t459)
    (in-availability t460) (in-availability t461) (in-availability t462) (in-availability t463) (in-availability t464)
    (in-availability t465) (in-availability t466) (in-availability t467) (in-availability t468) (in-availability t469)
    (in-availability t470) (in-availability t471) (in-availability t472) (in-availability t473) (in-availability t474)
    (in-availability t475) (in-availability t476) (in-availability t477) (in-availability t478) (in-availability t479)
    (in-availability t480) (in-availability t481) (in-availability t482) (in-availability t483) (in-availability t484)
    (in-availability t485) (in-availability t486) (in-availability t487) (in-availability t488) (in-availability t489)
    (in-availability t490) (in-availability t491) (in-availability t492) (in-availability t493) (in-availability t494)
    (in-availability t495) (in-availability t496) (in-availability t497) (in-availability t498) (in-availability t499)
    (in-availability t500) (in-availability t501) (in-availability t502) (in-availability t503) (in-availability t504)
    (in-availability t505) (in-availability t506) (in-availability t507) (in-availability t508) (in-availability t509)
    (in-availability t510) (in-availability t511) (in-availability t512) (in-availability t513) (in-availability t514)
    (in-availability t515) (in-availability t516) (in-availability t517) (in-availability t518) (in-availability t519)
    (in-availability t520) (in-availability t521) (in-availability t522) (in-availability t523) (in-availability t524)
    (in-availability t525) (in-availability t526) (in-availability t527) (in-availability t528) (in-availability t529)
    (in-availability t530) (in-availability t531) (in-availability t532) (in-availability t533) (in-availability t534)
    (in-availability t535) (in-availability t536) (in-availability t537) (in-availability t538) (in-availability t539)
    (in-availability t540) (in-availability t541) (in-availability t542) (in-availability t543) (in-availability t544)
    (in-availability t545) (in-availability t546) (in-availability t547) (in-availability t548) (in-availability t549)
    (in-availability t550) (in-availability t551) (in-availability t552) (in-availability t553) (in-availability t554)
    (in-availability t555) (in-availability t556) (in-availability t557) (in-availability t558) (in-availability t559)
    (in-availability t560) (in-availability t561) (in-availability t562) (in-availability t563) (in-availability t564)
    (in-availability t565) (in-availability t566) (in-availability t567) (in-availability t568) (in-availability t569)
    (in-availability t570) (in-availability t571) (in-availability t572) (in-availability t573) (in-availability t574)
    (in-availability t575) (in-availability t576) (in-availability t577) (in-availability t578) (in-availability t579)
    (in-availability t580) (in-availability t581) (in-availability t582) (in-availability t583) (in-availability t584)
    (in-availability t585) (in-availability t586) (in-availability t587) (in-availability t588) (in-availability t589)
    (in-availability t590) (in-availability t591) (in-availability t592) (in-availability t593) (in-availability t594)
    (in-availability t595) (in-availability t596) (in-availability t597) (in-availability t598) (in-availability t599)
    (in-availability t600) (in-availability t601) (in-availability t602) (in-availability t603) (in-availability t604)
    (in-availability t605) (in-availability t606) (in-availability t607) (in-availability t608) (in-availability t609)
    (in-availability t610) (in-availability t611) (in-availability t612) (in-availability t613) (in-availability t614)
    (in-availability t615) (in-availability t616) (in-availability t617) (in-availability t618) (in-availability t619)
    (in-availability t620) (in-availability t621) (in-availability t622) (in-availability t623) (in-availability t624)
    (in-availability t625) (in-availability t626) (in-availability t627) (in-availability t628) (in-availability t629)
    (in-availability t630) (in-availability t631) (in-availability t632) (in-availability t633) (in-availability t634)
    (in-availability t635) (in-availability t636) (in-availability t637) (in-availability t638) (in-availability t639)
    (in-availability t640) (in-availability t641) (in-availability t642) (in-availability t643) (in-availability t644)
    (in-availability t645) (in-availability t646) (in-availability t647) (in-availability t648) (in-availability t649)
    (in-availability t650) (in-availability t651) (in-availability t652) (in-availability t653) (in-availability t654)
    (in-availability t655) (in-availability t656) (in-availability t657) (in-availability t658) (in-availability t659)
    (in-availability t660) (in-availability t661) (in-availability t662) (in-availability t663) (in-availability t664)
    (in-availability t665) (in-availability t666) (in-availability t667) (in-availability t668) (in-availability t669)
    (in-availability t670) (in-availability t671) (in-availability t672) (in-availability t673) (in-availability t674)
    (in-availability t675) (in-availability t676) (in-availability t677) (in-availability t678) (in-availability t679)
    (in-availability t680) (in-availability t681) (in-availability t682) (in-availability t683) (in-availability t684)
    (in-availability t685) (in-availability t686) (in-availability t687) (in-availability t688) (in-availability t689)
    (in-availability t690) (in-availability t691) (in-availability t692) (in-availability t693) (in-availability t694)
    (in-availability t695) (in-availability t696) (in-availability t697) (in-availability t698) (in-availability t699)
    (in-availability t700) (in-availability t701) (in-availability t702) (in-availability t703) (in-availability t704)
    (in-availability t705) (in-availability t706) (in-availability t707) (in-availability t708) (in-availability t709)
    (in-availability t710) (in-availability t711) (in-availability t712) (in-availability t713) (in-availability t714)
    (in-availability t715) (in-availability t716) (in-availability t717) (in-availability t718) (in-availability t719)
    (in-availability t720) (in-availability t721) (in-availability t722) (in-availability t723) (in-availability t724)
    (in-availability t725) (in-availability t726) (in-availability t727) (in-availability t728) (in-availability t729)
    (in-availability t730) (in-availability t731) (in-availability t732) (in-availability t733) (in-availability t734)
    (in-availability t735) (in-availability t736) (in-availability t737) (in-availability t738) (in-availability t739)
    (in-availability t740) (in-availability t741) (in-availability t742) (in-availability t743) (in-availability t744)
    (in-availability t745) (in-availability t746) (in-availability t747) (in-availability t748) (in-availability t749)

    ;; Successor chain for contiguous minutes within availability
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
    (succ t745 t746) (succ t746 t747) (succ t747 t748) (succ t748 t749)

    ;; Occupancy facts: schedule_early105 occupies t375..t479 (contiguous 105 minutes)
    (occupies schedule_early105 t375) (occupies schedule_early105 t376) (occupies schedule_early105 t377)
    (occupies schedule_early105 t378) (occupies schedule_early105 t379) (occupies schedule_early105 t380)
    (occupies schedule_early105 t381) (occupies schedule_early105 t382) (occupies schedule_early105 t383)
    (occupies schedule_early105 t384) (occupies schedule_early105 t385) (occupies schedule_early105 t386)
    (occupies schedule_early105 t387) (occupies schedule_early105 t388) (occupies schedule_early105 t389)
    (occupies schedule_early105 t390) (occupies schedule_early105 t391) (occupies schedule_early105 t392)
    (occupies schedule_early105 t393) (occupies schedule_early105 t394) (occupies schedule_early105 t395)
    (occupies schedule_early105 t396) (occupies schedule_early105 t397) (occupies schedule_early105 t398)
    (occupies schedule_early105 t399) (occupies schedule_early105 t400) (occupies schedule_early105 t401)
    (occupies schedule_early105 t402) (occupies schedule_early105 t403) (occupies schedule_early105 t404)
    (occupies schedule_early105 t405) (occupies schedule_early105 t406) (occupies schedule_early105 t407)
    (occupies schedule_early105 t408) (occupies schedule_early105 t409) (occupies schedule_early105 t410)
    (occupies schedule_early105 t411) (occupies schedule_early105 t412) (occupies schedule_early105 t413)
    (occupies schedule_early105 t414) (occupies schedule_early105 t415) (occupies schedule_early105 t416)
    (occupies schedule_early105 t417) (occupies schedule_early105 t418) (occupies schedule_early105 t419)
    (occupies schedule_early105 t420) (occupies schedule_early105 t421) (occupies schedule_early105 t422)
    (occupies schedule_early105 t423) (occupies schedule_early105 t424) (occupies schedule_early105 t425)
    (occupies schedule_early105 t426) (occupies schedule_early105 t427) (occupies schedule_early105 t428)
    (occupies schedule_early105 t429) (occupies schedule_early105 t430) (occupies schedule_early105 t431)
    (occupies schedule_early105 t432) (occupies schedule_early105 t433) (occupies schedule_early105 t434)
    (occupies schedule_early105 t435) (occupies schedule_early105 t436) (occupies schedule_early105 t437)
    (occupies schedule_early105 t438) (occupies schedule_early105 t439) (occupies schedule_early105 t440)
    (occupies schedule_early105 t441) (occupies schedule_early105 t442) (occupies schedule_early105 t443)
    (occupies schedule_early105 t444) (occupies schedule_early105 t445) (occupies schedule_early105 t446)
    (occupies schedule_early105 t447) (occupies schedule_early105 t448) (occupies schedule_early105 t449)
    (occupies schedule_early105 t450) (occupies schedule_early105 t451) (occupies schedule_early105 t452)
    (occupies schedule_early105 t453) (occupies schedule_early105 t454) (occupies schedule_early105 t455)
    (occupies schedule_early105 t456) (occupies schedule_early105 t457) (occupies schedule_early105 t458)
    (occupies schedule_early105 t459) (occupies schedule_early105 t460) (occupies schedule_early105 t461)
    (occupies schedule_early105 t462) (occupies schedule_early105 t463) (occupies schedule_early105 t464)
    (occupies schedule_early105 t465) (occupies schedule_early105 t466) (occupies schedule_early105 t467)
    (occupies schedule_early105 t468) (occupies schedule_early105 t469) (occupies schedule_early105 t470)
    (occupies schedule_early105 t471) (occupies schedule_early105 t472) (occupies schedule_early105 t473)
    (occupies schedule_early105 t474) (occupies schedule_early105 t475) (occupies schedule_early105 t476)
    (occupies schedule_early105 t477) (occupies schedule_early105 t478) (occupies schedule_early105 t479)

    ;; Occupancy facts: schedule_full375 occupies t375..t749 (contiguous 375 minutes)
    (occupies schedule_full375 t375) (occupies schedule_full375 t376) (occupies schedule_full375 t377)
    (occupies schedule_full375 t378) (occupies schedule_full375 t379) (occupies schedule_full375 t380)
    (occupies schedule_full375 t381) (occupies schedule_full375 t382) (occupies schedule_full375 t383)
    (occupies schedule_full375 t384) (occupies schedule_full375 t385) (occupies schedule_full375 t386)
    (occupies schedule_full375 t387) (occupies schedule_full375 t388) (occupies schedule_full375 t389)
    (occupies schedule_full375 t390) (occupies schedule_full375 t391) (occupies schedule_full375 t392)
    (occupies schedule_full375 t393) (occupies schedule_full375 t394) (occupies schedule_full375 t395)
    (occupies schedule_full375 t396) (occupies schedule_full375 t397) (occupies schedule_full375 t398)
    (occupies schedule_full375 t399) (occupies schedule_full375 t400) (occupies schedule_full375 t401)
    (occupies schedule_full375 t402) (occupies schedule_full375 t403) (occupies schedule_full375 t404)
    (occupies schedule_full375 t405) (occupies schedule_full375 t406) (occupies schedule_full375 t407)
    (occupies schedule_full375 t408) (occupies schedule_full375 t409) (occupies schedule_full375 t410)
    (occupies schedule_full375 t411) (occupies schedule_full375 t412) (occupies schedule_full375 t413)
    (occupies schedule_full375 t414) (occupies schedule_full375 t415) (occupies schedule_full375 t416)
    (occupies schedule_full375 t417) (occupies schedule_full375 t418) (occupies schedule_full375 t419)
    (occupies schedule_full375 t420) (occupies schedule_full375 t421) (occupies schedule_full375 t422)
    (occupies schedule_full375 t423) (occupies schedule_full375 t424) (occupies schedule_full375 t425)
    (occupies schedule_full375 t426) (occupies schedule_full375 t427) (occupies schedule_full375 t428)
    (occupies schedule_full375 t429) (occupies schedule_full375 t430) (occupies schedule_full375 t431)
    (occupies schedule_full375 t432) (occupies schedule_full375 t433) (occupies schedule_full375 t434)
    (occupies schedule_full375 t435) (occupies schedule_full375 t436) (occupies schedule_full375 t437)
    (occupies schedule_full375 t438) (occupies schedule_full375 t439) (occupies schedule_full375 t440)
    (occupies schedule_full375 t441) (occupies schedule_full375 t442) (occupies schedule_full375 t443)
    (occupies schedule_full375 t444) (occupies schedule_full375 t445) (occupies schedule_full375 t446)
    (occupies schedule_full375 t447) (occupies schedule_full375 t448) (occupies schedule_full375 t449)
    (occupies schedule_full375 t450) (occupies schedule_full375 t451) (occupies schedule_full375 t452)
    (occupies schedule_full375 t453) (occupies schedule_full375 t454) (occupies schedule_full375 t455)
    (occupies schedule_full375 t456) (occupies schedule_full375 t457) (occupies schedule_full375 t458)
    (occupies schedule_full375 t459) (occupies schedule_full375 t460) (occupies schedule_full375 t461)
    (occupies schedule_full375 t462) (occupies schedule_full375 t463) (occupies schedule_full375 t464)
    (occupies schedule_full375 t465) (occupies schedule_full375 t466) (occupies schedule_full375 t467)
    (occupies schedule_full375 t468) (occupies schedule_full375 t469) (occupies schedule_full375 t470)
    (occupies schedule_full375 t471) (occupies schedule_full375 t472) (occupies schedule_full375 t473)
    (occupies schedule_full375 t474) (occupies schedule_full375 t475) (occupies schedule_full375 t476)
    (occupies schedule_full375 t477) (occupies schedule_full375 t478) (occupies schedule_full375 t479)
    (occupies schedule_full375 t480) (occupies schedule_full375 t481) (occupies schedule_full375 t482)
    (occupies schedule_full375 t483) (occupies schedule_full375 t484) (occupies schedule_full375 t485)
    (occupies schedule_full375 t486) (occupies schedule_full375 t487) (occupies schedule_full375 t488)
    (occupies schedule_full375 t489) (occupies schedule_full375 t490) (occupies schedule_full375 t491)
    (occupies schedule_full375 t492) (occupies schedule_full375 t493) (occupies schedule_full375 t494)
    (occupies schedule_full375 t495) (occupies schedule_full375 t496) (occupies schedule_full375 t497)
    (occupies schedule_full375 t498) (occupies schedule_full375 t499) (occupies schedule_full375 t500)
    (occupies schedule_full375 t501) (occupies schedule_full375 t502) (occupies schedule_full375 t503)
    (occupies schedule_full375 t504) (occupies schedule_full375 t505) (occupies schedule_full375 t506)
    (occupies schedule_full375 t507) (occupies schedule_full375 t508) (occupies schedule_full375 t509)
    (occupies schedule_full375 t510) (occupies schedule_full375 t511) (occupies schedule_full375 t512)
    (occupies schedule_full375 t513) (occupies schedule_full375 t514) (occupies schedule_full375 t515)
    (occupies schedule_full375 t516) (occupies schedule_full375 t517) (occupies schedule_full375 t518)
    (occupies schedule_full375 t519) (occupies schedule_full375 t520) (occupies schedule_full375 t521)
    (occupies schedule_full375 t522) (occupies schedule_full375 t523) (occupies schedule_full375 t524)
    (occupies schedule_full375 t525) (occupies schedule_full375 t526) (occupies schedule_full375 t527)
    (occupies schedule_full375 t528) (occupies schedule_full375 t529) (occupies schedule_full375 t530)
    (occupies schedule_full375 t531) (occupies schedule_full375 t532) (occupies schedule_full375 t533)
    (occupies schedule_full375 t534) (occupies schedule_full375 t535) (occupies schedule_full375 t536)
    (occupies schedule_full375 t537) (occupies schedule_full375 t538) (occupies schedule_full375 t539)
    (occupies schedule_full375 t540) (occupies schedule_full375 t541) (occupies schedule_full375 t542)
    (occupies schedule_full375 t543) (occupies schedule_full375 t544) (occupies schedule_full375 t545)
    (occupies schedule_full375 t546) (occupies schedule_full375 t547) (occupies schedule_full375 t548)
    (occupies schedule_full375 t549) (occupies schedule_full375 t550) (occupies schedule_full375 t551)
    (occupies schedule_full375 t552) (occupies schedule_full375 t553) (occupies schedule_full375 t554)
    (occupies schedule_full375 t555) (occupies schedule_full375 t556) (occupies schedule_full375 t557)
    (occupies schedule_full375 t558) (occupies schedule_full375 t559) (occupies schedule_full375 t560)
    (occupies schedule_full375 t561) (occupies schedule_full375 t562) (occupies schedule_full375 t563)
    (occupies schedule_full375 t564) (occupies schedule_full375 t565) (occupies schedule_full375 t566)
    (occupies schedule_full375 t567) (occupies schedule_full375 t568) (occupies schedule_full375 t569)
    (occupies schedule_full375 t570) (occupies schedule_full375 t571) (occupies schedule_full375 t572)
    (occupies schedule_full375 t573) (occupies schedule_full375 t574) (occupies schedule_full375 t575)
    (occupies schedule_full375 t576) (occupies schedule_full375 t577) (occupies schedule_full375 t578)
    (occupies schedule_full375 t579) (occupies schedule_full375 t580) (occupies schedule_full375 t581)
    (occupies schedule_full375 t582) (occupies schedule_full375 t583) (occupies schedule_full375 t584)
    (occupies schedule_full375 t585) (occupies schedule_full375 t586) (occupies schedule_full375 t587)
    (occupies schedule_full375 t588) (occupies schedule_full375 t589) (occupies schedule_full375 t590)
    (occupies schedule_full375 t591) (occupies schedule_full375 t592) (occupies schedule_full375 t593)
    (occupies schedule_full375 t594) (occupies schedule_full375 t595) (occupies schedule_full375 t596)
    (occupies schedule_full375 t597) (occupies schedule_full375 t598) (occupies schedule_full375 t599)
    (occupies schedule_full375 t600) (occupies schedule_full375 t601) (occupies schedule_full375 t602)
    (occupies schedule_full375 t603) (occupies schedule_full375 t604) (occupies schedule_full375 t605)
    (occupies schedule_full375 t606) (occupies schedule_full375 t607) (occupies schedule_full375 t608)
    (occupies schedule_full375 t609) (occupies schedule_full375 t610) (occupies schedule_full375 t611)
    (occupies schedule_full375 t612) (occupies schedule_full375 t613) (occupies schedule_full375 t614)
    (occupies schedule_full375 t615) (occupies schedule_full375 t616) (occupies schedule_full375 t617)
    (occupies schedule_full375 t618) (occupies schedule_full375 t619) (occupies schedule_full375 t620)
    (occupies schedule_full375 t621) (occupies schedule_full375 t622) (occupies schedule_full375 t623)
    (occupies schedule_full375 t624) (occupies schedule_full375 t625) (occupies schedule_full375 t626)
    (occupies schedule_full375 t627) (occupies schedule_full375 t628) (occupies schedule_full375 t629)
    (occupies schedule_full375 t630) (occupies schedule_full375 t631) (occupies schedule_full375 t632)
    (occupies schedule_full375 t633) (occupies schedule_full375 t634) (occupies schedule_full375 t635)
    (occupies schedule_full375 t636) (occupies schedule_full375 t637) (occupies schedule_full375 t638)
    (occupies schedule_full375 t639) (occupies schedule_full375 t640) (occupies schedule_full375 t641)
    (occupies schedule_full375 t642) (occupies schedule_full375 t643) (occupies schedule_full375 t644)
    (occupies schedule_full375 t645) (occupies schedule_full375 t646) (occupies schedule_full375 t647)
    (occupies schedule_full375 t648) (occupies schedule_full375 t649) (occupies schedule_full375 t650)
    (occupies schedule_full375 t651) (occupies schedule_full375 t652) (occupies schedule_full375 t653)
    (occupies schedule_full375 t654) (occupies schedule_full375 t655) (occupies schedule_full375 t656)
    (occupies schedule_full375 t657) (occupies schedule_full375 t658) (occupies schedule_full375 t659)
    (occupies schedule_full375 t660) (occupies schedule_full375 t661) (occupies schedule_full375 t662)
    (occupies schedule_full375 t663) (occupies schedule_full375 t664) (occupies schedule_full375 t665)
    (occupies schedule_full375 t666) (occupies schedule_full375 t667) (occupies schedule_full375 t668)
    (occupies schedule_full375 t669) (occupies schedule_full375 t670) (occupies schedule_full375 t671)
    (occupies schedule_full375 t672) (occupies schedule_full375 t673) (occupies schedule_full375 t674)
    (occupies schedule_full375 t675) (occupies schedule_full375 t676) (occupies schedule_full375 t677)
    (occupies schedule_full375 t678) (occupies schedule_full375 t679) (occupies schedule_full375 t680)
    (occupies schedule_full375 t681) (occupies schedule_full375 t682) (occupies schedule_full375 t683)
    (occupies schedule_full375 t684) (occupies schedule_full375 t685) (occupies schedule_full375 t686)
    (occupies schedule_full375 t687) (occupies schedule_full375 t688) (occupies schedule_full375 t689)
    (occupies schedule_full375 t690) (occupies schedule_full375 t691) (occupies schedule_full375 t692)
    (occupies schedule_full375 t693) (occupies schedule_full375 t694) (occupies schedule_full375 t695)
    (occupies schedule_full375 t696) (occupies schedule_full375 t697) (occupies schedule_full375 t698)
    (occupies schedule_full375 t699) (occupies schedule_full375 t700) (occupies schedule_full375 t701)
    (occupies schedule_full375 t702) (occupies schedule_full375 t703) (occupies schedule_full375 t704)
    (occupies schedule_full375 t705) (occupies schedule_full375 t706) (occupies schedule_full375 t707)
    (occupies schedule_full375 t708) (occupies schedule_full375 t709) (occupies schedule_full375 t710)
    (occupies schedule_full375 t711) (occupies schedule_full375 t712) (occupies schedule_full375 t713)
    (occupies schedule_full375 t714) (occupies schedule_full375 t715) (occupies schedule_full375 t716)
    (occupies schedule_full375 t717) (occupies schedule_full375 t718) (occupies schedule_full375 t719)
    (occupies schedule_full375 t720) (occupies schedule_full375 t721) (occupies schedule_full375 t722)
    (occupies schedule_full375 t723) (occupies schedule_full375 t724) (occupies schedule_full375 t725)
    (occupies schedule_full375 t726) (occupies schedule_full375 t727) (occupies schedule_full375 t728)
    (occupies schedule_full375 t729) (occupies schedule_full375 t730) (occupies schedule_full375 t731)
    (occupies schedule_full375 t732) (occupies schedule_full375 t733) (occupies schedule_full375 t734)
    (occupies schedule_full375 t735) (occupies schedule_full375 t736) (occupies schedule_full375 t737)
    (occupies schedule_full375 t738) (occupies schedule_full375 t739) (occupies schedule_full375 t740)
    (occupies schedule_full375 t741) (occupies schedule_full375 t742) (occupies schedule_full375 t743)
    (occupies schedule_full375 t744) (occupies schedule_full375 t745) (occupies schedule_full375 t746)
    (occupies schedule_full375 t747) (occupies schedule_full375 t748) (occupies schedule_full375 t749)

    ;; Auditor-validated meeting-coverage facts (contiguous occupancy within availability)
    (meeting-coverage-valid schedule_early105)
    (meeting-coverage-valid schedule_full375)
  )

  (:goal (and (met-ronald) (selected schedule_full375)))
)