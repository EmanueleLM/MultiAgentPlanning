(define (problem sokoban_map36_problem)
  (:domain sokoban_map36_domain)
  (:objects
    pos_2_2 pos_2_3 pos_2_4 pos_2_5 pos_2_6 pos_2_7 pos_2_8 pos_2_9 pos_2_10
    pos_2_11 pos_2_12 pos_2_13 pos_2_14 pos_2_15 pos_2_16 pos_2_17 pos_2_18 pos_2_19 pos_2_20
    pos_2_21 pos_2_22 pos_2_23 pos_2_24 pos_2_25 pos_2_26 pos_2_27 pos_2_28 pos_2_29 pos_2_30
    pos_2_31 pos_2_32 pos_2_33 pos_2_34 pos_2_35 pos_2_36 pos_2_37 pos_2_38 pos_2_39 pos_2_40
    pos_2_41 pos_2_42 pos_2_43 pos_2_44 pos_2_45 pos_2_46 pos_2_47 pos_2_48 pos_2_49 pos_2_50
    pos_2_51 pos_2_52 pos_2_53 pos_2_54 pos_2_55 pos_2_56 pos_2_57 pos_2_58 pos_2_59 pos_2_60
    pos_2_61 pos_2_62 pos_2_63 pos_2_64 pos_2_65 pos_2_66 pos_2_67 pos_2_68 pos_2_69 pos_2_70
    pos_2_71 pos_2_72 pos_2_73 pos_2_74 pos_2_75 pos_2_76 pos_2_77 pos_2_78 pos_2_79 pos_2_80
    pos_2_81 pos_2_82 pos_2_83 pos_2_84 pos_2_85 pos_2_86 pos_2_87 pos_2_88 pos_2_89 pos_2_90
    pos_2_91 pos_2_92 pos_2_93 pos_2_94 pos_2_95 - location
  )
  (:init
    (at_player pos_2_95)
    (at_box pos_2_49)
    (clear pos_2_2) (clear pos_2_3) (clear pos_2_4) (clear pos_2_5) (clear pos_2_6) (clear pos_2_7) (clear pos_2_8) (clear pos_2_9) (clear pos_2_10)
    (clear pos_2_11) (clear pos_2_12) (clear pos_2_13) (clear pos_2_14) (clear pos_2_15) (clear pos_2_16) (clear pos_2_17) (clear pos_2_18) (clear pos_2_19) (clear pos_2_20)
    (clear pos_2_21) (clear pos_2_22) (clear pos_2_23) (clear pos_2_24) (clear pos_2_25) (clear pos_2_26) (clear pos_2_27) (clear pos_2_28) (clear pos_2_29) (clear pos_2_30)
    (clear pos_2_31) (clear pos_2_32) (clear pos_2_33) (clear pos_2_34) (clear pos_2_35) (clear pos_2_36) (clear pos_2_37) (clear pos_2_38) (clear pos_2_39) (clear pos_2_40)
    (clear pos_2_41) (clear pos_2_42) (clear pos_2_43) (clear pos_2_44) (clear pos_2_45) (clear pos_2_46) (clear pos_2_47) (clear pos_2_48)
    (clear pos_2_50) (clear pos_2_51) (clear pos_2_52) (clear pos_2_53) (clear pos_2_54) (clear pos_2_55) (clear pos_2_56) (clear pos_2_57) (clear pos_2_58) (clear pos_2_59) (clear pos_2_60)
    (clear pos_2_61) (clear pos_2_62) (clear pos_2_63) (clear pos_2_64) (clear pos_2_65) (clear pos_2_66) (clear pos_2_67) (clear pos_2_68) (clear pos_2_69) (clear pos_2_70)
    (clear pos_2_71) (clear pos_2_72) (clear pos_2_73) (clear pos_2_74) (clear pos_2_75) (clear pos_2_76) (clear pos_2_77) (clear pos_2_78) (clear pos_2_79) (clear pos_2_80)
    (clear pos_2_81) (clear pos_2_82) (clear pos_2_83) (clear pos_2_84) (clear pos_2_85) (clear pos_2_86) (clear pos_2_87) (clear pos_2_88) (clear pos_2_89) (clear pos_2_90)
    (clear pos_2_91) (clear pos_2_92) (clear pos_2_93) (clear pos_2_94)
    (adj_left pos_2_2 pos_2_3) (adj_left pos_2_3 pos_2_4) (adj_left pos_2_4 pos_2_5) (adj_left pos_2_5 pos_2_6) (adj_left pos_2_6 pos_2_7) (adj_left pos_2_7 pos_2_8) (adj_left pos_2_8 pos_2_9) (adj_left pos_2_9 pos_2_10)
    (adj_left pos_2_10 pos_2_11) (adj_left pos_2_11 pos_2_12) (adj_left pos_2_12 pos_2_13) (adj_left pos_2_13 pos_2_14) (adj_left pos_2_14 pos_2_15) (adj_left pos_2_15 pos_2_16) (adj_left pos_2_16 pos_2_17) (adj_left pos_2_17 pos_2_18) (adj_left pos_2_18 pos_2_19) (adj_left pos_2_19 pos_2_20)
    (adj_left pos_2_20 pos_2_21) (adj_left pos_2_21 pos_2_22) (adj_left pos_2_22 pos_2_23) (adj_left pos_2_23 pos_2_24) (adj_left pos_2_24 pos_2_25) (adj_left pos_2_25 pos_2_26) (adj_left pos_2_26 pos_2_27) (adj_left pos_2_27 pos_2_28) (adj_left pos_2_28 pos_2_29) (adj_left pos_2_29 pos_2_30)
    (adj_left pos_2_30 pos_2_31) (adj_left pos_2_31 pos_2_32) (adj_left pos_2_32 pos_2_33) (adj_left pos_2_33 pos_2_34) (adj_left pos_2_34 pos_2_35) (adj_left pos_2_35 pos_2_36) (adj_left pos_2_36 pos_2_37) (adj_left pos_2_37 pos_2_38) (adj_left pos_2_38 pos_2_39) (adj_left pos_2_39 pos_2_40)
    (adj_left pos_2_40 pos_2_41) (adj_left pos_2_41 pos_2_42) (adj_left pos_2_42 pos_2_43) (adj_left pos_2_43 pos_2_44) (adj_left pos_2_44 pos_2_45) (adj_left pos_2_45 pos_2_46) (adj_left pos_2_46 pos_2_47) (adj_left pos_2_47 pos_2_48) (adj_left pos_2_48 pos_2_49) (adj_left pos_2_49 pos_2_50)
    (adj_left pos_2_50 pos_2_51) (adj_left pos_2_51 pos_2_52) (adj_left pos_2_52 pos_2_53) (adj_left pos_2_53 pos_2_54) (adj_left pos_2_54 pos_2_55) (adj_left pos_2_55 pos_2_56) (adj_left pos_2_56 pos_2_57) (adj_left pos_2_57 pos_2_58) (adj_left pos_2_58 pos_2_59) (adj_left pos_2_59 pos_2_60)
    (adj_left pos_2_60 pos_2_61) (adj_left pos_2_61 pos_2_62) (adj_left pos_2_62 pos_2_63) (adj_left pos_2_63 pos_2_64) (adj_left pos_2_64 pos_2_65) (adj_left pos_2_65 pos_2_66) (adj_left pos_2_66 pos_2_67) (adj_left pos_2_67 pos_2_68) (adj_left pos_2_68 pos_2_69) (adj_left pos_2_69 pos_2_70)
    (adj_left pos_2_70 pos_2_71) (adj_left pos_2_71 pos_2_72) (adj_left pos_2_72 pos_2_73) (adj_left pos_2_73 pos_2_74) (adj_left pos_2_74 pos_2_75) (adj_left pos_2_75 pos_2_76) (adj_left pos_2_76 pos_2_77) (adj_left pos_2_77 pos_2_78) (adj_left pos_2_78 pos_2_79) (adj_left pos_2_79 pos_2_80)
    (adj_left pos_2_80 pos_2_81) (adj_left pos_2_81 pos_2_82) (adj_left pos_2_82 pos_2_83) (adj_left pos_2_83 pos_2_84) (adj_left pos_2_84 pos_2_85) (adj_left pos_2_85 pos_2_86) (adj_left pos_2_86 pos_2_87) (adj_left pos_2_87 pos_2_88) (adj_left pos_2_88 pos_2_89) (adj_left pos_2_89 pos_2_90)
    (adj_left pos_2_90 pos_2_91) (adj_left pos_2_91 pos_2_92) (adj_left pos_2_92 pos_2_93) (adj_left pos_2_93 pos_2_94) (adj_left pos_2_94 pos_2_95)
  )
  (:goal (at_box pos_2_2))
)