(define (problem blocksworld-medium-0)
    (:domain blocksworld)
    (:objects
        R B Y O - block
    )
    (:init
        (ontable O)
        (ontable Y)
        (on R Y)
        (on B O)
        (clear R)
        (clear B)
        (handempty)
        (= (total-cost) 0)
    )
    (:goal (and
        (on B Y)
        (on Y R)
    ))
    (:metric minimize (total-cost))
)