(define (problem meet-barbara-problem)
  (:domain multiagent-travel)
  (:objects
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
    t960 t961 t962 t963 t964 t965 t966 t967 t968 t969
    t970 t971 t972 t973 t974 t975 t976 t977 t978 t979
    t980 t981 t982 t983 t984 t985 t986 t987 t988 t989
    t990 t991 t992 t993 t994 t995 t996 t997 t998 t999
    t1000 t1001 t1002 t1003 t1004 t1005 t1006 t1007 t1008 t1009
    t1010 t1011 t1012 t1013 t1014 t1015 t1016 t1017 t1018 t1019
    t1020 t1021 t1022 t1023 t1024 t1025 t1026 t1027 t1028 t1029
    t1030 t1031 t1032 t1033 t1034 t1035 t1036 t1037 t1038 t1039
    t1040 t1041 t1042 t1043 t1044 t1045 t1046 t1047 t1048 t1049
    t1050 t1051 t1052 t1053 t1054 t1055 t1056 t1057 t1058 t1059
    t1060 t1061 t1062 t1063 t1064 t1065 t1066 t1067 t1068 t1069
    t1070 t1071 t1072 t1073 t1074 t1075 t1076 t1077 t1078 t1079
    t1080 t1081 t1082 t1083 t1084 t1085 t1086 t1087 t1088 t1089
    t1090 t1091 t1092 t1093 t1094 t1095 t1096 t1097 t1098 t1099
    t1100 t1101 t1102 t1103 t1104 t1105 t1106 t1107 t1108 t1109
    t1110 t1111 t1112 t1113 t1114 t1115 t1116 t1117 t1118 t1119
    t1120 t1121 t1122 t1123 t1124 t1125 t1126 t1127 t1128 t1129
    t1130 t1131 t1132 t1133 t1134 t1135 t1136 t1137 t1138 t1139
    t1140 t1141 t1142 t1143 t1144 t1145 t1146 t1147 t1148 t1149
    t1150 t1151 t1152 t1153 t1154 t1155 t1156 t1157 t1158 t1159
    t1160 t1161 t1162 t1163 t1164 t1165 t1166 t1167 t1168 t1169
    t1170 t1171 t1172 t1173 t1174 t1175 t1176 t1177 t1178 t1179
    t1180 t1181 t1182 t1183 t1184 t1185 t1186 t1187 t1188 t1189
    t1190 t1191 t1192 t1193 t1194 t1195 t1196 t1197 t1198 t1199
    t1200
  )

  (:init
    (at traveler north-beach)
    (at barbara alamo-square)
    (now t540)

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
    (plus1 t690 t691) (plus1 t691 t692) (plus1 t692 t693) (plus1 t693 t694) (plus1 t694 t695)
    (plus1 t695 t696) (plus1 t696 t697) (plus1 t697 t698) (plus1 t698 t699) (plus1 t699 t700)
    (plus1 t700 t701) (plus1 t701 t702) (plus1 t702 t703) (plus1 t703 t704) (plus1 t704 t705)
    (plus1 t705 t706) (plus1 t706 t707) (plus1 t707 t708) (plus1 t708 t709) (plus1 t709 t710)
    (plus1 t710 t711) (plus1 t711 t712) (plus1 t712 t713) (plus1 t713 t714) (plus1 t714 t715)
    (plus1 t715 t716) (plus1 t716 t717) (plus1 t717 t718) (plus1 t718 t719) (plus1 t719 t720)
    (plus1 t720 t721) (plus1 t721 t722) (plus1 t722 t723) (plus1 t723 t724) (plus1 t724 t725)
    (plus1 t725 t726) (plus1 t726 t727) (plus1 t727 t728) (plus1 t728 t729) (plus1 t729 t730)
    (plus1 t730 t731) (plus1 t731 t732) (plus1 t732 t733) (plus1 t733 t734) (plus1 t734 t735)
    (plus1 t735 t736) (plus1 t736 t737) (plus1 t737 t738) (plus1 t738 t739) (plus1 t739 t740)
    (plus1 t740 t741) (plus1 t741 t742) (plus1 t742 t743) (plus1 t743 t744) (plus1 t744 t745)
    (plus1 t745 t746) (plus1 t746 t747) (plus1 t747 t748) (plus1 t748 t749) (plus1 t749 t750)
    (plus1 t750 t751) (plus1 t751 t752) (plus1 t752 t753) (plus1 t753 t754) (plus1 t754 t755)
    (plus1 t755 t756) (plus1 t756 t757) (plus1 t757 t758) (plus1 t758 t759) (plus1 t759 t760)
    (plus1 t760 t761) (plus1 t761 t762) (plus1 t762 t763) (plus1 t763 t764) (plus1 t764 t765)
    (plus1 t765 t766) (plus1 t766 t767) (plus1 t767 t768) (plus1 t768 t769) (plus1 t769 t770)
    (plus1 t770 t771) (plus1 t771 t772) (plus1 t772 t773) (plus1 t773 t774) (plus1 t774 t775)
    (plus1 t775 t776) (plus1 t776 t777) (plus1 t777 t778) (plus1 t778 t779) (plus1 t779 t780)
    (plus1 t780 t781) (plus1 t781 t782) (plus1 t782 t783) (plus1 t783 t784) (plus1 t784 t785)
    (plus1 t785 t786) (plus1 t786 t787) (plus1 t787 t788) (plus1 t788 t789) (plus1 t789 t790)
    (plus1 t790 t791) (plus1 t791 t792) (plus1 t792 t793) (plus1 t793 t794) (plus1 t794 t795)
    (plus1 t795 t796) (plus1 t796 t797) (plus1 t797 t798) (plus1 t798 t799) (plus1 t799 t800)
    (plus1 t800 t801) (plus1 t801 t802) (plus1 t802 t803) (plus1 t803 t804) (plus1 t804 t805)
    (plus1 t805 t806) (plus1 t806 t807) (plus1 t807 t808) (plus1 t808 t809) (plus1 t809 t810)
    (plus1 t810 t811) (plus1 t811 t812) (plus1 t812 t813) (plus1 t813 t814) (plus1 t814 t815)
    (plus1 t815 t816) (plus1 t816 t817) (plus1 t817 t818) (plus1 t818 t819) (plus1 t819 t820)
    (plus1 t820 t821) (plus1 t821 t822) (plus1 t822 t823) (plus1 t823 t824) (plus1 t824 t825)
    (plus1 t825 t826) (plus1 t826 t827) (plus1 t827 t828) (plus1 t828 t829) (plus1 t829 t830)
    (plus1 t830 t831) (plus1 t831 t832) (plus1 t832 t833) (plus1 t833 t834) (plus1 t834 t835)
    (plus1 t835 t836) (plus1 t836 t837) (plus1 t837 t838) (plus1 t838 t839) (plus1 t839 t840)
    (plus1 t840 t841) (plus1 t841 t842) (plus1 t842 t843) (plus1 t843 t844) (plus1 t844 t845)
    (plus1 t845 t846) (plus1 t846 t847) (plus1 t847 t848) (plus1 t848 t849) (plus1 t849 t850)
    (plus1 t850 t851) (plus1 t851 t852) (plus1 t852 t853) (plus1 t853 t854) (plus1 t854 t855)
    (plus1 t855 t856) (plus1 t856 t857) (plus1 t857 t858) (plus1 t858 t859) (plus1 t859 t860)
    (plus1 t860 t861) (plus1 t861 t862) (plus1 t862 t863) (plus1 t863 t864) (plus1 t864 t865)
    (plus1 t865 t866) (plus1 t866 t867) (plus1 t867 t868) (plus1 t868 t869) (plus1 t869 t870)
    (plus1 t870 t871) (plus1 t871 t872) (plus1 t872 t873) (plus1 t873 t874) (plus1 t874 t875)
    (plus1 t875 t876) (plus1 t876 t877) (plus1 t877 t878) (plus1 t878 t879) (plus1 t879 t880)
    (plus1 t880 t881) (plus1 t881 t882) (plus1 t882 t883) (plus1 t883 t884) (plus1 t884 t885)
    (plus1 t885 t886) (plus1 t886 t887) (plus1 t887 t888) (plus1 t888 t889) (plus1 t889 t890)
    (plus1 t890 t891) (plus1 t891 t892) (plus1 t892 t893) (plus1 t893 t894) (plus1 t894 t895)
    (plus1 t895 t896) (plus1 t896 t897) (plus1 t897 t898) (plus1 t898 t899) (plus1 t899 t900)
    (plus1 t900 t901) (plus1 t901 t902) (plus1 t902 t903) (plus1 t903 t904) (plus1 t904 t905)
    (plus1 t905 t906) (plus1 t906 t907) (plus1 t907 t908) (plus1 t908 t909) (plus1 t909 t910)
    (plus1 t910 t911) (plus1 t911 t912) (plus1 t912 t913) (plus1 t913 t914) (plus1 t914 t915)
    (plus1 t915 t916) (plus1 t916 t917) (plus1 t917 t918) (plus1 t918 t919) (plus1 t919 t920)
    (plus1 t920 t921) (plus1 t921 t922) (plus1 t922 t923) (plus1 t923 t924) (plus1 t924 t925)
    (plus1 t925 t926) (plus1 t926 t927) (plus1 t927 t928) (plus1 t928 t929) (plus1 t929 t930)
    (plus1 t930 t931) (plus1 t931 t932) (plus1 t932 t933) (plus1 t933 t934) (plus1 t934 t935)
    (plus1 t935 t936) (plus1 t936 t937) (plus1 t937 t938) (plus1 t938 t939) (plus1 t939 t940)
    (plus1 t940 t941) (plus1 t941 t942) (plus1 t942 t943) (plus1 t943 t944) (plus1 t944 t945)
    (plus1 t945 t946) (plus1 t946 t947) (plus1 t947 t948) (plus1 t948 t949) (plus1 t949 t950)
    (plus1 t950 t951) (plus1 t951 t952) (plus1 t952 t953) (plus1 t953 t954) (plus1 t954 t955)
    (plus1 t955 t956) (plus1 t956 t957) (plus1 t957 t958) (plus1 t958 t959) (plus1 t959 t960)
    (plus1 t960 t961) (plus1 t961 t962) (plus1 t962 t963) (plus1 t963 t964) (plus1 t964 t965)
    (plus1 t965 t966) (plus1 t966 t967) (plus1 t967 t968) (plus1 t968 t969) (plus1 t969 t970)
    (plus1 t970 t971) (plus1 t971 t972) (plus1 t972 t973) (plus1 t973 t974) (plus1 t974 t975)
    (plus1 t975 t976) (plus1 t976 t977) (plus1 t977 t978) (plus1 t978 t979) (plus1 t979 t980)
    (plus1 t980 t981) (plus1 t981 t982) (plus1 t982 t983) (plus1 t983 t984) (plus1 t984 t985)
    (plus1 t985 t986) (plus1 t986 t987) (plus1 t987 t988) (plus1 t988 t989) (plus1 t989 t990)
    (plus1 t990 t991) (plus1 t991 t992) (plus1 t992 t993) (plus1 t993 t994) (plus1 t994 t995)
    (plus1 t995 t996) (plus1 t996 t997) (plus1 t997 t998) (plus1 t998 t999) (plus1 t999 t1000)
    (plus1 t1000 t1001) (plus1 t1001 t1002) (plus1 t1002 t1003) (plus1 t1003 t1004) (plus1 t1004 t1005)
    (plus1 t1005 t1006) (plus1 t1006 t1007) (plus1 t1007 t1008) (plus1 t1008 t1009) (plus1 t1009 t1010)
    (plus1 t1010 t1011) (plus1 t1011 t1012) (plus1 t1012 t1013) (plus1 t1013 t1014) (plus1 t1014 t1015)
    (plus1 t1015 t1016) (plus1 t1016 t1017) (plus1 t1017 t1018) (plus1 t1018 t1019) (plus1 t1019 t1020)
    (plus1 t1020 t1021) (plus1 t1021 t1022) (plus1 t1022 t1023) (plus1 t1023 t1024) (plus1 t1024 t1025)
    (plus1 t1025 t1026) (plus1 t1026 t1027) (plus1 t1027 t1028) (plus1 t1028 t1029) (plus1 t1029 t1030)
    (plus1 t1030 t1031) (plus1 t1031 t1032) (plus1 t1032 t1033) (plus1 t1033 t1034) (plus1 t1034 t1035)
    (plus1 t1035 t1036) (plus1 t1036 t1037) (plus1 t1037 t1038) (plus1 t1038 t1039) (plus1 t1039 t1040)
    (plus1 t1040 t1041) (plus1 t1041 t1042) (plus1 t1042 t1043) (plus1 t1043 t1044) (plus1 t1044 t1045)
    (plus1 t1045 t1046) (plus1 t1046 t1047) (plus1 t1047 t1048) (plus1 t1048 t1049) (plus1 t1049 t1050)
    (plus1 t1050 t1051) (plus1 t1051 t1052) (plus1 t1052 t1053) (plus1 t1053 t1054) (plus1 t1054 t1055)
    (plus1 t1055 t1056) (plus1 t1056 t1057) (plus1 t1057 t1058) (plus1 t1058 t1059) (plus1 t1059 t1060)
    (plus1 t1060 t1061) (plus1 t1061 t1062) (plus1 t1062 t1063) (plus1 t1063 t1064) (plus1 t1064 t1065)
    (plus1 t1065 t1066) (plus1 t1066 t1067) (plus1 t1067 t1068) (plus1 t1068 t1069) (plus1 t1069 t1070)
    (plus1 t1070 t1071) (plus1 t1071 t1072) (plus1 t1072 t1073) (plus1 t1073 t1074) (plus1 t1074 t1075)
    (plus1 t1075 t1076) (plus1 t1076 t1077) (plus1 t1077 t1078) (plus1 t1078 t1079) (plus1 t1079 t1080)
    (plus1 t1080 t1081) (plus1 t1081 t1082) (plus1 t1082 t1083) (plus1 t1083 t1084) (plus1 t1084 t1085)
    (plus1 t1085 t1086) (plus1 t1086 t1087) (plus1 t1087 t1088) (plus1 t1088 t1089) (plus1 t1089 t1090)
    (plus1 t1090 t1091) (plus1 t1091 t1092) (plus1 t1092 t1093) (plus1 t1093 t1094) (plus1 t1094 t1095)
    (plus1 t1095 t1096) (plus1 t1096 t1097) (plus1 t1097 t1098) (plus1 t1098 t1099) (plus1 t1099 t1100)
    (plus1 t1100 t1101) (plus1 t1101 t1102) (plus1 t1102 t1103) (plus1 t1103 t1104) (plus1 t1104 t1105)
    (plus1 t1105 t1106) (plus1 t1106 t1107) (plus1 t1107 t1108) (plus1 t1108 t1109) (plus1 t1109 t1110)
    (plus1 t1110 t1111) (plus1 t1111 t1112) (plus1 t1112 t1113) (plus1 t1113 t1114) (plus1 t1114 t1115)
    (plus1 t1115 t1116) (plus1 t1116 t1117) (plus1 t1117 t1118) (plus1 t1118 t1119) (plus1 t1119 t1120)
    (plus1 t1120 t1121) (plus1 t1121 t1122) (plus1 t1122 t1123) (plus1 t1123 t1124) (plus1 t1124 t1125)
    (plus1 t1125 t1126) (plus1 t1126 t1127) (plus1 t1127 t1128) (plus1 t1128 t1129) (plus1 t1129 t1130)
    (plus1 t1130 t1131) (plus1 t1131 t1132) (plus1 t1132 t1133) (plus1 t1133 t1134) (plus1 t1134 t1135)
    (plus1 t1135 t1136) (plus1 t1136 t1137) (plus1 t1137 t1138) (plus1 t1138 t1139) (plus1 t1139 t1140)
    (plus1 t1140 t1141) (plus1 t1141 t1142) (plus1 t1142 t1143) (plus1 t1143 t1144) (plus1 t1144 t1145)
    (plus1 t1145 t1146) (plus1 t1146 t1147) (plus1 t1147 t1148) (plus1 t1148 t1149) (plus1 t1149 t1150)
    (plus1 t1150 t1151) (plus1 t1151 t1152) (plus1 t1152 t1153) (plus1 t1153 t1154) (plus1 t1154 t1155)
    (plus1 t1155 t1156) (plus1 t1156 t1157) (plus1 t1157 t1158) (plus1 t1158 t1159) (plus1 t1159 t1160)
    (plus1 t1160 t1161) (plus1 t1161 t1162) (plus1 t1162 t1163) (plus1 t1163 t1164) (plus1 t1164 t1165)
    (plus1 t1165 t1166) (plus1 t1166 t1167) (plus1 t1167 t1168) (plus1 t1168 t1169) (plus1 t1169 t1170)
    (plus1 t1170 t1171) (plus1 t1171 t1172) (plus1 t1172 t1173) (plus1 t1173 t1174) (plus1 t1174 t1175)
    (plus1 t1175 t1176) (plus1 t1176 t1177) (plus1 t1177 t1178) (plus1 t1178 t1179) (plus1 t1179 t1180)
    (plus1 t1180 t1181) (plus1 t1181 t1182) (plus1 t1182 t1183) (plus1 t1183 t1184) (plus1 t1184 t1185)
    (plus1 t1185 t1186) (plus1 t1186 t1187) (plus1 t1187 t1188) (plus1 t1188 t1189) (plus1 t1189 t1190)
    (plus1 t1190 t1191) (plus1 t1191 t1192) (plus1 t1192 t1193) (plus1 t1193 t1194) (plus1 t1194 t1195)
    (plus1 t1195 t1196) (plus1 t1196 t1197) (plus1 t1197 t1198) (plus1 t1198 t1199) (plus1 t1199 t1200)

    (plus15 t540 t555) (plus15 t541 t556) (plus15 t542 t557) (plus15 t543 t558) (plus15 t544 t559)
    (plus15 t545 t560) (plus15 t546 t561) (plus15 t547 t562) (plus15 t548 t563) (plus15 t549 t564)
    (plus15 t550 t565) (plus15 t551 t566) (plus15 t552 t567) (plus15 t553 t568) (plus15 t554 t569)
    (plus15 t555 t570) (plus15 t556 t571) (plus15 t557 t572) (plus15 t558 t573) (plus15 t559 t574)
    (plus15 t560 t575) (plus15 t561 t576) (plus15 t562 t577) (plus15 t563 t578) (plus15 t564 t579)
    (plus15 t565 t580) (plus15 t566 t581) (plus15 t567 t582) (plus15 t568 t583) (plus15 t569 t584)
    (plus15 t570 t585) (plus15 t571 t586) (plus15 t572 t587) (plus15 t573 t588) (plus15 t574 t589)
    (plus15 t575 t590) (plus15 t576 t591) (plus15 t577 t592) (plus15 t578 t593) (plus15 t579 t594)
    (plus15 t580 t595) (plus15 t581 t596) (plus15 t582 t597) (plus15 t583 t598) (plus15 t584 t599)
    (plus15 t585 t600) (plus15 t586 t601) (plus15 t587 t602) (plus15 t588 t603) (plus15 t589 t604)
    (plus15 t590 t605) (plus15 t591 t606) (plus15 t592 t607) (plus15 t593 t608) (plus15 t594 t609)
    (plus15 t595 t610) (plus15 t596 t611) (plus15 t597 t612) (plus15 t598 t613) (plus15 t599 t614)
    (plus15 t600 t615) (plus15 t601 t616) (plus15 t602 t617) (plus15 t603 t618) (plus15 t604 t619)
    (plus15 t605 t620) (plus15 t606 t621) (plus15 t607 t622) (plus15 t608 t623) (plus15 t609 t624)
    (plus15 t610 t625) (plus15 t611 t626) (plus15 t612 t627) (plus15 t613 t628) (plus15 t614 t629)
    (plus15 t615 t630) (plus15 t616 t631) (plus15 t617 t632) (plus15 t618 t633) (plus15 t619 t634)
    (plus15 t620 t635) (plus15 t621 t636) (plus15 t622 t637) (plus15 t623 t638) (plus15 t624 t639)
    (plus15 t625 t640) (plus15 t626 t641) (plus15 t627 t642) (plus15 t628 t643) (plus15 t629 t644)
    (plus15 t630 t645) (plus15 t631 t646) (plus15 t632 t647) (plus15 t633 t648) (plus15 t634 t649)
    (plus15 t635 t650) (plus15 t636 t651) (plus15 t637 t652) (plus15 t638 t653) (plus15 t639 t654)
    (plus15 t640 t655) (plus15 t641 t656) (plus15 t642 t657) (plus15 t643 t658) (plus15 t644 t659)
    (plus15 t645 t660) (plus15 t646 t661) (plus15 t647 t662) (plus15 t648 t663) (plus15 t649 t664)
    (plus15 t650 t665) (plus15 t651 t666) (plus15 t652 t667) (plus15 t653 t668) (plus15 t654 t669)
    (plus15 t655 t670) (plus15 t656 t671) (plus15 t657 t672) (plus15 t658 t673) (plus15 t659 t674)
    (plus15 t660 t675) (plus15 t661 t676) (plus15 t662 t677) (plus15 t663 t678) (plus15 t664 t679)
    (plus15 t665 t680) (plus15 t666 t681) (plus15 t667 t682) (plus15 t668 t683) (plus15 t669 t684)
    (plus15 t670 t685) (plus15 t671 t686) (plus15 t672 t687) (plus15 t673 t688) (plus15 t674 t689)
    (plus15 t675 t690) (plus15 t676 t691) (plus15 t677 t692) (plus15 t678 t693) (plus15 t679 t694)
    (plus15 t680 t695) (plus15 t681 t696) (plus15 t682 t697) (plus15 t683 t698) (plus15 t684 t699)
    (plus15 t685 t700) (plus15 t686 t701) (plus15 t687 t702) (plus1 t688 t703) (plus1 t689 t704)
    (plus16 t540 t556) (plus16 t541 t557) (plus16 t542 t558) (plus16 t543 t559) (plus16 t544 t560)
    (plus16 t545 t561) (plus16 t546 t562) (plus16 t547 t563) (plus16 t548 t564) (plus16 t549 t565)
    (plus16 t550 t566) (plus16 t551 t567) (plus16 t552 t568) (plus16 t553 t569) (plus16 t554 t570)
    (plus16 t555 t571) (plus16 t556 t572) (plus16 t557 t573) (plus16 t558 t574) (plus16 t559 t575)
    (plus16 t560 t576) (plus16 t561 t577) (plus16 t562 t578) (plus16 t563 t579) (plus16 t564 t580)
    (plus16 t565 t581) (plus16 t566 t582) (plus16 t567 t583) (plus16 t568 t584) (plus16 t569 t585)
    (plus16 t570 t586) (plus16 t571 t587) (plus16 t572 t588) (plus16 t573 t589) (plus16 t574 t590)
    (plus16 t575 t591) (plus16 t576 t592) (plus16 t577 t593) (plus16 t578 t594) (plus16 t579 t595)
    (plus16 t580 t596) (plus16 t581 t597) (plus16 t582 t598) (plus16 t583 t599) (plus16 t584 t600)
    (plus16 t585 t601) (plus16 t586 t602) (plus16 t587 t603) (plus16 t588 t604) (plus16 t589 t605)
    (plus16 t590 t606) (plus16 t591 t607) (plus16 t592 t608) (plus16 t593 t609) (plus16 t594 t610)
    (plus16 t595 t611) (plus16 t596 t612) (plus16 t597 t613) (plus16 t598 t614) (plus16 t599 t615)
    (plus16 t600 t616) (plus16 t601 t617) (plus16 t602 t618) (plus16 t603 t619) (plus16 t604 t620)

    (plus90 t1080 t1170) (plus90 t1081 t1171) (plus90 t1082 t1172) (plus90 t1083 t1173) (plus90 t1084 t1174)
    (plus90 t1085 t1175) (plus90 t1086 t1176) (plus90 t1087 t1177) (plus90 t1088 t1178) (plus90 t1089 t1179)
    (plus90 t1090 t1180) (plus90 t1091 t1181) (plus90 t1092 t1182) (plus90 t1093 t1183) (plus90 t1094 t1184)
    (plus90 t1095 t1185) (plus90 t1096 t1186) (plus90 t1097 t1187) (plus90 t1098 t1188) (plus90 t1099 t1189)
    (plus90 t1100 t1190) (plus90 t1101 t1191) (plus90 t1102 t1192) (plus90 t1103 t1193) (plus90 t1104 t1194)
    (plus90 t1105 t1195) (plus90 t1106 t1196) (plus90 t1107 t1197) (plus90 t1108 t1198) (plus90 t1109 t1199)
    (plus90 t1110 t1200) (plus90 t1111 t1201) (plus90 t1112 t1202) (plus90 t1113 t1203) (plus90 t1114 t1204)
    (plus90 t1115 t1205) (plus90 t1116 t1206) (plus90 t1117 t1207) (plus90 t1118 t1208) (plus90 t1119 t1209)
    (plus90 t1120 t1210) (plus90 t1121 t1211) (plus90 t1122 t1212) (plus90 t1123 t1213) (plus90 t1124 t1214)
    (plus90 t1125 t1215) (plus90 t1126 t1216) (plus90 t1127 t1217) (plus90 t1128 t1218) (plus90 t1129 t1219)
    (plus90 t1130 t1220) (plus90 t1131 t1221) (plus90 t1132 t1222) (plus90 t1133 t1223) (plus90 t1134 t1224)
    (plus90 t1135 t1225) (plus90 t1136 t1226) (plus90 t1137 t1227) (plus90 t1138 t1228) (plus90 t1139 t1229)
    (plus90 t1140 t1230) (plus90 t1141 t1231) (plus90 t1142 t1232) (plus90 t1143 t1233) (plus90 t1144 t1234)
    (plus90 t1145 t1235) (plus90 t1146 t1236) (plus90 t1147 t1237) (plus90 t1148 t1238) (plus90 t1149 t1239)
    (plus90 t1150 t1240) (plus90 t1151 t1241) (plus90 t1152 t1242) (plus90 t1153 t1243) (plus90 t1154 t1244)
    (plus90 t1155 t1245) (plus90 t1156 t1246) (plus90 t1157 t1247) (plus90 t1158 t1248) (plus90 t1159 t1249)
    (plus90 t1160 t1250) (plus90 t1161 t1251) (plus90 t1162 t1252) (plus90 t1163 t1253) (plus90 t1164 t1254)
    (plus90 t1165 t1255) (plus90 t1166 t1256) (plus90 t1167 t1257) (plus90 t1168 t1258) (plus90 t1169 t1259)
    (plus90 t1170 t1260) (plus90 t1171 t1261) (plus90 t1172 t1262) (plus90 t1173 t1263) (plus90 t1174 t1264)
    (plus90 t1175 t1265) (plus90 t1176 t1266) (plus90 t1177 t1267) (plus90 t1178 t1268) (plus90 t1179 t1269)
    (plus90 t1180 t1270) (plus90 t1181 t1271) (plus90 t1182 t1272) (plus90 t1183 t1273) (plus90 t1184 t1274)
    (plus90 t1185 t1275) (plus90 t1186 t1276) (plus90 t1187 t1277) (plus90 t1188 t1278) (plus90 t1189 t1279)
    (plus90 t1190 t1280) (plus90 t1191 t1281) (plus90 t1192 t1282) (plus90 t1193 t1283) (plus90 t1194 t1284)
    (plus90 t1195 t1285) (plus90 t1196 t1286) (plus90 t1197 t1287) (plus90 t1198 t1288) (plus90 t1199 t1289)
    (plus90 t1200 t1290)

    (can-start-meeting t1080) (can-start-meeting t1081) (can-start-meeting t1082) (can-start-meeting t1083) (can-start-meeting t1084)
    (can-start-meeting t1085) (can-start-meeting t1086) (can-start-meeting t1087) (can-start-meeting t1088) (can-start-meeting t1089)
    (can-start-meeting t1090) (can-start-meeting t1091) (can-start-meeting t1092) (can-start-meeting t1093) (can-start-meeting t1094)
    (can-start-meeting t1095) (can-start-meeting t1096) (can-start-meeting t1097) (can-start-meeting t1098) (can-start-meeting t1099)
    (can-start-meeting t1100) (can-start-meeting t1101) (can-start-meeting t1102) (can-start-meeting t1103) (can-start-meeting t1104)
    (can-start-meeting t1105) (can-start-meeting t1106) (can-start-meeting t1107) (can-start-meeting t1108) (can-start-meeting t1109)
    (can-start-meeting t1110) (can-start-meeting t1111) (can-start-meeting t1112) (can-start-meeting t1113) (can-start-meeting t1114)
    (can-start-meeting t1115) (can-start-meeting t1116) (can-start-meeting t1117) (can-start-meeting t1118) (can-start-meeting t1119)
    (can-start-meeting t1120) (can-start-meeting t1121) (can-start-meeting t1122) (can-start-meeting t1123) (can-start-meeting t1124)
    (can-start-meeting t1125) (can-start-meeting t1126) (can-start-meeting t1127) (can-start-meeting t1128) (can-start-meeting t1129)
    (can-start-meeting t1130) (can-start-meeting t1131) (can-start-meeting t1132) (can-start-meeting t1133) (can-start-meeting t1134)
    (can-start-meeting t1135) (can-start-meeting t1136) (can-start-meeting t1137) (can-start-meeting t1138) (can-start-meeting t1139)
    (can-start-meeting t1140) (can-start-meeting t1141) (can-start-meeting t1142) (can-start-meeting t1143) (can-start-meeting t1144)
    (can-start-meeting t1145) (can-start-meeting t1146) (can-start-meeting t1147) (can-start-meeting t1148) (can-start-meeting t1149)
    (can-start-meeting t1150) (can-start-meeting t1151) (can-start-meeting t1152) (can-start-meeting t1153) (can-start-meeting t1154)
    (can-start-meeting t1155) (can-start-meeting t1156) (can-start-meeting t1157) (can-start-meeting t1158) (can-start-meeting t1159)
    (can-start-meeting t1160) (can-start-meeting t1161) (can-start-meeting t1162) (can-start-meeting t1163) (can-start-meeting t1164)
    (can-start-meeting t1165) (can-start-meeting t1166) (can-start-meeting t1167) (can-start-meeting t1168) (can-start-meeting t1169)
    (can-start-meeting t1170) (can-start-meeting t1171) (can-start-meeting t1172) (can-start-meeting t1173) (can-start-meeting t1174)
    (can-start-meeting t1175) (can-start-meeting t1176) (can-start-meeting t1177) (can-start-meeting t1178) (can-start-meeting t1179)
    (can-start-meeting t1180) (can-start-meeting t1181) (can-start-meeting t1182) (can-start-meeting t1183) (can-start-meeting t1184)
    (can-start-meeting t1185) (can-start-meeting t1186) (can-start-meeting t1187) (can-start-meeting t1188) (can-start-meeting t1189)
    (can-start-meeting t1190) (can-start-meeting t1191) (can-start-meeting t1192) (can-start-meeting t1193) (can-start-meeting t1194)
    (can-start-meeting t1195) (can-start-meeting t1196) (can-start-meeting t1197) (can-start-meeting t1198) (can-start-meeting t1199)
    (can-start-meeting t1200)
  )

  (:goal (and
           (met barbara)
         )
  )
  (:metric minimize (total-cost))
)