(define (problem sokoban-map0)
    (:domain sokoban)
    (:objects
        player_1 - player
        box_1 - box
        ;; Define all positions needed for this task
        pos_0 pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9
        pos_10 pos_11 pos_12 pos_13 pos_14 pos_15 pos_16 pos_17 pos_18 pos_19
        pos_20 pos_21 pos_22 pos_23 pos_24 pos_25 pos_26 pos_27 pos_28 pos_29
        pos_30 pos_31 pos_32 pos_33 pos_34 pos_35 pos_36 pos_37 pos_38 pos_39
        pos_40 pos_41 pos_42 pos_43 pos_44 pos_45 pos_46 pos_47 pos_48 pos_49
        pos_50 pos_51 pos_52 pos_53 pos_54 pos_55 pos_56 pos_57 pos_58 pos_59
        pos_60 pos_61 pos_62 pos_63 pos_64 pos_65 pos_66 pos_67 pos_68 pos_69
        pos_70 pos_71 pos_72 pos_73 pos_74 pos_75 pos_76 pos_77 pos_78 pos_79
        pos_80 pos_81 pos_82 pos_83 pos_84 pos_85 pos_86 pos_87 pos_88 pos_89
        pos_90 pos_91 pos_92 pos_93 pos_94 pos_95 - position
    )
    (:init
        ;; Initial positions
        (at player_1 pos_90)
        (at box_1 pos_87)
        
        ;; Goal position
        (is_goal pos_2)
        
        ;; Walls
        (is_wall pos_0) (is_wall pos_1) (is_wall pos_3) (is_wall pos_4)
        (is_wall pos_5) (is_wall pos_6) (is_wall pos_7) (is_wall pos_8)
        (is_wall pos_9) (is_wall pos_89) (is_wall pos_91) (is_wall pos_92)
        (is_wall pos_93) (is_wall pos_94) (is_wall pos_95)

        ;; Adjacency definitions
        (adjacent pos_0 pos_9) (adjacent pos_9 pos_0)
        (adjacent pos_9 pos_18) (adjacent pos_18 pos_9)
        (adjacent pos_18 pos_27) (adjacent pos_27 pos_18)
        (adjacent pos_27 pos_36) (adjacent pos_36 pos_27)
        (adjacent pos_36 pos_45) (adjacent pos_45 pos_36)
        (adjacent pos_45 pos_54) (adjacent pos_54 pos_45)
        (adjacent pos_54 pos_63) (adjacent pos_63 pos_54)
        (adjacent pos_63 pos_72) (adjacent pos_72 pos_63)
        (adjacent pos_72 pos_81) (adjacent pos_81 pos_72)
        (adjacent pos_81 pos_90) (adjacent pos_90 pos_81)
        (adjacent pos_1 pos_2) (adjacent pos_2 pos_1)
        (adjacent pos_88 pos_87) (adjacent pos_87 pos_88)
    )
    (:goal
        (at box_1 pos_2)
    )
)