(define (problem sokoban_map42_instance)
  (:domain sokoban_map42)
  (:objects
    pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8 pos9 pos10
    pos11 pos12 pos13 pos14 pos15 pos16 pos17 pos18 pos19 pos20
    pos21 pos22 pos23 pos24 pos25 pos26 pos27 pos28 pos29 pos30
    pos31 pos32 pos33 pos34 pos35 pos36 pos37 pos38 pos39 pos40
    pos41 pos42 pos43 pos44 pos45 pos46 pos47 pos48 pos49 pos50
    pos51 pos52 pos53 pos54 pos55 pos56 pos57 pos58 pos59 pos60
    pos61 pos62 pos63 pos64 pos65 pos66 pos67 pos68 pos69 pos70
    pos71 pos72 pos73 pos74 pos75 pos76 pos77 pos78 pos79 pos80
    pos81 pos82 pos83 pos84 pos85 pos86 pos87 pos88 pos89 pos90
    pos91 pos92 pos93 pos94 pos95 pos96 - position
    box1 - box
    player1 - player
  )

  (:init
    ;; adjacency right (pos1 -> pos2 ... pos95 -> pos96)
    (neighbor_right pos1 pos2) (neighbor_right pos2 pos3) (neighbor_right pos3 pos4) (neighbor_right pos4 pos5)
    (neighbor_right pos5 pos6) (neighbor_right pos6 pos7) (neighbor_right pos7 pos8) (neighbor_right pos8 pos9)
    (neighbor_right pos9 pos10) (neighbor_right pos10 pos11) (neighbor_right pos11 pos12) (neighbor_right pos12 pos13)
    (neighbor_right pos13 pos14) (neighbor_right pos14 pos15) (neighbor_right pos15 pos16) (neighbor_right pos16 pos17)
    (neighbor_right pos17 pos18) (neighbor_right pos18 pos19) (neighbor_right pos19 pos20) (neighbor_right pos20 pos21)
    (neighbor_right pos21 pos22) (neighbor_right pos22 pos23) (neighbor_right pos23 pos24) (neighbor_right pos24 pos25)
    (neighbor_right pos25 pos26) (neighbor_right pos26 pos27) (neighbor_right pos27 pos28) (neighbor_right pos28 pos29)
    (neighbor_right pos29 pos30) (neighbor_right pos30 pos31) (neighbor_right pos31 pos32) (neighbor_right pos32 pos33)
    (neighbor_right pos33 pos34) (neighbor_right pos34 pos35) (neighbor_right pos35 pos36) (neighbor_right pos36 pos37)
    (neighbor_right pos37 pos38) (neighbor_right pos38 pos39) (neighbor_right pos39 pos40) (neighbor_right pos40 pos41)
    (neighbor_right pos41 pos42) (neighbor_right pos42 pos43) (neighbor_right pos43 pos44) (neighbor_right pos44 pos45)
    (neighbor_right pos45 pos46) (neighbor_right pos46 pos47) (neighbor_right pos47 pos48) (neighbor_right pos48 pos49)
    (neighbor_right pos49 pos50) (neighbor_right pos50 pos51) (neighbor_right pos51 pos52) (neighbor_right pos52 pos53)
    (neighbor_right pos53 pos54) (neighbor_right pos54 pos55) (neighbor_right pos55 pos56) (neighbor_right pos56 pos57)
    (neighbor_right pos57 pos58) (neighbor_right pos58 pos59) (neighbor_right pos59 pos60) (neighbor_right pos60 pos61)
    (neighbor_right pos61 pos62) (neighbor_right pos62 pos63) (neighbor_right pos63 pos64) (neighbor_right pos64 pos65)
    (neighbor_right pos65 pos66) (neighbor_right pos66 pos67) (neighbor_right pos67 pos68) (neighbor_right pos68 pos69)
    (neighbor_right pos69 pos70) (neighbor_right pos70 pos71) (neighbor_right pos71 pos72) (neighbor_right pos72 pos73)
    (neighbor_right pos73 pos74) (neighbor_right pos74 pos75) (neighbor_right pos75 pos76) (neighbor_right pos76 pos77)
    (neighbor_right pos77 pos78) (neighbor_right pos78 pos79) (neighbor_right pos79 pos80) (neighbor_right pos80 pos81)
    (neighbor_right pos81 pos82) (neighbor_right pos82 pos83) (neighbor_right pos83 pos84) (neighbor_right pos84 pos85)
    (neighbor_right pos85 pos86) (neighbor_right pos86 pos87) (neighbor_right pos87 pos88) (neighbor_right pos88 pos89)
    (neighbor_right pos89 pos90) (neighbor_right pos90 pos91) (neighbor_right pos91 pos92) (neighbor_right pos92 pos93)
    (neighbor_right pos93 pos94) (neighbor_right pos94 pos95) (neighbor_right pos95 pos96)

    ;; adjacency left (inverse)
    (neighbor_left pos2 pos1) (neighbor_left pos3 pos2) (neighbor_left pos4 pos3) (neighbor_left pos5 pos4)
    (neighbor_left pos6 pos5) (neighbor_left pos7 pos6) (neighbor_left pos8 pos7) (neighbor_left pos9 pos8)
    (neighbor_left pos10 pos9) (neighbor_left pos11 pos10) (neighbor_left pos12 pos11) (neighbor_left pos13 pos12)
    (neighbor_left pos14 pos13) (neighbor_left pos15 pos14) (neighbor_left pos16 pos15) (neighbor_left pos17 pos16)
    (neighbor_left pos18 pos17) (neighbor_left pos19 pos18) (neighbor_left pos20 pos19) (neighbor_left pos21 pos20)
    (neighbor_left pos22 pos21) (neighbor_left pos23 pos22) (neighbor_left pos24 pos23) (neighbor_left pos25 pos24)
    (neighbor_left pos26 pos25) (neighbor_left pos27 pos26) (neighbor_left pos28 pos27) (neighbor_left pos29 pos28)
    (neighbor_left pos30 pos29) (neighbor_left pos31 pos30) (neighbor_left pos32 pos31) (neighbor_left pos33 pos32)
    (neighbor_left pos34 pos33) (neighbor_left pos35 pos34) (neighbor_left pos36 pos35) (neighbor_left pos37 pos36)
    (neighbor_left pos38 pos37) (neighbor_left pos39 pos38) (neighbor_left pos40 pos39) (neighbor_left pos41 pos40)
    (neighbor_left pos42 pos41) (neighbor_left pos43 pos42) (neighbor_left pos44 pos43) (neighbor_left pos45 pos44)
    (neighbor_left pos46 pos45) (neighbor_left pos47 pos46) (neighbor_left pos48 pos47) (neighbor_left pos49 pos48)
    (neighbor_left pos50 pos49) (neighbor_left pos51 pos50) (neighbor_left pos52 pos51) (neighbor_left pos53 pos52)
    (neighbor_left pos54 pos53) (neighbor_left pos55 pos54) (neighbor_left pos56 pos55) (neighbor_left pos57 pos56)
    (neighbor_left pos58 pos57) (neighbor_left pos59 pos58) (neighbor_left pos60 pos59) (neighbor_left pos61 pos60)
    (neighbor_left pos62 pos61) (neighbor_left pos63 pos62) (neighbor_left pos64 pos63) (neighbor_left pos65 pos64)
    (neighbor_left pos66 pos65) (neighbor_left pos67 pos66) (neighbor_left pos68 pos67) (neighbor_left pos69 pos68)
    (neighbor_left pos70 pos69) (neighbor_left pos71 pos70) (neighbor_left pos72 pos71) (neighbor_left pos73 pos72)
    (neighbor_left pos74 pos73) (neighbor_left pos75 pos74) (neighbor_left pos76 pos75) (neighbor_left pos77 pos76)
    (neighbor_left pos78 pos77) (neighbor_left pos79 pos78) (neighbor_left pos80 pos79) (neighbor_left pos81 pos80)
    (neighbor_left pos82 pos81) (neighbor_left pos83 pos82) (neighbor_left pos84 pos83) (neighbor_left pos85 pos84)
    (neighbor_left pos86 pos85) (neighbor_left pos87 pos86) (neighbor_left pos88 pos87) (neighbor_left pos89 pos88)
    (neighbor_left pos90 pos89) (neighbor_left pos91 pos90) (neighbor_left pos92 pos91) (neighbor_left pos93 pos92)
    (neighbor_left pos94 pos93) (neighbor_left pos95 pos94) (neighbor_left pos96 pos95)

    ;; static goal cell
    (goal pos1)

    ;; initial placements
    (at_box box1 pos48)
    (at_player player1 pos96)

    ;; empty positions: all except pos48 and pos96
    (empty pos1) (empty pos2) (empty pos3) (empty pos4) (empty pos5) (empty pos6) (empty pos7) (empty pos8) (empty pos9) (empty pos10)
    (empty pos11) (empty pos12) (empty pos13) (empty pos14) (empty pos15) (empty pos16) (empty pos17) (empty pos18) (empty pos19) (empty pos20)
    (empty pos21) (empty pos22) (empty pos23) (empty pos24) (empty pos25) (empty pos26) (empty pos27) (empty pos28) (empty pos29) (empty pos30)
    (empty pos31) (empty pos32) (empty pos33) (empty pos34) (empty pos35) (empty pos36) (empty pos37) (empty pos38) (empty pos39) (empty pos40)
    (empty pos41) (empty pos42) (empty pos43) (empty pos44) (empty pos45) (empty pos46) (empty pos47)
    (empty pos49) (empty pos50) (empty pos51) (empty pos52) (empty pos53) (empty pos54) (empty pos55) (empty pos56) (empty pos57) (empty pos58)
    (empty pos59) (empty pos60) (empty pos61) (empty pos62) (empty pos63) (empty pos64) (empty pos65) (empty pos66) (empty pos67) (empty pos68)
    (empty pos69) (empty pos70) (empty pos71) (empty pos72) (empty pos73) (empty pos74) (empty pos75) (empty pos76) (empty pos77) (empty pos78)
    (empty pos79) (empty pos80) (empty pos81) (empty pos82) (empty pos83) (empty pos84) (empty pos85) (empty pos86) (empty pos87) (empty pos88)
    (empty pos89) (empty pos90) (empty pos91) (empty pos92) (empty pos93) (empty pos94) (empty pos95)
  )

  (:goal (and (at_box box1 pos1)))
)