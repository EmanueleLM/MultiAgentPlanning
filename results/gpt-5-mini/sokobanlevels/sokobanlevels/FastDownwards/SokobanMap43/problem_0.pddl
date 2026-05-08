(define (problem sokoban_instance)
  (:domain sokoban_1d)
  (:objects
    agent_player - agent
    box_1 - box
    cell_1 cell_2 cell_3 cell_4 cell_5 cell_6 cell_7 cell_8 cell_9 cell_10
    cell_11 cell_12 cell_13 cell_14 cell_15 cell_16 cell_17 cell_18 cell_19 cell_20
    cell_21 cell_22 cell_23 cell_24 cell_25 cell_26 cell_27 cell_28 cell_29 cell_30
    cell_31 cell_32 cell_33 cell_34 cell_35 cell_36 cell_37 cell_38 cell_39 cell_40
    cell_41 cell_42 cell_43 cell_44 cell_45 cell_46 cell_47 cell_48 cell_49 cell_50
    cell_51 cell_52 cell_53 cell_54 cell_55 cell_56 cell_57 cell_58 cell_59 cell_60
    cell_61 cell_62 cell_63 cell_64 cell_65 cell_66 cell_67 cell_68 cell_69 cell_70
    cell_71 cell_72 cell_73 cell_74 cell_75 cell_76 cell_77 cell_78 cell_79 cell_80
    cell_81 cell_82 cell_83 cell_84 cell_85 cell_86 cell_87 cell_88 cell_89 cell_90
    cell_91 cell_92 cell_93 cell_94 cell_95 cell_96 cell_97 cell_98 cell_99 cell_100 - cell
  )

  (:init
    ;; walls
    (wall cell_1)
    (wall cell_100)

    ;; floors (interior cells)
    (floor cell_2) (floor cell_3) (floor cell_4) (floor cell_5) (floor cell_6) (floor cell_7) (floor cell_8) (floor cell_9) (floor cell_10)
    (floor cell_11) (floor cell_12) (floor cell_13) (floor cell_14) (floor cell_15) (floor cell_16) (floor cell_17) (floor cell_18) (floor cell_19) (floor cell_20)
    (floor cell_21) (floor cell_22) (floor cell_23) (floor cell_24) (floor cell_25) (floor cell_26) (floor cell_27) (floor cell_28) (floor cell_29) (floor cell_30)
    (floor cell_31) (floor cell_32) (floor cell_33) (floor cell_34) (floor cell_35) (floor cell_36) (floor cell_37) (floor cell_38) (floor cell_39) (floor cell_40)
    (floor cell_41) (floor cell_42) (floor cell_43) (floor cell_44) (floor cell_45) (floor cell_46) (floor cell_47) (floor cell_48) (floor cell_49) (floor cell_50)
    (floor cell_51) (floor cell_52) (floor cell_53) (floor cell_54) (floor cell_55) (floor cell_56) (floor cell_57) (floor cell_58) (floor cell_59) (floor cell_60)
    (floor cell_61) (floor cell_62) (floor cell_63) (floor cell_64) (floor cell_65) (floor cell_66) (floor cell_67) (floor cell_68) (floor cell_69) (floor cell_70)
    (floor cell_71) (floor cell_72) (floor cell_73) (floor cell_74) (floor cell_75) (floor cell_76) (floor cell_77) (floor cell_78) (floor cell_79) (floor cell_80)
    (floor cell_81) (floor cell_82) (floor cell_83) (floor cell_84) (floor cell_85) (floor cell_86) (floor cell_87) (floor cell_88) (floor cell_89) (floor cell_90)
    (floor cell_91) (floor cell_92) (floor cell_93) (floor cell_94) (floor cell_95) (floor cell_96) (floor cell_97) (floor cell_98) (floor cell_99)

    ;; adjacency chain
    (adjacent_right cell_1 cell_2) (adjacent_right cell_2 cell_3) (adjacent_right cell_3 cell_4) (adjacent_right cell_4 cell_5)
    (adjacent_right cell_5 cell_6) (adjacent_right cell_6 cell_7) (adjacent_right cell_7 cell_8) (adjacent_right cell_8 cell_9)
    (adjacent_right cell_9 cell_10) (adjacent_right cell_10 cell_11) (adjacent_right cell_11 cell_12) (adjacent_right cell_12 cell_13)
    (adjacent_right cell_13 cell_14) (adjacent_right cell_14 cell_15) (adjacent_right cell_15 cell_16) (adjacent_right cell_16 cell_17)
    (adjacent_right cell_17 cell_18) (adjacent_right cell_18 cell_19) (adjacent_right cell_19 cell_20) (adjacent_right cell_20 cell_21)
    (adjacent_right cell_21 cell_22) (adjacent_right cell_22 cell_23) (adjacent_right cell_23 cell_24) (adjacent_right cell_24 cell_25)
    (adjacent_right cell_25 cell_26) (adjacent_right cell_26 cell_27) (adjacent_right cell_27 cell_28) (adjacent_right cell_28 cell_29)
    (adjacent_right cell_29 cell_30) (adjacent_right cell_30 cell_31) (adjacent_right cell_31 cell_32) (adjacent_right cell_32 cell_33)
    (adjacent_right cell_33 cell_34) (adjacent_right cell_34 cell_35) (adjacent_right cell_35 cell_36) (adjacent_right cell_36 cell_37)
    (adjacent_right cell_37 cell_38) (adjacent_right cell_38 cell_39) (adjacent_right cell_39 cell_40) (adjacent_right cell_40 cell_41)
    (adjacent_right cell_41 cell_42) (adjacent_right cell_42 cell_43) (adjacent_right cell_43 cell_44) (adjacent_right cell_44 cell_45)
    (adjacent_right cell_45 cell_46) (adjacent_right cell_46 cell_47) (adjacent_right cell_47 cell_48) (adjacent_right cell_48 cell_49)
    (adjacent_right cell_49 cell_50) (adjacent_right cell_50 cell_51) (adjacent_right cell_51 cell_52) (adjacent_right cell_52 cell_53)
    (adjacent_right cell_53 cell_54) (adjacent_right cell_54 cell_55) (adjacent_right cell_55 cell_56) (adjacent_right cell_56 cell_57)
    (adjacent_right cell_57 cell_58) (adjacent_right cell_58 cell_59) (adjacent_right cell_59 cell_60) (adjacent_right cell_60 cell_61)
    (adjacent_right cell_61 cell_62) (adjacent_right cell_62 cell_63) (adjacent_right cell_63 cell_64) (adjacent_right cell_64 cell_65)
    (adjacent_right cell_65 cell_66) (adjacent_right cell_66 cell_67) (adjacent_right cell_67 cell_68) (adjacent_right cell_68 cell_69)
    (adjacent_right cell_69 cell_70) (adjacent_right cell_70 cell_71) (adjacent_right cell_71 cell_72) (adjacent_right cell_72 cell_73)
    (adjacent_right cell_73 cell_74) (adjacent_right cell_74 cell_75) (adjacent_right cell_75 cell_76) (adjacent_right cell_76 cell_77)
    (adjacent_right cell_77 cell_78) (adjacent_right cell_78 cell_79) (adjacent_right cell_79 cell_80) (adjacent_right cell_80 cell_81)
    (adjacent_right cell_81 cell_82) (adjacent_right cell_82 cell_83) (adjacent_right cell_83 cell_84) (adjacent_right cell_84 cell_85)
    (adjacent_right cell_85 cell_86) (adjacent_right cell_86 cell_87) (adjacent_right cell_87 cell_88) (adjacent_right cell_88 cell_89)
    (adjacent_right cell_89 cell_90) (adjacent_right cell_90 cell_91) (adjacent_right cell_91 cell_92) (adjacent_right cell_92 cell_93)
    (adjacent_right cell_93 cell_94) (adjacent_right cell_94 cell_95) (adjacent_right cell_95 cell_96) (adjacent_right cell_96 cell_97)
    (adjacent_right cell_97 cell_98) (adjacent_right cell_98 cell_99) (adjacent_right cell_99 cell_100)

    ;; initial agent and box locations
    (player_at agent_player cell_2)
    (box_at box_1 cell_52)

    ;; empty cells: every floor cell except the player and the box locations
    (empty cell_3) (empty cell_4) (empty cell_5) (empty cell_6) (empty cell_7) (empty cell_8) (empty cell_9) (empty cell_10)
    (empty cell_11) (empty cell_12) (empty cell_13) (empty cell_14) (empty cell_15) (empty cell_16) (empty cell_17) (empty cell_18) (empty cell_19) (empty cell_20)
    (empty cell_21) (empty cell_22) (empty cell_23) (empty cell_24) (empty cell_25) (empty cell_26) (empty cell_27) (empty cell_28) (empty cell_29) (empty cell_30)
    (empty cell_31) (empty cell_32) (empty cell_33) (empty cell_34) (empty cell_35) (empty cell_36) (empty cell_37) (empty cell_38) (empty cell_39) (empty cell_40)
    (empty cell_41) (empty cell_42) (empty cell_43) (empty cell_44) (empty cell_45) (empty cell_46) (empty cell_47) (empty cell_48) (empty cell_49) (empty cell_50)
    (empty cell_51) (empty cell_53) (empty cell_54) (empty cell_55) (empty cell_56) (empty cell_57) (empty cell_58) (empty cell_59) (empty cell_60)
    (empty cell_61) (empty cell_62) (empty cell_63) (empty cell_64) (empty cell_65) (empty cell_66) (empty cell_67) (empty cell_68) (empty cell_69) (empty cell_70)
    (empty cell_71) (empty cell_72) (empty cell_73) (empty cell_74) (empty cell_75) (empty cell_76) (empty cell_77) (empty cell_78) (empty cell_79) (empty cell_80)
    (empty cell_81) (empty cell_82) (empty cell_83) (empty cell_84) (empty cell_85) (empty cell_86) (empty cell_87) (empty cell_88) (empty cell_89) (empty cell_90)
    (empty cell_91) (empty cell_92) (empty cell_93) (empty cell_94) (empty cell_95) (empty cell_96) (empty cell_97) (empty cell_98) (empty cell_99)
  )

  (:goal (and (box_at box_1 cell_90)))
)