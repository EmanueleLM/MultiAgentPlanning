(define (problem blocksworld-16)
    (:domain blocksworld)
    (:objects
        red - block
        blue - block
        orange - block
        yellow - block
    )
    (:init
        (handempty)
        (ontable red)
        (ontable blue)
        (ontable yellow)
        (on orange red)
        (clear blue)
        (clear orange)
        (clear yellow)
        (= (total-cost) 0)
    )
    (:goal (and
        (on blue orange)
        (on yellow blue)
    ))
    (:metric minimize (total-cost))
)