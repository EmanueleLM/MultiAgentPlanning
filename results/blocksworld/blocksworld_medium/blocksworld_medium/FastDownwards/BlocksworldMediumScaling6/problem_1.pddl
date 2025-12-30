(define (problem blocksworld-4blocks-medium)
    (:domain blocksworld)
    (:objects 
        red blue yellow orange - block
    )
    
    (:init
        ; Stack B on Y on O, R on Table
        (on blue yellow)
        (on yellow orange)
        (on-table red)
        (on-table orange)
        
        ; Clear status
        (clear red)    ; Red has nothing on it and is not picked up.
        (clear blue)   ; Blue has nothing on it and is not picked up.
        
        ; Implicitly (not clear yellow) and (not clear orange)
        
        ; Hand status
        (hand-empty)
    )
    
    (:goal (and 
        (on blue red)
        (on orange blue)
    ))
)