(define (problem BlocksworldMediumScaling22)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        yellow - block
        red - block
    )
    (:init
        (clear blue)
        (clear orange)
        (hand_empty)
        
        ; Initial configuration: B on Y, Y on R
        (on blue yellow)
        (on yellow red)
        
        ; R and O on table
        (on_table red)
        (on_table orange)
    )
    (:goal (and
        (on blue red)
        (on orange yellow)
    ))
)