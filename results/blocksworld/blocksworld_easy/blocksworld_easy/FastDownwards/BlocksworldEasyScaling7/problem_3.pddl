(define (problem blocksworld-easy-scaling-7)
    (:domain blocksworld)
    (:objects
        red orange yellow blue - block
    )
    (:init
        (= (total-cost) 0)
        (handempty)
        
        ;; Structure: Orange on Blue. Red, Blue, Yellow on table.
        (on orange blue)
        (ontable red)
        (ontable blue)
        (ontable yellow)
        
        ;; Clarity based on structure: R, O, Y are clear. B is not.
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