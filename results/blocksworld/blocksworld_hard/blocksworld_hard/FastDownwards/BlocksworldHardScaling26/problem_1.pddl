(define (problem BlocksworldHardScaling26_problem)
    (:domain blocksworld)
    (:objects
        R B Y O - block
    )
    (:init
        (= (total-cost) 0)
        ;; Initial Stack: R/B/Y/O (R on B, B on Y, Y on O, O on table)
        (ontable O)
        (on Y O)
        (on B Y)
        (on R B)
        (clear R)
        (handempty)
    )
    (:goal
        (and
            ;; Goal Stack: Y/O/R/B (Y on O, O on R, R on B, B on table)
            (on R B)
            (on O R)
            (on Y O)
            (ontable B)
        )
    )
    (:metric minimize (total-cost))
)