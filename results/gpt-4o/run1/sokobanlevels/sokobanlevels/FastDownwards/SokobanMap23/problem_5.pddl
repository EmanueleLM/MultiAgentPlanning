(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - agent
    main_box - box
    pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 pos_10
    pos_11 pos_12 pos_13 pos_14 pos_15 pos_16 pos_17 pos_18 pos_19 pos_20
    pos_21 pos_22 pos_23 pos_24 pos_25 pos_26 pos_27 pos_28 pos_29 pos_30
    pos_31 pos_32 pos_33 pos_34 pos_35 pos_36 pos_37 pos_38 pos_39 pos_40
    pos_41 pos_42 pos_43 pos_44 pos_45 pos_46 pos_47 pos_48 pos_49 pos_50
    pos_51 pos_52 pos_53 pos_54 pos_55 pos_56 pos_57 pos_58 pos_59 pos_60
    pos_61 pos_62 pos_63 pos_64 pos_65 pos_66 pos_67 pos_68 pos_69 pos_70
    pos_71 pos_72 pos_73 pos_74 pos_75 pos_76 pos_77 pos_78 pos_79 pos_80
    pos_81 pos_82 pos_83 pos_84 pos_85 pos_86 pos_87 pos_88 pos_89 pos_90
    pos_91 pos_92 pos_93 pos_94 pos_95 pos_96 pos_97 pos_98 pos_99
    - position)
  (:init
    (at player pos_2)
    (box_at main_box pos_52)
    (goal_at pos_98)
    (free pos_3) (free pos_4) (free pos_5)  ;; Mark all free positions correctly as per grid layout
    (free pos_6) (free pos_7)... (free pos_93)
    (free pos_94) (free pos_96) (free pos_97)
    (adjacent pos_1 pos_2) (adjacent pos_2 pos_1)
    (adjacent pos_2 pos_3) (adjacent pos_3 pos_2)
    ; Define all adjacency pairs reflecting the adjacency on a typical Sokoban grid
    ; Ensure these reflect actual possible moves
    (adjacent pos_51 pos_52) (adjacent pos_52 pos_53)
    (adjacent pos_53 pos_54) (adjacent pos_54 pos_55)
    (adjacent pos_95 pos_96) (adjacent pos_96 pos_97)
    (adjacent pos_97 pos_98) (adjacent pos_98 pos_99)
  )
  (:goal
    (box_at main_box pos_98))
)