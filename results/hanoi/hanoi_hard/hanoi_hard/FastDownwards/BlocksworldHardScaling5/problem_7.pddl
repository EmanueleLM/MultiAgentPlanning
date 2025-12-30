(define (problem BlocksworldHardScaling5-P1)
    (:domain Blocksworld)
    (:objects
        red blue yellow orange - block
    )
    
    (:init
        (= (total-cost) 0)
        
        ;; Hand state
        (handempty)
        
        ;; Initial configuration: R on B, B on Y (Y on Table). O on Table.
        (on red blue)
        (on blue yellow)
        (ontable orange)
        (ontable yellow)
        
        ;; Clear blocks
        (clear red)
        (clear orange)
    )
    
    (:goal (and
        ;; Goal configuration: B on Y, Y on O, O on R. (R must be on table).
        (on blue yellow)
        (on yellow orange)
        (on orange red)
        
        ;; R is the base
        (ontable red)
        
        ;; Hand must be empty upon goal achievement
        (handempty)
        
        ;; The top block (blue) must be clear
        (clear blue)
    ))
    
    (:metric minimize (total-cost))
)