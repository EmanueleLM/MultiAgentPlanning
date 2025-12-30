(define (problem BlocksworldHardScaling21-p)
    (:domain blocksworld)
    (:objects
        R - block
        B - block
        O - block
        Y - block
    )
    (:init
        ; Initial State: R/B/O/Y stack
        (on R B)
        (on B O)
        (on O Y)
        (ontable Y)
        (clear R)
        (handempty)
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal State: B/O/Y/R stack (R on table)
        (on B O)
        (on O Y)
        (on Y R)
        (ontable R)
    ))
    (:metric minimize (total-cost))
)