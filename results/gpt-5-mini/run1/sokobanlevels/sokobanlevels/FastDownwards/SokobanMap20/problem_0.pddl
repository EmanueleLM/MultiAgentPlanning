(define (problem sokoban_instance)
  (:domain sokoban_corridor)
  (:objects
    player1 - player
    box1 - box
    pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 pos_10
    pos_11 pos_12 pos_13 pos_14 pos_15 pos_16 pos_17 pos_18 pos_19 pos_20
    pos_21 pos_22 pos_23 pos_24 pos_25 pos_26 pos_27 pos_28 pos_29 pos_30
    pos_31 pos_32 pos_33 pos_34 pos_35 pos_36 pos_37 pos_38 pos_39 pos_40
    pos_41 pos_42 pos_43 pos_44 pos_45 pos_46 pos_47 pos_48 pos_49 pos_50
    pos_51 pos_52 pos_53 pos_54 pos_55 pos_56 pos_57 pos_58 pos_59 pos_60
    pos_61 pos_62 pos_63 pos_64 pos_65 pos_66 pos_67 pos_68 pos_69 pos_70
    pos_71 pos_72 pos_73 pos_74 pos_75 pos_76 pos_77 pos_78 pos_79 pos_80
    pos_81 pos_82 pos_83 pos_84 pos_85 pos_86 pos_87 pos_88 pos_89 pos_90
    pos_91 pos_92 pos_93 pos_94 pos_95 pos_96 pos_97 pos_98 pos_99 pos_100
    pos_101 pos_102 pos_103 pos_104 pos_105 pos_106 pos_107 pos_108 pos_109 pos_110
    pos_111 pos_112 pos_113 pos_114 pos_115 pos_116 pos_117 pos_118 pos_119 pos_120 - position
  )

  (:init
    ;; adjacency chain: for i = 2..120 adj_up pos_i pos_{i-1}
    (adj_up pos_2 pos_1) (adj_up pos_3 pos_2) (adj_up pos_4 pos_3) (adj_up pos_5 pos_4)
    (adj_up pos_6 pos_5) (adj_up pos_7 pos_6) (adj_up pos_8 pos_7) (adj_up pos_9 pos_8)
    (adj_up pos_10 pos_9) (adj_up pos_11 pos_10) (adj_up pos_12 pos_11) (adj_up pos_13 pos_12)
    (adj_up pos_14 pos_13) (adj_up pos_15 pos_14) (adj_up pos_16 pos_15) (adj_up pos_17 pos_16)
    (adj_up pos_18 pos_17) (adj_up pos_19 pos_18) (adj_up pos_20 pos_19) (adj_up pos_21 pos_20)
    (adj_up pos_22 pos_21) (adj_up pos_23 pos_22) (adj_up pos_24 pos_23) (adj_up pos_25 pos_24)
    (adj_up pos_26 pos_25) (adj_up pos_27 pos_26) (adj_up pos_28 pos_27) (adj_up pos_29 pos_28)
    (adj_up pos_30 pos_29) (adj_up pos_31 pos_30) (adj_up pos_32 pos_31) (adj_up pos_33 pos_32)
    (adj_up pos_34 pos_33) (adj_up pos_35 pos_34) (adj_up pos_36 pos_35) (adj_up pos_37 pos_36)
    (adj_up pos_38 pos_37) (adj_up pos_39 pos_38) (adj_up pos_40 pos_39) (adj_up pos_41 pos_40)
    (adj_up pos_42 pos_41) (adj_up pos_43 pos_42) (adj_up pos_44 pos_43) (adj_up pos_45 pos_44)
    (adj_up pos_46 pos_45) (adj_up pos_47 pos_46) (adj_up pos_48 pos_47) (adj_up pos_49 pos_48)
    (adj_up pos_50 pos_49) (adj_up pos_51 pos_50) (adj_up pos_52 pos_51) (adj_up pos_53 pos_52)
    (adj_up pos_54 pos_53) (adj_up pos_55 pos_54) (adj_up pos_56 pos_55) (adj_up pos_57 pos_56)
    (adj_up pos_58 pos_57) (adj_up pos_59 pos_58) (adj_up pos_60 pos_59) (adj_up pos_61 pos_60)
    (adj_up pos_62 pos_61) (adj_up pos_63 pos_62) (adj_up pos_64 pos_63) (adj_up pos_65 pos_64)
    (adj_up pos_66 pos_65) (adj_up pos_67 pos_66) (adj_up pos_68 pos_67) (adj_up pos_69 pos_68)
    (adj_up pos_70 pos_69) (adj_up pos_71 pos_70) (adj_up pos_72 pos_71) (adj_up pos_73 pos_72)
    (adj_up pos_74 pos_73) (adj_up pos_75 pos_74) (adj_up pos_76 pos_75) (adj_up pos_77 pos_76)
    (adj_up pos_78 pos_77) (adj_up pos_79 pos_78) (adj_up pos_80 pos_79) (adj_up pos_81 pos_80)
    (adj_up pos_82 pos_81) (adj_up pos_83 pos_82) (adj_up pos_84 pos_83) (adj_up pos_85 pos_84)
    (adj_up pos_86 pos_85) (adj_up pos_87 pos_86) (adj_up pos_88 pos_87) (adj_up pos_89 pos_88)
    (adj_up pos_90 pos_89) (adj_up pos_91 pos_90) (adj_up pos_92 pos_91) (adj_up pos_93 pos_92)
    (adj_up pos_94 pos_93) (adj_up pos_95 pos_94) (adj_up pos_96 pos_95) (adj_up pos_97 pos_96)
    (adj_up pos_98 pos_97) (adj_up pos_99 pos_98) (adj_up pos_100 pos_99) (adj_up pos_101 pos_100)
    (adj_up pos_102 pos_101) (adj_up pos_103 pos_102) (adj_up pos_104 pos_103) (adj_up pos_105 pos_104)
    (adj_up pos_106 pos_105) (adj_up pos_107 pos_106) (adj_up pos_108 pos_107) (adj_up pos_109 pos_108)
    (adj_up pos_110 pos_109) (adj_up pos_111 pos_110) (adj_up pos_112 pos_111) (adj_up pos_113 pos_112)
    (adj_up pos_114 pos_113) (adj_up pos_115 pos_114) (adj_up pos_116 pos_115) (adj_up pos_117 pos_116)
    (adj_up pos_118 pos_117) (adj_up pos_119 pos_118) (adj_up pos_120 pos_119)

    ;; static goal at top interior cell
    (goal pos_1)

    ;; initial placements: box and player (mapped from ASCII)
    ;; box located in the corridor interior (mapped to pos_60)
    (box_at box1 pos_60)
    ;; player located near the bottom interior (mapped to pos_120)
    (player_at player1 pos_120)

    ;; free flags: every position not occupied by player or box is free
    (free pos_1) (free pos_2) (free pos_3) (free pos_4) (free pos_5) (free pos_6) (free pos_7) (free pos_8) (free pos_9) (free pos_10)
    (free pos_11) (free pos_12) (free pos_13) (free pos_14) (free pos_15) (free pos_16) (free pos_17) (free pos_18) (free pos_19) (free pos_20)
    (free pos_21) (free pos_22) (free pos_23) (free pos_24) (free pos_25) (free pos_26) (free pos_27) (free pos_28) (free pos_29) (free pos_30)
    (free pos_31) (free pos_32) (free pos_33) (free pos_34) (free pos_35) (free pos_36) (free pos_37) (free pos_38) (free pos_39) (free pos_40)
    (free pos_41) (free pos_42) (free pos_43) (free pos_44) (free pos_45) (free pos_46) (free pos_47) (free pos_48) (free pos_49) (free pos_50)
    (free pos_51) (free pos_52) (free pos_53) (free pos_54) (free pos_55) (free pos_56) (free pos_57) (free pos_59) (free pos_61) (free pos_62)
    (free pos_63) (free pos_64) (free pos_65) (free pos_66) (free pos_67) (free pos_68) (free pos_69) (free pos_70) (free pos_71) (free pos_72)
    (free pos_73) (free pos_74) (free pos_75) (free pos_76) (free pos_77) (free pos_78) (free pos_79) (free pos_80) (free pos_81) (free pos_82)
    (free pos_83) (free pos_84) (free pos_85) (free pos_86) (free pos_87) (free pos_88) (free pos_89) (free pos_90) (free pos_91) (free pos_92)
    (free pos_93) (free pos_94) (free pos_95) (free pos_96) (free pos_97) (free pos_98) (free pos_99) (free pos_100) (free pos_101) (free pos_102)
    (free pos_103) (free pos_104) (free pos_105) (free pos_106) (free pos_107) (free pos_108) (free pos_109) (free pos_110) (free pos_111) (free pos_112)
    (free pos_113) (free pos_114) (free pos_115) (free pos_116) (free pos_117) (free pos_118) (free pos_119)
    ;; note: pos_60 and pos_120 are occupied by box and player respectively and thus not free
  )

  (:goal (and
    (box_at box1 pos_1)
  ))
)