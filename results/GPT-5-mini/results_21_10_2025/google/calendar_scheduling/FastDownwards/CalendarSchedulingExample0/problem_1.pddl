(define (problem schedule-meeting-monday)
  (:domain schedule-meeting)
  (:objects
    ; time objects: minute-resolution start times from 9:00 (540) through last allowed start 16:00 (960)
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
    t820 t821 t822 t823 t824 t825 t826 t827 t828 t829
    t830 t831 t832 t833 t834 t835 t836 t837 t838 t839
    t840 t841 t842 t843 t844 t845 t846 t847 t848 t849
    t850 t851 t852 t853 t854 t855 t856 t857 t858 t859
    t860 t861 t862 t863 t864 t865 t866 t867 t868 t869
    t870 t871 t872 t873 t874 t875 t876 t877 t878 t879
    t880 t881 t882 t883 t884 t885 t886 t887 t888 t889
    t890 t891 t892 t893 t894 t895 t896 t897 t898 t899
    t900 t901 t902 t903 t904 t905 t906 t907 t908 t909
    t910 t911 t912 t913 t914 t915 t916 t917 t918 t919
    t920 t921 t922 t923 t924 t925 t926 t927 t928 t929
    t930 t931 t932 t933 t934 t935 t936 t937 t938 t939
    t940 t941 t942 t943 t944 t945 t946 t947 t948 t949
    t950 t951 t952 t953 t954 t955 t956 t957 t958 t959
    t960 - time

    michelle steven jerry - person
  )

  (:init
    ; Forbidden start times for Michelle (busy 11:00-12:00 => 660-720)
    ; forbid starts s such that [s, s+60) overlaps [660,720) -> s in 601..719
    (forbidden michelle t601) (forbidden michelle t602) (forbidden michelle t603) (forbidden michelle t604)
    (forbidden michelle t605) (forbidden michelle t606) (forbidden michelle t607) (forbidden michelle t608)
    (forbidden michelle t609) (forbidden michelle t610) (forbidden michelle t611) (forbidden michelle t612)
    (forbidden michelle t613) (forbidden michelle t614) (forbidden michelle t615) (forbidden michelle t616)
    (forbidden michelle t617) (forbidden michelle t618) (forbidden michelle t619) (forbidden michelle t620)
    (forbidden michelle t621) (forbidden michelle t622) (forbidden michelle t623) (forbidden michelle t624)
    (forbidden michelle t625) (forbidden michelle t626) (forbidden michelle t627) (forbidden michelle t628)
    (forbidden michelle t629) (forbidden michelle t630) (forbidden michelle t631) (forbidden michelle t632)
    (forbidden michelle t633) (forbidden michelle t634) (forbidden michelle t635) (forbidden michelle t636)
    (forbidden michelle t637) (forbidden michelle t638) (forbidden michelle t639) (forbidden michelle t640)
    (forbidden michelle t641) (forbidden michelle t642) (forbidden michelle t643) (forbidden michelle t644)
    (forbidden michelle t645) (forbidden michelle t646) (forbidden michelle t647) (forbidden michelle t648)
    (forbidden michelle t649) (forbidden michelle t650) (forbidden michelle t651) (forbidden michelle t652)
    (forbidden michelle t653) (forbidden michelle t654) (forbidden michelle t655) (forbidden michelle t656)
    (forbidden michelle t657) (forbidden michelle t658) (forbidden michelle t659) (forbidden michelle t660)
    (forbidden michelle t661) (forbidden michelle t662) (forbidden michelle t663) (forbidden michelle t664)
    (forbidden michelle t665) (forbidden michelle t666) (forbidden michelle t667) (forbidden michelle t668)
    (forbidden michelle t669) (forbidden michelle t670) (forbidden michelle t671) (forbidden michelle t672)
    (forbidden michelle t673) (forbidden michelle t674) (forbidden michelle t675) (forbidden michelle t676)
    (forbidden michelle t677) (forbidden michelle t678) (forbidden michelle t679) (forbidden michelle t680)
    (forbidden michelle t681) (forbidden michelle t682) (forbidden michelle t683) (forbidden michelle t684)
    (forbidden michelle t685) (forbidden michelle t686) (forbidden michelle t687) (forbidden michelle t688)
    (forbidden michelle t689) (forbidden michelle t690) (forbidden michelle t691) (forbidden michelle t692)
    (forbidden michelle t693) (forbidden michelle t694) (forbidden michelle t695) (forbidden michelle t696)
    (forbidden michelle t697) (forbidden michelle t698) (forbidden michelle t699) (forbidden michelle t700)
    (forbidden michelle t701) (forbidden michelle t702) (forbidden michelle t703) (forbidden michelle t704)
    (forbidden michelle t705) (forbidden michelle t706) (forbidden michelle t707) (forbidden michelle t708)
    (forbidden michelle t709) (forbidden michelle t710) (forbidden michelle t711) (forbidden michelle t712)
    (forbidden michelle t713) (forbidden michelle t714) (forbidden michelle t715) (forbidden michelle t716)
    (forbidden michelle t717) (forbidden michelle t718) (forbidden michelle t719)

    ; Forbidden start times for Steven:
    ; Busy: 09:00-09:30 (540-570) => forbid 540..569
    ;       11:30-12:00 (690-720) => forbid 631..719
    ;       13:30-14:00 (810-840) => forbid 751..839
    ;       15:30-16:00 (930-960) => forbid 871..959

    (forbidden steven t540) (forbidden steven t541) (forbidden steven t542) (forbidden steven t543)
    (forbidden steven t544) (forbidden steven t545) (forbidden steven t546) (forbidden steven t547)
    (forbidden steven t548) (forbidden steven t549) (forbidden steven t550) (forbidden steven t551)
    (forbidden steven t552) (forbidden steven t553) (forbidden steven t554) (forbidden steven t555)
    (forbidden steven t556) (forbidden steven t557) (forbidden steven t558) (forbidden steven t559)
    (forbidden steven t560) (forbidden steven t561) (forbidden steven t562) (forbidden steven t563)
    (forbidden steven t564) (forbidden steven t565) (forbidden steven t566) (forbidden steven t567)
    (forbidden steven t568) (forbidden steven t569)

    (forbidden steven t631) (forbidden steven t632) (forbidden steven t633) (forbidden steven t634)
    (forbidden steven t635) (forbidden steven t636) (forbidden steven t637) (forbidden steven t638)
    (forbidden steven t639) (forbidden steven t640) (forbidden steven t641) (forbidden steven t642)
    (forbidden steven t643) (forbidden steven t644) (forbidden steven t645) (forbidden steven t646)
    (forbidden steven t647) (forbidden steven t648) (forbidden steven t649) (forbidden steven t650)
    (forbidden steven t651) (forbidden steven t652) (forbidden steven t653) (forbidden steven t654)
    (forbidden steven t655) (forbidden steven t656) (forbidden steven t657) (forbidden steven t658)
    (forbidden steven t659) (forbidden steven t660) (forbidden steven t661) (forbidden steven t662)
    (forbidden steven t663) (forbidden steven t664) (forbidden steven t665) (forbidden steven t666)
    (forbidden steven t667) (forbidden steven t668) (forbidden steven t669) (forbidden steven t670)
    (forbidden steven t671) (forbidden steven t672) (forbidden steven t673) (forbidden steven t674)
    (forbidden steven t675) (forbidden steven t676) (forbidden steven t677) (forbidden steven t678)
    (forbidden steven t679) (forbidden steven t680) (forbidden steven t681) (forbidden steven t682)
    (forbidden steven t683) (forbidden steven t684) (forbidden steven t685) (forbidden steven t686)
    (forbidden steven t687) (forbidden steven t688) (forbidden steven t689) (forbidden steven t690)
    (forbidden steven t691) (forbidden steven t692) (forbidden steven t693) (forbidden steven t694)
    (forbidden steven t695) (forbidden steven t696) (forbidden steven t697) (forbidden steven t698)
    (forbidden steven t699) (forbidden steven t700) (forbidden steven t701) (forbidden steven t702)
    (forbidden steven t703) (forbidden steven t704) (forbidden steven t705) (forbidden steven t706)
    (forbidden steven t707) (forbidden steven t708) (forbidden steven t709) (forbidden steven t710)
    (forbidden steven t711) (forbidden steven t712) (forbidden steven t713) (forbidden steven t714)
    (forbidden steven t715) (forbidden steven t716) (forbidden steven t717) (forbidden steven t718)
    (forbidden steven t719)

    (forbidden steven t751) (forbidden steven t752) (forbidden steven t753) (forbidden steven t754)
    (forbidden steven t755) (forbidden steven t756) (forbidden steven t757) (forbidden steven t758)
    (forbidden steven t759) (forbidden steven t760) (forbidden steven t761) (forbidden steven t762)
    (forbidden steven t763) (forbidden steven t764) (forbidden steven t765) (forbidden steven t766)
    (forbidden steven t767) (forbidden steven t768) (forbidden steven t769) (forbidden steven t770)
    (forbidden steven t771) (forbidden steven t772) (forbidden steven t773) (forbidden steven t774)
    (forbidden steven t775) (forbidden steven t776) (forbidden steven t777) (forbidden steven t778)
    (forbidden steven t779) (forbidden steven t780) (forbidden steven t781) (forbidden steven t782)
    (forbidden steven t783) (forbidden steven t784) (forbidden steven t785) (forbidden steven t786)
    (forbidden steven t787) (forbidden steven t788) (forbidden steven t789) (forbidden steven t790)
    (forbidden steven t791) (forbidden steven t792) (forbidden steven t793) (forbidden steven t794)
    (forbidden steven t795) (forbidden steven t796) (forbidden steven t797) (forbidden steven t798)
    (forbidden steven t799) (forbidden steven t800) (forbidden steven t801) (forbidden steven t802)
    (forbidden steven t803) (forbidden steven t804) (forbidden steven t805) (forbidden steven t806)
    (forbidden steven t807) (forbidden steven t808) (forbidden steven t809) (forbidden steven t810)
    (forbidden steven t811) (forbidden steven t812) (forbidden steven t813) (forbidden steven t814)
    (forbidden steven t815) (forbidden steven t816) (forbidden steven t817) (forbidden steven t818)
    (forbidden steven t819) (forbidden steven t820) (forbidden steven t821) (forbidden steven t822)
    (forbidden steven t823) (forbidden steven t824) (forbidden steven t825) (forbidden steven t826)
    (forbidden steven t827) (forbidden steven t828) (forbidden steven t829) (forbidden steven t830)
    (forbidden steven t831) (forbidden steven t832) (forbidden steven t833) (forbidden steven t834)
    (forbidden steven t835) (forbidden steven t836) (forbidden steven t837) (forbidden steven t838)
    (forbidden steven t839)

    (forbidden steven t871) (forbidden steven t872) (forbidden steven t873) (forbidden steven t874)
    (forbidden steven t875) (forbidden steven t876) (forbidden steven t877) (forbidden steven t878)
    (forbidden steven t879) (forbidden steven t880) (forbidden steven t881) (forbidden steven t882)
    (forbidden steven t883) (forbidden steven t884) (forbidden steven t885) (forbidden steven t886)
    (forbidden steven t887) (forbidden steven t888) (forbidden steven t889) (forbidden steven t890)
    (forbidden steven t891) (forbidden steven t892) (forbidden steven t893) (forbidden steven t894)
    (forbidden steven t895) (forbidden steven t896) (forbidden steven t897) (forbidden steven t898)
    (forbidden steven t899) (forbidden steven t900) (forbidden steven t901) (forbidden steven t902)
    (forbidden steven t903) (forbidden steven t904) (forbidden steven t905) (forbidden steven t906)
    (forbidden steven t907) (forbidden steven t908) (forbidden steven t909) (forbidden steven t910)
    (forbidden steven t911) (forbidden steven t912) (forbidden steven t913) (forbidden steven t914)
    (forbidden steven t915) (forbidden steven t916) (forbidden steven t917) (forbidden steven t918)
    (forbidden steven t919) (forbidden steven t920) (forbidden steven t921) (forbidden steven t922)
    (forbidden steven t923) (forbidden steven t924) (forbidden steven t925) (forbidden steven t926)
    (forbidden steven t927) (forbidden steven t928) (forbidden steven t929) (forbidden steven t930)
    (forbidden steven t931) (forbidden steven t932) (forbidden steven t933) (forbidden steven t934)
    (forbidden steven t935) (forbidden steven t936) (forbidden steven t937) (forbidden steven t938)
    (forbidden steven t939) (forbidden steven t940) (forbidden steven t941) (forbidden steven t942)
    (forbidden steven t943) (forbidden steven t944) (forbidden steven t945) (forbidden steven t946)
    (forbidden steven t947) (forbidden steven t948) (forbidden steven t949) (forbidden steven t950)
    (forbidden steven t951) (forbidden steven t952) (forbidden steven t953) (forbidden steven t954)
    (forbidden steven t955) (forbidden steven t956) (forbidden steven t957) (forbidden steven t958)
    (forbidden steven t959)

    ; Forbidden start times for Jerry:
    ; Busy: 09:00-09:30 (540-570) => forbid 540..569
    ;       10:00-11:00 (600-660) => forbid 541..659
    ;       11:30-12:30 (690-750) => forbid 631..749
    ;       13:00-14:30 (780-870) => forbid 721..869
    ;       15:30-16:00 (930-960) => forbid 871..959
    ;       16:30-17:00 (990-1020) => forbid 931..960 (intersecting our start range up to 960)
    ; Combined (in domain 540..960) Jerry forbids 540..869 and 871..960, leaving only t870 allowed.

    (forbidden jerry t540) (forbidden jerry t541) (forbidden jerry t542) (forbidden jerry t543)
    (forbidden jerry t544) (forbidden jerry t545) (forbidden jerry t546) (forbidden jerry t547)
    (forbidden jerry t548) (forbidden jerry t549) (forbidden jerry t550) (forbidden jerry t551)
    (forbidden jerry t552) (forbidden jerry t553) (forbidden jerry t554) (forbidden jerry t555)
    (forbidden jerry t556) (forbidden jerry t557) (forbidden jerry t558) (forbidden jerry t559)
    (forbidden jerry t560) (forbidden jerry t561) (forbidden jerry t562) (forbidden jerry t563)
    (forbidden jerry t564) (forbidden jerry t565) (forbidden jerry t566) (forbidden jerry t567)
    (forbidden jerry t568) (forbidden jerry t569) (forbidden jerry t570) (forbidden jerry t571)
    (forbidden jerry t572) (forbidden jerry t573) (forbidden jerry t574) (forbidden jerry t575)
    (forbidden jerry t576) (forbidden jerry t577) (forbidden jerry t578) (forbidden jerry t579)
    (forbidden jerry t580) (forbidden jerry t581) (forbidden jerry t582) (forbidden jerry t583)
    (forbidden jerry t584) (forbidden jerry t585) (forbidden jerry t586) (forbidden jerry t587)
    (forbidden jerry t588) (forbidden jerry t589) (forbidden jerry t590) (forbidden jerry t591)
    (forbidden jerry t592) (forbidden jerry t593) (forbidden jerry t594) (forbidden jerry t595)
    (forbidden jerry t596) (forbidden jerry t597) (forbidden jerry t598) (forbidden jerry t599)
    (forbidden jerry t600) (forbidden jerry t601) (forbidden jerry t602) (forbidden jerry t603)
    (forbidden jerry t604) (forbidden jerry t605) (forbidden jerry t606) (forbidden jerry t607)
    (forbidden jerry t608) (forbidden jerry t609) (forbidden jerry t610) (forbidden jerry t611)
    (forbidden jerry t612) (forbidden jerry t613) (forbidden jerry t614) (forbidden jerry t615)
    (forbidden jerry t616) (forbidden jerry t617) (forbidden jerry t618) (forbidden jerry t619)
    (forbidden jerry t620) (forbidden jerry t621) (forbidden jerry t622) (forbidden jerry t623)
    (forbidden jerry t624) (forbidden jerry t625) (forbidden jerry t626) (forbidden jerry t627)
    (forbidden jerry t628) (forbidden jerry t629) (forbidden jerry t630) (forbidden jerry t631)
    (forbidden jerry t632) (forbidden jerry t633) (forbidden jerry t634) (forbidden jerry t635)
    (forbidden jerry t636) (forbidden jerry t637) (forbidden jerry t638) (forbidden jerry t639)
    (forbidden jerry t640) (forbidden jerry t641) (forbidden jerry t642) (forbidden jerry t643)
    (forbidden jerry t644) (forbidden jerry t645) (forbidden jerry t646) (forbidden jerry t647)
    (forbidden jerry t648) (forbidden jerry t649) (forbidden jerry t650) (forbidden jerry t651)
    (forbidden jerry t652) (forbidden jerry t653) (forbidden jerry t654) (forbidden jerry t655)
    (forbidden jerry t656) (forbidden jerry t657) (forbidden jerry t658) (forbidden jerry t659)
    (forbidden jerry t660) (forbidden jerry t661) (forbidden jerry t662) (forbidden jerry t663)
    (forbidden jerry t664) (forbidden jerry t665) (forbidden jerry t666) (forbidden jerry t667)
    (forbidden jerry t668) (forbidden jerry t669) (forbidden jerry t670) (forbidden jerry t671)
    (forbidden jerry t672) (forbidden jerry t673) (forbidden jerry t674) (forbidden jerry t675)
    (forbidden jerry t676) (forbidden jerry t677) (forbidden jerry t678) (forbidden jerry t679)
    (forbidden jerry t680) (forbidden jerry t681) (forbidden jerry t682) (forbidden jerry t683)
    (forbidden jerry t684) (forbidden jerry t685) (forbidden jerry t686) (forbidden jerry t687)
    (forbidden jerry t688) (forbidden jerry t689) (forbidden jerry t690) (forbidden jerry t691)
    (forbidden jerry t692) (forbidden jerry t693) (forbidden jerry t694) (forbidden jerry t695)
    (forbidden jerry t696) (forbidden jerry t697) (forbidden jerry t698) (forbidden jerry t699)
    (forbidden jerry t700) (forbidden jerry t701) (forbidden jerry t702) (forbidden jerry t703)
    (forbidden jerry t704) (forbidden jerry t705) (forbidden jerry t706) (forbidden jerry t707)
    (forbidden jerry t708) (forbidden jerry t709) (forbidden jerry t710) (forbidden jerry t711)
    (forbidden jerry t712) (forbidden jerry t713) (forbidden jerry t714) (forbidden jerry t715)
    (forbidden jerry t716) (forbidden jerry t717) (forbidden jerry t718) (forbidden jerry t719)
    (forbidden jerry t720) (forbidden jerry t721) (forbidden jerry t722) (forbidden jerry t723)
    (forbidden jerry t724) (forbidden jerry t725) (forbidden jerry t726) (forbidden jerry t727)
    (forbidden jerry t728) (forbidden jerry t729) (forbidden jerry t730) (forbidden jerry t731)
    (forbidden jerry t732) (forbidden jerry t733) (forbidden jerry t734) (forbidden jerry t735)
    (forbidden jerry t736) (forbidden jerry t737) (forbidden jerry t738) (forbidden jerry t739)
    (forbidden jerry t740) (forbidden jerry t741) (forbidden jerry t742) (forbidden jerry t743)
    (forbidden jerry t744) (forbidden jerry t745) (forbidden jerry t746) (forbidden jerry t747)
    (forbidden jerry t748) (forbidden jerry t749) (forbidden jerry t750) (forbidden jerry t751)
    (forbidden jerry t752) (forbidden jerry t753) (forbidden jerry t754) (forbidden jerry t755)
    (forbidden jerry t756) (forbidden jerry t757) (forbidden jerry t758) (forbidden jerry t759)
    (forbidden jerry t760) (forbidden jerry t761) (forbidden jerry t762) (forbidden jerry t763)
    (forbidden jerry t764) (forbidden jerry t765) (forbidden jerry t766) (forbidden jerry t767)
    (forbidden jerry t768) (forbidden jerry t769) (forbidden jerry t770) (forbidden jerry t771)
    (forbidden jerry t772) (forbidden jerry t773) (forbidden jerry t774) (forbidden jerry t775)
    (forbidden jerry t776) (forbidden jerry t777) (forbidden jerry t778) (forbidden jerry t779)
    (forbidden jerry t780) (forbidden jerry t781) (forbidden jerry t782) (forbidden jerry t783)
    (forbidden jerry t784) (forbidden jerry t785) (forbidden jerry t786) (forbidden jerry t787)
    (forbidden jerry t788) (forbidden jerry t789) (forbidden jerry t790) (forbidden jerry t791)
    (forbidden jerry t792) (forbidden jerry t793) (forbidden jerry t794) (forbidden jerry t795)
    (forbidden jerry t796) (forbidden jerry t797) (forbidden jerry t798) (forbidden jerry t799)
    (forbidden jerry t800) (forbidden jerry t801) (forbidden jerry t802) (forbidden jerry t803)
    (forbidden jerry t804) (forbidden jerry t805) (forbidden jerry t806) (forbidden jerry t807)
    (forbidden jerry t808) (forbidden jerry t809) (forbidden jerry t810) (forbidden jerry t811)
    (forbidden jerry t812) (forbidden jerry t813) (forbidden jerry t814) (forbidden jerry t815)
    (forbidden jerry t816) (forbidden jerry t817) (forbidden jerry t818) (forbidden jerry t819)
    (forbidden jerry t820) (forbidden jerry t821) (forbidden jerry t822) (forbidden jerry t823)
    (forbidden jerry t824) (forbidden jerry t825) (forbidden jerry t826) (forbidden jerry t827)
    (forbidden jerry t828) (forbidden jerry t829) (forbidden jerry t830) (forbidden jerry t831)
    (forbidden jerry t832) (forbidden jerry t833) (forbidden jerry t834) (forbidden jerry t835)
    (forbidden jerry t836) (forbidden jerry t837) (forbidden jerry t838) (forbidden jerry t839)
    (forbidden jerry t840) (forbidden jerry t841) (forbidden jerry t842) (forbidden jerry t843)
    (forbidden jerry t844) (forbidden jerry t845) (forbidden jerry t846) (forbidden jerry t847)
    (forbidden jerry t848) (forbidden jerry t849) (forbidden jerry t850) (forbidden jerry t851)
    (forbidden jerry t852) (forbidden jerry t853) (forbidden jerry t854) (forbidden jerry t855)
    (forbidden jerry t856) (forbidden jerry t857) (forbidden jerry t858) (forbidden jerry t859)
    (forbidden jerry t860) (forbidden jerry t861) (forbidden jerry t862) (forbidden jerry t863)
    (forbidden jerry t864) (forbidden jerry t865) (forbidden jerry t866) (forbidden jerry t867)
    (forbidden jerry t868) (forbidden jerry t869)

    (forbidden jerry t871) (forbidden jerry t872) (forbidden jerry t873) (forbidden jerry t874)
    (forbidden jerry t875) (forbidden jerry t876) (forbidden jerry t877) (forbidden jerry t878)
    (forbidden jerry t879) (forbidden jerry t880) (forbidden jerry t881) (forbidden jerry t882)
    (forbidden jerry t883) (forbidden jerry t884) (forbidden jerry t885) (forbidden jerry t886)
    (forbidden jerry t887) (forbidden jerry t888) (forbidden jerry t889) (forbidden jerry t890)
    (forbidden jerry t891) (forbidden jerry t892) (forbidden jerry t893) (forbidden jerry t894)
    (forbidden jerry t895) (forbidden jerry t896) (forbidden jerry t897) (forbidden jerry t898)
    (forbidden jerry t899) (forbidden jerry t900) (forbidden jerry t901) (forbidden jerry t902)
    (forbidden jerry t903) (forbidden jerry t904) (forbidden jerry t905) (forbidden jerry t906)
    (forbidden jerry t907) (forbidden jerry t908) (forbidden jerry t909) (forbidden jerry t910)
    (forbidden jerry t911) (forbidden jerry t912) (forbidden jerry t913) (forbidden jerry t914)
    (forbidden jerry t915) (forbidden jerry t916) (forbidden jerry t917) (forbidden jerry t918)
    (forbidden jerry t919) (forbidden jerry t920) (forbidden jerry t921) (forbidden jerry t922)
    (forbidden jerry t923) (forbidden jerry t924) (forbidden jerry t925) (forbidden jerry t926)
    (forbidden jerry t927) (forbidden jerry t928) (forbidden jerry t929) (forbidden jerry t930)
    (forbidden jerry t931) (forbidden jerry t932) (forbidden jerry t933) (forbidden jerry t934)
    (forbidden jerry t935) (forbidden jerry t936) (forbidden jerry t937) (forbidden jerry t938)
    (forbidden jerry t939) (forbidden jerry t940) (forbidden jerry t941) (forbidden jerry t942)
    (forbidden jerry t943) (forbidden jerry t944) (forbidden jerry t945) (forbidden jerry t946)
    (forbidden jerry t947) (forbidden jerry t948) (forbidden jerry t949) (forbidden jerry t950)
    (forbidden jerry t951) (forbidden jerry t952) (forbidden jerry t953) (forbidden jerry t954)
    (forbidden jerry t955) (forbidden jerry t956) (forbidden jerry t957) (forbidden jerry t958)
    (forbidden jerry t959) (forbidden jerry t960)

    ; No (scheduled) fact in the initial state: meeting not yet scheduled.
  )

  (:goal (scheduled))
)