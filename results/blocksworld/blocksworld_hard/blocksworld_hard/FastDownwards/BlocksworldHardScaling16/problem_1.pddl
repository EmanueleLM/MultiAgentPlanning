(define (problem blocksworld-hard-scaling-16)
    (:domain blocksworld)
    (:objects
        blue - block
        red - block
        orange - block
        yellow - block
    )
    (:init
        ; Stack configuration: B on Y on R on O (on Table)
        (ontable orange)
        (on red orange)
        (on yellow red)
        (on blue yellow)
        (clear blue)
        (handempty)
        (= (total-cost) 0)
    )
    (:goal (and
        (on blue yellow)
        (on orange red)
    ))
    (:metric minimize (total-cost))
)