(define (problem meet-betty-travel-instance)
  (:domain meet-betty-travel)

  (:objects
    ; timepoints
    t0900 t2000 t2011 t2019
    t2030 t2031 t2032 t2033 t2034 t2035 t2036 t2037 t2038 t2039
    t2040 t2041 t2042 t2043 t2044 t2045 t2046 t2047 t2048 t2049
    t2050 t2051 t2052 t2053 t2054 t2055 t2056 t2057 t2058 t2059
    t2100 t2101 t2102 t2103 t2104 t2105 t2106 t2107 t2108 t2109
    t2110 t2111 t2112 t2113 t2114 t2115 t2116 t2117 t2118 t2119
    t2120 t2121 t2122 t2123 t2124 t2125 t2126 t2127 t2128 t2129
    t2130 t2131 t2132 t2133 t2134 t2135 t2136 t2137 t2138 t2139
    t2140 t2141 t2142 t2143 t2144 t2145 t2146 t2147 t2148 t2149
    t2150 t2151 t2152 t2153 t2154 t2155 t2156 t2157 t2158 t2159
    t2200 - time

    ; meeting-minute quota tokens (75 required)
    m1 m2 m3 m4 m5 m6 m7 m8 m9 m10
    m11 m12 m13 m14 m15 m16 m17 m18 m19 m20
    m21 m22 m23 m24 m25 m26 m27 m28 m29 m30
    m31 m32 m33 m34 m35 m36 m37 m38 m39 m40
    m41 m42 m43 m44 m45 m46 m47 m48 m49 m50
    m51 m52 m53 m54 m55 m56 m57 m58 m59 m60
    m61 m62 m63 m64 m65 m66 m67 m68 m69 m70
    m71 m72 m73 m74 m75 - quota
  )

  (:init
    ; start state
    (at marina)
    (now t0900)

    ; allowed waiting jumps (coarse waiting)
    (step t0900 t2000)
    (step t0900 t2019)
    (step t0900 t2034)
    (step t2011 t2030)

    ; minute-by-minute successors within meeting window [20:30, 22:00]
    (next t2030 t2031) (next t2031 t2032) (next t2032 t2033) (next t2033 t2034) (next t2034 t2035)
    (next t2035 t2036) (next t2036 t2037) (next t2037 t2038) (next t2038 t2039) (next t2039 t2040)
    (next t2040 t2041) (next t2041 t2042) (next t2042 t2043) (next t2043 t2044) (next t2044 t2045)
    (next t2045 t2046) (next t2046 t2047) (next t2047 t2048) (next t2048 t2049) (next t2049 t2050)
    (next t2050 t2051) (next t2051 t2052) (next t2052 t2053) (next t2053 t2054) (next t2054 t2055)
    (next t2055 t2056) (next t2056 t2057) (next t2057 t2058) (next t2058 t2059) (next t2059 t2100)
    (next t2100 t2101) (next t2101 t2102) (next t2102 t2103) (next t2103 t2104) (next t2104 t2105)
    (next t2105 t2106) (next t2106 t2107) (next t2107 t2108) (next t2108 t2109) (next t2109 t2110)
    (next t2110 t2111) (next t2111 t2112) (next t2112 t2113) (next t2113 t2114) (next t2114 t2115)
    (next t2115 t2116) (next t2116 t2117) (next t2117 t2118) (next t2118 t2119) (next t2119 t2120)
    (next t2120 t2121) (next t2121 t2122) (next t2122 t2123) (next t2123 t2124) (next t2124 t2125)
    (next t2125 t2126) (next t2126 t2127) (next t2127 t2128) (next t2128 t2129) (next t2129 t2130)
    (next t2130 t2131) (next t2131 t2132) (next t2132 t2133) (next t2133 t2134) (next t2134 t2135)
    (next t2135 t2136) (next t2136 t2137) (next t2137 t2138) (next t2138 t2139) (next t2139 t2140)
    (next t2140 t2141) (next t2141 t2142) (next t2142 t2143) (next t2143 t2144) (next t2144 t2145)
    (next t2145 t2146) (next t2146 t2147) (next t2147 t2148) (next t2148 t2149) (next t2149 t2150)
    (next t2150 t2151) (next t2151 t2152) (next t2152 t2153) (next t2153 t2154) (next t2154 t2155)
    (next t2155 t2156) (next t2156 t2157) (next t2157 t2158) (next t2158 t2159) (next t2159 t2200)

    ; Marina -> Richmond travel mappings (11 minutes)
    (plus11 t2000 t2011)
    (plus11 t2019 t2030)
    (plus11 t2034 t2045)

    ; Richmond -> Marina travel mappings (9 minutes) - optional return (within horizon)
    (plus9 t2145 t2154)

    ; Betty availability: from 20:30 to 21:59 (start minute of each meeting minute)
    (betty-available t2030) (betty-available t2031) (betty-available t2032) (betty-available t2033) (betty-available t2034)
    (betty-available t2035) (betty-available t2036) (betty-available t2037) (betty-available t2038) (betty-available t2039)
    (betty-available t2040) (betty-available t2041) (betty-available t2042) (betty-available t2043) (betty-available t2044)
    (betty-available t2045) (betty-available t2046) (betty-available t2047) (betty-available t2048) (betty-available t2049)
    (betty-available t2050) (betty-available t2051) (betty-available t2052) (betty-available t2053) (betty-available t2054)
    (betty-available t2055) (betty-available t2056) (betty-available t2057) (betty-available t2058) (betty-available t2059)
    (betty-available t2100) (betty-available t2101) (betty-available t2102) (betty-available t2103) (betty-available t2104)
    (betty-available t2105) (betty-available t2106) (betty-available t2107) (betty-available t2108) (betty-available t2109)
    (betty-available t2110) (betty-available t2111) (betty-available t2112) (betty-available t2113) (betty-available t2114)
    (betty-available t2115) (betty-available t2116) (betty-available t2117) (betty-available t2118) (betty-available t2119)
    (betty-available t2120) (betty-available t2121) (betty-available t2122) (betty-available t2123) (betty-available t2124)
    (betty-available t2125) (betty-available t2126) (betty-available t2127) (betty-available t2128) (betty-available t2129)
    (betty-available t2130) (betty-available t2131) (betty-available t2132) (betty-available t2133) (betty-available t2134)
    (betty-available t2135) (betty-available t2136) (betty-available t2137) (betty-available t2138) (betty-available t2139)
    (betty-available t2140) (betty-available t2141) (betty-available t2142) (betty-available t2143) (betty-available t2144)
    (betty-available t2145) (betty-available t2146) (betty-available t2147) (betty-available t2148) (betty-available t2149)
    (betty-available t2150) (betty-available t2151) (betty-available t2152) (betty-available t2153) (betty-available t2154)
    (betty-available t2155) (betty-available t2156) (betty-available t2157) (betty-available t2158) (betty-available t2159)

    ; meeting quota tokens initially unused
    (unused m1) (unused m2) (unused m3) (unused m4) (unused m5)
    (unused m6) (unused m7) (unused m8) (unused m9) (unused m10)
    (unused m11) (unused m12) (unused m13) (unused m14) (unused m15)
    (unused m16) (unused m17) (unused m18) (unused m19) (unused m20)
    (unused m21) (unused m22) (unused m23) (unused m24) (unused m25)
    (unused m26) (unused m27) (unused m28) (unused m29) (unused m30)
    (unused m31) (unused m32) (unused m33) (unused m34) (unused m35)
    (unused m36) (unused m37) (unused m38) (unused m39) (unused m40)
    (unused m41) (unused m42) (unused m43) (unused m44) (unused m45)
    (unused m46) (unused m47) (unused m48) (unused m49) (unused m50)
    (unused m51) (unused m52) (unused m53) (unused m54) (unused m55)
    (unused m56) (unused m57) (unused m58) (unused m59) (unused m60)
    (unused m61) (unused m62) (unused m63) (unused m64) (unused m65)
    (unused m66) (unused m67) (unused m68) (unused m69) (unused m70)
    (unused m71) (unused m72) (unused m73) (unused m74) (unused m75)
  )

  (:goal
    (and
      (used m1) (used m2) (used m3) (used m4) (used m5)
      (used m6) (used m7) (used m8) (used m9) (used m10)
      (used m11) (used m12) (used m13) (used m14) (used m15)
      (used m16) (used m17) (used m18) (used m19) (used m20)
      (used m21) (used m22) (used m23) (used m24) (used m25)
      (used m26) (used m27) (used m28) (used m29) (used m30)
      (used m31) (used m32) (used m33) (used m34) (used m35)
      (used m36) (used m37) (used m38) (used m39) (used m40)
      (used m41) (used m42) (used m43) (used m44) (used m45)
      (used m46) (used m47) (used m48) (used m49) (used m50)
      (used m51) (used m52) (used m53) (used m54) (used m55)
      (used m56) (used m57) (used m58) (used m59) (used m60)
      (used m61) (used m62) (used m63) (used m64) (used m65)
      (used m66) (used m67) (used m68) (used m69) (used m70)
      (used m71) (used m72) (used m73) (used m74) (used m75)
    )
  )
)