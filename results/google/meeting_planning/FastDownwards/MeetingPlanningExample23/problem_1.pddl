(define (problem meeting-sf-instance)
  (:domain meeting-sf)
  (:objects
    bayview russian_hill - location
    brh rhb - route
    ;; travel stages (0..22 for 23 minutes)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 - tstage
    ;; meeting stages (0..74 for first 75 minutes)
    m0 m1 m2 m3 m4 m5 m6 m7 m8 m9
    m10 m11 m12 m13 m14 m15 m16 m17 m18 m19
    m20 m21 m22 m23 m24 m25 m26 m27 m28 m29
    m30 m31 m32 m33 m34 m35 m36 m37 m38 m39
    m40 m41 m42 m43 m44 m45 m46 m47 m48 m49
    m50 m51 m52 m53 m54 m55 m56 m57 m58 m59
    m60 m61 m62 m63 m64 m65 m66 m67 m68 m69
    m70 m71 m72 m73 m74 - mstage
    ;; time minutes from 09:00 (540) to 21:00 (1260)
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
    (at bayview)
    (now t540)
    (= (total-cost) 0)

    ;; time successor chain minute-by-minute
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
    (next t825 t826) (next t826 t827) (next t827 t828) (next t828 t829) (next t829 t830)
    (next t830 t831) (next t831 t832) (next t832 t833) (next t833 t834) (next t834 t835)
    (next t835 t836) (next t836 t837) (next t837 t838) (next t838 t839) (next t839 t840)
    (next t840 t841) (next t841 t842) (next t842 t843) (next t843 t844) (next t844 t845)
    (next t845 t846) (next t846 t847) (next t847 t848) (next t848 t849) (next t849 t850)
    (next t850 t851) (next t851 t852) (next t852 t853) (next t853 t854) (next t854 t855)
    (next t855 t856) (next t856 t857) (next t857 t858) (next t858 t859) (next t859 t860)
    (next t860 t861) (next t861 t862) (next t862 t863) (next t863 t864) (next t864 t865)
    (next t865 t866) (next t866 t867) (next t867 t868) (next t868 t869) (next t869 t870)
    (next t870 t871) (next t871 t872) (next t872 t873) (next t873 t874) (next t874 t875)
    (next t875 t876) (next t876 t877) (next t877 t878) (next t878 t879) (next t879 t880)
    (next t880 t881) (next t881 t882) (next t882 t883) (next t883 t884) (next t884 t885)
    (next t885 t886) (next t886 t887) (next t887 t888) (next t888 t889) (next t889 t890)
    (next t890 t891) (next t891 t892) (next t892 t893) (next t893 t894) (next t894 t895)
    (next t895 t896) (next t896 t897) (next t897 t898) (next t898 t899) (next t899 t900)
    (next t900 t901) (next t901 t902) (next t902 t903) (next t903 t904) (next t904 t905)
    (next t905 t906) (next t906 t907) (next t907 t908) (next t908 t909) (next t909 t910)
    (next t910 t911) (next t911 t912) (next t912 t913) (next t913 t914) (next t914 t915)
    (next t915 t916) (next t916 t917) (next t917 t918) (next t918 t919) (next t919 t920)
    (next t920 t921) (next t921 t922) (next t922 t923) (next t923 t924) (next t924 t925)
    (next t925 t926) (next t926 t927) (next t927 t928) (next t928 t929) (next t929 t930)
    (next t930 t931) (next t931 t932) (next t932 t933) (next t933 t934) (next t934 t935)
    (next t935 t936) (next t936 t937) (next t937 t938) (next t938 t939) (next t939 t940)
    (next t940 t941) (next t941 t942) (next t942 t943) (next t943 t944) (next t944 t945)
    (next t945 t946) (next t946 t947) (next t947 t948) (next t948 t949) (next t949 t950)
    (next t950 t951) (next t951 t952) (next t952 t953) (next t953 t954) (next t954 t955)
    (next t955 t956) (next t956 t957) (next t957 t958) (next t958 t959) (next t959 t960)
    (next t960 t961) (next t961 t962) (next t962 t963) (next t963 t964) (next t964 t965)
    (next t965 t966) (next t966 t967) (next t967 t968) (next t968 t969) (next t969 t970)
    (next t970 t971) (next t971 t972) (next t972 t973) (next t973 t974) (next t974 t975)
    (next t975 t976) (next t976 t977) (next t977 t978) (next t978 t979) (next t979 t980)
    (next t980 t981) (next t981 t982) (next t982 t983) (next t983 t984) (next t984 t985)
    (next t985 t986) (next t986 t987) (next t987 t988) (next t988 t989) (next t989 t990)
    (next t990 t991) (next t991 t992) (next t992 t993) (next t993 t994) (next t994 t995)
    (next t995 t996) (next t996 t997) (next t997 t998) (next t998 t999) (next t999 t1000)
    (next t1000 t1001) (next t1001 t1002) (next t1002 t1003) (next t1003 t1004) (next t1004 t1005)
    (next t1005 t1006) (next t1006 t1007) (next t1007 t1008) (next t1008 t1009) (next t1009 t1010)
    (next t1010 t1011) (next t1011 t1012) (next t1012 t1013) (next t1013 t1014) (next t1014 t1015)
    (next t1015 t1016) (next t1016 t1017) (next t1017 t1018) (next t1018 t1019) (next t1019 t1020)
    (next t1020 t1021) (next t1021 t1022) (next t1022 t1023) (next t1023 t1024) (next t1024 t1025)
    (next t1025 t1026) (next t1026 t1027) (next t1027 t1028) (next t1028 t1029) (next t1029 t1030)
    (next t1030 t1031) (next t1031 t1032) (next t1032 t1033) (next t1033 t1034) (next t1034 t1035)
    (next t1035 t1036) (next t1036 t1037) (next t1037 t1038) (next t1038 t1039) (next t1039 t1040)
    (next t1040 t1041) (next t1041 t1042) (next t1042 t1043) (next t1043 t1044) (next t1044 t1045)
    (next t1045 t1046) (next t1046 t1047) (next t1047 t1048) (next t1048 t1049) (next t1049 t1050)
    (next t1050 t1051) (next t1051 t1052) (next t1052 t1053) (next t1053 t1054) (next t1054 t1055)
    (next t1055 t1056) (next t1056 t1057) (next t1057 t1058) (next t1058 t1059) (next t1059 t1060)
    (next t1060 t1061) (next t1061 t1062) (next t1062 t1063) (next t1063 t1064) (next t1064 t1065)
    (next t1065 t1066) (next t1066 t1067) (next t1067 t1068) (next t1068 t1069) (next t1069 t1070)
    (next t1070 t1071) (next t1071 t1072) (next t1072 t1073) (next t1073 t1074) (next t1074 t1075)
    (next t1075 t1076) (next t1076 t1077) (next t1077 t1078) (next t1078 t1079) (next t1079 t1080)
    (next t1080 t1081) (next t1081 t1082) (next t1082 t1083) (next t1083 t1084) (next t1084 t1085)
    (next t1085 t1086) (next t1086 t1087) (next t1087 t1088) (next t1088 t1089) (next t1089 t1090)
    (next t1090 t1091) (next t1091 t1092) (next t1092 t1093) (next t1093 t1094) (next t1094 t1095)
    (next t1095 t1096) (next t1096 t1097) (next t1097 t1098) (next t1098 t1099) (next t1099 t1100)
    (next t1100 t1101) (next t1101 t1102) (next t1102 t1103) (next t1103 t1104) (next t1104 t1105)
    (next t1105 t1106) (next t1106 t1107) (next t1107 t1108) (next t1108 t1109) (next t1109 t1110)
    (next t1110 t1111) (next t1111 t1112) (next t1112 t1113) (next t1113 t1114) (next t1114 t1115)
    (next t1115 t1116) (next t1116 t1117) (next t1117 t1118) (next t1118 t1119) (next t1119 t1120)
    (next t1120 t1121) (next t1121 t1122) (next t1122 t1123) (next t1123 t1124) (next t1124 t1125)
    (next t1125 t1126) (next t1126 t1127) (next t1127 t1128) (next t1128 t1129) (next t1129 t1130)
    (next t1130 t1131) (next t1131 t1132) (next t1132 t1133) (next t1133 t1134) (next t1134 t1135)
    (next t1135 t1136) (next t1136 t1137) (next t1137 t1138) (next t1138 t1139) (next t1139 t1140)
    (next t1140 t1141) (next t1141 t1142) (next t1142 t1143) (next t1143 t1144) (next t1144 t1145)
    (next t1145 t1146) (next t1146 t1147) (next t1147 t1148) (next t1148 t1149) (next t1149 t1150)
    (next t1150 t1151) (next t1151 t1152) (next t1152 t1153) (next t1153 t1154) (next t1154 t1155)
    (next t1155 t1156) (next t1156 t1157) (next t1157 t1158) (next t1158 t1159) (next t1159 t1160)
    (next t1160 t1161) (next t1161 t1162) (next t1162 t1163) (next t1163 t1164) (next t1164 t1165)
    (next t1165 t1166) (next t1166 t1167) (next t1167 t1168) (next t1168 t1169) (next t1169 t1170)
    (next t1170 t1171) (next t1171 t1172) (next t1172 t1173) (next t1173 t1174) (next t1174 t1175)
    (next t1175 t1176) (next t1176 t1177) (next t1177 t1178) (next t1178 t1179) (next t1179 t1180)
    (next t1180 t1181) (next t1181 t1182) (next t1182 t1183) (next t1183 t1184) (next t1184 t1185)
    (next t1185 t1186) (next t1186 t1187) (next t1187 t1188) (next t1188 t1189) (next t1189 t1190)
    (next t1190 t1191) (next t1191 t1192) (next t1192 t1193) (next t1193 t1194) (next t1194 t1195)
    (next t1195 t1196) (next t1196 t1197) (next t1197 t1198) (next t1198 t1199) (next t1199 t1200)
    (next t1200 t1201) (next t1201 t1202) (next t1202 t1203) (next t1203 t1204) (next t1204 t1205)
    (next t1205 t1206) (next t1206 t1207) (next t1207 t1208) (next t1208 t1209) (next t1209 t1210)
    (next t1210 t1211) (next t1211 t1212) (next t1212 t1213) (next t1213 t1214) (next t1214 t1215)
    (next t1215 t1216) (next t1216 t1217) (next t1217 t1218) (next t1218 t1219) (next t1219 t1220)
    (next t1220 t1221) (next t1221 t1222) (next t1222 t1223) (next t1223 t1224) (next t1224 t1225)
    (next t1225 t1226) (next t1226 t1227) (next t1227 t1228) (next t1228 t1229) (next t1229 t1230)
    (next t1230 t1231) (next t1231 t1232) (next t1232 t1233) (next t1233 t1234) (next t1234 t1235)
    (next t1235 t1236) (next t1236 t1237) (next t1237 t1238) (next t1238 t1239) (next t1239 t1240)
    (next t1240 t1241) (next t1241 t1242) (next t1242 t1243) (next t1243 t1244) (next t1244 t1245)
    (next t1245 t1246) (next t1246 t1247) (next t1247 t1248) (next t1248 t1249) (next t1249 t1250)
    (next t1250 t1251) (next t1251 t1252) (next t1252 t1253) (next t1253 t1254) (next t1254 t1255)
    (next t1255 t1256) (next t1256 t1257) (next t1257 t1258) (next t1258 t1259) (next t1259 t1260)

    ;; travel stage successor chain (0..22)
    (snext s0 s1) (snext s1 s2) (snext s2 s3) (snext s3 s4) (snext s4 s5)
    (snext s5 s6) (snext s6 s7) (snext s7 s8) (snext s8 s9) (snext s9 s10)
    (snext s10 s11) (snext s11 s12) (snext s12 s13) (snext s13 s14) (snext s14 s15)
    (snext s15 s16) (snext s16 s17) (snext s17 s18) (snext s18 s19) (snext s19 s20)
    (snext s20 s21) (snext s21 s22)

    ;; meeting stage successor chain (0..74)
    (mnext m0 m1) (mnext m1 m2) (mnext m2 m3) (mnext m3 m4) (mnext m4 m5)
    (mnext m5 m6) (mnext m6 m7) (mnext m7 m8) (mnext m8 m9) (mnext m9 m10)
    (mnext m10 m11) (mnext m11 m12) (mnext m12 m13) (mnext m13 m14) (mnext m14 m15)
    (mnext m15 m16) (mnext m16 m17) (mnext m17 m18) (mnext m18 m19) (mnext m19 m20)
    (mnext m20 m21) (mnext m21 m22) (mnext m22 m23) (mnext m23 m24) (mnext m24 m25)
    (mnext m25 m26) (mnext m26 m27) (mnext m27 m28) (mnext m28 m29) (mnext m29 m30)
    (mnext m30 m31) (mnext m31 m32) (mnext m32 m33) (mnext m33 m34) (mnext m34 m35)
    (mnext m35 m36) (mnext m36 m37) (mnext m37 m38) (mnext m38 m39) (mnext m39 m40)
    (mnext m40 m41) (mnext m41 m42) (mnext m42 m43) (mnext m43 m44) (mnext m44 m45)
    (mnext m45 m46) (mnext m46 m47) (mnext m47 m48) (mnext m48 m49) (mnext m49 m50)
    (mnext m50 m51) (mnext m51 m52) (mnext m52 m53) (mnext m53 m54) (mnext m54 m55)
    (mnext m55 m56) (mnext m56 m57) (mnext m57 m58) (mnext m58 m59) (mnext m59 m60)
    (mnext m60 m61) (mnext m61 m62) (mnext m62 m63) (mnext m63 m64) (mnext m64 m65)
    (mnext m65 m66) (mnext m66 m67) (mnext m67 m68) (mnext m68 m69) (mnext m69 m70)
    (mnext m70 m71) (mnext m71 m72) (mnext m72 m73) (mnext m73 m74)

    ;; John's availability: 17:30 (1050) to 21:00 (1260) inclusive
    (avail_john t1050) (avail_john t1051) (avail_john t1052) (avail_john t1053) (avail_john t1054)
    (avail_john t1055) (avail_john t1056) (avail_john t1057) (avail_john t1058) (avail_john t1059)
    (avail_john t1060) (avail_john t1061) (avail_john t1062) (avail_john t1063) (avail_john t1064)
    (avail_john t1065) (avail_john t1066) (avail_john t1067) (avail_john t1068) (avail_john t1069)
    (avail_john t1070) (avail_john t1071) (avail_john t1072) (avail_john t1073) (avail_john t1074)
    (avail_john t1075) (avail_john t1076) (avail_john t1077) (avail_john t1078) (avail_john t1079)
    (avail_john t1080) (avail_john t1081) (avail_john t1082) (avail_john t1083) (avail_john t1084)
    (avail_john t1085) (avail_john t1086) (avail_john t1087) (avail_john t1088) (avail_john t1089)
    (avail_john t1090) (avail_john t1091) (avail_john t1092) (avail_john t1093) (avail_john t1094)
    (avail_john t1095) (avail_john t1096) (avail_john t1097) (avail_john t1098) (avail_john t1099)
    (avail_john t1100) (avail_john t1101) (avail_john t1102) (avail_john t1103) (avail_john t1104)
    (avail_john t1105) (avail_john t1106) (avail_john t1107) (avail_john t1108) (avail_john t1109)
    (avail_john t1110) (avail_john t1111) (avail_john t1112) (avail_john t1113) (avail_john t1114)
    (avail_john t1115) (avail_john t1116) (avail_john t1117) (avail_john t1118) (avail_john t1119)
    (avail_john t1120) (avail_john t1121) (avail_john t1122) (avail_john t1123) (avail_john t1124)
    (avail_john t1125) (avail_john t1126) (avail_john t1127) (avail_john t1128) (avail_john t1129)
    (avail_john t1130) (avail_john t1131) (avail_john t1132) (avail_john t1133) (avail_john t1134)
    (avail_john t1135) (avail_john t1136) (avail_john t1137) (avail_john t1138) (avail_john t1139)
    (avail_john t1140) (avail_john t1141) (avail_john t1142) (avail_john t1143) (avail_john t1144)
    (avail_john t1145) (avail_john t1146) (avail_john t1147) (avail_john t1148) (avail_john t1149)
    (avail_john t1150) (avail_john t1151) (avail_john t1152) (avail_john t1153) (avail_john t1154)
    (avail_john t1155) (avail_john t1156) (avail_john t1157) (avail_john t1158) (avail_john t1159)
    (avail_john t1160) (avail_john t1161) (avail_john t1162) (avail_john t1163) (avail_john t1164)
    (avail_john t1165) (avail_john t1166) (avail_john t1167) (avail_john t1168) (avail_john t1169)
    (avail_john t1170) (avail_john t1171) (avail_john t1172) (avail_john t1173) (avail_john t1174)
    (avail_john t1175) (avail_john t1176) (avail_john t1177) (avail_john t1178) (avail_john t1179)
    (avail_john t1180) (avail_john t1181) (avail_john t1182) (avail_john t1183) (avail_john t1184)
    (avail_john t1185) (avail_john t1186) (avail_john t1187) (avail_john t1188) (avail_john t1189)
    (avail_john t1190) (avail_john t1191) (avail_john t1192) (avail_john t1193) (avail_john t1194)
    (avail_john t1195) (avail_john t1196) (avail_john t1197) (avail_john t1198) (avail_john t1199)
    (avail_john t1200) (avail_john t1201) (avail_john t1202) (avail_john t1203) (avail_john t1204)
    (avail_john t1205) (avail_john t1206) (avail_john t1207) (avail_john t1208) (avail_john t1209)
    (avail_john t1210) (avail_john t1211) (avail_john t1212) (avail_john t1213) (avail_john t1214)
    (avail_john t1215) (avail_john t1216) (avail_john t1217) (avail_john t1218) (avail_john t1219)
    (avail_john t1220) (avail_john t1221) (avail_john t1222) (avail_john t1223) (avail_john t1224)
    (avail_john t1225) (avail_john t1226) (avail_john t1227) (avail_john t1228) (avail_john t1229)
    (avail_john t1230) (avail_john t1231) (avail_john t1232) (avail_john t1233) (avail_john t1234)
    (avail_john t1235) (avail_john t1236) (avail_john t1237) (avail_john t1238) (avail_john t1239)
    (avail_john t1240) (avail_john t1241) (avail_john t1242) (avail_john t1243) (avail_john t1244)
    (avail_john t1245) (avail_john t1246) (avail_john t1247) (avail_john t1248) (avail_john t1249)
    (avail_john t1250) (avail_john t1251) (avail_john t1252) (avail_john t1253) (avail_john t1254)
    (avail_john t1255) (avail_john t1256) (avail_john t1257) (avail_john t1258) (avail_john t1259)
    (avail_john t1260)
  )

  (:goal (and (met_john)))

  (:metric minimize (total-cost))
)