(define (problem meeting-itinerary-problem)
  (:domain meeting-itinerary)

  (:objects
    presidio northbeach - location
    alice carlos farah eli dana grace betty - friend
    ;; Time slots: s0 = 09:00. Each slot = 5 minutes. s150 corresponds to 21:30 end.
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60 s61 s62 s63 s64 s65 s66 s67 s68 s69 s70 s71 s72 s73 s74 s75 s76 s77 s78 s79 s80 s81 s82 s83 s84 s85 s86 s87 s88 s89 s90 s91 s92 s93 s94 s95 s96 s97 s98 s99 s100 s101 s102 s103 s104 s105 s106 s107 s108 s109 s110 s111 s112 s113 s114 s115 s116 s117 s118 s119 s120 s121 s122 s123 s124 s125 s126 s127 s128 s129 s130 s131 s132 s133 s134 s135 s136 s137 s138 s139 s140 s141 s142 s143 s144 s145 s146 s147 s148 s149 s150 - timeslot
  )

  (:init
    ;; Start at Presidio at 09:00 (s0)
    (at presidio)
    (time-at s0)

    ;; Successor chain for contiguous time slots up to s150
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6)
    (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17)
    (succ s17 s18) (succ s18 s19) (succ s19 s20) (succ s20 s21) (succ s21 s22)
    (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27)
    (succ s27 s28) (succ s28 s29) (succ s29 s30) (succ s30 s31) (succ s31 s32)
    (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36) (succ s36 s37)
    (succ s37 s38) (succ s38 s39) (succ s39 s40) (succ s40 s41) (succ s41 s42)
    (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47)
    (succ s47 s48) (succ s48 s49) (succ s49 s50) (succ s50 s51) (succ s51 s52)
    (succ s52 s53) (succ s53 s54) (succ s54 s55) (succ s55 s56) (succ s56 s57)
    (succ s57 s58) (succ s58 s59) (succ s59 s60) (succ s60 s61) (succ s61 s62)
    (succ s62 s63) (succ s63 s64) (succ s64 s65) (succ s65 s66) (succ s66 s67)
    (succ s67 s68) (succ s68 s69) (succ s69 s70) (succ s70 s71) (succ s71 s72)
    (succ s72 s73) (succ s73 s74) (succ s74 s75) (succ s75 s76) (succ s76 s77)
    (succ s77 s78) (succ s78 s79) (succ s79 s80) (succ s80 s81) (succ s81 s82)
    (succ s82 s83) (succ s83 s84) (succ s84 s85) (succ s85 s86) (succ s86 s87)
    (succ s87 s88) (succ s88 s89) (succ s89 s90) (succ s90 s91) (succ s91 s92)
    (succ s92 s93) (succ s93 s94) (succ s94 s95) (succ s95 s96) (succ s96 s97)
    (succ s97 s98) (succ s98 s99) (succ s99 s100) (succ s100 s101) (succ s101 s102)
    (succ s102 s103) (succ s103 s104) (succ s104 s105) (succ s105 s106) (succ s106 s107)
    (succ s107 s108) (succ s108 s109) (succ s109 s110) (succ s110 s111) (succ s111 s112)
    (succ s112 s113) (succ s113 s114) (succ s114 s115) (succ s115 s116) (succ s116 s117)
    (succ s117 s118) (succ s118 s119) (succ s119 s120) (succ s120 s121) (succ s121 s122)
    (succ s122 s123) (succ s123 s124) (succ s124 s125) (succ s125 s126) (succ s126 s127)
    (succ s127 s128) (succ s128 s129) (succ s129 s130) (succ s130 s131) (succ s131 s132)
    (succ s132 s133) (succ s133 s134) (succ s134 s135) (succ s135 s136) (succ s136 s137)
    (succ s137 s138) (succ s138 s139) (succ s139 s140) (succ s140 s141) (succ s141 s142)
    (succ s142 s143) (succ s143 s144) (succ s144 s145) (succ s145 s146) (succ s146 s147)
    (succ s147 s148) (succ s148 s149) (succ s149 s150)

    ;; Friend availabilities mapped to 5-minute slots (available ?friend ?slot)
    ;; Alice 09:00-11:00 -> s0..s23
    (available alice s0) (available alice s1) (available alice s2) (available alice s3)
    (available alice s4) (available alice s5) (available alice s6) (available alice s7)
    (available alice s8) (available alice s9) (available alice s10) (available alice s11)
    (available alice s12) (available alice s13) (available alice s14) (available alice s15)
    (available alice s16) (available alice s17) (available alice s18) (available alice s19)
    (available alice s20) (available alice s21) (available alice s22) (available alice s23)

    ;; Carlos 10:30-12:00 -> s18..s35
    (available carlos s18) (available carlos s19) (available carlos s20) (available carlos s21)
    (available carlos s22) (available carlos s23) (available carlos s24) (available carlos s25)
    (available carlos s26) (available carlos s27) (available carlos s28) (available carlos s29)
    (available carlos s30) (available carlos s31) (available carlos s32) (available carlos s33)
    (available carlos s34) (available carlos s35)

    ;; Farah 13:00-14:00 -> s48..s59
    (available farah s48) (available farah s49) (available farah s50) (available farah s51)
    (available farah s52) (available farah s53) (available farah s54) (available farah s55)
    (available farah s56) (available farah s57) (available farah s58) (available farah s59)

    ;; Eli 17:30-18:30 -> s102..s107
    (available eli s102) (available eli s103) (available eli s104) (available eli s105)
    (available eli s106) (available eli s107)

    ;; Dana 18:00-19:30 -> s108..s125
    (available dana s108) (available dana s109) (available dana s110) (available dana s111)
    (available dana s112) (available dana s113) (available dana s114) (available dana s115)
    (available dana s116) (available dana s117) (available dana s118) (available dana s119)
    (available dana s120) (available dana s121) (available dana s122) (available dana s123)
    (available dana s124) (available dana s125)

    ;; Betty 18:45-22:00 -> s117..s150 (limited to s150 in this encoding)
    (available betty s117) (available betty s118) (available betty s119) (available betty s120)
    (available betty s121) (available betty s122) (available betty s123) (available betty s124)
    (available betty s125) (available betty s126) (available betty s127) (available betty s128)
    (available betty s129) (available betty s130) (available betty s131) (available betty s132)
    (available betty s133) (available betty s134) (available betty s135) (available betty s136)
    (available betty s137) (available betty s138) (available betty s139) (available betty s140)
    (available betty s141) (available betty s142) (available betty s143) (available betty s144)
    (available betty s145) (available betty s146) (available betty s147) (available betty s148)
    (available betty s149) (available betty s150)

    ;; Grace 20:30-21:30 -> s138..s149
    (available grace s138) (available grace s139) (available grace s140) (available grace s141)
    (available grace s142) (available grace s143) (available grace s144) (available grace s145)
    (available grace s146) (available grace s147) (available grace s148) (available grace s149)
  )

  ;; Hard goal: meet all friends and guarantee Betty's required contiguous 75-minute meeting (satisfied-betty)
  (:goal (and
    (met alice)
    (met carlos)
    (met farah)
    (met eli)
    (met dana)
    (met grace)
    (met betty)
    (satisfied-betty)
  ))
)