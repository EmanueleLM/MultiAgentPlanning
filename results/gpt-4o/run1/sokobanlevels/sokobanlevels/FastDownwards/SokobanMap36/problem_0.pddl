(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    location_1_1 location_1_2 location_1_3 location_1_4 location_1_5 location_1_6
    location_1_7 location_1_8 location_1_9 location_1_10 location_1_11 location_1_12
    location_1_13 location_1_14 location_1_15 location_1_16 location_1_17 location_1_18 
    location_1_19 location_1_20 location_1_21 location_1_22 location_1_23 location_1_24
    location_1_25 location_1_26 location_1_27 location_1_28 location_1_29 location_1_30
    location_1_31 location_1_32 location_1_33 location_1_34 location_1_35 location_1_36
    location_1_37 location_1_38 location_1_39 location_1_40 location_1_41 location_1_42
    location_1_43 location_1_44 location_1_45 location_1_46 location_1_47 location_1_48
    location_1_49 location_1_50 location_1_51 location_1_52 location_1_53 location_1_54
    location_1_55 location_1_56 location_1_57 location_1_58 location_1_59 location_1_60
    location_1_61 location_1_62 location_1_63 location_1_64 location_1_65 location_1_66
    location_1_67 location_1_68 location_1_69 location_1_70 location_1_71 location_1_72
    location_1_73 location_1_74 location_1_75 location_1_76 location_1_77 location_1_78
    location_1_79 location_1_80 location_1_81 location_1_82 location_1_83 location_1_84
    location_1_85 location_1_86 location_1_87 location_1_88 location_1_89 location_1_90
    location_1_91 location_1_92 location_1_93 location_1_94 - cell
    player1 - entity
    box1 - entity
  )
  
  (:init
    (at player1 location_1_94)
    (at box1 location_1_47)
    (goal location_1_2)
    
    ; Define which cells are initially empty (excluding walls)
    (forall (?cell - cell) 
        (or (at player1 ?cell) (at box1 ?cell) (cell_empty ?cell)))
    
    ; Define adjacencies based on the problem map
    (adjacent location_1_1 location_1_2) (adjacent location_1_2 location_1_1)
    (adjacent location_1_2 location_1_3) (adjacent location_1_3 location_1_2)
    ; Add remaining adjacency definitions here for the entire map
    ; Make sure to respect wall boundaries in these definitions
  )
  
  (:goal
    (at box1 location_1_2)
  )
)