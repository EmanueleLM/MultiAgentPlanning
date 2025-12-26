(define (problem BlocksworldEasyScaling10-P1)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        blue - block
        orange - block
    )
    (:init
        (clear red)
        (clear yellow)
        (hand-empty)
        
        ; Stack 1: Red on Blue, Blue on table
        (on red blue)
        (on-table blue)
        
        ; Stack 2: Yellow on Orange, Orange on table
        (on yellow orange)
        (on-table orange)
    )
    (:goal (and
        (on orange red)
    ))
)