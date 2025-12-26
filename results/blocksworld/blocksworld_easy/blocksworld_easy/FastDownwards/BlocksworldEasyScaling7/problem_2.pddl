(define (problem blocksworld-easy-scaling-7)
    (:domain blocksworld)
    (:objects
        red orange yellow blue - block
    )
    (:init
        (= (total-cost) 0)
        (handempty)
        
        ;; Configuration: Orange on Blue; Red, Blue, Yellow on table.
        (on orange blue)
        (ontable red)
        (ontable blue)
        (ontable yellow)
        
        ;; Clarity: Only blocks with nothing on top are clear.
        (clear red)
        (clear orange) ; Orange is on top of Blue
        (clear yellow)
        ;; Blue is NOT clear because Orange is on it.
    )
    (:goal (and
        (on orange blue)
        (on yellow red)
    ))
    (:metric minimize (total-cost))
)