(define (problem sokoban-instance)
    (:domain sokoban)
    
    (:objects
        player - movable_entity
        box - movable_entity
        pos_1_1 pos_1_2 pos_1_3 pos_2_3 pos_3_3 pos_27_3 pos_38_3 pos_48_3 pos_50_3 pos_51_3 pos_52_3 - pos
    )
    
    (:init
        (at player pos_1_1)
        (at box pos_51_3)
        
        (adjacent pos_1_1 pos_1_2)
        (adjacent pos_1_2 pos_1_3)
        (adjacent pos_2_3 pos_1_3)
        (adjacent pos_2_3 pos_3_3)
        
        (adjacent pos_3_3 pos_27_3) ;; Assume a vertical corridor from pos_3_3 to pos_27_3
        (adjacent pos_27_3 pos_38_3) ;; Continuing the corridor
        (adjacent pos_38_3 pos_48_3)
        (adjacent pos_48_3 pos_50_3)
        (adjacent pos_50_3 pos_51_3)
        (adjacent pos_51_3 pos_52_3) ;; Goal area
        
        (clear pos_1_2)
        (clear pos_1_3)
        (clear pos_2_3)
        (clear pos_3_3)
        (clear pos_27_3)
        (clear pos_38_3)
        (clear pos_48_3)
        (clear pos_50_3)
        (clear pos_52_3)

        ;; Ensure adjacency is symmetric
        (adjacent pos_1_2 pos_1_1)
        (adjacent pos_1_3 pos_1_2)
        (adjacent pos_1_3 pos_2_3)
        (adjacent pos_3_3 pos_2_3)
        (adjacent pos_27_3 pos_3_3)
        (adjacent pos_38_3 pos_27_3)
        (adjacent pos_48_3 pos_38_3)
        (adjacent pos_50_3 pos_48_3)
        (adjacent pos_51_3 pos_50_3)
        (adjacent pos_52_3 pos_51_3)
    )
    
    (:goal 
        (and
            (at box pos_52_3)
        )
    )
)