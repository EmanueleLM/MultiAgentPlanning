```pddl
(define (problem BlocksworldMediumScaling14)
    (:domain blocks)
    (:objects 
        R B Y O - block
    )
    
    (:init 
        (hand-empty)
        
        ; R, O, Y are on the table
        (on-table R)
        (on-table O)
        (on-table Y)
        
        ; Blue on Orange
        (on B O) 
        
        ; Clearance: R, B, Y are clear. O is not clear.
        (clear R)
        (clear B)
        (clear Y)
    )
    
    (:goal (and 
        (on R B)
        (on B Y)
        (on Y O)
    ))
)
```