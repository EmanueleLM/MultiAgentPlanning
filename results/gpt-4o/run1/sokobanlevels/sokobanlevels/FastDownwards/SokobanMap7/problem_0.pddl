(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player_1 - agent
    box_1 - box
    goal_1 - goal
    pos_0_1 pos_1_1 pos_2_1 pos_2_2 pos_2_3 pos_2_4 pos_2_5 pos_2_6 pos_2_7 pos_2_8 pos_2_9 pos_2_10 pos_2_11 pos_2_12 pos_2_13 pos_2_14 pos_2_15 pos_2_16 pos_2_17 pos_2_18 pos_2_19 pos_2_20 pos_2_21 pos_2_22 pos_2_23 pos_2_24 pos_2_25 pos_2_26 pos_2_27 pos_2_28 pos_2_29 pos_2_30 pos_2_31 pos_2_32 pos_2_33 pos_2_34 pos_2_35 pos_2_36 pos_2_37 pos_2_38 pos_2_39 pos_2_40 pos_2_41 pos_2_42 pos_2_43 pos_2_44 pos_2_45 pos_2_46 pos_2_47 pos_2_48 pos_2_49 pos_2_50 pos_2_51 pos_2_52 pos_2_53 pos_2_54 pos_2_55 pos_2_56 pos_2_57 pos_2_58 pos_2_59 pos_2_60 pos_2_61 pos_2_62 pos_2_63 pos_2_64 pos_2_65 pos_2_66 pos_2_67 pos_2_68 pos_2_69 pos_2_70 pos_2_71 pos_2_72 pos_2_73 pos_2_74 pos_2_75 pos_2_76 pos_1_76 pos_0_76 - position
    pos_1_0 pos_1_2 pos_1_3 pos_1_75 - wall
  )
  (:init
    (at player_1 pos_1_1)
    (at box_1 pos_72_1)
    (goal_pos goal_1 pos_75_1)
    
    (adjacent pos_0_1 pos_1_1) (adjacent pos_1_1 pos_0_1)
    (adjacent pos_1_1 pos_2_1) (adjacent pos_2_1 pos_1_1)
    (adjacent pos_2_1 pos_2_2) (adjacent pos_2_2 pos_2_1)
    ;; ... adjacency list continued for each adjacent pair of positions
    
    ;; Clear positions except for walls
    (clear pos_1_1) (clear pos_2_1) (clear pos_2_2)
    ;; ... clear list continued for each clear position
  )
  (:goal
    (at box_1 pos_75_1)
  )
)