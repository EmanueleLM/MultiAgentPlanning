(define (problem schedule_john_nb_p1)
  (:domain schedule_john_nb)
  (:objects
    richmond northbeach - location
    t540 t898 t899 t900 t901 t902 t903 t904 t905 t906 t907 t908 t909 t910 t911 t912 t913 t914 t915 t916 t917 t918 t919 t920 t921 t922 t923 t924 t925 t926 t927 t928 t929 t930 t931 t932 t933 t934 t935 t936 t937 t938 t939 t940 t941 t942 t943 t944 t945 t946 t947 t948 t949 t950 t951 t952 t953 t954 t955 t956 t957 t958 t959 t960 t961 t962 t963 t964 t965 t966 t967 t968 t969 t970 t971 t972 t973 t974 t975 t976 t977 t978 t979 t980 t981 t982 t983 t984 t985 t986 t987 t988 t989 t990 t991 t992 t993 t994 t995 t996 t997 t998 t999 t1000 t1001 t1002 t1003 t1004 t1005 t1006 t1007 t1008 t1009 t1010 t1011 t1012 t1013 t1014 t1015 t1016 t1017 t1018 t1019 t1020 t1021 t1022 t1023 t1024 t1025 t1026 t1027 t1028 t1029 t1030 t1031 t1032 t1033 t1034 t1035 - time
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 c73 c74 c75 - count
  )

  (:init
    ; locations and roads
    (at richmond)
    (idle)
    (road richmond northbeach)
    (road northbeach richmond)
    (duration richmond northbeach c17)
    (duration northbeach richmond c18)
    (meeting-spot northbeach)

    ; time progression: a coarse jump for long wait, then minute-by-minute from 14:58 through 17:15
    (current-time t540)
    (next t540 t898)
    (next t898 t899) (next t899 t900) (next t900 t901) (next t901 t902) (next t902 t903) (next t903 t904) (next t904 t905) (next t905 t906) (next t906 t907) (next t907 t908) (next t908 t909) (next t909 t910) (next t910 t911) (next t911 t912) (next t912 t913) (next t913 t914) (next t914 t915)
    (next t915 t916) (next t916 t917) (next t917 t918) (next t918 t919) (next t919 t920) (next t920 t921) (next t921 t922) (next t922 t923) (next t923 t924) (next t924 t925) (next t925 t926) (next t926 t927) (next t927 t928) (next t928 t929) (next t929 t930) (next t930 t931) (next t931 t932) (next t932 t933) (next t933 t934) (next t934 t935) (next t935 t936) (next t936 t937) (next t937 t938) (next t938 t939) (next t939 t940) (next t940 t941) (next t941 t942) (next t942 t943) (next t943 t944) (next t944 t945) (next t945 t946) (next t946 t947) (next t947 t948) (next t948 t949) (next t949 t950) (next t950 t951) (next t951 t952) (next t952 t953) (next t953 t954) (next t954 t955) (next t955 t956) (next t956 t957) (next t957 t958) (next t958 t959) (next t959 t960) (next t960 t961) (next t961 t962) (next t962 t963) (next t963 t964) (next t964 t965) (next t965 t966) (next t966 t967) (next t967 t968) (next t968 t969) (next t969 t970) (next t970 t971) (next t971 t972) (next t972 t973) (next t973 t974) (next t974 t975) (next t975 t976) (next t976 t977) (next t977 t978) (next t978 t979) (next t979 t980) (next t980 t981) (next t981 t982) (next t982 t983) (next t983 t984) (next t984 t985) (next t985 t986) (next t986 t987) (next t987 t988) (next t988 t989) (next t989 t990)
    (next t990 t991) (next t991 t992) (next t992 t993) (next t993 t994) (next t994 t995) (next t995 t996) (next t996 t997) (next t997 t998) (next t998 t999) (next t999 t1000) (next t1000 t1001) (next t1001 t1002) (next t1002 t1003) (next t1003 t1004) (next t1004 t1005) (next t1005 t1006) (next t1006 t1007) (next t1007 t1008) (next t1008 t1009) (next t1009 t1010) (next t1010 t1011) (next t1011 t1012) (next t1012 t1013) (next t1013 t1014) (next t1014 t1015) (next t1015 t1016) (next t1016 t1017) (next t1017 t1018) (next t1018 t1019) (next t1019 t1020) (next t1020 t1021) (next t1021 t1022) (next t1022 t1023) (next t1023 t1024) (next t1024 t1025) (next t1025 t1026) (next t1026 t1027) (next t1027 t1028) (next t1028 t1029) (next t1029 t1030) (next t1030 t1031) (next t1031 t1032) (next t1032 t1033) (next t1033 t1034) (next t1034 t1035)

    ; John's availability at North Beach from 15:15 (t915) to 17:15 (t1035), minute by minute on the modeled chain
    (available-john t915) (available-john t916) (available-john t917) (available-john t918) (available-john t919) (available-john t920) (available-john t921) (available-john t922) (available-john t923) (available-john t924) (available-john t925) (available-john t926) (available-john t927) (available-john t928) (available-john t929) (available-john t930) (available-john t931) (available-john t932) (available-john t933) (available-john t934) (available-john t935) (available-john t936) (available-john t937) (available-john t938) (available-john t939) (available-john t940) (available-john t941) (available-john t942) (available-john t943) (available-john t944) (available-john t945) (available-john t946) (available-john t947) (available-john t948) (available-john t949) (available-john t950) (available-john t951) (available-john t952) (available-john t953) (available-john t954) (available-john t955) (available-john t956) (available-john t957) (available-john t958) (available-john t959) (available-john t960) (available-john t961) (available-john t962) (available-john t963) (available-john t964) (available-john t965) (available-john t966) (available-john t967) (available-john t968) (available-john t969) (available-john t970) (available-john t971) (available-john t972) (available-john t973) (available-john t974) (available-john t975) (available-john t976) (available-john t977) (available-john t978) (available-john t979) (available-john t980) (available-john t981) (available-john t982) (available-john t983) (available-john t984) (available-john t985) (available-john t986) (available-john t987) (available-john t988) (available-john t989) (available-john t990) (available-john t991) (available-john t992) (available-john t993) (available-john t994) (available-john t995) (available-john t996) (available-john t997) (available-john t998) (available-john t999) (available-john t1000) (available-john t1001) (available-john t1002) (available-john t1003) (available-john t1004) (available-john t1005) (available-john t1006) (available-john t1007) (available-john t1008) (available-john t1009) (available-john t1010) (available-john t1011) (available-john t1012) (available-john t1013) (available-john t1014) (available-john t1015) (available-john t1016) (available-john t1017) (available-john t1018) (available-john t1019) (available-john t1020) (available-john t1021) (available-john t1022) (available-john t1023) (available-john t1024) (available-john t1025) (available-john t1026) (available-john t1027) (available-john t1028) (available-john t1029) (available-john t1030) (available-john t1031) (available-john t1032) (available-john t1033) (available-john t1034)

    ; count chains (for travel and meeting minutes)
    (is-zero c0)
    (is-75 c75)
    (prev-count c1 c0) (prev-count c2 c1) (prev-count c3 c2) (prev-count c4 c3) (prev-count c5 c4) (prev-count c6 c5) (prev-count c7 c6) (prev-count c8 c7) (prev-count c9 c8) (prev-count c10 c9)
    (prev-count c11 c10) (prev-count c12 c11) (prev-count c13 c12) (prev-count c14 c13) (prev-count c15 c14) (prev-count c16 c15) (prev-count c17 c16) (prev-count c18 c17) (prev-count c19 c18) (prev-count c20 c19)
    (prev-count c21 c20) (prev-count c22 c21) (prev-count c23 c22) (prev-count c24 c23) (prev-count c25 c24) (prev-count c26 c25) (prev-count c27 c26) (prev-count c28 c27) (prev-count c29 c28) (prev-count c30 c29)
    (prev-count c31 c30) (prev-count c32 c31) (prev-count c33 c32) (prev-count c34 c33) (prev-count c35 c34) (prev-count c36 c35) (prev-count c37 c36) (prev-count c38 c37) (prev-count c39 c38) (prev-count c40 c39)
    (prev-count c41 c40) (prev-count c42 c41) (prev-count c43 c42) (prev-count c44 c43) (prev-count c45 c44) (prev-count c46 c45) (prev-count c47 c46) (prev-count c48 c47) (prev-count c49 c48) (prev-count c50 c49)
    (prev-count c51 c50) (prev-count c52 c51) (prev-count c53 c52) (prev-count c54 c53) (prev-count c55 c54) (prev-count c56 c55) (prev-count c57 c56) (prev-count c58 c57) (prev-count c59 c58) (prev-count c60 c59)
    (prev-count c61 c60) (prev-count c62 c61) (prev-count c63 c62) (prev-count c64 c63) (prev-count c65 c64) (prev-count c66 c65) (prev-count c67 c66) (prev-count c68 c67) (prev-count c69 c68) (prev-count c70 c69)
    (prev-count c71 c70) (prev-count c72 c71) (prev-count c73 c72) (prev-count c74 c73) (prev-count c75 c74)

    (next-count c0 c1) (next-count c1 c2) (next-count c2 c3) (next-count c3 c4) (next-count c4 c5) (next-count c5 c6) (next-count c6 c7) (next-count c7 c8) (next-count c8 c9) (next-count c9 c10)
    (next-count c10 c11) (next-count c11 c12) (next-count c12 c13) (next-count c13 c14) (next-count c14 c15) (next-count c15 c16) (next-count c16 c17) (next-count c17 c18) (next-count c18 c19) (next-count c19 c20)
    (next-count c20 c21) (next-count c21 c22) (next-count c22 c23) (next-count c23 c24) (next-count c24 c25) (next-count c25 c26) (next-count c26 c27) (next-count c27 c28) (next-count c28 c29) (next-count c29 c30)
    (next-count c30 c31) (next-count c31 c32) (next-count c32 c33) (next-count c33 c34) (next-count c34 c35) (next-count c35 c36) (next-count c36 c37) (next-count c37 c38) (next-count c38 c39) (next-count c39 c40)
    (next-count c40 c41) (next-count c41 c42) (next-count c42 c43) (next-count c43 c44) (next-count c44 c45) (next-count c45 c46) (next-count c46 c47) (next-count c47 c48) (next-count c48 c49) (next-count c49 c50)
    (next-count c50 c51) (next-count c51 c52) (next-count c52 c53) (next-count c53 c54) (next-count c54 c55) (next-count c55 c56) (next-count c56 c57) (next-count c57 c58) (next-count c58 c59) (next-count c59 c60)
    (next-count c60 c61) (next-count c61 c62) (next-count c62 c63) (next-count c63 c64) (next-count c64 c65) (next-count c65 c66) (next-count c66 c67) (next-count c67 c68) (next-count c68 c69) (next-count c69 c70)
    (next-count c70 c71) (next-count c71 c72) (next-count c72 c73) (next-count c73 c74) (next-count c74 c75)
  )

  (:goal
    (and
      (at northbeach)
      (idle)
      (current-time t990)
      (met-minimum)
      (meeting-started-at t915)
      (meeting-finished-at t990)
      (departed-from richmond t898)
      (arrived-at northbeach t915)
    )
  )
)