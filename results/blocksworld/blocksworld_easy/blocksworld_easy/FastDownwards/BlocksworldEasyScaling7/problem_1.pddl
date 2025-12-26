(define (problem blocksworld-easy-scaling-7)
    (:domain blocksworld)
    (:objects
        red orange yellow blue - block
    )
    (:init
        (= (total-cost) 0)
        (handempty)
        
        ;; Initial configuration
        (on orange blue)
        (ontable red)
        (ontable blue)
        (ontable yellow)
        
        ;; Clarity
        (clear red)
        (clear orange)
        (clear yellow)
        ;; blue is not clear because orange is on it
    )
    (:goal (and
        (on orange blue)
        (on yellow red)
    ))
    (:metric minimize (total-cost))
)