(define (problem blocksworld-easy-scaling-5)
    (:domain blocksworld-scaling)
    (:objects
        blue orange yellow red - block
    )
    
    (:init
        ; Specified initial state:
        (clear blue)
        (clear orange)
        (hand-empty)
        (on blue yellow)
        (on orange red)
        (on-table red)
        (on-table yellow)
        
        ; Initialize cost function
        (= (total-cost) 0)
    )
    
    (:goal 
        (on blue orange)
    )
    
    (:metric minimize (total-cost))
)