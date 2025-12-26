(define (problem blocksworld-easy-scaling-7)
    (:domain blocksworld)
    (:objects
        red orange yellow blue - block
    )
    (:init
        (= (total-cost) 0)
        (handempty)
        
        (on orange blue)
        (ontable red)
        (ontable blue)
        (ontable yellow)
        
        (clear red)
        (clear orange)
        (clear yellow)
    )
    (:goal (and
        (on orange blue)
        (on yellow red)
    ))
    (:metric minimize (total-cost))
)