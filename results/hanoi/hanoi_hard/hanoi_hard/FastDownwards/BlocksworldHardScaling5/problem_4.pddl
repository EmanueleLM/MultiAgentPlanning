(define (problem BlocksworldHardScaling5-P1)
    (:domain BlocksworldHardScaling5)
    (:objects
        red - block
        blue - block
        yellow - block
        orange - block
    )
    
    (:init
        (= (total-cost) 0)
        
        ;; Initial State Predicates:
        (handempty)
        (clear red)
        (clear orange)
        
        (on red blue)
        (on blue yellow)
        
        (ontable orange)
        (ontable yellow)
    )
    
    (:goal (and
        ;; Specified goal relationships (B on Y on O on R)
        (on blue yellow)
        (on orange red)
        (on yellow orange)
        
        ;; Ensure terminal state closures
        (ontable red)   ; Base of the stack must be on the table
        (clear blue)    ; Top of the stack must be clear
        (handempty)     ; Agent is finished
    ))
    
    (:metric minimize (total-cost))
)