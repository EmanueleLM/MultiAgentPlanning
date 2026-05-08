(define (problem sokoban-problem)
    (:domain sokoban)
    (:objects
        pos_0_0 pos_1_0 pos_2_0 pos_0_1 pos_1_1 pos_2_1 pos_0_2 pos_1_2 pos_2_2
        pos_0_3 pos_1_3 pos_2_3 pos_0_4 pos_1_4 pos_2_4 pos_0_5 pos_1_5 pos_2_5
        pos_0_6 pos_1_6 pos_2_6 pos_0_7 pos_1_7 pos_2_7 pos_0_8 pos_1_8 pos_2_8
        pos_0_9 pos_1_9 pos_2_9 pos_0_10 pos_1_10 pos_2_10 pos_0_11 pos_1_11 pos_2_11
        pos_0_12 pos_1_12 pos_2_12 pos_0_13 pos_1_13 pos_2_13 pos_0_14 pos_1_14 pos_2_14
        pos_0_15 pos_1_15 pos_2_15 pos_0_16 pos_1_16 pos_2_16 pos_0_17 pos_1_17 pos_2_17
        pos_0_18 pos_1_18 pos_2_18 pos_0_19 pos_1_19 pos_2_19 pos_0_20 pos_1_20 pos_2_20
        pos_0_21 pos_1_21 pos_2_21 pos_0_22 pos_1_22 pos_2_22 pos_0_23 pos_1_23 pos_2_23
        pos_0_24 pos_1_24 pos_2_24 pos_0_25 pos_1_25 pos_2_25 pos_0_26 pos_1_26 pos_2_26
        pos_0_27 pos_1_27 pos_2_27 pos_0_28 pos_1_28 pos_2_28 pos_0_29 pos_1_29 pos_2_29
        pos_0_30 pos_1_30 pos_2_30 pos_0_31 pos_1_31 pos_2_31 pos_0_32 pos_1_32 pos_2_32
        pos_0_33 pos_1_33 pos_2_33 pos_0_34 pos_1_34 pos_2_34 pos_0_35 pos_1_35 pos_2_35
        pos_0_36 pos_1_36 pos_2_36 pos_0_37 pos_1_37 pos_2_37 pos_0_38 pos_1_38 pos_2_38
        pos_0_39 pos_1_39 pos_2_39 pos_0_40 pos_1_40 pos_2_40 pos_0_41 pos_1_41 pos_2_41
        pos_0_42 pos_1_42 pos_2_42 pos_0_43 pos_1_43 pos_2_43 pos_0_44 pos_1_44 pos_2_44
        pos_0_45 pos_1_45 pos_2_45 pos_0_46 pos_1_46 pos_2_46 pos_0_47 pos_1_47 pos_2_47
        pos_0_48 pos_1_48 pos_2_48 pos_0_49 pos_1_49 pos_2_49 pos_0_50 pos_1_50 pos_2_50
        pos_0_51 pos_1_51 pos_2_51 pos_0_52 pos_1_52 pos_2_52 pos_0_53 pos_1_53 pos_2_53
        pos_0_54 pos_1_54 pos_2_54 pos_0_55 pos_1_55 pos_2_55 pos_0_56 pos_1_56 pos_2_56
        pos_0_57 pos_1_57 pos_2_57 pos_0_58 pos_1_58 pos_2_58 pos_0_59 pos_1_59 pos_2_59
        pos_0_60 pos_1_60 pos_2_60 pos_0_61 pos_1_61 pos_2_61 pos_0_62 pos_1_62 pos_2_62
        pos_0_63 pos_1_63 pos_2_63 pos_0_64 pos_1_64 pos_2_64 pos_0_65 pos_1_65 pos_2_65
        pos_0_66 pos_1_66 pos_2_66 pos_0_67 pos_1_67 pos_2_67 pos_0_68 pos_1_68 pos_2_68
        pos_0_69 pos_1_69 pos_2_69 pos_0_70 pos_1_70 pos_2_70 pos_0_71 pos_1_71 pos_2_71
        pos_0_72 pos_1_72 pos_2_72 pos_0_73 pos_1_73 pos_2_73 pos_0_74 pos_1_74 pos_2_74
        pos_0_75 pos_1_75 pos_2_75 pos_0_76 pos_1_76 pos_2_76 pos_0_77 pos_1_77 pos_2_77
        pos_0_78 pos_1_78 pos_2_78 pos_0_79 pos_1_79 pos_2_79 pos_0_80 pos_1_80 pos_2_80
        pos_0_81 pos_1_81 pos_2_81 pos_0_82 pos_1_82 pos_2_82 pos_0_83 pos_1_83 pos_2_83
        pos_0_84 pos_1_84 pos_2_84 pos_0_85 pos_1_85 pos_2_85 pos_0_86 pos_1_86 pos_2_86
        pos_0_87 pos_1_87 pos_2_87
    )
    
    (:init
        (player_at pos_1_1)
        (box_at pos_1_86)
        (goal_at pos_1_85)

        ;; Wall schema
        (wall_at pos_0_0) (wall_at pos_1_0) (wall_at pos_2_0)
        (wall_at pos_0_1) (wall_at pos_2_1)
        (wall_at pos_0_86) (wall_at pos_2_86)
        (wall_at pos_0_87) (wall_at pos_1_87) (wall_at pos_2_87)

        ;; Complete adjacency
        (adjacent pos_1_1 pos_1_2) (adjacent pos_1_2 pos_1_1)
        (adjacent pos_1_2 pos_1_3) (adjacent pos_1_3 pos_1_2)
        (adjacent pos_1_3 pos_1_4) (adjacent pos_1_4 pos_1_3)
        (adjacent pos_1_4 pos_1_5) (adjacent pos_1_5 pos_1_4)
        (adjacent pos_1_5 pos_1_6) (adjacent pos_1_6 pos_1_5)
        (adjacent pos_1_6 pos_1_7) (adjacent pos_1_7 pos_1_6)
        (adjacent pos_1_7 pos_1_8) (adjacent pos_1_8 pos_1_7)
        ;; Add other adjacency relations properly
        (adjacent pos_1_84 pos_1_85) (adjacent pos_1_85 pos_1_84)
        (adjacent pos_1_85 pos_1_86) (adjacent pos_1_86 pos_1_85)
    )
    
    (:goal (and (box_at pos_1_85)))
)