(define (problem blocksworld-medium-22)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        yellow - block
        red - block
    )
    (:init
        (on blue yellow)
        (on yellow red)
        (on_table red)
        (on_table orange)
        (clear blue)
        (clear orange)
        (hand_empty)
        (= (total-cost) 0)
    )
    (:goal (and
        (on blue red)
        (on orange yellow)
    ))
    (:metric minimize (total-cost))
)