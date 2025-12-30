(define (problem blocksworld-4-1)
    (:domain blocksworld)
    (:objects
        blue - block
        yellow - block
        orange - block
        red - block
    )
    (:init
        (clear blue)
        (clear yellow)
        (hand-empty)

        (on blue orange)
        (on orange red)
        
        (on-table red)
        (on-table yellow)
    )
    (:goal (and
        (on blue yellow)
        (on orange red)
    ))
)