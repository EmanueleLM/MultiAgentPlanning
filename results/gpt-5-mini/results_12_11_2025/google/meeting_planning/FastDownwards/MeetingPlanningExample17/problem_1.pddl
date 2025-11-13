(define (problem traveler-problem)
  (:domain traveler-domain)

  ;; Objects
  (:objects
    alamo_square sunset_district - location
    matthew - person

    ;; Timeslots: minute-by-minute from 09:00 (540) to 13:45 (825).
    ;; Names: t540 = 09:00, t541 = 09:01, ..., t825 = 13:45
    ;; (Only up to 13:45 is needed for the chosen plan: depart at 13:14 (t794), arrive 13:30 (t810), finish meet 13:45 (t825))
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
    t780 t781 t782 t783 t784 t785 t786 t787 t788 t789
    t790 t791 t792 t793 t794 t795 t796 t797 t798 t799
    t800 t801 t802 t803 t804 t805 t806 t807 t808 t809
    t810 t811 t812 t813 t814 t815 t816 t817 t818 t819
    t820 t821 t822 t823 t824 t825 - timeslot
  )

  (:init
    ;; Starting location: at Alamo Square at 09:00 (t540)
    (at alamo_square t540)

    ;; Travel-route encoding for the directed route:
    ;; Depart at t794 (13:14). The travel-route lists the 16 successive minute timeslots after departure:
    ;;  t795 (13:15), t796 (13:16), ... , t810 (13:30) where t810 is the arrival timeslot (the 16th successive slot).
    ;; This encodes a 16-minute directed travel time from alamo_square to sunset_district.
    (travel-route alamo_square sunset_district
                  t794
                  t795 t796 t797 t798 t799 t800 t801 t802 t803 t804
                  t805 t806 t807 t808 t809 t810)

    ;; Matthew's availability: present at Sunset District from 13:30 (t810) through at least 13:45 (t825).
    ;; We assert person-at for each minute in that interval to ensure any 15-minute meeting fully within 13:30–14:30 is permitted.
    (person-at matthew sunset_district t810)
    (person-at matthew sunset_district t811)
    (person-at matthew sunset_district t812)
    (person-at matthew sunset_district t813)
    (person-at matthew sunset_district t814)
    (person-at matthew sunset_district t815)
    (person-at matthew sunset_district t816)
    (person-at matthew sunset_district t817)
    (person-at matthew sunset_district t818)
    (person-at matthew sunset_district t819)
    (person-at matthew sunset_district t820)
    (person-at matthew sunset_district t821)
    (person-at matthew sunset_district t822)
    (person-at matthew sunset_district t823)
    (person-at matthew sunset_district t824)
    (person-at matthew sunset_district t825)

    ;; Next relations for every consecutive minute from 09:00 (t540) to 13:45 (t825).
    ;; These define the minute-by-minute timeline used by stay, travel, and meeting duration constraints.
    (next t540 t541) (next t541 t542) (next t542 t543) (next t543 t544) (next t544 t545)
    (next t545 t546) (next t546 t547) (next t547 t548) (next t548 t549) (next t549 t550)
    (next t550 t551) (next t551 t552) (next t552 t553) (next t553 t554) (next t554 t555)
    (next t555 t556) (next t556 t557) (next t557 t558) (next t558 t559) (next t559 t560)
    (next t560 t561) (next t561 t562) (next t562 t563) (next t563 t564) (next t564 t565)
    (next t565 t566) (next t566 t567) (next t567 t568) (next t568 t569) (next t569 t570)
    (next t570 t571) (next t571 t572) (next t572 t573) (next t573 t574) (next t574 t575)
    (next t575 t576) (next t576 t577) (next t577 t578) (next t578 t579) (next t579 t580)
    (next t580 t581) (next t581 t582) (next t582 t583) (next t583 t584) (next t584 t585)
    (next t585 t586) (next t586 t587) (next t587 t588) (next t588 t589) (next t589 t590)
    (next t590 t591) (next t591 t592) (next t592 t593) (next t593 t594) (next t594 t595)
    (next t595 t596) (next t596 t597) (next t597 t598) (next t598 t599) (next t599 t600)
    (next t600 t601) (next t601 t602) (next t602 t603) (next t603 t604) (next t604 t605)
    (next t605 t606) (next t606 t607) (next t607 t608) (next t608 t609) (next t609 t610)
    (next t610 t611) (next t611 t612) (next t612 t613) (next t613 t614) (next t614 t615)
    (next t615 t616) (next t616 t617) (next t617 t618) (next t618 t619) (next t619 t620)
    (next t620 t621) (next t621 t622) (next t622 t623) (next t623 t624) (next t624 t625)
    (next t625 t626) (next t626 t627) (next t627 t628) (next t628 t629) (next t629 t630)
    (next t630 t631) (next t631 t632) (next t632 t633) (next t633 t634) (next t634 t635)
    (next t635 t636) (next t636 t637) (next t637 t638) (next t638 t639) (next t639 t640)
    (next t640 t641) (next t641 t642) (next t642 t643) (next t643 t644) (next t644 t645)
    (next t645 t646) (next t646 t647) (next t647 t648) (next t648 t649) (next t649 t650)
    (next t650 t651) (next t651 t652) (next t652 t653) (next t653 t654) (next t654 t655)
    (next t655 t656) (next t656 t657) (next t657 t658) (next t658 t659) (next t659 t660)
    (next t660 t661) (next t661 t662) (next t662 t663) (next t663 t664) (next t664 t665)
    (next t665 t666) (next t666 t667) (next t667 t668) (next t668 t669) (next t669 t670)
    (next t670 t671) (next t671 t672) (next t672 t673) (next t673 t674) (next t674 t675)
    (next t675 t676) (next t676 t677) (next t677 t678) (next t678 t679) (next t679 t680)
    (next t680 t681) (next t681 t682) (next t682 t683) (next t683 t684) (next t684 t685)
    (next t685 t686) (next t686 t687) (next t687 t688) (next t688 t689) (next t689 t690)
    (next t690 t691) (next t691 t692) (next t692 t693) (next t693 t694) (next t694 t695)
    (next t695 t696) (next t696 t697) (next t697 t698) (next t698 t699) (next t699 t700)
    (next t700 t701) (next t701 t702) (next t702 t703) (next t703 t704) (next t704 t705)
    (next t705 t706) (next t706 t707) (next t707 t708) (next t708 t709) (next t709 t710)
    (next t710 t711) (next t711 t712) (next t712 t713) (next t713 t714) (next t714 t715)
    (next t715 t716) (next t716 t717) (next t717 t718) (next t718 t719) (next t719 t720)
    (next t720 t721) (next t721 t722) (next t722 t723) (next t723 t724) (next t724 t725)
    (next t725 t726) (next t726 t727) (next t727 t728) (next t728 t729) (next t729 t730)
    (next t730 t731) (next t731 t732) (next t732 t733) (next t733 t734) (next t734 t735)
    (next t735 t736) (next t736 t737) (next t737 t738) (next t738 t739) (next t739 t740)
    (next t740 t741) (next t741 t742) (next t742 t743) (next t743 t744) (next t744 t745)
    (next t745 t746) (next t746 t747) (next t747 t748) (next t748 t749) (next t749 t750)
    (next t750 t751) (next t751 t752) (next t752 t753) (next t753 t754) (next t754 t755)
    (next t755 t756) (next t756 t757) (next t757 t758) (next t758 t759) (next t759 t760)
    (next t760 t761) (next t761 t762) (next t762 t763) (next t763 t764) (next t764 t765)
    (next t765 t766) (next t766 t767) (next t767 t768) (next t768 t769) (next t769 t770)
    (next t770 t771) (next t771 t772) (next t772 t773) (next t773 t774) (next t774 t775)
    (next t775 t776) (next t776 t777) (next t777 t778) (next t778 t779) (next t779 t780)
    (next t780 t781) (next t781 t782) (next t782 t783) (next t783 t784) (next t784 t785)
    (next t785 t786) (next t786 t787) (next t787 t788) (next t788 t789) (next t789 t790)
    (next t790 t791) (next t791 t792) (next t792 t793) (next t793 t794) (next t794 t795)
    (next t795 t796) (next t796 t797) (next t797 t798) (next t798 t799) (next t799 t800)
    (next t800 t801) (next t801 t802) (next t802 t803) (next t803 t804) (next t804 t805)
    (next t805 t806) (next t806 t807) (next t807 t808) (next t808 t809) (next t809 t810)
    (next t810 t811) (next t811 t812) (next t812 t813) (next t813 t814) (next t814 t815)
    (next t815 t816) (next t816 t817) (next t817 t818) (next t818 t819) (next t819 t820)
    (next t820 t821) (next t821 t822) (next t822 t823) (next t823 t824) (next t824 t825)
  )

  ;; Goal: meet Matthew (the planner must produce a plan that results in (met matthew)).
  ;; The problem enforces: start at alamo_square at 09:00; the only available directed travel
  ;; route to Matthew departs at t794 and takes 16 minutes to arrive at t810; Matthew is present
  ;; at Sunset District at times t810..t825, so any 15-minute meeting must be scheduled within that window.
  (:goal (met matthew))
)