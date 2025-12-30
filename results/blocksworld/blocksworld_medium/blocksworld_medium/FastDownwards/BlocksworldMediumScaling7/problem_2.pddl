(define (problem blocksworld-7)
    (:domain blocks-world)
    (:objects
        blue - block
        orange - block
        yellow - block
        red - block
    )
    (:init
        (on blue red)
        (ontable red)
        (ontable orange)
        (ontable yellow)
        (clear blue)
        (clear orange)
        (clear yellow)
        (hand-empty)
    )
    (:goal (and
        (on red blue)
        (on blue orange)
        (on yellow red)
    ))
)