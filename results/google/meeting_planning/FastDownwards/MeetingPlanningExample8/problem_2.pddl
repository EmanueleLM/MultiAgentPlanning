(define (problem meeting-planning-example8-prob)
  (:domain meeting-planning-example8)
  (:objects
    chinatown marina_district - location
    m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 m14 m15 m16 m17 m18 m19 m20
    m21 m22 m23 m24 m25 m26 m27 m28 m29 m30 m31 m32 m33 m34 m35 m36 m37 m38 m39 m40
    m41 m42 m43 m44 m45 m46 m47 m48 m49 m50 m51 m52 m53 m54 m55 m56 m57 m58 m59 m60
    m61 m62 m63 m64 m65 m66 m67 m68 m69 m70 m71 m72 m73 m74 m75 m76 m77 m78 m79 m80
    m81 m82 m83 m84 m85 m86 m87 m88 m89 m90 m91 m92 m93 m94 m95 m96 m97 m98 m99 m100
    m101 m102 m103 m104 m105 m106 m107 m108 m109 m110 m111 m112 m113 m114 m115 m116 m117 - minute
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20
    c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40
    c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60
    c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 c73 c74 c75 c76 c77 c78 c79 c80
    c81 c82 c83 c84 c85 c86 c87 c88 c89 c90 c91 c92 c93 c94 c95 c96 c97 c98 c99 c100
    c101 c102 c103 c104 c105 - count
  )
  (:init
    (at chinatown)
    (now m0)
    (met-count c0)
    (= (total-cost) 0)
    (next m0 m1) (next m1 m2) (next m2 m3) (next m3 m4) (next m4 m5) (next m5 m6) (next m6 m7) (next m7 m8) (next m8 m9) (next m9 m10)
    (next m10 m11) (next m11 m12) (next m12 m13) (next m13 m14) (next m14 m15) (next m15 m16) (next m16 m17) (next m17 m18) (next m18 m19) (next m19 m20)
    (next m20 m21) (next m21 m22) (next m22 m23) (next m23 m24) (next m24 m25) (next m25 m26) (next m26 m27) (next m27 m28) (next m28 m29) (next m29 m30)
    (next m30 m31) (next m31 m32) (next m32 m33) (next m33 m34) (next m34 m35) (next m35 m36) (next m36 m37) (next m37 m38) (next m38 m39) (next m39 m40)
    (next m40 m41) (next m41 m42) (next m42 m43) (next m43 m44) (next m44 m45) (next m45 m46) (next m46 m47) (next m47 m48) (next m48 m49) (next m49 m50)
    (next m50 m51) (next m51 m52) (next m52 m53) (next m53 m54) (next m54 m55) (next m55 m56) (next m56 m57) (next m57 m58) (next m58 m59) (next m59 m60)
    (next m60 m61) (next m61 m62) (next m62 m63) (next m63 m64) (next m64 m65) (next m65 m66) (next m66 m67) (next m67 m68) (next m68 m69) (next m69 m70)
    (next m70 m71) (next m71 m72) (next m72 m73) (next m73 m74) (next m74 m75) (next m75 m76) (next m76 m77) (next m77 m78) (next m78 m79) (next m79 m80)
    (next m80 m81) (next m81 m82) (next m82 m83) (next m83 m84) (next m84 m85) (next m85 m86) (next m86 m87) (next m87 m88) (next m88 m89) (next m89 m90)
    (next m90 m91) (next m91 m92) (next m92 m93) (next m93 m94) (next m94 m95) (next m95 m96) (next m96 m97) (next m97 m98) (next m98 m99) (next m99 m100)
    (next m100 m101) (next m101 m102) (next m102 m103) (next m103 m104) (next m104 m105) (next m105 m106) (next m106 m107) (next m107 m108) (next m108 m109) (next m109 m110)
    (next m110 m111) (next m111 m112) (next m112 m113) (next m113 m114) (next m114 m115) (next m115 m116) (next m116 m117)
    (steph-available m0) (steph-available m1) (steph-available m2) (steph-available m3) (steph-available m4) (steph-available m5) (steph-available m6) (steph-available m7) (steph-available m8) (steph-available m9)
    (steph-available m10) (steph-available m11) (steph-available m12) (steph-available m13) (steph-available m14) (steph-available m15) (steph-available m16) (steph-available m17) (steph-available m18) (steph-available m19)
    (steph-available m20) (steph-available m21) (steph-available m22) (steph-available m23) (steph-available m24) (steph-available m25) (steph-available m26) (steph-available m27) (steph-available m28) (steph-available m29)
    (steph-available m30) (steph-available m31) (steph-available m32) (steph-available m33) (steph-available m34) (steph-available m35) (steph-available m36) (steph-available m37) (steph-available m38) (steph-available m39)
    (steph-available m40) (steph-available m41) (steph-available m42) (steph-available m43) (steph-available m44) (steph-available m45) (steph-available m46) (steph-available m47) (steph-available m48) (steph-available m49)
    (steph-available m50) (steph-available m51) (steph-available m52) (steph-available m53) (steph-available m54) (steph-available m55) (steph-available m56) (steph-available m57) (steph-available m58) (steph-available m59)
    (steph-available m60) (steph-available m61) (steph-available m62) (steph-available m63) (steph-available m64) (steph-available m65) (steph-available m66) (steph-available m67) (steph-available m68) (steph-available m69)
    (steph-available m70) (steph-available m71) (steph-available m72) (steph-available m73) (steph-available m74) (steph-available m75) (steph-available m76) (steph-available m77) (steph-available m78) (steph-available m79)
    (steph-available m80) (steph-available m81) (steph-available m82) (steph-available m83) (steph-available m84) (steph-available m85) (steph-available m86) (steph-available m87) (steph-available m88) (steph-available m89)
    (steph-available m90) (steph-available m91) (steph-available m92) (steph-available m93) (steph-available m94) (steph-available m95) (steph-available m96) (steph-available m97) (steph-available m98) (steph-available m99)
    (steph-available m100) (steph-available m101) (steph-available m102) (steph-available m103) (steph-available m104) (steph-available m105) (steph-available m106) (steph-available m107) (steph-available m108) (steph-available m109)
    (steph-available m110) (steph-available m111) (steph-available m112) (steph-available m113) (steph-available m114) (steph-available m115) (steph-available m116) (steph-available m117)
    (next-count c0 c1) (next-count c1 c2) (next-count c2 c3) (next-count c3 c4) (next-count c4 c5)
    (next-count c5 c6) (next-count c6 c7) (next-count c7 c8) (next-count c8 c9) (next-count c9 c10)
    (next-count c10 c11) (next-count c11 c12) (next-count c12 c13) (next-count c13 c14) (next-count c14 c15)
    (next-count c15 c16) (next-count c16 c17) (next-count c17 c18) (next-count c18 c19) (next-count c19 c20)
    (next-count c20 c21) (next-count c21 c22) (next-count c22 c23) (next-count c23 c24) (next-count c24 c25)
    (next-count c25 c26) (next-count c26 c27) (next-count c27 c28) (next-count c28 c29) (next-count c29 c30)
    (next-count c30 c31) (next-count c31 c32) (next-count c32 c33) (next-count c33 c34) (next-count c34 c35)
    (next-count c35 c36) (next-count c36 c37) (next-count c37 c38) (next-count c38 c39) (next-count c39 c40)
    (next-count c40 c41) (next-count c41 c42) (next-count c42 c43) (next-count c43 c44) (next-count c44 c45)
    (next-count c45 c46) (next-count c46 c47) (next-count c47 c48) (next-count c48 c49) (next-count c49 c50)
    (next-count c50 c51) (next-count c51 c52) (next-count c52 c53) (next-count c53 c54) (next-count c54 c55)
    (next-count c55 c56) (next-count c56 c57) (next-count c57 c58) (next-count c58 c59) (next-count c59 c60)
    (next-count c60 c61) (next-count c61 c62) (next-count c62 c63) (next-count c63 c64) (next-count c64 c65)
    (next-count c65 c66) (next-count c66 c67) (next-count c67 c68) (next-count c68 c69) (next-count c69 c70)
    (next-count c70 c71) (next-count c71 c72) (next-count c72 c73) (next-count c73 c74) (next-count c74 c75)
    (next-count c75 c76) (next-count c76 c77) (next-count c77 c78) (next-count c78 c79) (next-count c79 c80)
    (next-count c80 c81) (next-count c81 c82) (next-count c82 c83) (next-count c83 c84) (next-count c84 c85)
    (next-count c85 c86) (next-count c86 c87) (next-count c87 c88) (next-count c88 c89) (next-count c89 c90)
    (next-count c90 c91) (next-count c91 c92) (next-count c92 c93) (next-count c93 c94) (next-count c94 c95)
    (next-count c95 c96) (next-count c96 c97) (next-count c97 c98) (next-count c98 c99) (next-count c99 c100)
    (next-count c100 c101) (next-count c101 c102) (next-count c102 c103) (next-count c103 c104) (next-count c104 c105)
  )
  (:goal
    (and (met-count c105))
  )
  (:metric minimize (total-cost))
)