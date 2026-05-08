(define (problem sokoban-instance)
    (:domain sokoban)
    
    (:objects
        pos_1_2 pos_1_3 pos_2_3 pos_3_3 pos_27_3 pos_38_3 pos_48_3 pos_50_3 pos_51_3 pos_52_3 - pos
    )
    
    (:init
        (at_player pos_1_2)
        (at_box pos_51_3)

        ; Define adjacency along the vertical corridor
        (adjacent pos_1_2 pos_1_3)
        (adjacent pos_1_3 pos_2_3)
        (adjacent pos_2_3 pos_3_3)
        (adjacent pos_3_3 pos_27_3)
        (adjacent pos_27_3 pos_38_3)
        (adjacent pos_38_3 pos_48_3)
        (adjacent pos_48_3 pos_50_3)
        (adjacent pos_50_3 pos_51_3)
        (adjacent pos_51_3 pos_52_3)

        ; Ensure adjacencies are bidirectional
        (adjacent pos_1_3 pos_1_2)
        (adjacent pos_2_3 pos_1_3)
        (adjacent pos_3_3 pos_2_3)
        (adjacent pos_27_3 pos_3_3)
        (adjacent pos_38_3 pos_27_3)
        (adjacent pos_48_3 pos_38_3)
        (adjacent pos_50_3 pos_48_3)
        (adjacent pos_51_3 pos_50_3)
        (adjacent pos_52_3 pos_51_3)

        ; Specify clear positions initially
        (clear pos_1_3)
        (clear pos_2_3)
        (clear pos_3_3)
        (clear pos_27_3)
        (clear pos_38_3)
        (clear pos_48_3)
        (clear pos_50_3)
        (clear pos_52_3)
    )
    
    (:goal 
        (at_box pos_52_3)
    )
)