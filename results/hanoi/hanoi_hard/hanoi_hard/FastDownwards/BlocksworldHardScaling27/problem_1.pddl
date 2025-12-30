(define (problem BlocksworldHardScaling27_Problem)
    (:domain Blocksworld)
    (:objects
        B R O Y - block
    )
    (:init
        ; Initial State: Blue / Red / Orange / Yellow (Top to Bottom)
        (on B R)
        (on R O)
        (on O Y)
        (ontable Y)
        (clear B)
        (handempty)
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal State: On(R, O), On(B, Y), On(Y, R) => B/Y/R/O stack
        (on R O)
        (on Y R)
        (on B Y)
    ))
    (:metric minimize (total-cost))
)