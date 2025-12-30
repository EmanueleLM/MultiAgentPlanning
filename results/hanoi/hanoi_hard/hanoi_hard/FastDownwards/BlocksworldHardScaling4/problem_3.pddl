(define (problem blocksworld-hard-p01)
    (:domain blocksworld-hard)
    (:objects
        Y - block ; Yellow
        R - block ; Red
        B - block ; Blue
        O - block ; Orange
    )
    (:init
        (handempty)
        ; Initial Stacking State: Yellow (Y) on Blue (B) on Red (R) on Orange (O). O is on the table. Y is clear.
        (ontable O)
        (on R O)
        (on B R)
        (on Y B)
        (clear Y)
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal State: B on O, O on Y.
        (on B O)
        (on O Y)
        ; Note: We rely on the domain semantics that Y must be on the table 
        ; and B must be clear if they form the base/top of the final configuration.
    ))
    (:metric minimize (total-cost))
)