(define (problem sokoban_problem)
  (:domain sokoban_domain)
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
    pos_101 pos_102 pos_103 - location
  )
  (:init
    (at_player pos_1)
    (at_box pos_52)
    (is_empty pos_2) (is_empty pos_3) (is_empty pos_4) (is_empty pos_5) (is_empty pos_6) (is_empty pos_7) (is_empty pos_8) (is_empty pos_9) (is_empty pos_10)
    (is_empty pos_11) (is_empty pos_12) (is_empty pos_13) (is_empty pos_14) (is_empty pos_15) (is_empty pos_16) (is_empty pos_17) (is_empty pos_18) (is_empty pos_19) (is_empty pos_20)
    (is_empty pos_21) (is_empty pos_22) (is_empty pos_23) (is_empty pos_24) (is_empty pos_25) (is_empty pos_26) (is_empty pos_27) (is_empty pos_28) (is_empty pos_29) (is_empty pos_30)
    (is_empty pos_31) (is_empty pos_32) (is_empty pos_33) (is_empty pos_34) (is_empty pos_35) (is_empty pos_36) (is_empty pos_37) (is_empty pos_38) (is_empty pos_39) (is_empty pos_40)
    (is_empty pos_41) (is_empty pos_42) (is_empty pos_43) (is_empty pos_44) (is_empty pos_45) (is_empty pos_46) (is_empty pos_47) (is_empty pos_48) (is_empty pos_49) (is_empty pos_50)
    (is_empty pos_51) (is_empty pos_53) (is_empty pos_54) (is_empty pos_55) (is_empty pos_56) (is_empty pos_57) (is_empty pos_58) (is_empty pos_59) (is_empty pos_60)
    (is_empty pos_61) (is_empty pos_62) (is_empty pos_63) (is_empty pos_64) (is_empty pos_65) (is_empty pos_66) (is_empty pos_67) (is_empty pos_68) (is_empty pos_69) (is_empty pos_70)
    (is_empty pos_71) (is_empty pos_72) (is_empty pos_73) (is_empty pos_74) (is_empty pos_75) (is_empty pos_76) (is_empty pos_77) (is_empty pos_78) (is_empty pos_79) (is_empty pos_80)
    (is_empty pos_81) (is_empty pos_82) (is_empty pos_83) (is_empty pos_84) (is_empty pos_85) (is_empty pos_86) (is_empty pos_87) (is_empty pos_88) (is_empty pos_89) (is_empty pos_90)
    (is_empty pos_91) (is_empty pos_92) (is_empty pos_93) (is_empty pos_94) (is_empty pos_95) (is_empty pos_96) (is_empty pos_97) (is_empty pos_98) (is_empty pos_99) (is_empty pos_100)
    (is_empty pos_101) (is_empty pos_102) (is_empty pos_103)
    (next pos_1 pos_2) (next pos_2 pos_3) (next pos_3 pos_4) (next pos_4 pos_5) (next pos_5 pos_6) (next pos_6 pos_7) (next pos_7 pos_8) (next pos_8 pos_9) (next pos_9 pos_10)
    (next pos_10 pos_11) (next pos_11 pos_12) (next pos_12 pos_13) (next pos_13 pos_14) (next pos_14 pos_15) (next pos_15 pos_16) (next pos_16 pos_17) (next pos_17 pos_18) (next pos_18 pos_19) (next pos_19 pos_20)
    (next pos_20 pos_21) (next pos_21 pos_22) (next pos_22 pos_23) (next pos_23 pos_24) (next pos_24 pos_25) (next pos_25 pos_26) (next pos_26 pos_27) (next pos_27 pos_28) (next pos_28 pos_29) (next pos_29 pos_30)
    (next pos_30 pos_31) (next pos_31 pos_32) (next pos_32 pos_33) (next pos_33 pos_34) (next pos_34 pos_35) (next pos_35 pos_36) (next pos_36 pos_37) (next pos_37 pos_38) (next pos_38 pos_39) (next pos_39 pos_40)
    (next pos_40 pos_41) (next pos_41 pos_42) (next pos_42 pos_43) (next pos_43 pos_44) (next pos_44 pos_45) (next pos_45 pos_46) (next pos_46 pos_47) (next pos_47 pos_48) (next pos_48 pos_49) (next pos_49 pos_50)
    (next pos_50 pos_51) (next pos_51 pos_52) (next pos_52 pos_53) (next pos_53 pos_54) (next pos_54 pos_55) (next pos_55 pos_56) (next pos_56 pos_57) (next pos_57 pos_58) (next pos_58 pos_59) (next pos_59 pos_60)
    (next pos_60 pos_61) (next pos_61 pos_62) (next pos_62 pos_63) (next pos_63 pos_64) (next pos_64 pos_65) (next pos_65 pos_66) (next pos_66 pos_67) (next pos_67 pos_68) (next pos_68 pos_69) (next pos_69 pos_70)
    (next pos_70 pos_71) (next pos_71 pos_72) (next pos_72 pos_73) (next pos_73 pos_74) (next pos_74 pos_75) (next pos_75 pos_76) (next pos_76 pos_77) (next pos_77 pos_78) (next pos_78 pos_79) (next pos_79 pos_80)
    (next pos_80 pos_81) (next pos_81 pos_82) (next pos_82 pos_83) (next pos_83 pos_84) (next pos_84 pos_85) (next pos_85 pos_86) (next pos_86 pos_87) (next pos_87 pos_88) (next pos_88 pos_89) (next pos_89 pos_90)
    (next pos_90 pos_91) (next pos_91 pos_92) (next pos_92 pos_93) (next pos_93 pos_94) (next pos_94 pos_95) (next pos_95 pos_96) (next pos_96 pos_97) (next pos_97 pos_98) (next pos_98 pos_99) (next pos_99 pos_100)
    (next pos_100 pos_101) (next pos_101 pos_102) (next pos_102 pos_103)
  )
  (:goal (at_box pos_103))
)