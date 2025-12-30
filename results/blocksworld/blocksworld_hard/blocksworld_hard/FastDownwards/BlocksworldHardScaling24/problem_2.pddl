(define (problem blocksworld-hard-scaling24)
    (:domain blocksworld)
    (:objects
        orange blue yellow red - block
    )
    (:init
        ; Initial stack: R (table), Y (on R), B (on Y), O (on B)
        (on orange blue)
        (on blue yellow)
        (on yellow red)
        (on-table red)

        (clear orange)
        (hand-empty)
        (= (total-cost) 0)
    )
    (:goal (and
        ; Target stack: R on Y, O on R, B on O, Y on table
        (on red yellow)
        (on orange red)
        (on blue orange)
        (on-table yellow)
    ))
    (:metric minimize (total-cost))
)