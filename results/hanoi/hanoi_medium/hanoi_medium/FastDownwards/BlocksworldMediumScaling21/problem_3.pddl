(define (problem BlocksworldMediumScaling21_P0)
    (:domain blocksworld)
    (:objects
        B O Y R - block
    )
    (:init
        ; Blocks and Locations
        (on B Y)
        (on O R)
        (on_table R)
        (on_table Y)
        
        ; Clearance
        (clear B)
        (clear O)
        
        ; Hand Status
        (hand_empty)
        
        ; Metric Initialization
        (= (total-cost) 0)
    )
    (:goal (and
        (on R O) ; Red on Orange
        (on Y R) ; Yellow on Red
    ))
    (:metric minimize (total-cost))
)