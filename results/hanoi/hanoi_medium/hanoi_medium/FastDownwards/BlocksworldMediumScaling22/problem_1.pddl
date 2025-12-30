(define (problem blocksworld-medium-22)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        yellow - block
        red - block
    )
    (:init
        ; Blocks status
        (on blue yellow)
        (on yellow red)
        (on_table red)
        (on_table orange)
        
        ; Clear status
        (clear blue)
        (clear orange)
        
        ; Hand status
        (hand_empty)
        
        ; Metric initialization
        (= (total-cost) 0)
    )
    (:goal (and
        (on blue red)
        (on orange yellow)
    ))
    (:metric minimize (total-cost))
)