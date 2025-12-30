(define (problem blocksworld-hard-scaling18-p)
    (:domain blocksworld-hard)
    (:objects 
        orange - block
        yellow - block
        red - block
        blue - block
    )
    (:init
        (clear orange)
        (clear yellow)
        (hand-empty)
        (on red blue)
        (on orange red)
        (on-table blue)
        (on-table yellow)
    )
    (:goal (and
        (on red orange)
        (on orange yellow)
        (on yellow blue)
    ))
)