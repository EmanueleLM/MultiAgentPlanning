(define (problem blocksworld-arrangement)
    (:domain blocksworld)
    (:objects
        blue - block
        yellow - block
        red - block
        orange - block
    )
    (:init
        (clear blue)
        (clear yellow)
        (hand-empty)
        (on red orange)
        (on blue red)
        (on-table orange)
        (on-table yellow)
    )
    (:goal (and
        (on red orange)
        (on yellow blue)
    ))
)