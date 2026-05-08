(define (problem sokoban_instance)
  (:domain sokoban_linear)
  (:objects
    player_1 - player
    box_1 - box
    pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 pos_10
    pos_11 pos_12 pos_13 pos_14 pos_15 pos_16 pos_17 pos_18 pos_19 pos_20
    pos_21 pos_22 pos_23 pos_24 pos_25 pos_26 pos_27 pos_28 pos_29 pos_30
    pos_31 pos_32 pos_33 pos_34 pos_35 pos_36 pos_37 pos_38 pos_39 pos_40
    pos_41 pos_42 pos_43 pos_44 pos_45 pos_46 pos_47 pos_48 pos_49 pos_50
    pos_51 pos_52 pos_53 pos_54 pos_55 pos_56 pos_57 pos_58 pos_59 pos_60
    pos_61 pos_62 pos_63 pos_64 pos_65 pos_66 pos_67 pos_68 pos_69 pos_70
    pos_71 pos_72 pos_73 pos_74 pos_75 pos_76 pos_77 pos_78 pos_79 pos_80
    pos_81 pos_82 pos_83 pos_84 pos_85 pos_86 pos_87 pos_88 pos_89 pos_90
    pos_91 pos_92 - position
  )

  (:init
    ;; linear adjacency from left to right
    (right pos_1 pos_2)  (right pos_2 pos_3)  (right pos_3 pos_4)  (right pos_4 pos_5)
    (right pos_5 pos_6)  (right pos_6 pos_7)  (right pos_7 pos_8)  (right pos_8 pos_9)
    (right pos_9 pos_10) (right pos_10 pos_11) (right pos_11 pos_12) (right pos_12 pos_13)
    (right pos_13 pos_14) (right pos_14 pos_15) (right pos_15 pos_16) (right pos_16 pos_17)
    (right pos_17 pos_18) (right pos_18 pos_19) (right pos_19 pos_20) (right pos_20 pos_21)
    (right pos_21 pos_22) (right pos_22 pos_23) (right pos_23 pos_24) (right pos_24 pos_25)
    (right pos_25 pos_26) (right pos_26 pos_27) (right pos_27 pos_28) (right pos_28 pos_29)
    (right pos_29 pos_30) (right pos_30 pos_31) (right pos_31 pos_32) (right pos_32 pos_33)
    (right pos_33 pos_34) (right pos_34 pos_35) (right pos_35 pos_36) (right pos_36 pos_37)
    (right pos_37 pos_38) (right pos_38 pos_39) (right pos_39 pos_40) (right pos_40 pos_41)
    (right pos_41 pos_42) (right pos_42 pos_43) (right pos_43 pos_44) (right pos_44 pos_45)
    (right pos_45 pos_46) (right pos_46 pos_47) (right pos_47 pos_48) (right pos_48 pos_49)
    (right pos_49 pos_50) (right pos_50 pos_51) (right pos_51 pos_52) (right pos_52 pos_53)
    (right pos_53 pos_54) (right pos_54 pos_55) (right pos_55 pos_56) (right pos_56 pos_57)
    (right pos_57 pos_58) (right pos_58 pos_59) (right pos_59 pos_60) (right pos_60 pos_61)
    (right pos_61 pos_62) (right pos_62 pos_63) (right pos_63 pos_64) (right pos_64 pos_65)
    (right pos_65 pos_66) (right pos_66 pos_67) (right pos_67 pos_68) (right pos_68 pos_69)
    (right pos_69 pos_70) (right pos_70 pos_71) (right pos_71 pos_72) (right pos_72 pos_73)
    (right pos_73 pos_74) (right pos_74 pos_75) (right pos_75 pos_76) (right pos_76 pos_77)
    (right pos_77 pos_78) (right pos_78 pos_79) (right pos_79 pos_80) (right pos_80 pos_81)
    (right pos_81 pos_82) (right pos_82 pos_83) (right pos_83 pos_84) (right pos_84 pos_85)
    (right pos_85 pos_86) (right pos_86 pos_87) (right pos_87 pos_88) (right pos_88 pos_89)
    (right pos_89 pos_90) (right pos_90 pos_91) (right pos_91 pos_92)

    ;; initial positions: player at left end, box near middle
    (at-player player_1 pos_1)
    (at-box box_1 pos_47)

    ;; free positions: all positions except those occupied by player_1 or box_1
    (free pos_2) (free pos_3) (free pos_4) (free pos_5) (free pos_6) (free pos_7) (free pos_8) (free pos_9) (free pos_10)
    (free pos_11) (free pos_12) (free pos_13) (free pos_14) (free pos_15) (free pos_16) (free pos_17) (free pos_18) (free pos_19) (free pos_20)
    (free pos_21) (free pos_22) (free pos_23) (free pos_24) (free pos_25) (free pos_26) (free pos_27) (free pos_28) (free pos_29) (free pos_30)
    (free pos_31) (free pos_32) (free pos_33) (free pos_34) (free pos_35) (free pos_36) (free pos_37) (free pos_38) (free pos_39) (free pos_40)
    (free pos_41) (free pos_42) (free pos_43) (free pos_44) (free pos_45) (free pos_46) (free pos_48) (free pos_49) (free pos_50)
    (free pos_51) (free pos_52) (free pos_53) (free pos_54) (free pos_55) (free pos_56) (free pos_57) (free pos_58) (free pos_59) (free pos_60)
    (free pos_61) (free pos_62) (free pos_63) (free pos_64) (free pos_65) (free pos_66) (free pos_67) (free pos_68) (free pos_69) (free pos_70)
    (free pos_71) (free pos_72) (free pos_73) (free pos_74) (free pos_75) (free pos_76) (free pos_77) (free pos_78) (free pos_79) (free pos_80)
    (free pos_81) (free pos_82) (free pos_83) (free pos_84) (free pos_85) (free pos_86) (free pos_87) (free pos_88) (free pos_89) (free pos_90)
    (free pos_91) (free pos_92)

    ;; goal location
    (goal pos_92)
  )

  (:goal (and
    (at-box box_1 pos_92)
  ))
)