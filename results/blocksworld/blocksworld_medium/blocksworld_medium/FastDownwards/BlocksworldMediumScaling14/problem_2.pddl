```pddl
(define (problem BlocksworldMediumScaling14)
    (:domain blocksworld)
    (:objects 
        red - block
        blue - block
        yellow - block
        orange - block
    )
    
    (:init 
        (hand-empty)
        
        ; Initial layout: B is on O. R, Y, O are on the table.
        (on blue orange)
        (on-table red)
        (on-table orange)
        (on-table yellow)
        
        ; Clearance status: R, B, Y are clear. O is blocked by B.
        (clear red)
        (clear blue)
        (clear yellow)
    )
    
    (:goal (and 
        (on red blue)
        (on blue yellow)
        (on yellow orange)
    ))
)
```