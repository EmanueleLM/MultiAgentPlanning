(define (problem hanoi-7-mover)
  (:domain hanoi-mover)

  (:objects
    A B C D E F G - disk
    left middle right - peg

    S0 S1 S2 S3 S4 S5 S6 S7 S8 S9
    S10 S11 S12 S13 S14 S15 S16 S17 S18 S19
    S20 S21 S22 S23 S24 S25 S26 S27 S28 S29
    S30 S31 S32 S33 S34 S35 S36 S37 S38 S39
    S40 S41 S42 S43 S44 S45 S46 S47 S48 S49
    S50 S51 S52 S53 S54 S55 S56 S57 S58 S59
    S60 S61 S62 S63 S64 S65 S66 S67 S68 S69
    S70 S71 S72 S73 S74 S75 S76 S77 S78 S79
    S80 S81 S82 S83 S84 S85 S86 S87 S88 S89
    S90 S91 S92 S93 S94 S95 S96 S97 S98 S99
    S100 S101 S102 S103 S104 S105 S106 S107 S108 S109
    S110 S111 S112 S113 S114 S115 S116 S117 S118 S119
    S120 S121 S122 S123 S124 S125 S126 S127 - stage
  )

  (:init
    (on-peg G middle)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    (clear-disk A)

    (empty-peg left)
    (empty-peg right)

    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)

    (stage S0) (stage S1) (stage S2) (stage S3) (stage S4) (stage S5) (stage S6) (stage S7) (stage S8) (stage S9)
    (stage S10) (stage S11) (stage S12) (stage S13) (stage S14) (stage S15) (stage S16) (stage S17) (stage S18) (stage S19)
    (stage S20) (stage S21) (stage S22) (stage S23) (stage S24) (stage S25) (stage S26) (stage S27) (stage S28) (stage S29)
    (stage S30) (stage S31) (stage S32) (stage S33) (stage S34) (stage S35) (stage S36) (stage S37) (stage S38) (stage S39)
    (stage S40) (stage S41) (stage S42) (stage S43) (stage S44) (stage S45) (stage S46) (stage S47) (stage S48) (stage S49)
    (stage S50) (stage S51) (stage S52) (stage S53) (stage S54) (stage S55) (stage S56) (stage S57) (stage S58) (stage S59)
    (stage S60) (stage S61) (stage S62) (stage S63) (stage S64) (stage S65) (stage S66) (stage S67) (stage S68) (stage S69)
    (stage S70) (stage S71) (stage S72) (stage S73) (stage S74) (stage S75) (stage S76) (stage S77) (stage S78) (stage S79)
    (stage S80) (stage S81) (stage S82) (stage S83) (stage S84) (stage S85) (stage S86) (stage S87) (stage S88) (stage S89)
    (stage S90) (stage S91) (stage S92) (stage S93) (stage S94) (stage S95) (stage S96) (stage S97) (stage S98) (stage S99)
    (stage S100) (stage S101) (stage S102) (stage S103) (stage S104) (stage S105) (stage S106) (stage S107) (stage S108) (stage S109)
    (stage S110) (stage S111) (stage S112) (stage S113) (stage S114) (stage S115) (stage S116) (stage S117) (stage S118) (stage S119)
    (stage S120) (stage S121) (stage S122) (stage S123) (stage S124) (stage S125) (stage S126) (stage S127)

    (next S0 S1) (next S1 S2) (next S2 S3) (next S3 S4) (next S4 S5) (next S5 S6) (next S6 S7) (next S7 S8) (next S8 S9)
    (next S9 S10) (next S10 S11) (next S11 S12) (next S12 S13) (next S13 S14) (next S14 S15) (next S15 S16) (next S16 S17) (next S17 S18) (next S18 S19)
    (next S19 S20) (next S20 S21) (next S21 S22) (next S22 S23) (next S23 S24) (next S24 S25) (next S25 S26) (next S26 S27) (next S27 S28) (next S28 S29)
    (next S29 S30) (next S30 S31) (next S31 S32) (next S32 S33) (next S33 S34) (next S34 S35) (next S35 S36) (next S36 S37) (next S37 S38) (next S38 S39)
    (next S39 S40) (next S40 S41) (next S41 S42) (next S42 S43) (next S43 S44) (next S44 S45) (next S45 S46) (next S46 S47) (next S47 S48) (next S48 S49)
    (next S49 S50) (next S50 S51) (next S51 S52) (next S52 S53) (next S53 S54) (next S54 S55) (next S55 S56) (next S56 S57) (next S57 S58) (next S58 S59)
    (next S59 S60) (next S60 S61) (next S61 S62) (next S62 S63) (next S63 S64) (next S64 S65) (next S65 S66) (next S66 S67) (next S67 S68) (next S68 S69)
    (next S69 S70) (next S70 S71) (next S71 S72) (next S72 S73) (next S73 S74) (next S74 S75) (next S75 S76) (next S76 S77) (next S77 S78) (next S78 S79)
    (next S79 S80) (next S80 S81) (next S81 S82) (next S82 S83) (next S83 S84) (next S84 S85) (next S85 S86) (next S86 S87) (next S87 S88) (next S88 S89)
    (next S89 S90) (next S90 S91) (next S91 S92) (next S92 S93) (next S93 S94) (next S94 S95) (next S95 S96) (next S96 S97) (next S97 S98) (next S98 S99)
    (next S99 S100) (next S100 S101) (next S101 S102) (next S102 S103) (next S103 S104) (next S104 S105) (next S105 S106) (next S106 S107) (next S107 S108) (next S108 S109)
    (next S109 S110) (next S110 S111) (next S111 S112) (next S112 S113) (next S113 S114) (next S114 S115) (next S115 S116) (next S116 S117) (next S117 S118) (next S118 S119)
    (next S119 S120) (next S120 S121) (next S121 S122) (next S122 S123) (next S123 S124) (next S124 S125) (next S125 S126) (next S126 S127)

    (current S0)
  )

  (:goal (and
    (on-peg G right)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    (clear-disk A)
    (empty-peg left)
    (empty-peg middle)
    (current S127)
  ))