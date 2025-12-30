(define (problem bw_hard_24)
    (:domain blocksworld)
    (:objects 
        orange blue yellow red - block
    )
    (:init
        ; Initial stack: Table -> R -> Y -> B -> O
        (ontable red)
        (on yellow red)
        (on blue yellow)
        (on orange blue)
        
        (clear orange)
        (hand_empty)
        (= (total-cost) 0)
    )
    (:goal (and
        ; Target stack: Y -> R -> O -> B
        (on red yellow)
        (on orange red)
        (on blue orange)
    ))
    (:metric minimize (total-cost))
)