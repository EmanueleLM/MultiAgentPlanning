(define (problem blocksworld-hard-scaling-20)
    (:domain blocksworld)
    (:objects 
        B - block ; Blue
        R - block ; Red
        Y - block ; Yellow
        O - block ; Orange
    )
    (:init 
        ; Initial stack configuration: B/R/Y/O/Table
        (on B R)
        (on R Y)
        (on Y O)
        (on-table O)
        
        ; Clear and hand status
        (clear B)
        (hand-empty)
        
        ; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and 
        (on R Y)
        (on O B)
    ))
    (:metric minimize (total-cost))
)