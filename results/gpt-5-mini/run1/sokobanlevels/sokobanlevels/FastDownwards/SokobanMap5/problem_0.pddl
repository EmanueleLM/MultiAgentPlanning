(define (problem sokoban_instance)
  (:domain sokoban_corridor)
  (:objects
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
    pos_101 pos_102 pos_103 pos_104 pos_105 pos_106 pos_107 pos_108 pos_109 pos_110 pos_111
    player1 - player
    box1 - box
  )

  (:init
    ; adjacency succ from top to bottom (linear chain pos_1 -> pos_2 -> ... -> pos_111)
    (succ pos_1 pos_2) (succ pos_2 pos_3) (succ pos_3 pos_4) (succ pos_4 pos_5) (succ pos_5 pos_6)
    (succ pos_6 pos_7) (succ pos_7 pos_8) (succ pos_8 pos_9) (succ pos_9 pos_10) (succ pos_10 pos_11)
    (succ pos_11 pos_12) (succ pos_12 pos_13) (succ pos_13 pos_14) (succ pos_14 pos_15) (succ pos_15 pos_16)
    (succ pos_16 pos_17) (succ pos_17 pos_18) (succ pos_18 pos_19) (succ pos_19 pos_20) (succ pos_20 pos_21)
    (succ pos_21 pos_22) (succ pos_22 pos_23) (succ pos_23 pos_24) (succ pos_24 pos_25) (succ pos_25 pos_26)
    (succ pos_26 pos_27) (succ pos_27 pos_28) (succ pos_28 pos_29) (succ pos_29 pos_30) (succ pos_30 pos_31)
    (succ pos_31 pos_32) (succ pos_32 pos_33) (succ pos_33 pos_34) (succ pos_34 pos_35) (succ pos_35 pos_36)
    (succ pos_36 pos_37) (succ pos_37 pos_38) (succ pos_38 pos_39) (succ pos_39 pos_40) (succ pos_40 pos_41)
    (succ pos_41 pos_42) (succ pos_42 pos_43) (succ pos_43 pos_44) (succ pos_44 pos_45) (succ pos_45 pos_46)
    (succ pos_46 pos_47) (succ pos_47 pos_48) (succ pos_48 pos_49) (succ pos_49 pos_50) (succ pos_50 pos_51)
    (succ pos_51 pos_52) (succ pos_52 pos_53) (succ pos_53 pos_54) (succ pos_54 pos_55) (succ pos_55 pos_56)
    (succ pos_56 pos_57) (succ pos_57 pos_58) (succ pos_58 pos_59) (succ pos_59 pos_60) (succ pos_60 pos_61)
    (succ pos_61 pos_62) (succ pos_62 pos_63) (succ pos_63 pos_64) (succ pos_64 pos_65) (succ pos_65 pos_66)
    (succ pos_66 pos_67) (succ pos_67 pos_68) (succ pos_68 pos_69) (succ pos_69 pos_70) (succ pos_70 pos_71)
    (succ pos_71 pos_72) (succ pos_72 pos_73) (succ pos_73 pos_74) (succ pos_74 pos_75) (succ pos_75 pos_76)
    (succ pos_76 pos_77) (succ pos_77 pos_78) (succ pos_78 pos_79) (succ pos_79 pos_80) (succ pos_80 pos_81)
    (succ pos_81 pos_82) (succ pos_82 pos_83) (succ pos_83 pos_84) (succ pos_84 pos_85) (succ pos_85 pos_86)
    (succ pos_86 pos_87) (succ pos_87 pos_88) (succ pos_88 pos_89) (succ pos_89 pos_90) (succ pos_90 pos_91)
    (succ pos_91 pos_92) (succ pos_92 pos_93) (succ pos_93 pos_94) (succ pos_94 pos_95) (succ pos_95 pos_96)
    (succ pos_96 pos_97) (succ pos_97 pos_98) (succ pos_98 pos_99) (succ pos_99 pos_100) (succ pos_100 pos_101)
    (succ pos_101 pos_102) (succ pos_102 pos_103) (succ pos_103 pos_104) (succ pos_104 pos_105) (succ pos_105 pos_106)
    (succ pos_106 pos_107) (succ pos_107 pos_108) (succ pos_108 pos_109) (succ pos_109 pos_110) (succ pos_110 pos_111)

    ; initial agent and block locations (mapped from ASCII)
    (player_at pos_1)
    (box_at pos_107)

    ; goal cell (mapped from ASCII)
    (goal pos_111)

    ; emptiness facts for all positions not initially occupied by player or box
    (empty pos_2) (empty pos_3) (empty pos_4) (empty pos_5) (empty pos_6) (empty pos_7) (empty pos_8) (empty pos_9) (empty pos_10)
    (empty pos_11) (empty pos_12) (empty pos_13) (empty pos_14) (empty pos_15) (empty pos_16) (empty pos_17) (empty pos_18) (empty pos_19) (empty pos_20)
    (empty pos_21) (empty pos_22) (empty pos_23) (empty pos_24) (empty pos_25) (empty pos_26) (empty pos_27) (empty pos_28) (empty pos_29) (empty pos_30)
    (empty pos_31) (empty pos_32) (empty pos_33) (empty pos_34) (empty pos_35) (empty pos_36) (empty pos_37) (empty pos_38) (empty pos_39) (empty pos_40)
    (empty pos_41) (empty pos_42) (empty pos_43) (empty pos_44) (empty pos_45) (empty pos_46) (empty pos_47) (empty pos_48) (empty pos_49) (empty pos_50)
    (empty pos_51) (empty pos_52) (empty pos_53) (empty pos_54) (empty pos_55) (empty pos_56) (empty pos_57) (empty pos_58) (empty pos_59) (empty pos_60)
    (empty pos_61) (empty pos_62) (empty pos_63) (empty pos_64) (empty pos_65) (empty pos_66) (empty pos_68) (empty pos_69) (empty pos_70) (empty pos_71)
    (empty pos_72) (empty pos_73) (empty pos_74) (empty pos_75) (empty pos_76) (empty pos_77) (empty pos_78) (empty pos_79) (empty pos_80) (empty pos_81)
    (empty pos_82) (empty pos_83) (empty pos_84) (empty pos_85) (empty pos_86) (empty pos_87) (empty pos_88) (empty pos_89) (empty pos_90) (empty pos_91)
    (empty pos_92) (empty pos_93) (empty pos_94) (empty pos_95) (empty pos_96) (empty pos_97) (empty pos_98) (empty pos_99) (empty pos_100)
    (empty pos_101) (empty pos_102) (empty pos_103) (empty pos_104) (empty pos_105) (empty pos_106) (empty pos_108) (empty pos_109) (empty pos_110) (empty pos_111)
    ; note: pos_1 (player) and pos_107 (box) are not declared empty initially
  )

  (:goal (and (box_at pos_111)))
)