(define (problem BlocksworldMediumScaling1-Problem)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        blue - block
        red - block
    )
    
    (:init
        (hand-empty)
        
        ;; Initial state configuration
        (on orange blue)
        (on yellow red)
        (on-table red)
        (on-table blue)
        
        ;; Clear blocks
        (clear orange)
        (clear yellow)
        
        ;; Cost initialization
        (= (total-cost) 0)
    )
    
    (:goal (on red blue))

    (:metric minimize (total-cost))
)