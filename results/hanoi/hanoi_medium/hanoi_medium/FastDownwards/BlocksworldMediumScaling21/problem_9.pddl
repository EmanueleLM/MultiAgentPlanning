(define (problem BlocksworldMediumScaling21_p)
    (:domain blocksworld)
    (:objects
        B O Y R - block ; Blue, Orange, Yellow, Red
    )
    (:init
        (= (total-cost) 0)
        
        ; Initial configuration (State S0): 
        ; on(B, Y), on(O, R). on_table(R), on_table(Y).
        (on B Y)
        (on O R)
        (on_table R)
        (on_table Y)
        
        ; Clearance: clear(B), clear(O).
        (clear B)
        (clear O)
        
        ; Hand status
        (hand_empty)
    )
    (:goal (and
        ; Goal configuration: on(R, O) AND on(Y, R).
        (on R O)
        (on Y R)
    ))
    (:metric minimize (total-cost))
)