(define (problem sokoban_problem_30)
  (:domain sokoban_map_30)
  (:objects
    pos_1_1 pos_1_2 pos_1_3 pos_1_4 pos_1_5 pos_1_6 pos_1_7 pos_1_8 pos_1_9 pos_1_10
    pos_1_11 pos_1_12 pos_1_13 pos_1_14 pos_1_15 pos_1_16 pos_1_17 pos_1_18 pos_1_19 pos_1_20
    pos_1_21 pos_1_22 pos_1_23 pos_1_24 pos_1_25 pos_1_26 pos_1_27 pos_1_28 pos_1_29 pos_1_30
    pos_1_31 pos_1_32 pos_1_33 pos_1_34 pos_1_35 pos_1_36 pos_1_37 pos_1_38 pos_1_39 pos_1_40
    pos_1_41 pos_1_42 pos_1_43 pos_1_44 pos_1_45 pos_1_46 pos_1_47 pos_1_48 pos_1_49 pos_1_50
    pos_1_51 pos_1_52 pos_1_53 pos_1_54 pos_1_55 pos_1_56 pos_1_57 pos_1_58 pos_1_59 pos_1_60
    pos_1_61 pos_1_62 pos_1_63 pos_1_64 pos_1_65 pos_1_66 pos_1_67 pos_1_68 pos_1_69 pos_1_70
    pos_1_71 pos_1_72 pos_1_73 pos_1_74 pos_1_75 pos_1_76 pos_1_77 pos_1_78 pos_1_79 pos_1_80
    pos_1_81 pos_1_82 pos_1_83 pos_1_84 pos_1_85 pos_1_86 pos_1_87 pos_1_88 pos_1_89 pos_1_90 - loc
  )
  (:init
    (at_player pos_1_90)
    (at_box pos_1_45)
    (clear pos_1_1) (clear pos_1_2) (clear pos_1_3) (clear pos_1_4) (clear pos_1_5) (clear pos_1_6) (clear pos_1_7) (clear pos_1_8) (clear pos_1_9) (clear pos_1_10)
    (clear pos_1_11) (clear pos_1_12) (clear pos_1_13) (clear pos_1_14) (clear pos_1_15) (clear pos_1_16) (clear pos_1_17) (clear pos_1_18) (clear pos_1_19) (clear pos_1_20)
    (clear pos_1_21) (clear pos_1_22) (clear pos_1_23) (clear pos_1_24) (clear pos_1_25) (clear pos_1_26) (clear pos_1_27) (clear pos_1_28) (clear pos_1_29) (clear pos_1_30)
    (clear pos_1_31) (clear pos_1_32) (clear pos_1_33) (clear pos_1_34) (clear pos_1_35) (clear pos_1_36) (clear pos_1_37) (clear pos_1_38) (clear pos_1_39) (clear pos_1_40)
    (clear pos_1_41) (clear pos_1_42) (clear pos_1_43) (clear pos_1_44) (clear pos_1_46) (clear pos_1_47) (clear pos_1_48) (clear pos_1_49) (clear pos_1_50)
    (clear pos_1_51) (clear pos_1_52) (clear pos_1_53) (clear pos_1_54) (clear pos_1_55) (clear pos_1_56) (clear pos_1_57) (clear pos_1_58) (clear pos_1_59) (clear pos_1_60)
    (clear pos_1_61) (clear pos_1_62) (clear pos_1_63) (clear pos_1_64) (clear pos_1_65) (clear pos_1_66) (clear pos_1_67) (clear pos_1_68) (clear pos_1_69) (clear pos_1_70)
    (clear pos_1_71) (clear pos_1_72) (clear pos_1_73) (clear pos_1_74) (clear pos_1_75) (clear pos_1_76) (clear pos_1_77) (clear pos_1_78) (clear pos_1_79) (clear pos_1_80)
    (clear pos_1_81) (clear pos_1_82) (clear pos_1_83) (clear pos_1_84) (clear pos_1_85) (clear pos_1_86) (clear pos_1_87) (clear pos_1_88) (clear pos_1_89)

    (left_of pos_1_1 pos_1_2) (left_of pos_1_2 pos_1_3) (left_of pos_1_3 pos_1_4) (left_of pos_1_4 pos_1_5) (left_of pos_1_5 pos_1_6) (left_of pos_1_6 pos_1_7) (left_of pos_1_7 pos_1_8) (left_of pos_1_8 pos_1_9) (left_of pos_1_9 pos_1_10) (left_of pos_1_10 pos_1_11)
    (left_of pos_1_11 pos_1_12) (left_of pos_1_12 pos_1_13) (left_of pos_1_13 pos_1_14) (left_of pos_1_14 pos_1_15) (left_of pos_1_15 pos_1_16) (left_of pos_1_16 pos_1_17) (left_of pos_1_17 pos_1_18) (left_of pos_1_18 pos_1_19) (left_of pos_1_19 pos_1_20) (left_of pos_1_20 pos_1_21)
    (left_of pos_1_21 pos_1_22) (left_of pos_1_22 pos_1_23) (left_of pos_1_23 pos_1_24) (left_of pos_1_24 pos_1_25) (left_of pos_1_25 pos_1_26) (left_of pos_1_26 pos_1_27) (left_of pos_1_27 pos_1_28) (left_of pos_1_28 pos_1_29) (left_of pos_1_29 pos_1_30) (left_of pos_1_30 pos_1_31)
    (left_of pos_1_31 pos_1_32) (left_of pos_1_32 pos_1_33) (left_of pos_1_33 pos_1_34) (left_of pos_1_34 pos_1_35) (left_of pos_1_35 pos_1_36) (left_of pos_1_36 pos_1_37) (left_of pos_1_37 pos_1_38) (left_of pos_1_38 pos_1_39) (left_of pos_1_39 pos_1_40) (left_of pos_1_40 pos_1_41)
    (left_of pos_1_41 pos_1_42) (left_of pos_1_42 pos_1_43) (left_of pos_1_43 pos_1_44) (left_of pos_1_44 pos_1_45) (left_of pos_1_45 pos_1_46) (left_of pos_1_46 pos_1_47) (left_of pos_1_47 pos_1_48) (left_of pos_1_48 pos_1_49) (left_of pos_1_49 pos_1_50) (left_of pos_1_50 pos_1_51)
    (left_of pos_1_51 pos_1_52) (left_of pos_1_52 pos_1_53) (left_of pos_1_53 pos_1_54) (left_of pos_1_54 pos_1_55) (left_of pos_1_55 pos_1_56) (left_of pos_1_56 pos_1_57) (left_of pos_1_57 pos_1_58) (left_of pos_1_58 pos_1_59) (left_of pos_1_59 pos_1_60) (left_of pos_1_60 pos_1_61)
    (left_of pos_1_61 pos_1_62) (left_of pos_1_62 pos_1_63) (left_of pos_1_63 pos_1_64) (left_of pos_1_64 pos_1_65) (left_of pos_1_65 pos_1_66) (left_of pos_1_66 pos_1_67) (left_of pos_1_67 pos_1_68) (left_of pos_1_68 pos_1_69) (left_of pos_1_69 pos_1_70) (left_of pos_1_70 pos_1_71)
    (left_of pos_1_71 pos_1_72) (left_of pos_1_72 pos_1_73) (left_of pos_1_73 pos_1_74) (left_of pos_1_74 pos_1_75) (left_of pos_1_75 pos_1_76) (left_of pos_1_76 pos_1_77) (left_of pos_1_77 pos_1_78) (left_of pos_1_78 pos_1_79) (left_of pos_1_79 pos_1_80) (left_of pos_1_80 pos_1_81)
    (left_of pos_1_81 pos_1_82) (left_of pos_1_82 pos_1_83) (left_of pos_1_83 pos_1_84) (left_of pos_1_84 pos_1_85) (left_of pos_1_85 pos_1_86) (left_of pos_1_86 pos_1_87) (left_of pos_1_87 pos_1_88) (left_of pos_1_88 pos_1_89) (left_of pos_1_89 pos_1_90)

    (right_of pos_1_2 pos_1_1) (right_of pos_1_3 pos_1_2) (right_of pos_1_4 pos_1_3) (right_of pos_1_5 pos_1_4) (right_of pos_1_6 pos_1_5) (right_of pos_1_7 pos_1_6) (right_of pos_1_8 pos_1_7) (right_of pos_1_9 pos_1_8) (right_of pos_1_10 pos_1_9) (right_of pos_1_11 pos_1_10)
    (right_of pos_1_12 pos_1_11) (right_of pos_1_13 pos_1_12) (right_of pos_1_14 pos_1_13) (right_of pos_1_15 pos_1_14) (right_of pos_1_16 pos_1_15) (right_of pos_1_17 pos_1_16) (right_of pos_1_18 pos_1_17) (right_of pos_1_19 pos_1_18) (right_of pos_1_20 pos_1_19) (right_of pos_1_21 pos_1_20)
    (right_of pos_1_22 pos_1_21) (right_of pos_1_23 pos_1_22) (right_of pos_1_24 pos_1_23) (right_of pos_1_25 pos_1_24) (right_of pos_1_26 pos_1_25) (right_of pos_1_27 pos_1_26) (right_of pos_1_28 pos_1_27) (right_of pos_1_29 pos_1_28) (right_of pos_1_30 pos_1_29) (right_of pos_1_31 pos_1_30)
    (right_of pos_1_32 pos_1_31) (right_of pos_1_33 pos_1_32) (right_of pos_1_34 pos_1_33) (right_of pos_1_35 pos_1_34) (right_of pos_1_36 pos_1_35) (right_of pos_1_37 pos_1_36) (right_of pos_1_38 pos_1_37) (right_of pos_1_39 pos_1_38) (right_of pos_1_40 pos_1_39) (right_of pos_1_41 pos_1_40)
    (right_of pos_1_42 pos_1_41) (right_of pos_1_43 pos_1_42) (right_of pos_1_44 pos_1_43) (right_of pos_1_45 pos_1_44) (right_of pos_1_46 pos_1_45) (right_of pos_1_47 pos_1_46) (right_of pos_1_48 pos_1_47) (right_of pos_1_49 pos_1_48) (right_of pos_1_50 pos_1_49) (right_of pos_1_51 pos_1_50)
    (right_of pos_1_52 pos_1_51) (right_of pos_1_53 pos_1_52) (right_of pos_1_54 pos_1_53) (right_of pos_1_55 pos_1_54) (right_of pos_1_56 pos_1_55) (right_of pos_1_57 pos_1_56) (right_of pos_1_58 pos_1_57) (right_of pos_1_59 pos_1_58) (right_of pos_1_60 pos_1_59) (right_of pos_1_61 pos_1_60)
    (right_of pos_1_62 pos_1_61) (right_of pos_1_63 pos_1_62) (right_of pos_1_64 pos_1_63) (right_of pos_1_65 pos_1_64) (right_of pos_1_66 pos_1_65) (right_of pos_1_67 pos_1_66) (right_of pos_1_68 pos_1_67) (right_of pos_1_69 pos_1_68) (right_of pos_1_70 pos_1_69) (right_of pos_1_71 pos_1_70)
    (right_of pos_1_72 pos_1_71) (right_of pos_1_73 pos_1_72) (right_of pos_1_74 pos_1_73) (right_of pos_1_75 pos_1_74) (right_of pos_1_76 pos_1_75) (right_of pos_1_77 pos_1_76) (right_of pos_1_78 pos_1_77) (right_of pos_1_79 pos_1_78) (right_of pos_1_80 pos_1_79) (right_of pos_1_81 pos_1_80)
    (right_of pos_1_82 pos_1_81) (right_of pos_1_83 pos_1_82) (right_of pos_1_84 pos_1_83) (right_of pos_1_85 pos_1_84) (right_of pos_1_86 pos_1_85) (right_of pos_1_87 pos_1_86) (right_of pos_1_88 pos_1_87) (right_of pos_1_89 pos_1_88) (right_of pos_1_90 pos_1_89)
  )
  (:goal
    (at_box pos_1_1)
  )
)