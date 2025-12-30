(define (problem Blocksworld-HardScaling5)
    (:domain BlocksworldHardScaling5)
    (:objects
        red blue yellow orange - block
    )
    
    (:init
        (= (total-cost) 0)
        (handempty)
        
        (on red blue)
        (on blue yellow)
        (ontable yellow)
        
        (ontable orange)
        
        (clear red)
        (clear orange)
    )
    
    (:goal (and
        (on blue yellow)
        (on yellow orange)
        (on orange red)
        
        (ontable red)
        
        (clear blue)
        
        (handempty)
    ))
    
    (:metric minimize (total-cost))
)