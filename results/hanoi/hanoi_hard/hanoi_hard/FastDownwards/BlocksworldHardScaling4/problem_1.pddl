(define (problem blocksworld-4-p01)
    (:domain blocksworld-4-hard)
    (:objects
        Y - block
        R - block
        B - block
        O - block
    )
    (:init
        ; Initial stack: Y on B on R on O on Table
        (ontable O)
        (on R O)
        (on B R)
        (on Y B)
        (clear Y) ; Y is top
        (handempty)
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal stack: B on O on Y on Table (implicitly)
        (on B O)
        (on O Y)
    ))
    (:metric minimize (total-cost))
)