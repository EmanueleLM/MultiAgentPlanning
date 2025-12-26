(define (problem blocksworld-easy-scaling-13)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        blue - block
        red - block
    )
    (:init
        ; Stack configuration: Table -> Red -> Blue -> Yellow
        (on blue red)
        (on yellow blue)
        (on-table red)
        (on-table orange)

        ; Clear blocks
        (clear yellow)
        (clear orange)

        ; Hand status
        (hand-empty)

        ; Cost initialization
        (= (total-cost) 0)
    )
    (:goal (on blue yellow))
    (:metric minimize (total-cost))
)