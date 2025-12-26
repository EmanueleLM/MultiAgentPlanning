(define (problem blocksworld-easy-scaling-7)
    (:domain blocksworld)
    (:objects
        red orange yellow blue - block
    )
    (:init
        (= (total-cost) 0)
        (handempty)
        
        ;; Structure: Orange on Blue. R, B, Y on table.
        (on orange blue)
        (ontable red)
        (ontable blue)
        (ontable yellow)
        
        ;; Clarity state
        (clear red)
        (clear orange)
        (clear yellow)
        ;; Note: blue is implicitly not clear due to (on orange blue), 
        ;; and the CWA implies (not (clear blue)) since it's not listed.
    )
    (:goal (and
        (on orange blue)
        (on yellow red)
    ))
    (:metric minimize (total-cost))
)