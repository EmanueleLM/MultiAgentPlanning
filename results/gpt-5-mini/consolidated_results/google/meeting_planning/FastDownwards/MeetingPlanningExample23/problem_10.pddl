(define (problem meet-john-problem)
  (:domain meet-john-domain)
  (:objects
    bayview russian_hill - location
    ;; minute time-points from 09:00 (540) to 21:00 (1260)
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
    t1200 t1201 t1202 t1203 t1204 t1205 t1206 t1207 t1208 t1209
    t1210 t1211 t1212 t1213 t1214 t1215 t1216 t1217 t1218 t1219
    t1220 t1221 t1222 t1223 t1224 t1225 t1226 t1227 t1228 t1229
    t1230 t1231 t1232 t1233 t1234 t1235 t1236 t1237 t1238 t1239
    t1240 t1241 t1242 t1243 t1244 t1245 t1246 t1247 t1248 t1249
    t1250 t1251 t1252 t1253 t1254 t1255 t1256 t1257 t1258 t1259
    t1260 - time
  )
  (:init
    ;; starting presence at Bayview at 09:00 (t540)
    (at bayview t540)

    ;; travel-time facts: Bayview <-> Russian Hill require 23 contiguous minutes
    (travel-23-pair bayview russian_hill)
    (travel-23-pair russian_hill bayview)

    ;; John's known location
    (john-location russian_hill)

    ;; explicit successor relations for every consecutive minute in the day
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
    (succ t765 t766) (succ t766 t767) (succ t767 t768) (succ t768 t769) (succ t769 t770)
    (succ t770 t771) (succ t771 t772) (succ t772 t773) (succ t773 t774) (succ t774 t775)
    (succ t775 t776) (succ t776 t777) (succ t777 t778) (succ t778 t779) (succ t779 t780)
    (succ t780 t781) (succ t781 t782) (succ t782 t783) (succ t783 t784) (succ t784 t785)
    (succ t785 t786) (succ t786 t787) (succ t787 t788) (succ t788 t789) (succ t789 t790)
    (succ t790 t791) (succ t791 t792) (succ t792 t793) (succ t793 t794) (succ t794 t795)
    (succ t795 t796) (succ t796 t797) (succ t797 t798) (succ t798 t799) (succ t799 t800)
    (succ t800 t801) (succ t801 t802) (succ t802 t803) (succ t803 t804) (succ t804 t805)
    (succ t805 t806) (succ t806 t807) (succ t807 t808) (succ t808 t809) (succ t809 t810)
    (succ t810 t811) (succ t811 t812) (succ t812 t813) (succ t813 t814) (succ t814 t815)
    (succ t815 t816) (succ t816 t817) (succ t817 t818) (succ t818 t819) (succ t819 t820)
    (succ t820 t821) (succ t821 t822) (succ t822 t823) (succ t823 t824) (succ t824 t825)
    (succ t825 t826) (succ t826 t827) (succ t827 t828) (succ t828 t829) (succ t829 t830)
    (succ t830 t831) (succ t831 t832) (succ t832 t833) (succ t833 t834) (succ t834 t835)
    (succ t835 t836) (succ t836 t837) (succ t837 t838) (succ t838 t839) (succ t839 t840)
    (succ t840 t841) (succ t841 t842) (succ t842 t843) (succ t843 t844) (succ t844 t845)
    (succ t845 t846) (succ t846 t847) (succ t847 t848) (succ t848 t849) (succ t849 t850)
    (succ t850 t851) (succ t851 t852) (succ t852 t853) (succ t853 t854) (succ t854 t855)
    (succ t855 t856) (succ t856 t857) (succ t857 t858) (succ t858 t859) (succ t859 t860)
    (succ t860 t861) (succ t861 t862) (succ t862 t863) (succ t863 t864) (succ t864 t865)
    (succ t865 t866) (succ t866 t867) (succ t867 t868) (succ t868 t869) (succ t869 t870)
    (succ t870 t871) (succ t871 t872) (succ t872 t873) (succ t873 t874) (succ t874 t875)
    (succ t875 t876) (succ t876 t877) (succ t877 t878) (succ t878 t879) (succ t879 t880)
    (succ t880 t881) (succ t881 t882) (succ t882 t883) (succ t883 t884) (succ t884 t885)
    (succ t885 t886) (succ t886 t887) (succ t887 t888) (succ t888 t889) (succ t889 t890)
    (succ t890 t891) (succ t891 t892) (succ t892 t893) (succ t893 t894) (succ t894 t895)
    (succ t895 t896) (succ t896 t897) (succ t897 t898) (succ t898 t899) (succ t899 t900)
    (succ t900 t901) (succ t901 t902) (succ t902 t903) (succ t903 t904) (succ t904 t905)
    (succ t905 t906) (succ t906 t907) (succ t907 t908) (succ t908 t909) (succ t909 t910)
    (succ t910 t911) (succ t911 t912) (succ t912 t913) (succ t913 t914) (succ t914 t915)
    (succ t915 t916) (succ t916 t917) (succ t917 t918) (succ t918 t919) (succ t919 t920)
    (succ t920 t921) (succ t921 t922) (succ t922 t923) (succ t923 t924) (succ t924 t925)
    (succ t925 t926) (succ t926 t927) (succ t927 t928) (succ t928 t929) (succ t929 t930)
    (succ t930 t931) (succ t931 t932) (succ t932 t933) (succ t933 t934) (succ t934 t935)
    (succ t935 t936) (succ t936 t937) (succ t937 t938) (succ t938 t939) (succ t939 t940)
    (succ t940 t941) (succ t941 t942) (succ t942 t943) (succ t943 t944) (succ t944 t945)
    (succ t945 t946) (succ t946 t947) (succ t947 t948) (succ t948 t949) (succ t949 t950)
    (succ t950 t951) (succ t951 t952) (succ t952 t953) (succ t953 t954) (succ t954 t955)
    (succ t955 t956) (succ t956 t957) (succ t957 t958) (succ t958 t959) (succ t959 t960)
    (succ t960 t961) (succ t961 t962) (succ t962 t963) (succ t963 t964) (succ t964 t965)
    (succ t965 t966) (succ t966 t967) (succ t967 t968) (succ t968 t969) (succ t969 t970)
    (succ t970 t971) (succ t971 t972) (succ t972 t973) (succ t973 t974) (succ t974 t975)
    (succ t975 t976) (succ t976 t977) (succ t977 t978) (succ t978 t979) (succ t979 t980)
    (succ t980 t981) (succ t981 t982) (succ t982 t983) (succ t983 t984) (succ t984 t985)
    (succ t985 t986) (succ t986 t987) (succ t987 t988) (succ t988 t989) (succ t989 t990)
    (succ t990 t991) (succ t991 t992) (succ t992 t993) (succ t993 t994) (succ t994 t995)
    (succ t995 t996) (succ t996 t997) (succ t997 t998) (succ t998 t999) (succ t999 t1000)
    (succ t1000 t1001) (succ t1001 t1002) (succ t1002 t1003) (succ t1003 t1004) (succ t1004 t1005)
    (succ t1005 t1006) (succ t1006 t1007) (succ t1007 t1008) (succ t1008 t1009) (succ t1009 t1010)
    (succ t1010 t1011) (succ t1011 t1012) (succ t1012 t1013) (succ t1013 t1014) (succ t1014 t1015)
    (succ t1015 t1016) (succ t1016 t1017) (succ t1017 t1018) (succ t1018 t1019) (succ t1019 t1020)
    (succ t1020 t1021) (succ t1021 t1022) (succ t1022 t1023) (succ t1023 t1024) (succ t1024 t1025)
    (succ t1025 t1026) (succ t1026 t1027) (succ t1027 t1028) (succ t1028 t1029) (succ t1029 t1030)
    (succ t1030 t1031) (succ t1031 t1032) (succ t1032 t1033) (succ t1033 t1034) (succ t1034 t1035)
    (succ t1035 t1036) (succ t1036 t1037) (succ t1037 t1038) (succ t1038 t1039) (succ t1039 t1040)
    (succ t1040 t1041) (succ t1041 t1042) (succ t1042 t1043) (succ t1043 t1044) (succ t1044 t1045)
    (succ t1045 t1046) (succ t1046 t1047) (succ t1047 t1048) (succ t1048 t1049) (succ t1049 t1050)
    (succ t1050 t1051) (succ t1051 t1052) (succ t1052 t1053) (succ t1053 t1054) (succ t1054 t1055)
    (succ t1055 t1056) (succ t1056 t1057) (succ t1057 t1058) (succ t1058 t1059) (succ t1059 t1060)
    (succ t1060 t1061) (succ t1061 t1062) (succ t1062 t1063) (succ t1063 t1064) (succ t1064 t1065)
    (succ t1065 t1066) (succ t1066 t1067) (succ t1067 t1068) (succ t1068 t1069) (succ t1069 t1070)
    (succ t1070 t1071) (succ t1071 t1072) (succ t1072 t1073) (succ t1073 t1074) (succ t1074 t1075)
    (succ t1075 t1076) (succ t1076 t1077) (succ t1077 t1078) (succ t1078 t1079) (succ t1079 t1080)
    (succ t1080 t1081) (succ t1081 t1082) (succ t1082 t1083) (succ t1083 t1084) (succ t1084 t1085)
    (succ t1085 t1086) (succ t1086 t1087) (succ t1087 t1088) (succ t1088 t1089) (succ t1089 t1090)
    (succ t1090 t1091) (succ t1091 t1092) (succ t1092 t1093) (succ t1093 t1094) (succ t1094 t1095)
    (succ t1095 t1096) (succ t1096 t1097) (succ t1097 t1098) (succ t1098 t1099) (succ t1099 t1100)
    (succ t1100 t1101) (succ t1101 t1102) (succ t1102 t1103) (succ t1103 t1104) (succ t1104 t1105)
    (succ t1105 t1106) (succ t1106 t1107) (succ t1107 t1108) (succ t1108 t1109) (succ t1109 t1110)
    (succ t1110 t1111) (succ t1111 t1112) (succ t1112 t1113) (succ t1113 t1114) (succ t1114 t1115)
    (succ t1115 t1116) (succ t1116 t1117) (succ t1117 t1118) (succ t1118 t1119) (succ t1119 t1120)
    (succ t1120 t1121) (succ t1121 t1122) (succ t1122 t1123) (succ t1123 t1124) (succ t1124 t1125)
    (succ t1125 t1126) (succ t1126 t1127) (succ t1127 t1128) (succ t1128 t1129) (succ t1129 t1130)
    (succ t1130 t1131) (succ t1131 t1132) (succ t1132 t1133) (succ t1133 t1134) (succ t1134 t1135)
    (succ t1135 t1136) (succ t1136 t1137) (succ t1137 t1138) (succ t1138 t1139) (succ t1139 t1140)
    (succ t1140 t1141) (succ t1141 t1142) (succ t1142 t1143) (succ t1143 t1144) (succ t1144 t1145)
    (succ t1145 t1146) (succ t1146 t1147) (succ t1147 t1148) (succ t1148 t1149) (succ t1149 t1150)
    (succ t1150 t1151) (succ t1151 t1152) (succ t1152 t1153) (succ t1153 t1154) (succ t1154 t1155)
    (succ t1155 t1156) (succ t1156 t1157) (succ t1157 t1158) (succ t1158 t1159) (succ t1159 t1160)
    (succ t1160 t1161) (succ t1161 t1162) (succ t1162 t1163) (succ t1163 t1164) (succ t1164 t1165)
    (succ t1165 t1166) (succ t1166 t1167) (succ t1167 t1168) (succ t1168 t1169) (succ t1169 t1170)
    (succ t1170 t1171) (succ t1171 t1172) (succ t1172 t1173) (succ t1173 t1174) (succ t1174 t1175)
    (succ t1175 t1176) (succ t1176 t1177) (succ t1177 t1178) (succ t1178 t1179) (succ t1179 t1180)
    (succ t1180 t1181) (succ t1181 t1182) (succ t1182 t1183) (succ t1183 t1184) (succ t1184 t1185)
    (succ t1185 t1186) (succ t1186 t1187) (succ t1187 t1188) (succ t1188 t1189) (succ t1189 t1190)
    (succ t1190 t1191) (succ t1191 t1192) (succ t1192 t1193) (succ t1193 t1194) (succ t1194 t1195)
    (succ t1195 t1196) (succ t1196 t1197) (succ t1197 t1198) (succ t1198 t1199) (succ t1199 t1200)
    (succ t1200 t1201) (succ t1201 t1202) (succ t1202 t1203) (succ t1203 t1204) (succ t1204 t1205)
    (succ t1205 t1206) (succ t1206 t1207) (succ t1207 t1208) (succ t1208 t1209) (succ t1209 t1210)
    (succ t1210 t1211) (succ t1211 t1212) (succ t1212 t1213) (succ t1213 t1214) (succ t1214 t1215)
    (succ t1215 t1216) (succ t1216 t1217) (succ t1217 t1218) (succ t1218 t1219) (succ t1219 t1220)
    (succ t1220 t1221) (succ t1221 t1222) (succ t1222 t1223) (succ t1223 t1224) (succ t1224 t1225)
    (succ t1225 t1226) (succ t1226 t1227) (succ t1227 t1228) (succ t1228 t1229) (succ t1229 t1230)
    (succ t1230 t1231) (succ t1231 t1232) (succ t1232 t1233) (succ t1233 t1234) (succ t1234 t1235)
    (succ t1235 t1236) (succ t1236 t1237) (succ t1237 t1238) (succ t1238 t1239) (succ t1239 t1240)
    (succ t1240 t1241) (succ t1241 t1242) (succ t1242 t1243) (succ t1243 t1244) (succ t1244 t1245)
    (succ t1245 t1246) (succ t1246 t1247) (succ t1247 t1248) (succ t1248 t1249) (succ t1249 t1250)
    (succ t1250 t1251) (succ t1251 t1252) (succ t1252 t1253) (succ t1253 t1254) (succ t1254 t1255)
    (succ t1255 t1256) (succ t1256 t1257) (succ t1257 t1258) (succ t1258 t1259) (succ t1259 t1260)

    ;; Meeting allowed start times: 1050..1185 inclusive so 75-minute meeting ends by 1260.
    (meeting-start-allowed t1050) (meeting-start-allowed t1051) (meeting-start-allowed t1052) (meeting-start-allowed t1053) (meeting-start-allowed t1054)
    (meeting-start-allowed t1055) (meeting-start-allowed t1056) (meeting-start-allowed t1057) (meeting-start-allowed t1058) (meeting-start-allowed t1059)
    (meeting-start-allowed t1060) (meeting-start-allowed t1061) (meeting-start-allowed t1062) (meeting-start-allowed t1063) (meeting-start-allowed t1064)
    (meeting-start-allowed t1065) (meeting-start-allowed t1066) (meeting-start-allowed t1067) (meeting-start-allowed t1068) (meeting-start-allowed t1069)
    (meeting-start-allowed t1070) (meeting-start-allowed t1071) (meeting-start-allowed t1072) (meeting-start-allowed t1073) (meeting-start-allowed t1074)
    (meeting-start-allowed t1075) (meeting-start-allowed t1076) (meeting-start-allowed t1077) (meeting-start-allowed t1078) (meeting-start-allowed t1079)
    (meeting-start-allowed t1080) (meeting-start-allowed t1081) (meeting-start-allowed t1082) (meeting-start-allowed t1083) (meeting-start-allowed t1084)
    (meeting-start-allowed t1085) (meeting-start-allowed t1086) (meeting-start-allowed t1087) (meeting-start-allowed t1088) (meeting-start-allowed t1089)
    (meeting-start-allowed t1090) (meeting-start-allowed t1091) (meeting-start-allowed t1092) (meeting-start-allowed t1093) (meeting-start-allowed t1094)
    (meeting-start-allowed t1095) (meeting-start-allowed t1096) (meeting-start-allowed t1097) (meeting-start-allowed t1098) (meeting-start-allowed t1099)
    (meeting-start-allowed t1100) (meeting-start-allowed t1101) (meeting-start-allowed t1102) (meeting-start-allowed t1103) (meeting-start-allowed t1104)
    (meeting-start-allowed t1105) (meeting-start-allowed t1106) (meeting-start-allowed t1107) (meeting-start-allowed t1108) (meeting-start-allowed t1109)
    (meeting-start-allowed t1110) (meeting-start-allowed t1111) (meeting-start-allowed t1112) (meeting-start-allowed t1113) (meeting-start-allowed t1114)
    (meeting-start-allowed t1115) (meeting-start-allowed t1116) (meeting-start-allowed t1117) (meeting-start-allowed t1118) (meeting-start-allowed t1119)
    (meeting-start-allowed t1120) (meeting-start-allowed t1121) (meeting-start-allowed t1122) (meeting-start-allowed t1123) (meeting-start-allowed t1124)
    (meeting-start-allowed t1125) (meeting-start-allowed t1126) (meeting-start-allowed t1127) (meeting-start-allowed t1128) (meeting-start-allowed t1129)
    (meeting-start-allowed t1130) (meeting-start-allowed t1131) (meeting-start-allowed t1132) (meeting-start-allowed t1133) (meeting-start-allowed t1134)
    (meeting-start-allowed t1135) (meeting-start-allowed t1136) (meeting-start-allowed t1137) (meeting-start-allowed t1138) (meeting-start-allowed t1139)
    (meeting-start-allowed t1140) (meeting-start-allowed t1141) (meeting-start-allowed t1142) (meeting-start-allowed t1143) (meeting-start-allowed t1144)
    (meeting-start-allowed t1145) (meeting-start-allowed t1146) (meeting-start-allowed t1147) (meeting-start-allowed t1148) (meeting-start-allowed t1149)
    (meeting-start-allowed t1150) (meeting-start-allowed t1151) (meeting-start-allowed t1152) (meeting-start-allowed t1153) (meeting-start-allowed t1154)
    (meeting-start-allowed t1155) (meeting-start-allowed t1156) (meeting-start-allowed t1157) (meeting-start-allowed t1158) (meeting-start-allowed t1159)
    (meeting-start-allowed t1160) (meeting-start-allowed t1161) (meeting-start-allowed t1162) (meeting-start-allowed t1163) (meeting-start-allowed t1164)
    (meeting-start-allowed t1165) (meeting-start-allowed t1166) (meeting-start-allowed t1167) (meeting-start-allowed t1168) (meeting-start-allowed t1169)
    (meeting-start-allowed t1170) (meeting-start-allowed t1171) (meeting-start-allowed t1172) (meeting-start-allowed t1173) (meeting-start-allowed t1174)
    (meeting-start-allowed t1175) (meeting-start-allowed t1176) (meeting-start-allowed t1177) (meeting-start-allowed t1178) (meeting-start-allowed t1179)
    (meeting-start-allowed t1180) (meeting-start-allowed t1181) (meeting-start-allowed t1182) (meeting-start-allowed t1183) (meeting-start-allowed t1184)
    (meeting-start-allowed t1185)
  )
  (:goal (met-john))
)