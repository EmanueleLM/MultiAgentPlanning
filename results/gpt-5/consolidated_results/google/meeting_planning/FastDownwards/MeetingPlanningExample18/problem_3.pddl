(define (problem meetingplanningexample18-prob)
  (:domain meetingplanningexample18)
  (:objects
    t0900 t2019 t2020 t2021 t2022 t2023 t2024 t2025 t2026 t2027 t2028 t2029 t2030 t2031 t2032 t2033 t2034
    t2035 t2036 t2037 t2038 t2039 t2040 t2041 t2042 t2043 t2044 t2045 t2046 t2047 t2048 t2049 t2050 t2051 t2052 t2053 t2054 t2055 t2056 t2057 t2058 t2059
    t2100 t2101 t2102 t2103 t2104 t2105 t2106 t2107 t2108 t2109 t2110 t2111 t2112 t2113 t2114 t2115 t2116 t2117 t2118 t2119 t2120 t2121 t2122 t2123 t2124 t2125 t2126 t2127 t2128 t2129
    t2130 t2131 t2132 t2133 t2134 t2135 t2136 t2137 t2138 t2139 t2140 t2141 t2142 t2143 t2144 t2145 t2146 t2147 t2148 t2149 t2150 t2151 t2152 t2153 t2154 t2155 t2156 t2157 t2158 t2159
    t2200 - time
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 c73 c74 c75 - count
  )
  (:init
    (at marina)
    (time-at t0900)
    (need-betty c75)
    (= (total-cost) 0)

    (in-window t2030) (in-window t2031) (in-window t2032) (in-window t2033) (in-window t2034) (in-window t2035) (in-window t2036) (in-window t2037) (in-window t2038) (in-window t2039)
    (in-window t2040) (in-window t2041) (in-window t2042) (in-window t2043) (in-window t2044) (in-window t2045) (in-window t2046) (in-window t2047) (in-window t2048) (in-window t2049)
    (in-window t2050) (in-window t2051) (in-window t2052) (in-window t2053) (in-window t2054) (in-window t2055) (in-window t2056) (in-window t2057) (in-window t2058) (in-window t2059)
    (in-window t2100) (in-window t2101) (in-window t2102) (in-window t2103) (in-window t2104) (in-window t2105) (in-window t2106) (in-window t2107) (in-window t2108) (in-window t2109)
    (in-window t2110) (in-window t2111) (in-window t2112) (in-window t2113) (in-window t2114) (in-window t2115) (in-window t2116) (in-window t2117) (in-window t2118) (in-window t2119)
    (in-window t2120) (in-window t2121) (in-window t2122) (in-window t2123) (in-window t2124) (in-window t2125) (in-window t2126) (in-window t2127) (in-window t2128) (in-window t2129)
    (in-window t2130) (in-window t2131) (in-window t2132) (in-window t2133) (in-window t2134) (in-window t2135) (in-window t2136) (in-window t2137) (in-window t2138) (in-window t2139)
    (in-window t2140) (in-window t2141) (in-window t2142) (in-window t2143) (in-window t2144) (in-window t2145) (in-window t2146) (in-window t2147) (in-window t2148) (in-window t2149)
    (in-window t2150) (in-window t2151) (in-window t2152) (in-window t2153) (in-window t2154) (in-window t2155) (in-window t2156) (in-window t2157) (in-window t2158) (in-window t2159)
    (in-window t2200)

    (next-minute t2030 t2031) (next-minute t2031 t2032) (next-minute t2032 t2033) (next-minute t2033 t2034) (next-minute t2034 t2035) (next-minute t2035 t2036) (next-minute t2036 t2037) (next-minute t2037 t2038) (next-minute t2038 t2039) (next-minute t2039 t2040)
    (next-minute t2040 t2041) (next-minute t2041 t2042) (next-minute t2042 t2043) (next-minute t2043 t2044) (next-minute t2044 t2045) (next-minute t2045 t2046) (next-minute t2046 t2047) (next-minute t2047 t2048) (next-minute t2048 t2049) (next-minute t2049 t2050)
    (next-minute t2050 t2051) (next-minute t2051 t2052) (next-minute t2052 t2053) (next-minute t2053 t2054) (next-minute t2054 t2055) (next-minute t2055 t2056) (next-minute t2056 t2057) (next-minute t2057 t2058) (next-minute t2058 t2059) (next-minute t2059 t2100)
    (next-minute t2100 t2101) (next-minute t2101 t2102) (next-minute t2102 t2103) (next-minute t2103 t2104) (next-minute t2104 t2105) (next-minute t2105 t2106) (next-minute t2106 t2107) (next-minute t2107 t2108) (next-minute t2108 t2109) (next-minute t2109 t2110)
    (next-minute t2110 t2111) (next-minute t2111 t2112) (next-minute t2112 t2113) (next-minute t2113 t2114) (next-minute t2114 t2115) (next-minute t2115 t2116) (next-minute t2116 t2117) (next-minute t2117 t2118) (next-minute t2118 t2119) (next-minute t2119 t2120)
    (next-minute t2120 t2121) (next-minute t2121 t2122) (next-minute t2122 t2123) (next-minute t2123 t2124) (next-minute t2124 t2125) (next-minute t2125 t2126) (next-minute t2126 t2127) (next-minute t2127 t2128) (next-minute t2128 t2129) (next-minute t2129 t2130)
    (next-minute t2130 t2131) (next-minute t2131 t2132) (next-minute t2132 t2133) (next-minute t2133 t2134) (next-minute t2134 t2135) (next-minute t2135 t2136) (next-minute t2136 t2137) (next-minute t2137 t2138) (next-minute t2138 t2139) (next-minute t2139 t2140)
    (next-minute t2140 t2141) (next-minute t2141 t2142) (next-minute t2142 t2143) (next-minute t2143 t2144) (next-minute t2144 t2145) (next-minute t2145 t2146) (next-minute t2146 t2147) (next-minute t2147 t2148) (next-minute t2148 t2149) (next-minute t2149 t2150)
    (next-minute t2150 t2151) (next-minute t2151 t2152) (next-minute t2152 t2153) (next-minute t2153 t2154) (next-minute t2154 t2155) (next-minute t2155 t2156) (next-minute t2156 t2157) (next-minute t2157 t2158) (next-minute t2158 t2159) (next-minute t2159 t2200)

    (next-wait t0900 t2019) (next-wait t0900 t2020) (next-wait t0900 t2021) (next-wait t0900 t2022) (next-wait t0900 t2023) (next-wait t0900 t2024) (next-wait t0900 t2025) (next-wait t0900 t2026) (next-wait t0900 t2027) (next-wait t0900 t2028) (next-wait t0900 t2029) (next-wait t0900 t2030) (next-wait t0900 t2031) (next-wait t0900 t2032) (next-wait t0900 t2033) (next-wait t0900 t2034)

    (next-travel-mr t2019 t2030) (next-travel-mr t2020 t2031) (next-travel-mr t2021 t2032) (next-travel-mr t2022 t2033) (next-travel-mr t2023 t2034) (next-travel-mr t2024 t2035) (next-travel-mr t2025 t2036) (next-travel-mr t2026 t2037) (next-travel-mr t2027 t2038) (next-travel-mr t2028 t2039) (next-travel-mr t2029 t2040) (next-travel-mr t2030 t2041) (next-travel-mr t2031 t2042) (next-travel-mr t2032 t2043) (next-travel-mr t2033 t2044) (next-travel-mr t2034 t2045)

    (next-travel-rm t2030 t2039) (next-travel-rm t2031 t2040) (next-travel-rm t2032 t2041) (next-travel-rm t2033 t2042) (next-travel-rm t2034 t2043) (next-travel-rm t2035 t2044) (next-travel-rm t2036 t2045) (next-travel-rm t2037 t2046) (next-travel-rm t2038 t2047) (next-travel-rm t2039 t2048) (next-travel-rm t2040 t2049) (next-travel-rm t2041 t2050) (next-travel-rm t2042 t2051) (next-travel-rm t2043 t2052) (next-travel-rm t2044 t2053) (next-travel-rm t2045 t2054)

    (next-count c75 c74) (next-count c74 c73) (next-count c73 c72) (next-count c72 c71) (next-count c71 c70) (next-count c70 c69) (next-count c69 c68) (next-count c68 c67) (next-count c67 c66) (next-count c66 c65)
    (next-count c65 c64) (next-count c64 c63) (next-count c63 c62) (next-count c62 c61) (next-count c61 c60) (next-count c60 c59) (next-count c59 c58) (next-count c58 c57) (next-count c57 c56) (next-count c56 c55)
    (next-count c55 c54) (next-count c54 c53) (next-count c53 c52) (next-count c52 c51) (next-count c51 c50) (next-count c50 c49) (next-count c49 c48) (next-count c48 c47) (next-count c47 c46) (next-count c46 c45)
    (next-count c45 c44) (next-count c44 c43) (next-count c43 c42) (next-count c42 c41) (next-count c41 c40) (next-count c40 c39) (next-count c39 c38) (next-count c38 c37) (next-count c37 c36) (next-count c36 c35)
    (next-count c35 c34) (next-count c34 c33) (next-count c33 c32) (next-count c32 c31) (next-count c31 c30) (next-count c30 c29) (next-count c29 c28) (next-count c28 c27) (next-count c27 c26) (next-count c26 c25)
    (next-count c25 c24) (next-count c24 c23) (next-count c23 c22) (next-count c22 c21) (next-count c21 c20) (next-count c20 c19) (next-count c19 c18) (next-count c18 c17) (next-count c17 c16) (next-count c16 c15)
    (next-count c15 c14) (next-count c14 c13) (next-count c13 c12) (next-count c12 c11) (next-count c11 c10) (next-count c10 c9) (next-count c9 c8) (next-count c8 c7) (next-count c7 c6) (next-count c6 c5)
    (next-count c5 c4) (next-count c4 c3) (next-count c3 c2) (next-count c2 c1) (next-count c1 c0)
  )
  (:goal
    (and (need-betty c0))
  )
  (:metric minimize (total-cost))
)