(define (problem sokoban_instance)
  (:domain sokoban_corridor)
  (:objects
    p_0 p_1 p_2 p_3 p_4 p_5 p_6 p_7 p_8 p_9 p_10 p_11 p_12 p_13 p_14 p_15 p_16 p_17 p_18 p_19 p_20 p_21 p_22 p_23 p_24 p_25 p_26 p_27 p_28 p_29 p_30 p_31 p_32 p_33 p_34 p_35 p_36 p_37 p_38 p_39 p_40 p_41 p_42 p_43 p_44 p_45 p_46 p_47 p_48 p_49 p_50 p_51 p_52 p_53 p_54 p_55 p_56 p_57 p_58 p_59 p_60 p_61 p_62 p_63 p_64 p_65 p_66 p_67 p_68 p_69 p_70 p_71 p_72 p_73 p_74 p_75 p_76 p_77 p_78 p_79 p_80 p_81 p_82 p_83 p_84 p_85 p_86 p_87 p_88 p_89 p_90 p_91 p_92 p_93 p_94 p_95 p_96 p_97 p_98 p_99 p_100 p_101 p_102 p_103 p_104 p_105 p_106 p_107 p_108 p_109 p_110 - position
    player - agent
    box - box
  )

  (:init
    ; adjacency chain (adjacent p_i p_{i+1}) meaning p_{i+1} is north of p_i
    (adjacent p_0 p_1) (adjacent p_1 p_2) (adjacent p_2 p_3) (adjacent p_3 p_4) (adjacent p_4 p_5)
    (adjacent p_5 p_6) (adjacent p_6 p_7) (adjacent p_7 p_8) (adjacent p_8 p_9) (adjacent p_9 p_10)
    (adjacent p_10 p_11) (adjacent p_11 p_12) (adjacent p_12 p_13) (adjacent p_13 p_14) (adjacent p_14 p_15)
    (adjacent p_15 p_16) (adjacent p_16 p_17) (adjacent p_17 p_18) (adjacent p_18 p_19) (adjacent p_19 p_20)
    (adjacent p_20 p_21) (adjacent p_21 p_22) (adjacent p_22 p_23) (adjacent p_23 p_24) (adjacent p_24 p_25)
    (adjacent p_25 p_26) (adjacent p_26 p_27) (adjacent p_27 p_28) (adjacent p_28 p_29) (adjacent p_29 p_30)
    (adjacent p_30 p_31) (adjacent p_31 p_32) (adjacent p_32 p_33) (adjacent p_33 p_34) (adjacent p_34 p_35)
    (adjacent p_35 p_36) (adjacent p_36 p_37) (adjacent p_37 p_38) (adjacent p_38 p_39) (adjacent p_39 p_40)
    (adjacent p_40 p_41) (adjacent p_41 p_42) (adjacent p_42 p_43) (adjacent p_43 p_44) (adjacent p_44 p_45)
    (adjacent p_45 p_46) (adjacent p_46 p_47) (adjacent p_47 p_48) (adjacent p_48 p_49) (adjacent p_49 p_50)
    (adjacent p_50 p_51) (adjacent p_51 p_52) (adjacent p_52 p_53) (adjacent p_53 p_54) (adjacent p_54 p_55)
    (adjacent p_55 p_56) (adjacent p_56 p_57) (adjacent p_57 p_58) (adjacent p_58 p_59) (adjacent p_59 p_60)
    (adjacent p_60 p_61) (adjacent p_61 p_62) (adjacent p_62 p_63) (adjacent p_63 p_64) (adjacent p_64 p_65)
    (adjacent p_65 p_66) (adjacent p_66 p_67) (adjacent p_67 p_68) (adjacent p_68 p_69) (adjacent p_69 p_70)
    (adjacent p_70 p_71) (adjacent p_71 p_72) (adjacent p_72 p_73) (adjacent p_73 p_74) (adjacent p_74 p_75)
    (adjacent p_75 p_76) (adjacent p_76 p_77) (adjacent p_77 p_78) (adjacent p_78 p_79) (adjacent p_79 p_80)
    (adjacent p_80 p_81) (adjacent p_81 p_82) (adjacent p_82 p_83) (adjacent p_83 p_84) (adjacent p_84 p_85)
    (adjacent p_85 p_86) (adjacent p_86 p_87) (adjacent p_87 p_88) (adjacent p_88 p_89) (adjacent p_89 p_90)
    (adjacent p_90 p_91) (adjacent p_91 p_92) (adjacent p_92 p_93) (adjacent p_93 p_94) (adjacent p_94 p_95)
    (adjacent p_95 p_96) (adjacent p_96 p_97) (adjacent p_97 p_98) (adjacent p_98 p_99) (adjacent p_99 p_100)
    (adjacent p_100 p_101) (adjacent p_101 p_102) (adjacent p_102 p_103) (adjacent p_103 p_104) (adjacent p_104 p_105)
    (adjacent p_105 p_106) (adjacent p_106 p_107) (adjacent p_107 p_108) (adjacent p_108 p_109) (adjacent p_109 p_110)

    ; initial placements
    (player_at p_109)
    (box_at p_86)
    (goal p_0)

    ; empty for every position except where the box is (p_86)
    (empty p_0) (empty p_1) (empty p_2) (empty p_3) (empty p_4) (empty p_5)
    (empty p_6) (empty p_7) (empty p_8) (empty p_9) (empty p_10) (empty p_11)
    (empty p_12) (empty p_13) (empty p_14) (empty p_15) (empty p_16) (empty p_17)
    (empty p_18) (empty p_19) (empty p_20) (empty p_21) (empty p_22) (empty p_23)
    (empty p_24) (empty p_25) (empty p_26) (empty p_27) (empty p_28) (empty p_29)
    (empty p_30) (empty p_31) (empty p_32) (empty p_33) (empty p_34) (empty p_35)
    (empty p_36) (empty p_37) (empty p_38) (empty p_39) (empty p_40) (empty p_41)
    (empty p_42) (empty p_43) (empty p_44) (empty p_45) (empty p_46) (empty p_47)
    (empty p_48) (empty p_49) (empty p_50) (empty p_51) (empty p_52) (empty p_53)
    (empty p_54) (empty p_55) (empty p_56) (empty p_57) (empty p_58) (empty p_59)
    (empty p_60) (empty p_61) (empty p_62) (empty p_63) (empty p_64) (empty p_65)
    (empty p_66) (empty p_67) (empty p_68) (empty p_69) (empty p_70) (empty p_71)
    (empty p_72) (empty p_73) (empty p_74) (empty p_75) (empty p_76) (empty p_77)
    (empty p_78) (empty p_79) (empty p_80) (empty p_81) (empty p_82) (empty p_83)
    (empty p_84) (empty p_85) (empty p_87) (empty p_88) (empty p_89) (empty p_90)
    (empty p_91) (empty p_92) (empty p_93) (empty p_94) (empty p_95) (empty p_96)
    (empty p_97) (empty p_98) (empty p_99) (empty p_100) (empty p_101) (empty p_102)
    (empty p_103) (empty p_104) (empty p_105) (empty p_106) (empty p_107) (empty p_108)
    (empty p_109) (empty p_110)
  )

  (:goal (and
    (box_at p_0)
  ))
)