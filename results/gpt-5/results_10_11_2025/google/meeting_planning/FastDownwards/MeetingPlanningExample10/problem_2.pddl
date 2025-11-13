(define (problem meeting-planning-sf-fixed-p)
  (:domain meeting-planning-sf-fixed)
  (:objects
    t0900 t0901 t0902 t0903 t0904 t0905 t0906 t0907 t0908 t0909
    t0910 t0911 t0912 t0913 t0914 t0915 t0916 t0917 t0918 t0919
    t0920 t0921 t0922 t0923 t0924 t0925 t0926 t0927 t0928 t0929
    t0930 t0931 t0932 t0933 t0934 t0935 t0936 t0937 t0938 t0939
    t0940 t0941 t0942 t0943 t0944 t0945 t0946 t0947 t0948 t0949
    t0950 t0951 t0952 t0953 t0954 t0955 t0956 t0957 t0958 t0959
    t1000 t1001 t1002 t1003 t1004 t1005 t1006 t1007 t1008 t1009
    t1010 t1011 t1012 t1013 t1014 t1015 t1016 t1017 t1018 t1019
    t1020 t1021 t1022 t1023 t1024 t1025 t1026 t1027 t1028 t1029
    t1030 t1031 - time
  )
  (:init
    (at ggp)
    (cur t0900)
    (= (total-cost) 0)

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
    (next t1030 t1031)

    (plus16 t0900 t0916) (plus16 t0901 t0917) (plus16 t0902 t0918) (plus16 t0903 t0919)
    (plus16 t0904 t0920) (plus16 t0905 t0921) (plus16 t0906 t0922) (plus16 t0907 t0923)
    (plus16 t0908 t0924) (plus16 t0909 t0925) (plus16 t0910 t0926) (plus16 t0911 t0927)
    (plus16 t0912 t0928) (plus16 t0913 t0929) (plus16 t0914 t0930) (plus16 t0915 t0931)
    (plus16 t0916 t0932) (plus16 t0917 t0933) (plus16 t0918 t0934) (plus16 t0919 t0935)
    (plus16 t0920 t0936) (plus16 t0921 t0937) (plus16 t0922 t0938) (plus16 t0923 t0939)
    (plus16 t0924 t0940) (plus16 t0925 t0941) (plus16 t0926 t0942) (plus16 t0927 t0943)
    (plus16 t0928 t0944) (plus16 t0929 t0945) (plus16 t0930 t0946) (plus16 t0931 t0947)
    (plus16 t0932 t0948) (plus16 t0933 t0949) (plus16 t0934 t0950) (plus16 t0935 t0951)
    (plus16 t0936 t0952) (plus16 t0937 t0953) (plus16 t0938 t0954) (plus16 t0939 t0955)
    (plus16 t0940 t0956) (plus16 t0941 t0957) (plus16 t0942 t0958) (plus16 t0943 t0959)
    (plus16 t0944 t1000) (plus16 t0945 t1001) (plus16 t0946 t1002) (plus16 t0947 t1003)
    (plus16 t0948 t1004) (plus16 t0949 t1005) (plus16 t0950 t1006) (plus16 t0951 t1007)
    (plus16 t0952 t1008) (plus16 t0953 t1009) (plus16 t0954 t1010) (plus16 t0955 t1011)
    (plus16 t0956 t1012) (plus16 t0957 t1013) (plus16 t0958 t1014) (plus16 t0959 t1015)
    (plus16 t1000 t1016) (plus16 t1001 t1017) (plus16 t1002 t1018) (plus16 t1003 t1019)
    (plus16 t1004 t1020) (plus16 t1005 t1021) (plus16 t1006 t1022) (plus16 t1007 t1023)
    (plus16 t1008 t1024) (plus16 t1009 t1025) (plus16 t1010 t1026) (plus16 t1011 t1027)
    (plus16 t1012 t1028) (plus16 t1013 t1029) (plus16 t1014 t1030) (plus16 t1015 t1031)

    (plus18 t0900 t0918) (plus18 t0901 t0919) (plus18 t0902 t0920) (plus18 t0903 t0921)
    (plus18 t0904 t0922) (plus18 t0905 t0923) (plus18 t0906 t0924) (plus18 t0907 t0925)
    (plus18 t0908 t0926) (plus18 t0909 t0927) (plus18 t0910 t0928) (plus18 t0911 t0929)
    (plus18 t0912 t0930) (plus18 t0913 t0931) (plus18 t0914 t0932) (plus18 t0915 t0933)
    (plus18 t0916 t0934) (plus18 t0917 t0935) (plus18 t0918 t0936) (plus18 t0919 t0937)
    (plus18 t0920 t0938) (plus18 t0921 t0939) (plus18 t0922 t0940) (plus18 t0923 t0941)
    (plus18 t0924 t0942) (plus18 t0925 t0943) (plus18 t0926 t0944) (plus18 t0927 t0945)
    (plus18 t0928 t0946) (plus18 t0929 t0947) (plus18 t0930 t0948) (plus18 t0931 t0949)
    (plus18 t0932 t0950) (plus18 t0933 t0951) (plus18 t0934 t0952) (plus18 t0935 t0953)
    (plus18 t0936 t0954) (plus18 t0937 t0955) (plus18 t0938 t0956) (plus18 t0939 t0957)
    (plus18 t0940 t0958) (plus18 t0941 t0959) (plus18 t0942 t1000) (plus18 t0943 t1001)
    (plus18 t0944 t1002) (plus18 t0945 t1003) (plus18 t0946 t1004) (plus18 t0947 t1005)
    (plus18 t0948 t1006) (plus18 t0949 t1007) (plus18 t0950 t1008) (plus18 t0951 t1009)
    (plus18 t0952 t1010) (plus18 t0953 t1011) (plus18 t0954 t1012) (plus18 t0955 t1013)
    (plus18 t0956 t1014) (plus18 t0957 t1015) (plus18 t0958 t1016) (plus18 t0959 t1017)
    (plus18 t1000 t1018) (plus18 t1001 t1019) (plus18 t1002 t1020) (plus18 t1003 t1021)
    (plus18 t1004 t1022) (plus18 t1005 t1023) (plus18 t1006 t1024) (plus18 t1007 t1025)
    (plus18 t1008 t1026) (plus18 t1009 t1027) (plus18 t1010 t1028) (plus18 t1011 t1029)
    (plus18 t1012 t1030) (plus18 t1013 t1031)

    (plus15win t1015 t1030)
    (plus15win t1016 t1031)
  )
  (:goal (and
    (met-james)
  ))
  (:metric minimize (total-cost))
)