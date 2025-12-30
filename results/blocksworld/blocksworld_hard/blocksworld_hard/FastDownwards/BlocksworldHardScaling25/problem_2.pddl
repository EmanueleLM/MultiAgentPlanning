(define (problem BW-HardScaling25-0)
    (:domain blocksworld-hard-scaling)
    (:objects
        R B Y O - block
    )
    (:init
        (= (total-cost) 0)
        (handempty)

        ;; Initial Stack: O on Y, Y on B, B on R. R on table.
        (on O Y)
        (on Y B)
        (on B R)

        (ontable R)

        ;; Clearance: Only O is clear.
        (clear O)
    )
    (:goal (and
        (on B Y)
        (on Y O)
        (on O R)
    ))
    (:metric minimize (total-cost))
)