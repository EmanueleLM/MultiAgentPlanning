(define (problem sf-day-meeting-instance)
  (:domain sf-day-meeting)

  (:objects
    traveler - agent
    john - friend

    m540 m541 m542 m543 m544 m545 m546 m547 m548 m549
    m550 m551 m552 m553 m554 m555 m556 m557 m558 m559
    m560 m561 m562 m563 m564 m565 m566 m567 m568 m569
    m570 m571 m572 m573 m574 m575 m576 m577 m578 m579
    m580 m581 m582 m583 m584 m585 m586 m587 m588 m589
    m590 m591 m592 m593 m594 m595 m596 m597 m598 m599
    m600 m601 m602 m603 m604 m605 m606 m607 m608 m609
    m610 m611 m612 m613 m614 m615 m616 m617 m618 m619
    m620 m621 m622 m623 m624 m625 m626 m627 m628 m629
    m630 m631 m632 m633 m634 m635 m636 m637 m638 m639
    m640 m641 m642 m643 m644 m645 m646 m647 m648 m649
    m650 m651 m652 m653 m654 m655 m656 m657 m658 m659
    m660 m661 m662 m663 m664 m665 m666 m667 m668 m669
    m670 m671 m672 m673 m674 m675 m676 m677 m678 m679
    m680 m681 m682 m683 m684 m685 m686 m687 m688 m689
    m690 m691 m692 m693 m694 m695 m696 m697 m698 m699
    m700 m701 m702 m703 m704 m705 m706 m707 m708 m709
    m710 m711 m712 m713 m714 m715 m716 m717 m718 m719
    m720 m721 m722 m723 m724 m725 m726 m727 m728 m729
    m730 m731 m732 m733 m734 m735 m736 m737 m738 m739
    m740 m741 m742 m743 m744 m745 m746 m747 m748 m749
    m750 m751 m752 m753 m754 m755 m756 m757 m758 m759
    m760 m761 m762 m763 m764 m765 m766 m767 m768 m769
    m770 m771 m772 m773 m774 m775 m776 m777 m778 m779
    m780 m781 m782 m783 m784 m785 m786 m787 m788 m789
    m790 m791 m792 m793 m794 m795 m796 m797 m798 m799
    m800 m801 m802 m803 m804 m805 m806 m807 m808 m809
    m810 m811 m812 m813 m814 m815 m816 m817 m818 m819
    m820 m821 m822 m823 m824 m825 m826 m827 m828 m829
    m830 m831 m832 m833 m834 m835 m836 m837 m838 m839
    m840 m841 m842 m843 m844 m845 m846 m847 m848 m849
    m850 m851 m852 m853 m854 m855 m856 m857 m858 m859
    m860 m861 m862 m863 m864 m865 m866 m867 m868 m869
    m870 m871 m872 m873 m874 m875 m876 m877 m878 m879
    m880 m881 m882 m883 m884 m885 m886 m887 m888 m889
    m890 m891 m892 m893 m894 m895 m896 m897 m898 m899
    m900 m901 m902 m903 m904 m905 m906 m907 m908 m909
    m910 m911 m912 m913 m914 m915 m916 m917 m918 m919
    m920 m921 m922 m923 m924 m925 m926 m927 m928 m929
    m930 m931 m932 m933 m934 m935 m936 m937 m938 m939
    m940 m941 m942 m943 m944 m945 m946 m947 m948 m949
    m950 m951 m952 m953 m954 m955 m956 m957 m958 m959
    m960 m961 m962 m963 m964 m965 m966 m967 m968 m969
    m970 m971 m972 m973 m974 m975 m976 m977 m978 m979
    m980 m981 m982 m983 m984 m985 m986 m987 m988 m989
    m990 m991 m992 m993 m994 m995 m996 m997 m998 m999
    m1000 m1001 m1002 m1003 m1004 m1005 m1006 m1007 m1008 m1009
    m1010 m1011 m1012 m1013 m1014 m1015 m1016 m1017 m1018 m1019
    m1020 m1021 m1022 m1023 m1024 m1025 m1026 m1027 m1028 m1029
    m1030 m1031 m1032 m1033 m1034 m1035 m1036 m1037 m1038 m1039
    m1040 m1041 m1042 m1043 m1044 m1045 m1046 m1047 m1048 m1049
    m1050 m1051 m1052 m1053 m1054 m1055 m1056 m1057 m1058 m1059
    m1060 m1061 m1062 m1063 m1064 m1065 m1066 m1067 m1068 m1069
    m1070 m1071 m1072 m1073 m1074 m1075 m1076 m1077 m1078 m1079
    m1080 m1081 m1082 m1083 m1084 m1085 m1086 m1087 m1088 m1089
    m1090 m1091 m1092 m1093 m1094 m1095 m1096 m1097 m1098 m1099
    m1100 m1101 m1102 m1103 m1104 m1105 m1106 m1107 m1108 m1109
    m1110 m1111 m1112 m1113 m1114 m1115 m1116 m1117 m1118 m1119
    m1120 m1121 m1122 m1123 m1124 m1125 m1126 m1127 m1128 m1129
    m1130 m1131 m1132 m1133 m1134 m1135 m1136 m1137 m1138 m1139
    m1140 - minute

    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9
    c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
    c20 c21 c22 c23 c24 c25 c26 c27 c28 c29
    c30 c31 c32 c33 c34 c35 c36 c37 c38 c39
    c40 c41 c42 c43 c44 c45 c46 c47 c48 c49
    c50 c51 c52 c53 c54 c55 c56 c57 c58 c59
    c60 c61 c62 c63 c64 c65 c66 c67 c68 c69
    c70 c71 c72 c73 c74 c75 c76 c77 c78 c79
    c80 c81 c82 c83 c84 c85 c86 c87 c88 c89
    c90 - count
  )

  (:init
    (time m540)
    (at traveler russian_hill)
    (met-count c0)
    (= (total-cost) 0)

    (next m540 m541) (next m541 m542) (next m542 m543) (next m543 m544) (next m544 m545)
    (next m545 m546) (next m546 m547) (next m547 m548) (next m548 m549) (next m549 m550)
    (next m550 m551) (next m551 m552) (next m552 m553) (next m553 m554) (next m554 m555)
    (next m555 m556) (next m556 m557) (next m557 m558) (next m558 m559) (next m559 m560)
    (next m560 m561) (next m561 m562) (next m562 m563) (next m563 m564) (next m564 m565)
    (next m565 m566) (next m566 m567) (next m567 m568) (next m568 m569) (next m569 m570)
    (next m570 m571) (next m571 m572) (next m572 m573) (next m573 m574) (next m574 m575)
    (next m575 m576) (next m576 m577) (next m577 m578) (next m578 m579) (next m579 m580)
    (next m580 m581) (next m581 m582) (next m582 m583) (next m583 m584) (next m584 m585)
    (next m585 m586) (next m586 m587) (next m587 m588) (next m588 m589) (next m589 m590)
    (next m590 m591) (next m591 m592) (next m592 m593) (next m593 m594) (next m594 m595)
    (next m595 m596) (next m596 m597) (next m597 m598) (next m598 m599) (next m599 m600)
    (next m600 m601) (next m601 m602) (next m602 m603) (next m603 m604) (next m604 m605)
    (next m605 m606) (next m606 m607) (next m607 m608) (next m608 m609) (next m609 m610)
    (next m610 m611) (next m611 m612) (next m612 m613) (next m613 m614) (next m614 m615)
    (next m615 m616) (next m616 m617) (next m617 m618) (next m618 m619) (next m619 m620)
    (next m620 m621) (next m621 m622) (next m622 m623) (next m623 m624) (next m624 m625)
    (next m625 m626) (next m626 m627) (next m627 m628) (next m628 m629) (next m629 m630)
    (next m630 m631) (next m631 m632) (next m632 m633) (next m633 m634) (next m634 m635)
    (next m635 m636) (next m636 m637) (next m637 m638) (next m638 m639) (next m639 m640)
    (next m640 m641) (next m641 m642) (next m642 m643) (next m643 m644) (next m644 m645)
    (next m645 m646) (next m646 m647) (next m647 m648) (next m648 m649) (next m649 m650)
    (next m650 m651) (next m651 m652) (next m652 m653) (next m653 m654) (next m654 m655)
    (next m655 m656) (next m656 m657) (next m657 m658) (next m658 m659) (next m659 m660)
    (next m660 m661) (next m661 m662) (next m662 m663) (next m663 m664) (next m664 m665)
    (next m665 m666) (next m666 m667) (next m667 m668) (next m668 m669) (next m669 m670)
    (next m670 m671) (next m671 m672) (next m672 m673) (next m673 m674) (next m674 m675)
    (next m675 m676) (next m676 m677) (next m677 m678) (next m678 m679) (next m679 m680)
    (next m680 m681) (next m681 m682) (next m682 m683) (next m683 m684) (next m684 m685)
    (next m685 m686) (next m686 m687) (next m687 m688) (next m688 m689) (next m689 m690)
    (next m690 m691) (next m691 m692) (next m692 m693) (next m693 m694) (next m694 m695)
    (next m695 m696) (next m696 m697) (next m697 m698) (next m698 m699) (next m699 m700)
    (next m700 m701) (next m701 m702) (next m702 m703) (next m703 m704) (next m704 m705)
    (next m705 m706) (next m706 m707) (next m707 m708) (next m708 m709) (next m709 m710)
    (next m710 m711) (next m711 m712) (next m712 m713) (next m713 m714) (next m714 m715)
    (next m715 m716) (next m716 m717) (next m717 m718) (next m718 m719) (next m719 m720)
    (next m720 m721) (next m721 m722) (next m722 m723) (next m723 m724) (next m724 m725)
    (next m725 m726) (next m726 m727) (next m727 m728) (next m728 m729) (next m729 m730)
    (next m730 m731) (next m731 m732) (next m732 m733) (next m733 m734) (next m734 m735)
    (next m735 m736) (next m736 m737) (next m737 m738) (next m738 m739) (next m739 m740)
    (next m740 m741) (next m741 m742) (next m742 m743) (next m743 m744) (next m744 m745)
    (next m745 m746) (next m746 m747) (next m747 m748) (next m748 m749) (next m749 m750)
    (next m750 m751) (next m751 m752) (next m752 m753) (next m753 m754) (next m754 m755)
    (next m755 m756) (next m756 m757) (next m757 m758) (next m758 m759)
    (next m759 m760) (next m760 m761) (next m761 m762) (next m762 m763) (next m763 m764)
    (next m764 m765) (next m765 m766) (next m766 m767) (next m767 m768) (next m768 m769)
    (next m769 m770) (next m770 m771) (next m771 m772) (next m772 m773) (next m773 m774)
    (next m774 m775) (next m775 m776) (next m776 m777) (next m777 m778) (next m778 m779)
    (next m779 m780) (next m780 m781) (next m781 m782) (next m782 m783) (next m783 m784)
    (next m784 m785) (next m785 m786) (next m786 m787) (next m787 m788) (next m788 m789)
    (next m789 m790) (next m790 m791) (next m791 m792) (next m792 m793) (next m793 m794)
    (next m794 m795) (next m795 m796) (next m796 m797) (next m797 m798) (next m798 m799)
    (next m799 m800) (next m800 m801) (next m801 m802) (next m802 m803) (next m803 m804)
    (next m804 m805) (next m805 m806) (next m806 m807) (next m807 m808) (next m808 m809)
    (next m809 m810) (next m810 m811) (next m811 m812) (next m812 m813) (next m813 m814)
    (next m814 m815) (next m815 m816) (next m816 m817) (next m817 m818) (next m818 m819)
    (next m819 m820) (next m820 m821) (next m821 m822) (next m822 m823) (next m823 m824)
    (next m824 m825) (next m825 m826) (next m826 m827) (next m827 m828) (next m828 m829)
    (next m829 m830) (next m830 m831) (next m831 m832) (next m832 m833) (next m833 m834)
    (next m834 m835) (next m835 m836) (next m836 m837) (next m837 m838) (next m838 m839)
    (next m839 m840) (next m840 m841) (next m841 m842) (next m842 m843) (next m843 m844)
    (next m844 m845) (next m845 m846) (next m846 m847) (next m847 m848) (next m848 m849)
    (next m849 m850) (next m850 m851) (next m851 m852) (next m852 m853) (next m853 m854)
    (next m854 m855) (next m855 m856) (next m856 m857) (next m857 m858) (next m858 m859)
    (next m859 m860) (next m860 m861) (next m861 m862) (next m862 m863) (next m863 m864)
    (next m864 m865) (next m865 m866) (next m866 m867) (next m867 m868) (next m868 m869)
    (next m869 m870) (next m870 m871) (next m871 m872) (next m872 m873) (next m873 m874)
    (next m874 m875) (next m875 m876) (next m876 m877) (next m877 m878) (next m878 m879)
    (next m879 m880) (next m880 m881) (next m881 m882) (next m882 m883) (next m883 m884)
    (next m884 m885) (next m885 m886) (next m886 m887) (next m887 m888) (next m888 m889)
    (next m889 m890) (next m890 m891) (next m891 m892) (next m892 m893) (next m893 m894)
    (next m894 m895) (next m895 m896) (next m896 m897) (next m897 m898) (next m898 m899)
    (next m899 m900) (next m900 m901) (next m901 m902) (next m902 m903) (next m903 m904)
    (next m904 m905) (next m905 m906) (next m906 m907) (next m907 m908) (next m908 m909)
    (next m909 m910) (next m910 m911) (next m911 m912) (next m912 m913) (next m913 m914)
    (next m914 m915) (next m915 m916) (next m916 m917) (next m917 m918) (next m918 m919)
    (next m919 m920) (next m920 m921) (next m921 m922) (next m922 m923) (next m923 m924)
    (next m924 m925) (next m925 m926) (next m926 m927) (next m927 m928) (next m928 m929)
    (next m929 m930) (next m930 m931) (next m931 m932) (next m932 m933) (next m933 m934)
    (next m934 m935) (next m935 m936) (next m936 m937) (next m937 m938) (next m938 m939)
    (next m939 m940) (next m940 m941) (next m941 m942) (next m942 m943) (next m943 m944)
    (next m944 m945) (next m945 m946) (next m946 m947) (next m947 m948) (next m948 m949)
    (next m949 m950) (next m950 m951) (next m951 m952) (next m952 m953) (next m953 m954)
    (next m954 m955) (next m955 m956) (next m956 m957) (next m957 m958) (next m958 m959)
    (next m959 m960) (next m960 m961) (next m961 m962) (next m962 m963) (next m963 m964)
    (next m964 m965) (next m965 m966) (next m966 m967) (next m967 m968) (next m968 m969)
    (next m969 m970) (next m970 m971) (next m971 m972) (next m972 m973) (next m973 m974)
    (next m974 m975) (next m975 m976) (next m976 m977) (next m977 m978) (next m978 m979)
    (next m979 m980) (next m980 m981) (next m981 m982) (next m982 m983) (next m983 m984)
    (next m984 m985) (next m985 m986) (next m986 m987) (next m987 m988) (next m988 m989)
    (next m989 m990) (next m990 m991) (next m991 m992) (next m992 m993) (next m993 m994)
    (next m994 m995) (next m995 m996) (next m996 m997) (next m997 m998) (next m998 m999)
    (next m999 m1000) (next m1000 m1001) (next m1001 m1002) (next m1002 m1003) (next m1003 m1004)
    (next m1004 m1005) (next m1005 m1006) (next m1006 m1007) (next m1007 m1008) (next m1008 m1009)
    (next m1009 m1010) (next m1010 m1011) (next m1011 m1012) (next m1012 m1013) (next m1013 m1014)
    (next m1014 m1015) (next m1015 m1016) (next m1016 m1017) (next m1017 m1018) (next m1018 m1019)
    (next m1019 m1020) (next m1020 m1021) (next m1021 m1022) (next m1022 m1023) (next m1023 m1024)
    (next m1024 m1025) (next m1025 m1026) (next m1026 m1027) (next m1027 m1028) (next m1028 m1029)
    (next m1029 m1030) (next m1030 m1031) (next m1031 m1032) (next m1032 m1033) (next m1033 m1034)
    (next m1034 m1035) (next m1035 m1036) (next m1036 m1037) (next m1037 m1038) (next m1038 m1039)
    (next m1039 m1040) (next m1040 m1041) (next m1041 m1042) (next m1042 m1043) (next m1043 m1044)
    (next m1044 m1045) (next m1045 m1046) (next m1046 m1047) (next m1047 m1048) (next m1048 m1049)
    (next m1049 m1050) (next m1050 m1051) (next m1051 m1052) (next m1052 m1053) (next m1053 m1054)
    (next m1054 m1055) (next m1055 m1056) (next m1056 m1057) (next m1057 m1058) (next m1058 m1059)
    (next m1059 m1060) (next m1060 m1061) (next m1061 m1062) (next m1062 m1063) (next m1063 m1064)
    (next m1064 m1065) (next m1065 m1066) (next m1066 m1067) (next m1067 m1068) (next m1068 m1069)
    (next m1069 m1070) (next m1070 m1071) (next m1071 m1072) (next m1072 m1073) (next m1073 m1074)
    (next m1074 m1075) (next m1075 m1076) (next m1076 m1077) (next m1077 m1078) (next m1078 m1079)
    (next m1079 m1080) (next m1080 m1081) (next m1081 m1082) (next m1082 m1083) (next m1083 m1084)
    (next m1084 m1085) (next m1085 m1086) (next m1086 m1087) (next m1087 m1088) (next m1088 m1089)
    (next m1089 m1090) (next m1090 m1091) (next m1091 m1092) (next m1092 m1093) (next m1093 m1094)
    (next m1094 m1095) (next m1095 m1096) (next m1096 m1097) (next m1097 m1098) (next m1098 m1099)
    (next m1099 m1100) (next m1100 m1101) (next m1101 m1102) (next m1102 m1103) (next m1103 m1104)
    (next m1104 m1105) (next m1105 m1106) (next m1106 m1107) (next m1107 m1108) (next m1108 m1109)
    (next m1109 m1110) (next m1110 m1111) (next m1111 m1112) (next m1112 m1113) (next m1113 m1114)
    (next m1114 m1115) (next m1115 m1116) (next m1116 m1117) (next m1117 m1118) (next m1118 m1119)
    (next m1119 m1120) (next m1120 m1121) (next m1121 m1122) (next m1122 m1123) (next m1123 m1124)
    (next m1124 m1125) (next m1125 m1126) (next m1126 m1127) (next m1127 m1128) (next m1128 m1129)
    (next m1129 m1130) (next m1130 m1131) (next m1131 m1132) (next m1132 m1133) (next m1133 m1134)
    (next m1134 m1135) (next m1135 m1136) (next m1136 m1137) (next m1137 m1138) (next m1138 m1139)
    (next m1139 m1140)

    (john-available-at m780) (john-available-at m781) (john-available-at m782) (john-available-at m783) (john-available-at m784)
    (john-available-at m785) (john-available-at m786) (john-available-at m787) (john-available-at m788) (john-available-at m789)
    (john-available-at m790) (john-available-at m791) (john-available-at m792) (john-available-at m793) (john-available-at m794)
    (john-available-at m795) (john-available-at m796) (john-available-at m797) (john-available-at m798) (john-available-at m799)
    (john-available-at m800) (john-available-at m801) (john-available-at m802) (john-available-at m803) (john-available-at m804)
    (john-available-at m805) (john-available-at m806) (john-available-at m807) (john-available-at m808) (john-available-at m809)
    (john-available-at m810) (john-available-at m811) (john-available-at m812) (john-available-at m813) (john-available-at m814)
    (john-available-at m815) (john-available-at m816) (john-available-at m817) (john-available-at m818) (john-available-at m819)
    (john-available-at m820) (john-available-at m821) (john-available-at m822) (john-available-at m823) (john-available-at m824)
    (john-available-at m825) (john-available-at m826) (john-available-at m827) (john-available-at m828) (john-available-at m829)
    (john-available-at m830) (john-available-at m831) (john-available-at m832) (john-available-at m833) (john-available-at m834)
    (john-available-at m835) (john-available-at m836) (john-available-at m837) (john-available-at m838) (john-available-at m839)
    (john-available-at m840) (john-available-at m841) (john-available-at m842) (john-available-at m843) (john-available-at m844)
    (john-available-at m845) (john-available-at m846) (john-available-at m847) (john-available-at m848) (john-available-at m849)
    (john-available-at m850) (john-available-at m851) (john-available-at m852) (john-available-at m853) (john-available-at m854)
    (john-available-at m855) (john-available-at m856) (john-available-at m857) (john-available-at m858) (john-available-at m859)
    (john-available-at m860) (john-available-at m861) (john-available-at m862) (john-available-at m863) (john-available-at m864)
    (john-available-at m865) (john-available-at m866) (john-available-at m867) (john-available-at m868) (john-available-at m869)
    (john-available-at m870) (john-available-at m871) (john-available-at m872) (john-available-at m873) (john-available-at m874)
    (john-available-at m875) (john-available-at m876) (john-available-at m877) (john-available-at m878) (john-available-at m879)
    (john-available-at m880) (john-available-at m881) (john-available-at m882) (john-available-at m883) (john-available-at m884)
    (john-available-at m885) (john-available-at m886) (john-available-at m887) (john-available-at m888) (john-available-at m889)
    (john-available-at m890) (john-available-at m891) (john-available-at m892) (john-available-at m893) (john-available-at m894)
    (john-available-at m895) (john-available-at m896) (john-available-at m897) (john-available-at m898) (john-available-at m899)
    (john-available-at m900) (john-available-at m901) (john-available-at m902) (john-available-at m903) (john-available-at m904)
    (john-available-at m905) (john-available-at m906) (john-available-at m907) (john-available-at m908) (john-available-at m909)
    (john-available-at m910) (john-available-at m911) (john-available-at m912) (john-available-at m913) (john-available-at m914)
    (john-available-at m915) (john-available-at m916) (john-available-at m917) (john-available-at m918) (john-available-at m919)
    (john-available-at m920) (john-available-at m921) (john-available-at m922) (john-available-at m923) (john-available-at m924)
    (john-available-at m925) (john-available-at m926) (john-available-at m927) (john-available-at m928) (john-available-at m929)
    (john-available-at m930) (john-available-at m931) (john-available-at m932) (john-available-at m933) (john-available-at m934)
    (john-available-at m935) (john-available-at m936) (john-available-at m937) (john-available-at m938) (john-available-at m939)
    (john-available-at m940) (john-available-at m941) (john-available-at m942) (john-available-at m943) (john-available-at m944)
    (john-available-at m945) (john-available-at m946) (john-available-at m947) (john-available-at m948) (john-available-at m949)
    (john-available-at m950) (john-available-at m951) (john-available-at m952) (john-available-at m953) (john-available-at m954)
    (john-available-at m955) (john-available-at m956) (john-available-at m957) (john-available-at m958) (john-available-at m959)
    (john-available-at m960) (john-available-at m961) (john-available-at m962) (john-available-at m963) (john-available-at m964)
    (john-available-at m965) (john-available-at m966) (john-available-at m967) (john-available-at m968) (john-available-at m969)
    (john-available-at m970) (john-available-at m971) (john-available-at m972) (john-available-at m973) (john-available-at m974)
    (john-available-at m975) (john-available-at m976) (john-available-at m977) (john-available-at m978) (john-available-at m979)
    (john-available-at m980) (john-available-at m981) (john-available-at m982) (john-available-at m983) (john-available-at m984)
    (john-available-at m985) (john-available-at m986) (john-available-at m987) (john-available-at m988) (john-available-at m989)
    (john-available-at m990) (john-available-at m991) (john-available-at m992) (john-available-at m993) (john-available-at m994)
    (john-available-at m995) (john-available-at m996) (john-available-at m997) (john-available-at m998) (john-available-at m999)
    (john-available-at m1000) (john-available-at m1001) (john-available-at m1002) (john-available-at m1003) (john-available-at m1004)
    (john-available-at m1005) (john-available-at m1006) (john-available-at m1007) (john-available-at m1008) (john-available-at m1009)
    (john-available-at m1010) (john-available-at m1011) (john-available-at m1012) (john-available-at m1013) (john-available-at m1014)
    (john-available-at m1015) (john-available-at m1016) (john-available-at m1017) (john-available-at m1018) (john-available-at m1019)
    (john-available-at m1020) (john-available-at m1021) (john-available-at m1022) (john-available-at m1023) (john-available-at m1024)
    (john-available-at m1025) (john-available-at m1026) (john-available-at m1027) (john-available-at m1028) (john-available-at m1029)
    (john-available-at m1030) (john-available-at m1031) (john-available-at m1032) (john-available-at m1033) (john-available-at m1034)
    (john-available-at m1035) (john-available-at m1036) (john-available-at m1037) (john-available-at m1038) (john-available-at m1039)
    (john-available-at m1040) (john-available-at m1041) (john-available-at m1042) (john-available-at m1043) (john-available-at m1044)
    (john-available-at m1045) (john-available-at m1046) (john-available-at m1047) (john-available-at m1048) (john-available-at m1049)
    (john-available-at m1050) (john-available-at m1051) (john-available-at m1052) (john-available-at m1053) (john-available-at m1054)
    (john-available-at m1055) (john-available-at m1056) (john-available-at m1057) (john-available-at m1058) (john-available-at m1059)
    (john-available-at m1060) (john-available-at m1061) (john-available-at m1062) (john-available-at m1063) (john-available-at m1064)
    (john-available-at m1065) (john-available-at m1066) (john-available-at m1067) (john-available-at m1068) (john-available-at m1069)
    (john-available-at m1070) (john-available-at m1071) (john-available-at m1072) (john-available-at m1073) (john-available-at m1074)
    (john-available-at m1075) (john-available-at m1076) (john-available-at m1077) (john-available-at m1078) (john-available-at m1079)
    (john-available-at m1080) (john-available-at m1081) (john-available-at m1082) (john-available-at m1083) (john-available-at m1084)
    (john-available-at m1085) (john-available-at m1086) (john-available-at m1087) (john-available-at m1088) (john-available-at m1089)
    (john-available-at m1090) (john-available-at m1091) (john-available-at m1092) (john-available-at m1093) (john-available-at m1094)

    (plus21 m759 m780) (plus21 m760 m781) (plus21 m761 m782) (plus21 m762 m783) (plus21 m763 m784)
    (plus21 m764 m785) (plus21 m765 m786) (plus21 m766 m787) (plus21 m767 m788) (plus21 m768 m789)
    (plus21 m769 m790) (plus21 m770 m791) (plus21 m771 m792) (plus21 m772 m793) (plus21 m773 m794)
    (plus21 m774 m795) (plus21 m775 m796) (plus21 m776 m797) (plus21 m777 m798) (plus21 m778 m799)
    (plus21 m779 m800) (plus21 m780 m801) (plus21 m781 m802) (plus21 m782 m803) (plus21 m783 m804)
    (plus21 m784 m805) (plus21 m785 m806) (plus21 m786 m807) (plus21 m787 m808) (plus21 m788 m809)
    (plus21 m789 m810) (plus21 m790 m811) (plus21 m791 m812) (plus21 m792 m813) (plus21 m793 m814)
    (plus21 m794 m815) (plus21 m795 m816) (plus21 m796 m817) (plus21 m797 m818) (plus21 m798 m819)
    (plus21 m799 m820) (plus21 m800 m821) (plus21 m801 m822) (plus21 m802 m823) (plus21 m803 m824)
    (plus21 m804 m825) (plus21 m805 m826) (plus21 m806 m827) (plus21 m807 m828) (plus21 m808 m829)
    (plus21 m809 m830) (plus21 m810 m831) (plus21 m811 m832) (plus21 m812 m833) (plus21 m813 m834)
    (plus21 m814 m835) (plus21 m815 m836) (plus21 m816 m837) (plus21 m817 m838) (plus21 m818 m839)
    (plus21 m819 m840) (plus21 m820 m841) (plus21 m821 m842) (plus21 m822 m843) (plus21 m823 m844)
    (plus21 m824 m845) (plus21 m825 m846) (plus21 m826 m847) (plus21 m827 m848) (plus21 m828 m849)
    (plus21 m829 m850) (plus21 m830 m851) (plus21 m831 m852) (plus21 m832 m853) (plus21 m833 m854)
    (plus21 m834 m855) (plus21 m835 m856) (plus21 m836 m857) (plus21 m837 m858) (plus21 m838 m859)
    (plus21 m839 m860) (plus21 m840 m861) (plus21 m841 m862) (plus21 m842 m863) (plus21 m843 m864)
    (plus21 m844 m865) (plus21 m845 m866) (plus21 m846 m867) (plus21 m847 m868) (plus21 m848 m869)
    (plus21 m849 m870) (plus21 m850 m871) (plus21 m851 m872) (plus21 m852 m873) (plus21 m853 m874)
    (plus21 m854 m875) (plus21 m855 m876) (plus21 m856 m877) (plus21 m857 m878) (plus21 m858 m879)
    (plus21 m859 m880) (plus21 m860 m881) (plus21 m861 m882) (plus21 m862 m883) (plus21 m863 m884)
    (plus21 m864 m885) (plus21 m865 m886) (plus21 m866 m887) (plus21 m867 m888) (plus21 m868 m889)
    (plus21 m869 m890) (plus21 m870 m891) (plus21 m871 m892) (plus21 m872 m893) (plus21 m873 m894)
    (plus21 m874 m895) (plus21 m875 m896) (plus21 m876 m897) (plus21 m877 m898) (plus21 m878 m899)
    (plus21 m879 m900) (plus21 m880 m901) (plus21 m881 m902) (plus21 m882 m903) (plus21 m883 m904)
    (plus21 m884 m905) (plus21 m885 m906) (plus21 m886 m907) (plus21 m887 m908) (plus21 m888 m909)
    (plus21 m889 m910) (plus21 m890 m911) (plus21 m891 m912) (plus21 m892 m913) (plus21 m893 m914)
    (plus21 m894 m915) (plus21 m895 m916) (plus21 m896 m917) (plus21 m897 m918) (plus21 m898 m919)
    (plus21 m899 m920) (plus21 m900 m921) (plus21 m901 m922) (plus21 m902 m923) (plus21 m903 m924)
    (plus21 m904 m925) (plus21 m905 m926) (plus21 m906 m927) (plus21 m907 m928) (plus21 m908 m929)
    (plus21 m909 m930) (plus21 m910 m931) (plus21 m911 m932) (plus21 m912 m933) (plus21 m913 m934)
    (plus21 m914 m935) (plus21 m915 m936) (plus21 m916 m937) (plus21 m917 m938) (plus21 m918 m939)
    (plus21 m919 m940) (plus21 m920 m941) (plus21 m921 m942) (plus21 m922 m943) (plus21 m923 m944)
    (plus21 m924 m945) (plus21 m925 m946) (plus21 m926 m947) (plus21 m927 m948) (plus21 m928 m949)
    (plus21 m929 m950) (plus21 m930 m951) (plus21 m931 m952) (plus21 m932 m953) (plus21 m933 m954)
    (plus21 m934 m955) (plus21 m935 m956) (plus21 m936 m957) (plus21 m937 m958) (plus21 m938 m959)
    (plus21 m939 m960) (plus21 m940 m961) (plus21 m941 m962) (plus21 m942 m963) (plus21 m943 m964)
    (plus21 m944 m965) (plus21 m945 m966) (plus21 m946 m967) (plus21 m947 m968) (plus21 m948 m969)
    (plus21 m949 m970) (plus21 m950 m971) (plus21 m951 m972) (plus21 m952 m973) (plus21 m953 m974)
    (plus21 m954 m975) (plus21 m955 m976) (plus21 m956 m977) (plus21 m957 m978) (plus21 m958 m979)
    (plus21 m959 m980) (plus21 m960 m981) (plus21 m961 m982) (plus21 m962 m983) (plus21 m963 m984)
    (plus21 m964 m985) (plus21 m965 m986) (plus21 m966 m987) (plus21 m967 m988) (plus21 m968 m989)
    (plus21 m969 m990) (plus21 m970 m991) (plus21 m971 m992) (plus21 m972 m993) (plus21 m973 m994)
    (plus21 m974 m995) (plus21 m975 m996) (plus21 m976 m997) (plus21 m977 m998) (plus21 m978 m999)
    (plus21 m979 m1000) (plus21 m980 m1001) (plus21 m981 m1002) (plus21 m982 m1003) (plus21 m983 m1004)
    (plus21 m984 m1005) (plus21 m985 m1006) (plus21 m986 m1007) (plus21 m987 m1008) (plus21 m988 m1009)
    (plus21 m989 m1010) (plus21 m990 m1011) (plus21 m991 m1012) (plus21 m992 m1013) (plus21 m993 m1014)
    (plus21 m994 m1015) (plus21 m995 m1016) (plus21 m996 m1017) (plus21 m997 m1018) (plus21 m998 m1019)
    (plus21 m999 m1020) (plus21 m1000 m1021) (plus21 m1001 m1022) (plus21 m1002 m1023) (plus21 m1003 m1024)
    (plus21 m1004 m1025) (plus21 m1005 m1026) (plus21 m1006 m1027) (plus21 m1007 m1028) (plus21 m1008 m1029)
    (plus21 m1009 m1030) (plus21 m1010 m1031) (plus21 m1011 m1032) (plus21 m1012 m1033) (plus21 m1013 m1034)
    (plus21 m1014 m1035) (plus21 m1015 m1036) (plus21 m1016 m1037) (plus21 m1017 m1038) (plus21 m1018 m1039)
    (plus21 m1019 m1040) (plus21 m1020 m1041) (plus21 m1021 m1042) (plus21 m1022 m1043) (plus21 m1023 m1044)
    (plus21 m1024 m1045) (plus21 m1025 m1046) (plus21 m1026 m1047) (plus21 m1027 m1048) (plus21 m1028 m1049)
    (plus21 m1029 m1050) (plus21 m1030 m1051) (plus21 m1031 m1052) (plus21 m1032 m1053) (plus21 m1033 m1054)
    (plus21 m1034 m1055) (plus21 m1035 m1056) (plus21 m1036 m1057) (plus21 m1037 m1058) (plus21 m1038 m1059)
    (plus21 m1039 m1060) (plus21 m1040 m1061) (plus21 m1041 m1062) (plus21 m1042 m1063) (plus21 m1043 m1064)
    (plus21 m1044 m1065) (plus21 m1045 m1066) (plus21 m1046 m1067) (plus21 m1047 m1068) (plus21 m1048 m1069)
    (plus21 m1049 m1070) (plus21 m1050 m1071) (plus21 m1051 m1072) (plus21 m1052 m1073) (plus21 m1053 m1074)
    (plus21 m1054 m1075) (plus21 m1055 m1076) (plus21 m1056 m1077) (plus21 m1057 m1078) (plus21 m1058 m1079)
    (plus21 m1059 m1080) (plus21 m1060 m1081) (plus21 m1061 m1082) (plus21 m1062 m1083) (plus21 m1063 m1084)
    (plus21 m1064 m1085) (plus21 m1065 m1086) (plus21 m1066 m1087) (plus21 m1067 m1088) (plus21 m1068 m1089)
    (plus21 m1069 m1090) (plus21 m1070 m1091) (plus21 m1071 m1092) (plus21 m1072 m1093) (plus21 m1073 m1094)
    (plus21 m1074 m1095)

    (plus19 m780 m799) (plus19 m781 m800) (plus19 m782 m801) (plus19 m783 m802) (plus19 m784 m803)
    (plus19 m785 m804) (plus19 m786 m805) (plus19 m787 m806) (plus19 m788 m807) (plus19 m789 m808)
    (plus19 m790 m809) (plus19 m791 m810) (plus19 m792 m811) (plus19 m793 m812) (plus19 m794 m813)
    (plus19 m795 m814) (plus19 m796 m815) (plus19 m797 m816) (plus19 m798 m817) (plus19 m799 m818)
    (plus19 m800 m819) (plus19 m801 m820) (plus19 m802 m821) (plus19 m803 m822) (plus19 m804 m823)
    (plus19 m805 m824) (plus19 m806 m825) (plus19 m807 m826) (plus19 m808 m827) (plus19 m809 m828)
    (plus19 m810 m829) (plus19 m811 m830) (plus19 m812 m831) (plus19 m813 m832) (plus19 m814 m833)
    (plus19 m815 m834) (plus19 m816 m835) (plus19 m817 m836) (plus19 m818 m837) (plus19 m819 m838)
    (plus19 m820 m839) (plus19 m821 m840) (plus19 m822 m841) (plus19 m823 m842) (plus19 m824 m843)
    (plus19 m825 m844) (plus19 m826 m845) (plus19 m827 m846) (plus19 m828 m847) (plus19 m829 m848)
    (plus19 m830 m849) (plus19 m831 m850) (plus19 m832 m851) (plus19 m833 m852) (plus19 m834 m853)
    (plus19 m835 m854) (plus19 m836 m855) (plus19 m837 m856) (plus19 m838 m857) (plus19 m839 m858)
    (plus19 m840 m859) (plus19 m841 m860) (plus19 m842 m861) (plus19 m843 m862) (plus19 m844 m863)
    (plus19 m845 m864) (plus19 m846 m865) (plus19 m847 m866) (plus19 m848 m867) (plus19 m849 m868)
    (plus19 m850 m869) (plus19 m851 m870) (plus19 m852 m871) (plus19 m853 m872) (plus19 m854 m873)
    (plus19 m855 m874) (plus19 m856 m875) (plus19 m857 m876) (plus19 m858 m877) (plus19 m859 m878)
    (plus19 m860 m879) (plus19 m861 m880) (plus19 m862 m881) (plus19 m863 m882) (plus19 m864 m883)
    (plus19 m865 m884) (plus19 m866 m885) (plus19 m867 m886) (plus19 m868 m887) (plus19 m869 m888)
    (plus19 m870 m889) (plus19 m871 m890) (plus19 m872 m891) (plus19 m873 m892) (plus19 m874 m893)
    (plus19 m875 m894) (plus19 m876 m895) (plus19 m877 m896) (plus19 m878 m897) (plus19 m879 m898)
    (plus19 m880 m899) (plus19 m881 m900) (plus19 m882 m901) (plus19 m883 m902) (plus19 m884 m903)
    (plus19 m885 m904) (plus19 m886 m905) (plus19 m887 m906) (plus19 m888 m907) (plus19 m889 m908)
    (plus19 m890 m909) (plus19 m891 m910) (plus19 m892 m911) (plus19 m893 m912) (plus19 m894 m913)
    (plus19 m895 m914) (plus19 m896 m915) (plus19 m897 m916) (plus19 m898 m917) (plus19 m899 m918)
    (plus19 m900 m919) (plus19 m901 m920) (plus19 m902 m921) (plus19 m903 m922) (plus19 m904 m923)
    (plus19 m905 m924) (plus19 m906 m925) (plus19 m907 m926) (plus19 m908 m927) (plus19 m909 m928)
    (plus19 m910 m929) (plus19 m911 m930) (plus19 m912 m931) (plus19 m913 m932) (plus19 m914 m933)
    (plus19 m915 m934) (plus19 m916 m935) (plus19 m917 m936) (plus19 m918 m937) (plus19 m919 m938)
    (plus19 m920 m939) (plus19 m921 m940) (plus19 m922 m941) (plus19 m923 m942) (plus19 m924 m943)
    (plus19 m925 m944) (plus19 m926 m945) (plus19 m927 m946) (plus19 m928 m947) (plus19 m929 m948)
    (plus19 m930 m949) (plus19 m931 m950) (plus19 m932 m951) (plus19 m933 m952) (plus19 m934 m953)
    (plus19 m935 m954) (plus19 m936 m955) (plus19 m937 m956) (plus19 m938 m957) (plus19 m939 m958)
    (plus19 m940 m959) (plus19 m941 m960) (plus19 m942 m961) (plus19 m943 m962) (plus19 m944 m963)
    (plus19 m945 m964) (plus19 m946 m965) (plus19 m947 m966) (plus19 m948 m967) (plus19 m949 m968)
    (plus19 m950 m969) (plus19 m951 m970) (plus19 m952 m971) (plus19 m953 m972) (plus19 m954 m973)
    (plus19 m955 m974) (plus19 m956 m975) (plus19 m957 m976) (plus19 m958 m977) (plus19 m959 m978)
    (plus19 m960 m979) (plus19 m961 m980) (plus19 m962 m981) (plus19 m963 m982) (plus19 m964 m983)
    (plus19 m965 m984) (plus19 m966 m985) (plus19 m967 m986) (plus19 m968 m987) (plus19 m969 m988)
    (plus19 m970 m989) (plus19 m971 m990) (plus19 m972 m991) (plus19 m973 m992) (plus19 m974 m993)
    (plus19 m975 m994) (plus19 m976 m995) (plus19 m977 m996) (plus19 m978 m997) (plus19 m979 m998)
    (plus19 m980 m999) (plus19 m981 m1000) (plus19 m982 m1001) (plus19 m983 m1002) (plus19 m984 m1003)
    (plus19 m985 m1004) (plus19 m986 m1005) (plus19 m987 m1006) (plus19 m988 m1007) (plus19 m989 m1008)
    (plus19 m990 m1009) (plus19 m991 m1010) (plus19 m992 m1011) (plus19 m993 m1012) (plus19 m994 m1013)
    (plus19 m995 m1014) (plus19 m996 m1015) (plus19 m997 m1016) (plus19 m998 m1017) (plus19 m999 m1018)
    (plus19 m1000 m1019) (plus19 m1001 m1020) (plus19 m1002 m1021) (plus19 m1003 m1022) (plus19 m1004 m1023)
    (plus19 m1005 m1024) (plus19 m1006 m1025) (plus19 m1007 m1026) (plus19 m1008 m1027) (plus19 m1009 m1028)
    (plus19 m1010 m1029) (plus19 m1011 m1030) (plus19 m1012 m1031) (plus19 m1013 m1032) (plus19 m1014 m1033)
    (plus19 m1015 m1034) (plus19 m1016 m1035) (plus19 m1017 m1036) (plus19 m1018 m1037) (plus19 m1019 m1038)
    (plus19 m1020 m1039) (plus19 m1021 m1040) (plus19 m1022 m1041) (plus19 m1023 m1042) (plus19 m1024 m1043)
    (plus19 m1025 m1044) (plus19 m1026 m1045) (plus19 m1027 m1046) (plus19 m1028 m1047) (plus19 m1029 m1048)
    (plus19 m1030 m1049) (plus19 m1031 m1050) (plus19 m1032 m1051) (plus19 m1033 m1052) (plus19 m1034 m1053)
    (plus19 m1035 m1054) (plus19 m1036 m1055) (plus19 m1037 m1056) (plus19 m1038 m1057) (plus19 m1039 m1058)
    (plus19 m1040 m1059) (plus19 m1041 m1060) (plus19 m1042 m1061) (plus19 m1043 m1062) (plus19 m1044 m1063)
    (plus19 m1045 m1064) (plus19 m1046 m1065) (plus19 m1047 m1066) (plus19 m1048 m1067) (plus19 m1049 m1068)
    (plus19 m1050 m1069) (plus19 m1051 m1070) (plus19 m1052 m1071) (plus19 m1053 m1072) (plus19 m1054 m1073)
    (plus19 m1055 m1074) (plus19 m1056 m1075) (plus19 m1057 m1076) (plus19 m1058 m1077) (plus19 m1059 m1078)
    (plus19 m1060 m1079) (plus19 m1061 m1080) (plus19 m1062 m1081) (plus19 m1063 m1082) (plus19 m1064 m1083)
    (plus19 m1065 m1084) (plus19 m1066 m1085) (plus19 m1067 m1086) (plus19 m1068 m1087) (plus19 m1069 m1088)
    (plus19 m1070 m1089) (plus19 m1071 m1090) (plus19 m1072 m1091) (plus19 m1073 m1092) (plus19 m1074 m1093)
    (plus19 m1075 m1094) (plus19 m1076 m1095) (plus19 m1077 m1096) (plus19 m1078 m1097) (plus19 m1079 m1098)
    (plus19 m1080 m1099) (plus19 m1081 m1100) (plus19 m1082 m1101) (plus19 m1083 m1102) (plus19 m1084 m1103)
    (plus19 m1085 m1104) (plus19 m1086 m1105) (plus19 m1087 m1106) (plus19 m1088 m1107) (plus19 m1089 m1108)
    (plus19 m1090 m1109) (plus19 m1091 m1110) (plus19 m1092 m1111) (plus19 m1093 m1112) (plus19 m1094 m1113)
    (plus19 m1095 m1114) (plus19 m1096 m1115) (plus19 m1097 m1116) (plus19 m1098 m1117) (plus19 m1099 m1118)
    (plus19 m1100 m1119) (plus19 m1101 m1120) (plus19 m1102 m1121) (plus19 m1103 m1122) (plus19 m1104 m1123)
    (plus19 m1105 m1124) (plus19 m1106 m1125) (plus19 m1107 m1126) (plus19 m1108 m1127) (plus19 m1109 m1128)
    (plus19 m1110 m1129) (plus19 m1111 m1130) (plus19 m1112 m1131) (plus19 m1113 m1132) (plus19 m1114 m1133)
    (plus19 m1115 m1134) (plus19 m1116 m1135) (plus19 m1117 m1136) (plus19 m1118 m1137) (plus19 m1119 m1138)
    (plus19 m1120 m1139) (plus19 m1121 m1140)

    (count-next-pre90 c0 c1) (count-next-pre90 c1 c2) (count-next-pre90 c2 c3) (count-next-pre90 c3 c4) (count-next-pre90 c4 c5)
    (count-next-pre90 c5 c6) (count-next-pre90 c6 c7) (count-next-pre90 c7 c8) (count-next-pre90 c8 c9) (count-next-pre90 c9 c10)
    (count-next-pre90 c10 c11) (count-next-pre90 c11 c12) (count-next-pre90 c12 c13) (count-next-pre90 c13 c14) (count-next-pre90 c14 c15)
    (count-next-pre90 c15 c16) (count-next-pre90 c16 c17) (count-next-pre90 c17 c18) (count-next-pre90 c18 c19) (count-next-pre90 c19 c20)
    (count-next-pre90 c20 c21) (count-next-pre90 c21 c22) (count-next-pre90 c22 c23) (count-next-pre90 c23 c24) (count-next-pre90 c24 c25)
    (count-next-pre90 c25 c26) (count-next-pre90 c26 c27) (count-next-pre90 c27 c28) (count-next-pre90 c28 c29) (count-next-pre90 c29 c30)
    (count-next-pre90 c30 c31) (count-next-pre90 c31 c32) (count-next-pre90 c32 c33) (count-next-pre90 c33 c34) (count-next-pre90 c34 c35)
    (count-next-pre90 c35 c36) (count-next-pre90 c36 c37) (count-next-pre90 c37 c38) (count-next-pre90 c38 c39) (count-next-pre90 c39 c40)
    (count-next-pre90 c40 c41) (count-next-pre90 c41 c42) (count-next-pre90 c42 c43) (count-next-pre90 c43 c44) (count-next-pre90 c44 c45)
    (count-next-pre90 c45 c46) (count-next-pre90 c46 c47) (count-next-pre90 c47 c48) (count-next-pre90 c48 c49) (count-next-pre90 c49 c50)
    (count-next-pre90 c50 c51) (count-next-pre90 c51 c52) (count-next-pre90 c52 c53) (count-next-pre90 c53 c54) (count-next-pre90 c54 c55)
    (count-next-pre90 c55 c56) (count-next-pre90 c56 c57) (count-next-pre90 c57 c58) (count-next-pre90 c58 c59) (count-next-pre90 c59 c60)
    (count-next-pre90 c60 c61) (count-next-pre90 c61 c62) (count-next-pre90 c62 c63) (count-next-pre90 c63 c64) (count-next-pre90 c64 c65)
    (count-next-pre90 c65 c66) (count-next-pre90 c66 c67) (count-next-pre90 c67 c68) (count-next-pre90 c68 c69) (count-next-pre90 c69 c70)
    (count-next-pre90 c70 c71) (count-next-pre90 c71 c72) (count-next-pre90 c72 c73) (count-next-pre90 c73 c74) (count-next-pre90 c74 c75)
    (count-next-pre90 c75 c76) (count-next-pre90 c76 c77) (count-next-pre90 c77 c78) (count-next-pre90 c78 c79) (count-next-pre90 c79 c80)
    (count-next-pre90 c80 c81) (count-next-pre90 c81 c82) (count-next-pre90 c82 c83) (count-next-pre90 c83 c84) (count-next-pre90 c84 c85)
    (count-next-pre90 c85 c86) (count-next-pre90 c86 c87) (count-next-pre90 c87 c88) (count-next-pre90 c88 c89)

    (count-next-90 c89 c90)
  )

  (:goal
    (and
      (met-at-least-90)
      (at traveler russian_hill)
      (time m1140)
    )
  )

  (:metric minimize (total-cost))
)