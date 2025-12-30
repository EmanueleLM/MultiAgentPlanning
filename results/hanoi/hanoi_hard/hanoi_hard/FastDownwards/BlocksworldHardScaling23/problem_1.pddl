(define (problem blocksworld-instance)
    (:domain blocksworld-hard)
    (:objects
        red blue orange yellow - block
    )
    (:init
        ; Initial stack: Yellow on Blue, Blue on Orange, Orange on Red. Red on Table.
        (on yellow blue)
        (on blue orange)
        (on orange red)
        (on_table red)
        (clear yellow)
        (hand_empty)
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal stack: Yellow on Orange, Orange on Red, Red on Blue. Blue on Table.
        (on yellow orange)
        (on orange red)
        (on red blue)
    ))
    (:metric minimize (total-cost))
)