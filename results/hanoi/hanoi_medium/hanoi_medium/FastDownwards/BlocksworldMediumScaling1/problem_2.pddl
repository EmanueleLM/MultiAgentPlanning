(define (problem bw-medium-1)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        blue - block
        red - block
    )
    (:init
        ; Initial State based on specification:
        ; clear(orange), clear(yellow), hand_empty, on(orange, blue), on(yellow, red), on_table(red), on_table(blue).
        
        (hand-empty)
        (clear orange)
        (clear yellow)
        
        (on orange blue)
        (on yellow red)
        
        (on-table red)
        (on-table blue)
        
        (= (total-cost) 0)
    )
    
    (:goal 
        (on red blue)
    )
    
    (:metric minimize (total-cost))
)