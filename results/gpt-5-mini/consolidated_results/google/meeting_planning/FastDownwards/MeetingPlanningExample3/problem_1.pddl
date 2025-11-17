(define (problem MeetingPlanningExample3-problem)
  (:domain MeetingPlanningExample3)

  ;; Objects: times from 09:00 (540)..11:30 (690), meeting counters m0..m90
  (:objects
    ; locations and person are declared in the domain as constants
    ; times minute_540 .. minute_690
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
    t690
    ; meeting-count markers
    m0 m1 m2 m3 m4 m5 m6 m7 m8 m9
    m10 m11 m12 m13 m14 m15 m16 m17 m18 m19
    m20 m21 m22 m23 m24 m25 m26 m27 m28 m29
    m30 m31 m32 m33 m34 m35 m36 m37 m38 m39
    m40 m41 m42 m43 m44 m45 m46 m47 m48 m49
    m50 m51 m52 m53 m54 m55 m56 m57 m58 m59
    m60 m61 m62 m63 m64 m65 m66 m67 m68 m69
    m70 m71 m72 m73 m74 m75 m76 m77 m78 m79
    m80 m81 m82 m83 m84 m85 m86 m87 m88 m89
    m90
  )

  (:init
    ;; initial location and time
    (at Bayview)
    (now t540)                 ; 09:00 is current time

    ;; person Barbara is at Golden Gate Park (static)
    (at-person barbara GoldenGatePark)

    ;; initial meeting progress: zero minutes met
    (have-met m0)

    ;; nextmet progression m0->m1 ... m89->m90
    (nextmet m0 m1) (nextmet m1 m2) (nextmet m2 m3) (nextmet m3 m4) (nextmet m4 m5)
    (nextmet m5 m6) (nextmet m6 m7) (nextmet m7 m8) (nextmet m8 m9) (nextmet m9 m10)
    (nextmet m10 m11) (nextmet m11 m12) (nextmet m12 m13) (nextmet m13 m14) (nextmet m14 m15)
    (nextmet m15 m16) (nextmet m16 m17) (nextmet m17 m18) (nextmet m18 m19) (nextmet m19 m20)
    (nextmet m20 m21) (nextmet m21 m22) (nextmet m22 m23) (nextmet m23 m24) (nextmet m24 m25)
    (nextmet m25 m26) (nextmet m26 m27) (nextmet m27 m28) (nextmet m28 m29) (nextmet m29 m30)
    (nextmet m30 m31) (nextmet m31 m32) (nextmet m32 m33) (nextmet m33 m34) (nextmet m34 m35)
    (nextmet m35 m36) (nextmet m36 m37) (nextmet m37 m38) (nextmet m38 m39) (nextmet m39 m40)
    (nextmet m40 m41) (nextmet m41 m42) (nextmet m42 m43) (nextmet m43 m44) (nextmet m44 m45)
    (nextmet m45 m46) (nextmet m46 m47) (nextmet m47 m48) (nextmet m48 m49) (nextmet m49 m50)
    (nextmet m50 m51) (nextmet m51 m52) (nextmet m52 m53) (nextmet m53 m54) (nextmet m54 m55)
    (nextmet m55 m56) (nextmet m56 m57) (nextmet m57 m58) (nextmet m58 m59) (nextmet m59 m60)
    (nextmet m60 m61) (nextmet m61 m62) (nextmet m62 m63) (nextmet m63 m64) (nextmet m64 m65)
    (nextmet m65 m66) (nextmet m66 m67) (nextmet m67 m68) (nextmet m68 m69) (nextmet m69 m70)
    (nextmet m70 m71) (nextmet m71 m72) (nextmet m72 m73) (nextmet m73 m74) (nextmet m74 m75)
    (nextmet m75 m76) (nextmet m76 m77) (nextmet m77 m78) (nextmet m78 m79) (nextmet m79 m80)
    (nextmet m80 m81) (nextmet m81 m82) (nextmet m82 m83) (nextmet m83 m84) (nextmet m84 m85)
    (nextmet m85 m86) (nextmet m86 m87) (nextmet m87 m88) (nextmet m88 m89) (nextmet m89 m90)

    ;; plus1 relations for minute-by-minute progression (t540->t541 ... t689->t690)
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
    (plus1 t660 t661) (plus1 t661 t662) (plus1 t662 t663) (plus1 t663 t664) (plus1 t664 t665)
    (plus1 t665 t666) (plus1 t666 t667) (plus1 t667 t668) (plus1 t668 t669) (plus1 t669 t670)
    (plus1 t670 t671) (plus1 t671 t672) (plus1 t672 t673) (plus1 t673 t674) (plus1 t674 t675)
    (plus1 t675 t676) (plus1 t676 t677) (plus1 t677 t678) (plus1 t678 t679) (plus1 t679 t680)
    (plus1 t680 t681) (plus1 t681 t682) (plus1 t682 t683) (plus1 t683 t684) (plus1 t684 t685)
    (plus1 t685 t686) (plus1 t686 t687) (plus1 t687 t688) (plus1 t688 t689) (plus1 t689 t690)

    ;; plus22 pairs (t -> t+22) so move Bayview->GGP can be a single action
    (plus22 t540 t562) (plus22 t541 t563) (plus22 t542 t564) (plus22 t543 t565) (plus22 t544 t566)
    (plus22 t545 t567) (plus22 t546 t568) (plus22 t547 t569) (plus22 t548 t570) (plus22 t549 t571)
    (plus22 t550 t572) (plus22 t551 t573) (plus22 t552 t574) (plus22 t553 t575) (plus22 t554 t576)
    (plus22 t555 t577) (plus22 t556 t578) (plus22 t557 t579) (plus22 t558 t580) (plus22 t559 t581)
    (plus22 t560 t582) (plus22 t561 t583) (plus22 t562 t584) (plus22 t563 t585) (plus22 t564 t586)
    (plus22 t565 t587) (plus22 t566 t588) (plus22 t567 t589) (plus22 t568 t590) (plus22 t569 t591)
    (plus22 t570 t592) (plus22 t571 t593) (plus22 t572 t594) (plus22 t573 t595) (plus22 t574 t596)
    (plus22 t575 t597) (plus22 t576 t598) (plus22 t577 t599) (plus22 t578 t600) (plus22 t579 t601)
    (plus22 t580 t602) (plus22 t581 t603) (plus22 t582 t604) (plus22 t583 t605) (plus22 t584 t606)
    (plus22 t585 t607) (plus22 t586 t608) (plus22 t587 t609) (plus22 t588 t610) (plus22 t589 t611)
    (plus22 t590 t612) (plus22 t591 t613) (plus22 t592 t614) (plus22 t593 t615) (plus22 t594 t616)
    (plus22 t595 t617) (plus22 t596 t618) (plus22 t597 t619) (plus22 t598 t620) (plus22 t599 t621)
    (plus22 t600 t622) (plus22 t601 t623) (plus22 t602 t624) (plus22 t603 t625) (plus22 t604 t626)
    (plus22 t605 t627) (plus22 t606 t628) (plus22 t607 t629) (plus22 t608 t630) (plus22 t609 t631)
    (plus22 t610 t632) (plus22 t611 t633) (plus22 t612 t634) (plus22 t613 t635) (plus22 t614 t636)
    (plus22 t615 t637) (plus22 t616 t638) (plus22 t617 t639) (plus22 t618 t640) (plus22 t619 t641)
    (plus22 t620 t642) (plus22 t621 t643) (plus22 t622 t644) (plus22 t623 t645) (plus22 t624 t646)
    (plus22 t625 t647) (plus22 t626 t648) (plus22 t627 t649) (plus22 t628 t650) (plus22 t629 t651)
    (plus22 t630 t652) (plus22 t631 t653) (plus22 t632 t654) (plus22 t633 t655) (plus22 t634 t656)
    (plus22 t635 t657) (plus22 t636 t658) (plus22 t637 t659) (plus22 t638 t660) (plus22 t639 t661)
    (plus22 t640 t662) (plus22 t641 t663) (plus22 t642 t664) (plus22 t643 t665) (plus22 t644 t666)
    (plus22 t645 t667) (plus22 t646 t668) (plus22 t647 t669) (plus22 t648 t670) (plus22 t649 t671)
    (plus22 t650 t672) (plus22 t651 t673) (plus22 t652 t674) (plus22 t653 t675) (plus22 t654 t676)
    (plus22 t655 t677) (plus22 t656 t678) (plus22 t657 t679) (plus22 t658 t680) (plus22 t659 t681)
    (plus22 t660 t682) (plus22 t661 t683) (plus22 t662 t684) (plus22 t663 t685) (plus22 t664 t686)
    (plus22 t665 t687) (plus22 t666 t688) (plus22 t667 t689) (plus22 t668 t690)

    ;; plus23 pairs (t -> t+23) for return move
    (plus23 t540 t563) (plus23 t541 t564) (plus23 t542 t565) (plus23 t543 t566) (plus23 t544 t567)
    (plus23 t545 t568) (plus23 t546 t569) (plus23 t547 t570) (plus23 t548 t571) (plus23 t549 t572)
    (plus23 t550 t573) (plus23 t551 t574) (plus23 t552 t575) (plus23 t553 t576) (plus23 t554 t577)
    (plus23 t555 t578) (plus23 t556 t579) (plus23 t557 t580) (plus23 t558 t581) (plus23 t559 t582)
    (plus23 t560 t583) (plus23 t561 t584) (plus23 t562 t585) (plus23 t563 t586) (plus23 t564 t587)
    (plus23 t565 t588) (plus23 t566 t589) (plus23 t567 t590) (plus23 t568 t591) (plus23 t569 t592)
    (plus23 t570 t593) (plus23 t571 t594) (plus23 t572 t595) (plus23 t573 t596) (plus23 t574 t597)
    (plus23 t575 t598) (plus23 t576 t599) (plus23 t577 t600) (plus23 t578 t601) (plus23 t579 t602)
    (plus23 t580 t603) (plus23 t581 t604) (plus23 t582 t605) (plus23 t583 t606) (plus23 t584 t607)
    (plus23 t585 t608) (plus23 t586 t609) (plus23 t587 t610) (plus23 t588 t611) (plus23 t589 t612)
    (plus23 t590 t613) (plus23 t591 t614) (plus23 t592 t615) (plus23 t593 t616) (plus23 t594 t617)
    (plus23 t595 t618) (plus23 t596 t619) (plus23 t597 t620) (plus23 t598 t621) (plus23 t599 t622)
    (plus23 t600 t623) (plus23 t601 t624) (plus23 t602 t625) (plus23 t603 t626) (plus23 t604 t627)
    (plus23 t605 t628) (plus23 t606 t629) (plus23 t607 t630) (plus23 t608 t631) (plus23 t609 t632)
    (plus23 t610 t633) (plus23 t611 t634) (plus23 t612 t635) (plus23 t613 t636) (plus23 t614 t637)
    (plus23 t615 t638) (plus23 t616 t639) (plus23 t617 t640) (plus23 t618 t641) (plus23 t619 t642)
    (plus23 t620 t643) (plus23 t621 t644) (plus23 t622 t645) (plus23 t623 t646) (plus23 t624 t647)
    (plus23 t625 t648) (plus23 t626 t649) (plus23 t627 t650) (plus23 t628 t651) (plus23 t629 t652)
    (plus23 t630 t653) (plus23 t631 t654) (plus23 t632 t655) (plus23 t633 t656) (plus23 t634 t657)
    (plus23 t635 t658) (plus23 t636 t659) (plus23 t637 t660) (plus23 t638 t661) (plus23 t639 t662)
    (plus23 t640 t663) (plus23 t641 t664) (plus23 t642 t665) (plus23 t643 t666) (plus23 t644 t667)
    (plus23 t645 t668) (plus23 t646 t669) (plus23 t647 t670) (plus23 t648 t671) (plus23 t649 t672)
    (plus23 t650 t673) (plus23 t651 t674) (plus23 t652 t675) (plus23 t653 t676) (plus23 t654 t677)
    (plus23 t655 t678) (plus23 t656 t679) (plus23 t657 t680) (plus23 t658 t681) (plus23 t659 t682)
    (plus23 t660 t683) (plus23 t661 t684) (plus23 t662 t685) (plus23 t663 t686) (plus23 t664 t687)
    (plus23 t665 t688) (plus23 t666 t689) (plus23 t667 t690)

    ;; allowed_meet: any minute t where a 1-minute meeting starting at t ends on or before 11:30 (t <= 11:29)
    ;; Since our times start at t540 (09:00) and go to t690 (11:30), allowed_meet is t540..t689 inclusive.
    (allowed_meet t540) (allowed_meet t541) (allowed_meet t542) (allowed_meet t543) (allowed_meet t544)
    (allowed_meet t545) (allowed_meet t546) (allowed_meet t547) (allowed_meet t548) (allowed_meet t549)
    (allowed_meet t550) (allowed_meet t551) (allowed_meet t552) (allowed_meet t553) (allowed_meet t554)
    (allowed_meet t555) (allowed_meet t556) (allowed_meet t557) (allowed_meet t558) (allowed_meet t559)
    (allowed_meet t560) (allowed_meet t561) (allowed_meet t562) (allowed_meet t563) (allowed_meet t564)
    (allowed_meet t565) (allowed_meet t566) (allowed_meet t567) (allowed_meet t568) (allowed_meet t569)
    (allowed_meet t570) (allowed_meet t571) (allowed_meet t572) (allowed_meet t573) (allowed_meet t574)
    (allowed_meet t575) (allowed_meet t576) (allowed_meet t577) (allowed_meet t578) (allowed_meet t579)
    (allowed_meet t580) (allowed_meet t581) (allowed_meet t582) (allowed_meet t583) (allowed_meet t584)
    (allowed_meet t585) (allowed_meet t586) (allowed_meet t587) (allowed_meet t588) (allowed_meet t589)
    (allowed_meet t590) (allowed_meet t591) (allowed_meet t592) (allowed_meet t593) (allowed_meet t594)
    (allowed_meet t595) (allowed_meet t596) (allowed_meet t597) (allowed_meet t598) (allowed_meet t599)
    (allowed_meet t600) (allowed_meet t601) (allowed_meet t602) (allowed_meet t603) (allowed_meet t604)
    (allowed_meet t605) (allowed_meet t606) (allowed_meet t607) (allowed_meet t608) (allowed_meet t609)
    (allowed_meet t610) (allowed_meet t611) (allowed_meet t612) (allowed_meet t613) (allowed_meet t614)
    (allowed_meet t615) (allowed_meet t616) (allowed_meet t617) (allowed_meet t618) (allowed_meet t619)
    (allowed_meet t620) (allowed_meet t621) (allowed_meet t622) (allowed_meet t623) (allowed_meet t624)
    (allowed_meet t625) (allowed_meet t626) (allowed_meet t627) (allowed_meet t628) (allowed_meet t629)
    (allowed_meet t630) (allowed_meet t631) (allowed_meet t632) (allowed_meet t633) (allowed_meet t634)
    (allowed_meet t635) (allowed_meet t636) (allowed_meet t637) (allowed_meet t638) (allowed_meet t639)
    (allowed_meet t640) (allowed_meet t641) (allowed_meet t642) (allowed_meet t643) (allowed_meet t644)
    (allowed_meet t645) (allowed_meet t646) (allowed_meet t647) (allowed_meet t648) (allowed_meet t649)
    (allowed_meet t650) (allowed_meet t651) (allowed_meet t652) (allowed_meet t653) (allowed_meet t654)
    (allowed_meet t655) (allowed_meet t656) (allowed_meet t657) (allowed_meet t658) (allowed_meet t659)
    (allowed_meet t660) (allowed_meet t661) (allowed_meet t662) (allowed_meet t663) (allowed_meet t664)
    (allowed_meet t665) (allowed_meet t666) (allowed_meet t667) (allowed_meet t668) (allowed_meet t669)
    (allowed_meet t670) (allowed_meet t671) (allowed_meet t672) (allowed_meet t673) (allowed_meet t674)
    (allowed_meet t675) (allowed_meet t676) (allowed_meet t677) (allowed_meet t678) (allowed_meet t679)
    (allowed_meet t680) (allowed_meet t681) (allowed_meet t682) (allowed_meet t683) (allowed_meet t684)
    (allowed_meet t685) (allowed_meet t686) (allowed_meet t687) (allowed_meet t688) (allowed_meet t689)

    ;; End of init
  )

  ;; Goal: accumulate at least 90 one-minute meeting increments (i.e., reach m90)
  (:goal (have-met m90))
)