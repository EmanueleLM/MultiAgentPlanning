(define (problem Blocksworld-HardScaling5)
    (:domain BlocksworldHardScaling5)
    (:objects
        red blue yellow orange - block
    )
    
    (:init
        (= (total-cost) 0)
        (handempty)
        
        ;; Initial State based on specification:
        ;; Stack: Red on Blue, Blue on Yellow (R/B/Y)
        (on red blue)
        (on blue yellow)
        (ontable yellow)
        
        ;; Block Orange is on table
        (ontable orange)
        
        ;; Clear blocks (must be top blocks on stacks or alone on table)
        (clear red)
        (clear orange)
    )
    
    (:goal (and
        ;; Target Stack B/Y/O/R (top to bottom)
        (on blue yellow)
        (on yellow orange)
        (on orange red)
        
        ;; Base block must be on the table
        (ontable red)
        
        ;; Top block must be clear
        (clear blue)
        
        ;; Hand must be empty
        (handempty)
    ))
    
    (:metric minimize (total-cost))