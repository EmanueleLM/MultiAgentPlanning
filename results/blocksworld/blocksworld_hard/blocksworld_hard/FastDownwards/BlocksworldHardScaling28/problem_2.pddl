(define (problem p01-bwh28)
    (:domain blocksworld-hard-28)
    (:objects
        red blue yellow orange - block
    )

    (:init
        (= (total-cost) 0)
        (hand-empty)
        
        ; Initial State: Table, Blue, Yellow, Red, Orange.
        (on blue table)
        (on yellow blue)
        (on red yellow)
        (on orange red)
        
        (clear orange) 
    )

    (:goal (and
        ; Goal State: Table, Yellow, Orange, Red, Blue.
        (on orange yellow)
        (on red orange)
        (on blue red)
    ))
    
    (:metric minimize (total-cost))