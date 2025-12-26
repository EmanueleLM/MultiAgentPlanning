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
        
        ; Stack 1
        (on red blue)
        (on-table blue)
        
        ; Stack 2
        (on yellow orange)
        (on-table orange)
    )
    (:goal (and
        (on orange red)
    ))
)