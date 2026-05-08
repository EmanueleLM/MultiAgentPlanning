(define (problem sokoban_map49)
  (:domain sokoban_1d)
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
    pos_91 pos_92 pos_93 pos_94 pos_95 pos_96 pos_97 pos_98 pos_99 - location
  )
  (:init
    (at_player pos_1)
    (at_box pos_50)
    (clear pos_2) (clear pos_3) (clear pos_4) (clear pos_5) (clear pos_6) (clear pos_7) (clear pos_8) (clear pos_9) (clear pos_10)
    (clear pos_11) (clear pos_12) (clear pos_13) (clear pos_14) (clear pos_15) (clear pos_16) (clear pos_17) (clear pos_18) (clear pos_19) (clear pos_20)
    (clear pos_21) (clear pos_22) (clear pos_23) (clear pos_24) (clear pos_25) (clear pos_26) (clear pos_27) (clear pos_28) (clear pos_29) (clear pos_30)
    (clear pos_31) (clear pos_32) (clear pos_33) (clear pos_34) (clear pos_35) (clear pos_36) (clear pos_37) (clear pos_38) (clear pos_39) (clear pos_40)
    (clear pos_41) (clear pos_42) (clear pos_43) (clear pos_44) (clear pos_45) (clear pos_46) (clear pos_47) (clear pos_48) (clear pos_49)
    (clear pos_51) (clear pos_52) (clear pos_53) (clear pos_54) (clear pos_55) (clear pos_56) (clear pos_57) (clear pos_58) (clear pos_59) (clear pos_60)
    (clear pos_61) (clear pos_62) (clear pos_63) (clear pos_64) (clear pos_65) (clear pos_66) (clear pos_67) (clear pos_68) (clear pos_69) (clear pos_70)
    (clear pos_71) (clear pos_72) (clear pos_73) (clear pos_74) (clear pos_75) (clear pos_76) (clear pos_77) (clear pos_78) (clear pos_79) (clear pos_80)
    (clear pos_81) (clear pos_82) (clear pos_83) (clear pos_84) (clear pos_85) (clear pos_86) (clear pos_87) (clear pos_88) (clear pos_89) (clear pos_90)
    (clear pos_91) (clear pos_92) (clear pos_93) (clear pos_94) (clear pos_95) (clear pos_96) (clear pos_97) (clear pos_98) (clear pos_99)
    
    (adj_right pos_1 pos_2) (adj_right pos_2 pos_3) (adj_right pos_3 pos_4) (adj_right pos_4 pos_5) (adj_right pos_5 pos_6) (adj_right pos_6 pos_7) (adj_right pos_7 pos_8) (adj_right pos_8 pos_9) (adj_right pos_9 pos_10)
    (adj_right pos_10 pos_11) (adj_right pos_11 pos_12) (adj_right pos_12 pos_13) (adj_right pos_13 pos_14) (adj_right pos_14 pos_15) (adj_right pos_15 pos_16) (adj_right pos_16 pos_17) (adj_right pos_17 pos_18) (adj_right pos_18 pos_19) (adj_right pos_19 pos_20)
    (adj_right pos_20 pos_21) (adj_right pos_21 pos_22) (adj_right pos_22 pos_23) (adj_right pos_23 pos_24) (adj_right pos_24 pos_25) (adj_right pos_25 pos_26) (adj_right pos_26 pos_27) (adj_right pos_27 pos_28) (adj_right pos_28 pos_29) (adj_right pos_29 pos_30)
    (adj_right pos_30 pos_31) (adj_right pos_31 pos_32) (adj_right pos_32 pos_33) (adj_right pos_33 pos_34) (adj_right pos_34 pos_35) (adj_right pos_35 pos_36) (adj_right pos_36 pos_37) (adj_right pos_37 pos_38) (adj_right pos_38 pos_39) (adj_right pos_39 pos_40)
    (adj_right pos_40 pos_41) (adj_right pos_41 pos_42) (adj_right pos_42 pos_43) (adj_right pos_43 pos_44) (adj_right pos_44 pos_45) (adj_right pos_45 pos_46) (adj_right pos_46 pos_47) (adj_right pos_47 pos_48) (adj_right pos_48 pos_49) (adj_right pos_49 pos_50)
    (adj_right pos_50 pos_51) (adj_right pos_51 pos_52) (adj_right pos_52 pos_53) (adj_right pos_53 pos_54) (adj_right pos_54 pos_55) (adj_right pos_55 pos_56) (adj_right pos_56 pos_57) (adj_right pos_57 pos_58) (adj_right pos_58 pos_59) (adj_right pos_59 pos_60)
    (adj_right pos_60 pos_61) (adj_right pos_61 pos_62) (adj_right pos_62 pos_63) (adj_right pos_63 pos_64) (adj_right pos_64 pos_65) (adj_right pos_65 pos_66) (adj_right pos_66 pos_67) (adj_right pos_67 pos_68) (adj_right pos_68 pos_69) (adj_right pos_69 pos_70)
    (adj_right pos_70 pos_71) (adj_right pos_71 pos_72) (adj_right pos_72 pos_73) (adj_right pos_73 pos_74) (adj_right pos_74 pos_75) (adj_right pos_75 pos_76) (adj_right pos_76 pos_77) (adj_right pos_77 pos_78) (adj_right pos_78 pos_79) (adj_right pos_79 pos_80)
    (adj_right pos_80 pos_81) (adj_right pos_81 pos_82) (adj_right pos_82 pos_83) (adj_right pos_83 pos_84) (adj_right pos_84 pos_85) (adj_right pos_85 pos_86) (adj_right pos_86 pos_87) (adj_right pos_87 pos_88) (adj_right pos_88 pos_89) (adj_right pos_89 pos_90)
    (adj_right pos_90 pos_91) (adj_right pos_91 pos_92) (adj_right pos_92 pos_93) (adj_right pos_93 pos_94) (adj_right pos_94 pos_95) (adj_right pos_95 pos_96) (adj_right pos_96 pos_97) (adj_right pos_97 pos_98) (adj_right pos_98 pos_99)

    (adj_left pos_2 pos_1) (adj_left pos_3 pos_2) (adj_left pos_4 pos_3) (adj_left pos_5 pos_4) (adj_left pos_6 pos_5) (adj_left pos_7 pos_6) (adj_left pos_8 pos_7) (adj_left pos_9 pos_8) (adj_left pos_10 pos_9)
    (adj_left pos_11 pos_10) (adj_left pos_12 pos_11) (adj_left pos_13 pos_12) (adj_left pos_14 pos_13) (adj_left pos_15 pos_14) (adj_left pos_16 pos_15) (adj_left pos_17 pos_16) (adj_left pos_18 pos_17) (adj_left pos_19 pos_18) (adj_left pos_20 pos_19)
    (adj_left pos_21 pos_20) (adj_left pos_22 pos_21) (adj_left pos_23 pos_22) (adj_left pos_24 pos_23) (adj_left pos_25 pos_24) (adj_left pos_26 pos_25) (adj_left pos_27 pos_26) (adj_left pos_28 pos_27) (adj_left pos_29 pos_28) (adj_left pos_30 pos_29)
    (adj_left pos_31 pos_30) (adj_left pos_32 pos_31) (adj_left pos_33 pos_32) (adj_left pos_34 pos_33) (adj_left pos_35 pos_34) (adj_left pos_36 pos_35) (adj_left pos_37 pos_36) (adj_left pos_38 pos_37) (adj_left pos_39 pos_38) (adj_left pos_40 pos_39)
    (adj_left pos_41 pos_40) (adj_left pos_42 pos_41) (adj_left pos_43 pos_42) (adj_left pos_44 pos_43) (adj_left pos_45 pos_44) (adj_left pos_46 pos_45) (adj_left pos_47 pos_46) (adj_left pos_48 pos_47) (adj_left pos_49 pos_48) (adj_left pos_50 pos_49)
    (adj_left pos_51 pos_50) (adj_left pos_52 pos_51) (adj_left pos_53 pos_52) (adj_left pos_54 pos_53) (adj_left pos_55 pos_54) (adj_left pos_56 pos_55) (adj_left pos_57 pos_56) (adj_left pos_58 pos_57) (adj_left pos_59 pos_58) (adj_left pos_60 pos_59)
    (adj_left pos_61 pos_60) (adj_left pos_62 pos_61) (adj_left pos_63 pos_62) (adj_left pos_64 pos_63) (adj_left pos_65 pos_64) (adj_left pos_66 pos_65) (adj_left pos_67 pos_66) (adj_left pos_68 pos_67) (adj_left pos_69 pos_68) (adj_left pos_70 pos_69)
    (adj_left pos_71 pos_70) (adj_left pos_72 pos_71) (adj_left pos_73 pos_72) (adj_left pos_74 pos_73) (adj_left pos_75 pos_74) (adj_left pos_76 pos_75) (adj_left pos_77 pos_76) (adj_left pos_78 pos_77) (adj_left pos_79 pos_78) (adj_left pos_80 pos_79)
    (adj_left pos_81 pos_80) (adj_left pos_82 pos_81) (adj_left pos_83 pos_82) (adj_left pos_84 pos_83) (adj_left pos_85 pos_84) (adj_left pos_86 pos_85) (adj_left pos_87 pos_86) (adj_left pos_88 pos_87) (adj_left pos_89 pos_88) (adj_left pos_90 pos_89)
    (adj_left pos_91 pos_90) (adj_left pos_92 pos_91) (adj_left pos_93 pos_92) (adj_left pos_94 pos_93) (adj_left pos_95 pos_94) (adj_left pos_96 pos_95) (adj_left pos_97 pos_96) (adj_left pos_98 pos_97) (adj_left pos_99 pos_98)
  )
  (:goal (at_box pos_99))
)