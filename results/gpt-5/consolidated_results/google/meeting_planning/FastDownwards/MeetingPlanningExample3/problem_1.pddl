(define (problem meetingplanningexample3-problem)
  (:domain meetingplanningexample3-domain)

  (:objects
    me - agent
    barbara - person
    bayview goldengatepark - location
    ; time points from 09:00 to 10:52
    t0900 t0901 t0902 t0903 t0904 t0905 t0906 t0907 t0908 t0909
    t0910 t0911 t0912 t0913 t0914 t0915 t0916 t0917 t0918 t0919
    t0920 t0921 t0922 t0923 t0924 t0925 t0926 t0927 t0928 t0929
    t0930 t0931 t0932 t0933 t0934 t0935 t0936 t0937 t0938 t0939
    t0940 t0941 t0942 t0943 t0944 t0945 t0946 t0947 t0948 t0949
    t0950 t0951 t0952 t0953 t0954 t0955 t0956 t0957 t0958 t0959
    t1000 t1001 t1002 t1003 t1004 t1005 t1006 t1007 t1008 t1009
    t1010 t1011 t1012 t1013 t1014 t1015 t1016 t1017 t1018 t1019
    t1020 t1021 t1022 t1023 t1024 t1025 t1026 t1027 t1028 t1029
    t1030 t1031 t1032 t1033 t1034 t1035 t1036 t1037 t1038 t1039
    t1040 t1041 t1042 t1043 t1044 t1045 t1046 t1047 t1048 t1049
    t1050 t1051 t1052 - time
    ; meeting minute counter levels l0..l90 (l90 means 90 minutes remaining)
    l0 l1 l2 l3 l4 l5 l6 l7 l8 l9
    l10 l11 l12 l13 l14 l15 l16 l17 l18 l19
    l20 l21 l22 l23 l24 l25 l26 l27 l28 l29
    l30 l31 l32 l33 l34 l35 l36 l37 l38 l39
    l40 l41 l42 l43 l44 l45 l46 l47 l48 l49
    l50 l51 l52 l53 l54 l55 l56 l57 l58 l59
    l60 l61 l62 l63 l64 l65 l66 l67 l68 l69
    l70 l71 l72 l73 l74 l75 l76 l77 l78 l79
    l80 l81 l82 l83 l84 l85 l86 l87 l88 l89
    l90 - level
  )

  (:init
    (at me bayview)
    (current t0900)
    (need l90)

    ; level predecessor chain: prev(lp, ln) means lp = ln - 1
    (prev l89 l90) (prev l88 l89) (prev l87 l88) (prev l86 l87) (prev l85 l86)
    (prev l84 l85) (prev l83 l84) (prev l82 l83) (prev l81 l82) (prev l80 l81)
    (prev l79 l80) (prev l78 l79) (prev l77 l78) (prev l76 l77) (prev l75 l76)
    (prev l74 l75) (prev l73 l74) (prev l72 l73) (prev l71 l72) (prev l70 l71)
    (prev l69 l70) (prev l68 l69) (prev l67 l68) (prev l66 l67) (prev l65 l66)
    (prev l64 l65) (prev l63 l64) (prev l62 l63) (prev l61 l62) (prev l60 l61)
    (prev l59 l60) (prev l58 l59) (prev l57 l58) (prev l56 l57) (prev l55 l56)
    (prev l54 l55) (prev l53 l54) (prev l52 l53) (prev l51 l52) (prev l50 l51)
    (prev l49 l50) (prev l48 l49) (prev l47 l48) (prev l46 l47) (prev l45 l46)
    (prev l44 l45) (prev l43 l44) (prev l42 l43) (prev l41 l42) (prev l40 l41)
    (prev l39 l40) (prev l38 l39) (prev l37 l38) (prev l36 l37) (prev l35 l36)
    (prev l34 l35) (prev l33 l34) (prev l32 l33) (prev l31 l32) (prev l30 l31)
    (prev l29 l30) (prev l28 l29) (prev l27 l28) (prev l26 l27) (prev l25 l26)
    (prev l24 l25) (prev l23 l24) (prev l22 l23) (prev l21 l22) (prev l20 l21)
    (prev l19 l20) (prev l18 l19) (prev l17 l18) (prev l16 l17) (prev l15 l16)
    (prev l14 l15) (prev l13 l14) (prev l12 l13) (prev l11 l12) (prev l10 l11)
    (prev l9 l10)  (prev l8 l9)   (prev l7 l8)   (prev l6 l7)   (prev l5 l6)
    (prev l4 l5)   (prev l3 l4)   (prev l2 l3)   (prev l1 l2)   (prev l0 l1)

    ; next-minute links 09:00 -> 10:52
    (next t0900 t0901) (next t0901 t0902) (next t0902 t0903) (next t0903 t0904) (next t0904 t0905)
    (next t0905 t0906) (next t0906 t0907) (next t0907 t0908) (next t0908 t0909) (next t0909 t0910)
    (next t0910 t0911) (next t0911 t0912) (next t0912 t0913) (next t0913 t0914) (next t0914 t0915)
    (next t0915 t0916) (next t0916 t0917) (next t0917 t0918) (next t0918 t0919) (next t0919 t0920)
    (next t0920 t0921) (next t0921 t0922) (next t0922 t0923) (next t0923 t0924) (next t0924 t0925)
    (next t0925 t0926) (next t0926 t0927) (next t0927 t0928) (next t0928 t0929) (next t0929 t0930)
    (next t0930 t0931) (next t0931 t0932) (next t0932 t0933) (next t0933 t0934) (next t0934 t0935)
    (next t0935 t0936) (next t0936 t0937) (next t0937 t0938) (next t0938 t0939) (next t0939 t0940)
    (next t0940 t0941) (next t0941 t0942) (next t0942 t0943) (next t0943 t0944) (next t0944 t0945)
    (next t0945 t0946) (next t0946 t0947) (next t0947 t0948) (next t0948 t0949) (next t0949 t0950)
    (next t0950 t0951) (next t0951 t0952) (next t0952 t0953) (next t0953 t0954) (next t0954 t0955)
    (next t0955 t0956) (next t0956 t0957) (next t0957 t0958) (next t0958 t0959) (next t0959 t1000)
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
    (next t1050 t1051) (next t1051 t1052)

    ; Barbara's 1-minute-slot availability starts (valid from 09:00 to 11:29; within horizon that's 09:00–10:51)
    (avail-barbara t0900) (avail-barbara t0901) (avail-barbara t0902) (avail-barbara t0903) (avail-barbara t0904)
    (avail-barbara t0905) (avail-barbara t0906) (avail-barbara t0907) (avail-barbara t0908) (avail-barbara t0909)
    (avail-barbara t0910) (avail-barbara t0911) (avail-barbara t0912) (avail-barbara t0913) (avail-barbara t0914)
    (avail-barbara t0915) (avail-barbara t0916) (avail-barbara t0917) (avail-barbara t0918) (avail-barbara t0919)
    (avail-barbara t0920) (avail-barbara t0921) (avail-barbara t0922) (avail-barbara t0923) (avail-barbara t0924)
    (avail-barbara t0925) (avail-barbara t0926) (avail-barbara t0927) (avail-barbara t0928) (avail-barbara t0929)
    (avail-barbara t0930) (avail-barbara t0931) (avail-barbara t0932) (avail-barbara t0933) (avail-barbara t0934)
    (avail-barbara t0935) (avail-barbara t0936) (avail-barbara t0937) (avail-barbara t0938) (avail-barbara t0939)
    (avail-barbara t0940) (avail-barbara t0941) (avail-barbara t0942) (avail-barbara t0943) (avail-barbara t0944)
    (avail-barbara t0945) (avail-barbara t0946) (avail-barbara t0947) (avail-barbara t0948) (avail-barbara t0949)
    (avail-barbara t0950) (avail-barbara t0951) (avail-barbara t0952) (avail-barbara t0953) (avail-barbara t0954)
    (avail-barbara t0955) (avail-barbara t0956) (avail-barbara t0957) (avail-barbara t0958) (avail-barbara t0959)
    (avail-barbara t1000) (avail-barbara t1001) (avail-barbara t1002) (avail-barbara t1003) (avail-barbara t1004)
    (avail-barbara t1005) (avail-barbara t1006) (avail-barbara t1007) (avail-barbara t1008) (avail-barbara t1009)
    (avail-barbara t1010) (avail-barbara t1011) (avail-barbara t1012) (avail-barbara t1013) (avail-barbara t1014)
    (avail-barbara t1015) (avail-barbara t1016) (avail-barbara t1017) (avail-barbara t1018) (avail-barbara t1019)
    (avail-barbara t1020) (avail-barbara t1021) (avail-barbara t1022) (avail-barbara t1023) (avail-barbara t1024)
    (avail-barbara t1025) (avail-barbara t1026) (avail-barbara t1027) (avail-barbara t1028) (avail-barbara t1029)
    (avail-barbara t1030) (avail-barbara t1031) (avail-barbara t1032) (avail-barbara t1033) (avail-barbara t1034)
    (avail-barbara t1035) (avail-barbara t1036) (avail-barbara t1037) (avail-barbara t1038) (avail-barbara t1039)
    (avail-barbara t1040) (avail-barbara t1041) (avail-barbara t1042) (avail-barbara t1043) (avail-barbara t1044)
    (avail-barbara t1045) (avail-barbara t1046) (avail-barbara t1047) (avail-barbara t1048) (avail-barbara t1049)
    (avail-barbara t1050) (avail-barbara t1051)

    ; travel duration pairs: 22-minute jump windows within horizon
    (offset22 t0900 t0922) (offset22 t0901 t0923) (offset22 t0902 t0924) (offset22 t0903 t0925) (offset22 t0904 t0926)
    (offset22 t0905 t0927) (offset22 t0906 t0928) (offset22 t0907 t0929) (offset22 t0908 t0930) (offset22 t0909 t0931)
    (offset22 t0910 t0932) (offset22 t0911 t0933) (offset22 t0912 t0934) (offset22 t0913 t0935) (offset22 t0914 t0936)
    (offset22 t0915 t0937) (offset22 t0916 t0938) (offset22 t0917 t0939) (offset22 t0918 t0940) (offset22 t0919 t0941)
    (offset22 t0920 t0942) (offset22 t0921 t0943) (offset22 t0922 t0944) (offset22 t0923 t0945) (offset22 t0924 t0946)
    (offset22 t0925 t0947) (offset22 t0926 t0948) (offset22 t0927 t0949) (offset22 t0928 t0950) (offset22 t0929 t0951)
    (offset22 t0930 t0952) (offset22 t0931 t0953) (offset22 t0932 t0954) (offset22 t0933 t0955) (offset22 t0934 t0956)
    (offset22 t0935 t0957) (offset22 t0936 t0958) (offset22 t0937 t0959) (offset22 t0938 t1000) (offset22 t0939 t1001)
    (offset22 t0940 t1002) (offset22 t0941 t1003) (offset22 t0942 t1004) (offset22 t0943 t1005) (offset22 t0944 t1006)
    (offset22 t0945 t1007) (offset22 t0946 t1008) (offset22 t0947 t1009) (offset22 t0948 t1010) (offset22 t0949 t1011)
    (offset22 t0950 t1012) (offset22 t0951 t1013) (offset22 t0952 t1014) (offset22 t0953 t1015) (offset22 t0954 t1016)
    (offset22 t0955 t1017) (offset22 t0956 t1018) (offset22 t0957 t1019) (offset22 t0958 t1020) (offset22 t0959 t1021)
    (offset22 t1000 t1022) (offset22 t1001 t1023) (offset22 t1002 t1024) (offset22 t1003 t1025) (offset22 t1004 t1026)
    (offset22 t1005 t1027) (offset22 t1006 t1028) (offset22 t1007 t1029) (offset22 t1008 t1030) (offset22 t1009 t1031)
    (offset22 t1010 t1032) (offset22 t1011 t1033) (offset22 t1012 t1034) (offset22 t1013 t1035) (offset22 t1014 t1036)
    (offset22 t1015 t1037) (offset22 t1016 t1038) (offset22 t1017 t1039) (offset22 t1018 t1040) (offset22 t1019 t1041)
    (offset22 t1020 t1042) (offset22 t1021 t1043) (offset22 t1022 t1044) (offset22 t1023 t1045) (offset22 t1024 t1046)
    (offset22 t1025 t1047) (offset22 t1026 t1048) (offset22 t1027 t1049) (offset22 t1028 t1050) (offset22 t1029 t1051)
    (offset22 t1030 t1052)

    ; optional 23-minute return offsets are not needed within this horizon (goal does not require return)
  )

  (:goal
    (and
      (need l0)
    )
  )
)