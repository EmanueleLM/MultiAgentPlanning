(define (problem blocksworld-instance)
    (:domain blocksworld)
    (:objects
        R B O Y - block
    )
    (:init
        (= (total-cost) 0)
        
        ; Initial conditions specified:
        (clear R)
        (clear B)
        (hand-empty)
        
        (on R O)
        (on B Y)
        
        (ontable O)
        (ontable Y)
        
        ; O and Y are implicitly (not clear) since blocks are on them
    )
    (:goal (and
        ; Goal: R on O, B on R
        (on R O)
        (on B R)
    ))
    (:metric minimize (total-cost))
)