(define (problem BlocksworldHardScaling29_p)
    (:domain BlocksworldHardScaling29)
    (:objects
        R - block
        Y - block
        B - block
        O - block
    )
    (:init
        (= (total-cost) 0)
        (handempty)
        
        ; Initial State: R is on Y, Y is on B, B is on O, O is on table. R is clear.
        (ontable O)
        (on B O)
        (on Y B)
        (on R Y)
        
        (clear R)
    )
    (:goal (and
        ; Target Goal State: Y is on R. R is on O. O is on B.
        (on Y R)
        (on R O)
        (on O B)
        ; Since B is the bottom block of the stack, it must be on the table.
        (ontable B)
    ))
    (:metric minimize (total-cost))
)