(define (problem blocksworld-hard-scaling-1)
    (:domain blocksworld-hard-scaling)
    (:objects
        blue - block
        orange - block
        red - block
        yellow - block
    )
    
    (:init
        (handempty)
        
        ;; Initial configuration: Yellow on Red, Red on Orange, Orange on Blue, Blue on Table
        (ontable blue)
        (on orange blue)
        (on red orange)
        (on yellow red)
        
        ;; Only Yellow is clear
        (clear yellow)
        
        (= (total-cost) 0)
    )
    
    (:goal (and
        ;; R on Y, Y on B
        (on red yellow)
        (on yellow blue)
    ))
    
    (:metric minimize (total-cost))
)