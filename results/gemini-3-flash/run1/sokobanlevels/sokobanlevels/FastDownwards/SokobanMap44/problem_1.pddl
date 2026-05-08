(define (problem sokoban_map_44_problem)
  (:domain sokoban_map_44)
  (:objects
    pos_1_1 pos_1_2 pos_1_3 pos_1_4 pos_1_5 pos_1_6 pos_1_7 pos_1_8 pos_1_9 pos_1_10
    pos_1_11 pos_1_12 pos_1_13 pos_1_14 pos_1_15 pos_1_16 pos_1_17 pos_1_18 pos_1_19 pos_1_20
    pos_1_21 pos_1_22 pos_1_23 pos_1_24 pos_1_25 pos_1_26 pos_1_27 pos_1_28 pos_1_29 pos_1_30
    pos_1_31 pos_1_32 pos_1_33 pos_1_34 pos_1_35 pos_1_36 pos_1_37 pos_1_38 pos_1_39 pos_1_40
    pos_1_41 pos_1_42 pos_1_43 pos_1_44 pos_1_45 pos_1_46 pos_1_47 pos_1_48 pos_1_49 pos_1_50
    pos_1_51 pos_1_52 pos_1_53 pos_1_54 pos_1_55 pos_1_56 pos_1_57 pos_1_58 pos_1_59 pos_1_60
    pos_1_61 pos_1_62 pos_1_63 pos_1_64 pos_1_65 pos_1_66 pos_1_67 pos_1_68 pos_1_69 pos_1_70
    pos_1_71 pos_1_72 pos_1_73 pos_1_74 pos_1_75 pos_1_76 pos_1_77 pos_1_78 pos_1_79 pos_1_80
    pos_1_81 pos_1_82 pos_1_83 pos_1_84 pos_1_85 pos_1_86 pos_1_87 pos_1_88 pos_1_89 pos_1_90
    pos_1_91 pos_1_92 pos_1_93 pos_1_94 pos_1_95 pos_1_96 pos_1_97 - location
  )
  (:init
    (at_player pos_1_97)
    (at_box pos_1_49)
    (is_left_of pos_1_1 pos_1_2) (is_left_of pos_1_2 pos_1_3) (is_left_of pos_1_3 pos_1_4)
    (is_left_of pos_1_4 pos_1_5) (is_left_of pos_1_5 pos_1_6) (is_left_of pos_1_6 pos_1_7)
    (is_left_of pos_1_7 pos_1_8) (is_left_of pos_1_8 pos_1_9) (is_left_of pos_1_9 pos_1_10)
    (is_left_of pos_1_10 pos_1_11) (is_left_of pos_1_11 pos_1_12) (is_left_of pos_1_12 pos_1_13)
    (is_left_of pos_1_13 pos_1_14) (is_left_of pos_1_14 pos_1_15) (is_left_of pos_1_15 pos_1_16)
    (is_left_of pos_1_16 pos_1_17) (is_left_of pos_1_17 pos_1_18) (is_left_of pos_1_18 pos_1_19)
    (is_left_of pos_1_19 pos_1_20) (is_left_of pos_1_20 pos_1_21) (is_left_of pos_1_21 pos_1_22)
    (is_left_of pos_1_22 pos_1_23) (is_left_of pos_1_23 pos_1_24) (is_left_of pos_1_24 pos_1_25)
    (is_left_of pos_1_25 pos_1_26) (is_left_of pos_1_26 pos_1_27) (is_left_of pos_1_27 pos_1_28)
    (is_left_of pos_1_28 pos_1_29) (is_left_of pos_1_29 pos_1_30) (is_left_of pos_1_30 pos_1_31)
    (is_left_of pos_1_31 pos_1_32) (is_left_of pos_1_32 pos_1_33) (is_left_of pos_1_33 pos_1_34)
    (is_left_of pos_1_34 pos_1_35) (is_left_of pos_1_35 pos_1_36) (is_left_of pos_1_36 pos_1_37)
    (is_left_of pos_1_37 pos_1_38) (is_left_of pos_1_38 pos_1_39) (is_left_of pos_1_39 pos_1_40)
    (is_left_of pos_1_40 pos_1_41) (is_left_of pos_1_41 pos_1_42) (is_left_of pos_1_42 pos_1_43)
    (is_left_of pos_1_43 pos_1_44) (is_left_of pos_1_44 pos_1_45) (is_left_of pos_1_45 pos_1_46)
    (is_left_of pos_1_46 pos_1_47) (is_left_of pos_1_47 pos_1_48) (is_left_of pos_1_48 pos_1_49)
    (is_left_of pos_1_49 pos_1_50) (is_left_of pos_1_50 pos_1_51) (is_left_of pos_1_51 pos_1_52)
    (is_left_of pos_1_52 pos_1_53) (is_left_of pos_1_53 pos_1_54) (is_left_of pos_1_54 pos_1_55)
    (is_left_of pos_1_55 pos_1_56) (is_left_of pos_1_56 pos_1_57) (is_left_of pos_1_57 pos_1_58)
    (is_left_of pos_1_58 pos_1_59) (is_left_of pos_1_59 pos_1_60) (is_left_of pos_1_60 pos_1_61)
    (is_left_of pos_1_61 pos_1_62) (is_left_of pos_1_62 pos_1_63) (is_left_of pos_1_63 pos_1_64)
    (is_left_of pos_1_64 pos_1_65) (is_left_of pos_1_65 pos_1_66) (is_left_of pos_1_66 pos_1_67)
    (is_left_of pos_1_67 pos_1_68) (is_left_of pos_1_68 pos_1_69) (is_left_of pos_1_69 pos_1_70)
    (is_left_of pos_1_70 pos_1_71) (is_left_of pos_1_71 pos_1_72) (is_left_of pos_1_72 pos_1_73)
    (is_left_of pos_1_73 pos_1_74) (is_left_of pos_1_74 pos_1_75) (is_left_of pos_1_75 pos_1_76)
    (is_left_of pos_1_76 pos_1_77) (is_left_of pos_1_77 pos_1_78) (is_left_of pos_1_78 pos_1_79)
    (is_left_of pos_1_79 pos_1_80) (is_left_of pos_1_80 pos_1_81) (is_left_of pos_1_81 pos_1_82)
    (is_left_of pos_1_82 pos_1_83) (is_left_of pos_1_83 pos_1_84) (is_left_of pos_1_84 pos_1_85)
    (is_left_of pos_1_85 pos_1_86) (is_left_of pos_1_86 pos_1_87) (is_left_of pos_1_87 pos_1_88)
    (is_left_of pos_1_88 pos_1_89) (is_left_of pos_1_89 pos_1_90) (is_left_of pos_1_90 pos_1_91)
    (is_left_of pos_1_91 pos_1_92) (is_left_of pos_1_92 pos_1_93) (is_left_of pos_1_93 pos_1_94)
    (is_left_of pos_1_94 pos_1_95) (is_left_of pos_1_95 pos_1_96) (is_left_of pos_1_96 pos_1_97)
  )
  (:goal
    (at_box pos_1_1)
  )
)