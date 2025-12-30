(define (problem blocksworld-hard-scaling4-problem)
    (:domain blocksworld-hard-scaling4)
    (:objects
        Y - block ; Yellow
        R - block ; Red
        B - block ; Blue
        O - block ; Orange
    )
    (:init
        (handempty)
        (= (total-cost) 0)

        ; Initial Stacking State: Yellow (Y) on Blue (B), Blue (B) on Red (R), Red (R) on Orange (O), Orange (O) on Table. Yellow is clear.
        (ontable O)
        (on R O)
        (on B R)
        (on Y B)
        (clear Y)
    )
    (:goal (and
        ; Goal State: Blue block is on top of Orange block
        (on B O)
        ; Orange block is on top of Yellow block.
        (on O Y)
    ))
    (:metric minimize (total-cost))
)