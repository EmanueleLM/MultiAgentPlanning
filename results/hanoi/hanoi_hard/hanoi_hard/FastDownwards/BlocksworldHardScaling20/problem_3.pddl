(define (problem blocksworld-hard-scaling-20)
    (:domain blocksworld)
    (:objects 
        B R Y O - block
    )
    (:init 
        ; Initial State: (on B R), (on R Y), (on Y O), (on-table O), (clear B), (hand-empty).
        (on B R)
        (on R Y)
        (on Y O)
        (on-table O)
        
        (clear B)
        (hand-empty)

        (= (total-cost) 0)
    )
    (:goal (and 
        (on R Y) 
        (on O B)
    ))
    (:metric minimize (total-cost))
)