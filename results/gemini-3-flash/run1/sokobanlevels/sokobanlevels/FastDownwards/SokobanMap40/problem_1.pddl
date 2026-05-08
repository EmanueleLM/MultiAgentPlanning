(define (problem sokoban_map_40_problem)
  (:domain sokoban_map_40)
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
    pos_91 pos_92 pos_93 pos_94 pos_95 - loc
  )
  (:init
    (at_player pos_95)
    (at_box pos_48)
    (is_clear pos_1) (is_clear pos_2) (is_clear pos_3) (is_clear pos_4) (is_clear pos_5) (is_clear pos_6) (is_clear pos_7) (is_clear pos_8) (is_clear pos_9) (is_clear pos_10)
    (is_clear pos_11) (is_clear pos_12) (is_clear pos_13) (is_clear pos_14) (is_clear pos_15) (is_clear pos_16) (is_clear pos_17) (is_clear pos_18) (is_clear pos_19) (is_clear pos_20)
    (is_clear pos_21) (is_clear pos_22) (is_clear pos_23) (is_clear pos_24) (is_clear pos_25) (is_clear pos_26) (is_clear pos_27) (is_clear pos_28) (is_clear pos_29) (is_clear pos_30)
    (is_clear pos_31) (is_clear pos_32) (is_clear pos_33) (is_clear pos_34) (is_clear pos_35) (is_clear pos_36) (is_clear pos_37) (is_clear pos_38) (is_clear pos_39) (is_clear pos_40)
    (is_clear pos_41) (is_clear pos_42) (is_clear pos_43) (is_clear pos_44) (is_clear pos_45) (is_clear pos_46) (is_clear pos_47)
    (is_clear pos_49) (is_clear pos_50) (is_clear pos_51) (is_clear pos_52) (is_clear pos_53) (is_clear pos_54) (is_clear pos_55) (is_clear pos_56) (is_clear pos_57) (is_clear pos_58) (is_clear pos_59) (is_clear pos_60)
    (is_clear pos_61) (is_clear pos_62) (is_clear pos_63) (is_clear pos_64) (is_clear pos_65) (is_clear pos_66) (is_clear pos_67) (is_clear pos_68) (is_clear pos_69) (is_clear pos_70)
    (is_clear pos_71) (is_clear pos_72) (is_clear pos_73) (is_clear pos_74) (is_clear pos_75) (is_clear pos_76) (is_clear pos_77) (is_clear pos_78) (is_clear pos_79) (is_clear pos_80)
    (is_clear pos_81) (is_clear pos_82) (is_clear pos_83) (is_clear pos_84) (is_clear pos_85) (is_clear pos_86) (is_clear pos_87) (is_clear pos_88) (is_clear pos_89) (is_clear pos_90)
    (is_clear pos_91) (is_clear pos_92) (is_clear pos_93) (is_clear pos_94)
    (next pos_1 pos_2) (next pos_2 pos_3) (next pos_3 pos_4) (next pos_4 pos_5) (next pos_5 pos_6) (next pos_6 pos_7) (next pos_7 pos_8) (next pos_8 pos_9) (next pos_9 pos_10)
    (next pos_10 pos_11) (next pos_11 pos_12) (next pos_12 pos_13) (next pos_13 pos_14) (next pos_14 pos_15) (next pos_15 pos_16) (next pos_16 pos_17) (next pos_17 pos_18) (next pos_18 pos_19) (next pos_19 pos_20)
    (next pos_20 pos_21) (next pos_21 pos_22) (next pos_22 pos_23) (next pos_23 pos_24) (next pos_24 pos_25) (next pos_25 pos_26) (next pos_26 pos_27) (next pos_27 pos_28) (next pos_28 pos_29) (next pos_29 pos_30)
    (next pos_30 pos_31) (next pos_31 pos_32) (next pos_32 pos_33) (next pos_33 pos_34) (next pos_34 pos_35) (next pos_35 pos_36) (next pos_36 pos_37) (next pos_37 pos_38) (next pos_38 pos_39) (next pos_39 pos_40)
    (next pos_40 pos_41) (next pos_41 pos_42) (next pos_42 pos_43) (next pos_43 pos_44) (next pos_44 pos_45) (next pos_45 pos_46) (next pos_46 pos_47) (next pos_47 pos_48) (next pos_48 pos_49) (next pos_49 pos_50)
    (next pos_50 pos_51) (next pos_51 pos_52) (next pos_52 pos_53) (next pos_53 pos_54) (next pos_54 pos_55) (next pos_55 pos_56) (next pos_56 pos_57) (next pos_57 pos_58) (next pos_58 pos_59) (next pos_59 pos_60)
    (next pos_60 pos_61) (next pos_61 pos_62) (next pos_62 pos_63) (next pos_63 pos_64) (next pos_64 pos_65) (next pos_65 pos_66) (next pos_66 pos_67) (next pos_67 pos_68) (next pos_68 pos_69) (next pos_69 pos_70)
    (next pos_70 pos_71) (next pos_71 pos_72) (next pos_72 pos_73) (next pos_73 pos_74) (next pos_74 pos_75) (next pos_75 pos_76) (next pos_76 pos_77) (next pos_77 pos_78) (next pos_78 pos_79) (next pos_79 pos_80)
    (next pos_80 pos_81) (next pos_81 pos_82) (next pos_82 pos_83) (next pos_83 pos_84) (next pos_84 pos_85) (next pos_85 pos_86) (next pos_86 pos_87) (next pos_87 pos_88) (next pos_88 pos_89) (next pos_89 pos_90)
    (next pos_90 pos_91) (next pos_91 pos_92) (next pos_92 pos_93) (next pos_93 pos_94) (next pos_94 pos_95)
  )
  (:goal
    (at_box pos_1)
  )
)