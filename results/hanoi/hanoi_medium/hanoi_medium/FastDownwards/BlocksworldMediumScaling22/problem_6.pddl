(define (problem blocksworld-medium-scaling-22)
    (:domain blocksworld-medium-scaling)
    (:objects
        blue orange yellow red - block
    )
    (:init
        ; Initial State: Blue on Yellow, Yellow on Red. Orange and Red on table. Hand empty.
        (clear blue)
        (clear orange)
        (hand_empty)
        (on blue yellow)
        (on yellow red)
        (on_table red)
        (on_table orange)
    )
    (:goal (and
        ; Goal: blue on red, orange on yellow.
        (on blue red)
        (on orange yellow)
    ))
)