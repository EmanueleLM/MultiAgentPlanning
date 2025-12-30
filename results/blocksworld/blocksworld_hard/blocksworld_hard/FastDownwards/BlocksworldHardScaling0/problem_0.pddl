(define (problem blocks-world-instance-01)
    (:domain blocks-world)
    
    (:objects
        B O Y R - block ; Blue, Orange, Yellow, Red blocks
    )
    
    (:init
        ; Hand State
        (handempty)
        
        ; Initial Stacking Configuration (B on O, O on Y, Y on R, R on table)
        (on B O)
        (on O Y)
        (on Y R)
        (ontable R)
        
        ; Clearance State
        (clear B) ; B is the only clear block initially
    )
    
    (:goal
        (and
            (on R O) ; Red block is on top of the Orange block
            (on Y R) ; Yellow block is on top of the Red block
        )
    )
)