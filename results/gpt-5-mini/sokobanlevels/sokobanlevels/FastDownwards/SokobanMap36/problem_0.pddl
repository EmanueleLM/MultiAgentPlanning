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
    pos_91 pos_92 pos_93 - position
  )

  (:init
    ;; neighbor chain left->right
    (neighbor pos_1 pos_2) (neighbor pos_2 pos_3) (neighbor pos_3 pos_4)
    (neighbor pos_4 pos_5) (neighbor pos_5 pos_6) (neighbor pos_6 pos_7)
    (neighbor pos_7 pos_8) (neighbor pos_8 pos_9) (neighbor pos_9 pos_10)
    (neighbor pos_10 pos_11) (neighbor pos_11 pos_12) (neighbor pos_12 pos_13)
    (neighbor pos_13 pos_14) (neighbor pos_14 pos_15) (neighbor pos_15 pos_16)
    (neighbor pos_16 pos_17) (neighbor pos_17 pos_18) (neighbor pos_18 pos_19)
    (neighbor pos_19 pos_20) (neighbor pos_20 pos_21) (neighbor pos_21 pos_22)
    (neighbor pos_22 pos_23) (neighbor pos_23 pos_24) (neighbor pos_24 pos_25)
    (neighbor pos_25 pos_26) (neighbor pos_26 pos_27) (neighbor pos_27 pos_28)
    (neighbor pos_28 pos_29) (neighbor pos_29 pos_30) (neighbor pos_30 pos_31)
    (neighbor pos_31 pos_32) (neighbor pos_32 pos_33) (neighbor pos_33 pos_34)
    (neighbor pos_34 pos_35) (neighbor pos_35 pos_36) (neighbor pos_36 pos_37)
    (neighbor pos_37 pos_38) (neighbor pos_38 pos_39) (neighbor pos_39 pos_40)
    (neighbor pos_40 pos_41) (neighbor pos_41 pos_42) (neighbor pos_42 pos_43)
    (neighbor pos_43 pos_44) (neighbor pos_44 pos_45) (neighbor pos_45 pos_46)
    (neighbor pos_46 pos_47) (neighbor pos_47 pos_48) (neighbor pos_48 pos_49)
    (neighbor pos_49 pos_50) (neighbor pos_50 pos_51) (neighbor pos_51 pos_52)
    (neighbor pos_52 pos_53) (neighbor pos_53 pos_54) (neighbor pos_54 pos_55)
    (neighbor pos_55 pos_56) (neighbor pos_56 pos_57) (neighbor pos_57 pos_58)
    (neighbor pos_58 pos_59) (neighbor pos_59 pos_60) (neighbor pos_60 pos_61)
    (neighbor pos_61 pos_62) (neighbor pos_62 pos_63) (neighbor pos_63 pos_64)
    (neighbor pos_64 pos_65) (neighbor pos_65 pos_66) (neighbor pos_66 pos_67)
    (neighbor pos_67 pos_68) (neighbor pos_68 pos_69) (neighbor pos_69 pos_70)
    (neighbor pos_70 pos_71) (neighbor pos_71 pos_72) (neighbor pos_72 pos_73)
    (neighbor pos_73 pos_74) (neighbor pos_74 pos_75) (neighbor pos_75 pos_76)
    (neighbor pos_76 pos_77) (neighbor pos_77 pos_78) (neighbor pos_78 pos_79)
    (neighbor pos_79 pos_80) (neighbor pos_80 pos_81) (neighbor pos_81 pos_82)
    (neighbor pos_82 pos_83) (neighbor pos_83 pos_84) (neighbor pos_84 pos_85)
    (neighbor pos_85 pos_86) (neighbor pos_86 pos_87) (neighbor pos_87 pos_88)
    (neighbor pos_88 pos_89) (neighbor pos_89 pos_90) (neighbor pos_90 pos_91)
    (neighbor pos_91 pos_92) (neighbor pos_92 pos_93)

    ;; goal cell marker
    (goal pos_1)

    ;; initial box and player locations
    (box_at pos_47)
    (player_at pos_93)

    ;; empties: all positions except pos_47 (box) and pos_93 (player)
    (empty pos_1) (empty pos_2) (empty pos_3) (empty pos_4) (empty pos_5)
    (empty pos_6) (empty pos_7) (empty pos_8) (empty pos_9) (empty pos_10)
    (empty pos_11) (empty pos_12) (empty pos_13) (empty pos_14) (empty pos_15)
    (empty pos_16) (empty pos_17) (empty pos_18) (empty pos_19) (empty pos_20)
    (empty pos_21) (empty pos_22) (empty pos_23) (empty pos_24) (empty pos_25)
    (empty pos_26) (empty pos_27) (empty pos_28) (empty pos_29) (empty pos_30)
    (empty pos_31) (empty pos_32) (empty pos_33) (empty pos_34) (empty pos_35)
    (empty pos_36) (empty pos_37) (empty pos_38) (empty pos_39) (empty pos_40)
    (empty pos_41) (empty pos_42) (empty pos_43) (empty pos_44) (empty pos_45)
    (empty pos_46)        (empty pos_48) (empty pos_49) (empty pos_50)
    (empty pos_51) (empty pos_52) (empty pos_53) (empty pos_54) (empty pos_55)
    (empty pos_56) (empty pos_57) (empty pos_58) (empty pos_59) (empty pos_60)
    (empty pos_61) (empty pos_62) (empty pos_63) (empty pos_64) (empty pos_65)
    (empty pos_66) (empty pos_67) (empty pos_68) (empty pos_69) (empty pos_70)
    (empty pos_71) (empty pos_72) (empty pos_73) (empty pos_74) (empty pos_75)
    (empty pos_76) (empty pos_77) (empty pos_78) (empty pos_79) (empty pos_80)
    (empty pos_81) (empty pos_82) (empty pos_83) (empty pos_84) (empty pos_85)
    (empty pos_86) (empty pos_87) (empty pos_88) (empty pos_89) (empty pos_90)
    (empty pos_91) (empty pos_92)
  )

  (:goal (and (box_at pos_1)))
)