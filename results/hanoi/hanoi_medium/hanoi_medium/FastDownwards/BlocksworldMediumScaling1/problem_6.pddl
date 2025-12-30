(define (problem BlocksworldMediumScaling1-Problem)
    (:domain blocksworld-medium-1)
    (:objects
        orange yellow blue red - block
    )
    (:init
        (= (total-cost) 0)
        
        (clear orange)
        (clear yellow)
        (hand_empty)
        
        (on orange blue)
        (on yellow red)
        
        (on_table red)
        (on_table blue)
    )
    (:goal
        (on red blue)
    )
    (:metric minimize (total-cost))
)