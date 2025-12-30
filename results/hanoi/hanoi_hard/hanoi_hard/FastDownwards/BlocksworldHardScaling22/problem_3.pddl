(define (problem BlocksworldHardScaling22)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        blue - block
        yellow - block
    )
    (:init
        (hand-empty)
        (clear orange)

        (on red blue)
        (on orange yellow)
        (on yellow red)

        (on-table blue)
    )
    (:goal (and
        (on red orange)
        (on orange yellow)
        (on yellow blue)
    ))
)