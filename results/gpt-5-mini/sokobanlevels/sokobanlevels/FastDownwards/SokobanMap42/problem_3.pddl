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
    ;; adjacency (rightwards along corridor)
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

    ;; static goal cell
    (goal pos1)

    ;; initial placements
    (at_box box1 pos48)
    (at_player player1 pos96)
  )

  (:goal (and (at_box box1 pos1)))
)