(define (problem blocksworld-18)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        red - block
        yellow - block
    )
    (:init
        (clear blue)
        (clear orange)
        (hand-empty)
        (on blue yellow)
        (on orange red)
        (on-table red)
        (on-table yellow)
    )
    (:goal (and
        (on blue red)
        (on orange yellow)
        (on yellow blue)
    ))
)