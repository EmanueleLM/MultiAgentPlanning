(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - player
    box_1 - box
    position_0 position_1 position_2 position_3 position_4 position_5 position_6
    position_7 position_8 position_9 position_10 position_11 position_12 position_13
    position_14 position_15 position_16 position_17 position_18 position_19 position_20
    position_21 position_22 position_23 position_24 position_25 position_26 position_27
    position_28 position_29 position_30 position_31 position_32 position_33 position_34
    position_35 position_36 position_37 position_38 position_39 position_40 position_41
    position_42 position_43 position_44 position_45 position_46 position_47 position_48
    position_49 position_50 position_51 position_52 position_53 position_54 position_55
    position_56 position_57 position_58 position_59 position_60 position_61 position_62
    position_63 position_64 position_65 position_66 position_67 position_68 position_69
    position_70 position_71 position_72 position_73 position_74 position_75 position_76
    position_77 position_78 position_79 position_80 position_81 position_82 position_83
    position_84 position_85 position_86 position_87 position_88 position_89 position_90
    position_91 position_92 position_93 position_94 position_95 position_96 position_97
    position_98 - position
  )
  (:init
    (at player position_0)
    (at box_1 position_44)
    (goal position_98)

    (adjacent position_0 position_1) (adjacent position_1 position_2)
    (adjacent position_2 position_3) (adjacent position_3 position_4)
    (adjacent position_4 position_5) (adjacent position_5 position_6)
    (adjacent position_6 position_7) (adjacent position_7 position_8)
    (adjacent position_8 position_9) (adjacent position_9 position_10)
    (adjacent position_10 position_11) (adjacent position_11 position_12)
    (adjacent position_12 position_13) (adjacent position_13 position_14)
    (adjacent position_14 position_15) (adjacent position_15 position_16)
    (adjacent position_16 position_17) (adjacent position_17 position_18)
    (adjacent position_18 position_19) (adjacent position_19 position_20)
    (adjacent position_20 position_21) (adjacent position_21 position_22)
    (adjacent position_22 position_23) (adjacent position_23 position_24)
    (adjacent position_24 position_25) (adjacent position_25 position_26)
    (adjacent position_26 position_27) (adjacent position_27 position_28)
    (adjacent position_28 position_29) (adjacent position_29 position_30)
    (adjacent position_30 position_31) (adjacent position_31 position_32)
    (adjacent position_32 position_33) (adjacent position_33 position_34)
    (adjacent position_34 position_35) (adjacent position_35 position_36)
    (adjacent position_36 position_37) (adjacent position_37 position_38)
    (adjacent position_38 position_39) (adjacent position_39 position_40)
    (adjacent position_40 position_41) (adjacent position_41 position_42)
    (adjacent position_42 position_43) (adjacent position_43 position_44)
    (adjacent position_44 position_45) (adjacent position_45 position_46)
    (adjacent position_46 position_47) (adjacent position_47 position_48)
    (adjacent position_48 position_49) (adjacent position_49 position_50)
    (adjacent position_50 position_51) (adjacent position_51 position_52)
    (adjacent position_52 position_53) (adjacent position_53 position_54)
    (adjacent position_54 position_55) (adjacent position_55 position_56)
    (adjacent position_56 position_57) (adjacent position_57 position_58)
    (adjacent position_58 position_59) (adjacent position_59 position_60)
    (adjacent position_60 position_61) (adjacent position_61 position_62)
    (adjacent position_62 position_63) (adjacent position_63 position_64)
    (adjacent position_64 position_65) (adjacent position_65 position_66)
    (adjacent position_66 position_67) (adjacent position_67 position_68)
    (adjacent position_68 position_69) (adjacent position_69 position_70)
    (adjacent position_70 position_71) (adjacent position_71 position_72)
    (adjacent position_72 position_73) (adjacent position_73 position_74)
    (adjacent position_74 position_75) (adjacent position_75 position_76)
    (adjacent position_76 position_77) (adjacent position_77 position_78)
    (adjacent position_78 position_79) (adjacent position_79 position_80)
    (adjacent position_80 position_81) (adjacent position_81 position_82)
    (adjacent position_82 position_83) (adjacent position_83 position_84)
    (adjacent position_84 position_85) (adjacent position_85 position_86)
    (adjacent position_86 position_87) (adjacent position_87 position_88)
    (adjacent position_88 position_89) (adjacent position_89 position_90)
    (adjacent position_90 position_91) (adjacent position_91 position_92)
    (adjacent position_92 position_93) (adjacent position_93 position_94)
    (adjacent position_94 position_95) (adjacent position_95 position_96)
    (adjacent position_96 position_97) (adjacent position_97 position_98)

    (empty position_1) (empty position_2) (empty position_3)
    (empty position_4) (empty position_5) (empty position_6)
    (empty position_7) (empty position_8) (empty position_9)
    (empty position_10) (empty position_11) (empty position_12)
    (empty position_13) (empty position_14) (empty position_15)
    (empty position_16) (empty position_17) (empty position_18)
    (empty position_19) (empty position_20) (empty position_21)
    (empty position_22) (empty position_23) (empty position_24)
    (empty position_25) (empty position_26) (empty position_27)
    (empty position_28) (empty position_29) (empty position_30)
    (empty position_31) (empty position_32) (empty position_33)
    (empty position_34) (empty position_35) (empty position_36)
    (empty position_37) (empty position_38) (empty position_39)
    (empty position_40) (empty position_41) (empty position_42)
    (empty position_43) (empty position_45) (empty position_46)
    (empty position_47) (empty position_48) (empty position_49)
    (empty position_50) (empty position_51) (empty position_52)
    (empty position_53) (empty position_54) (empty position_55)
    (empty position_56) (empty position_57) (empty position_58)
    (empty position_59) (empty position_60) (empty position_61)
    (empty position_62) (empty position_63) (empty position_64)
    (empty position_65) (empty position_66) (empty position_67)
    (empty position_68) (empty position_69) (empty position_70)
    (empty position_71) (empty position_72) (empty position_73)
    (empty position_74) (empty position_75) (empty position_76)
    (empty position_77) (empty position_78) (empty position_79)
    (empty position_80) (empty position_81) (empty position_82)
    (empty position_83) (empty position_84) (empty position_85)
    (empty position_86) (empty position_87) (empty position_88)
    (empty position_89) (empty position_90) (empty position_91)
    (empty position_92) (empty position_93) (empty position_94)
    (empty position_95) (empty position_96) (empty position_97)
    (empty position_98)
  )

  (:goal (and (at box_1 position_98)))

)