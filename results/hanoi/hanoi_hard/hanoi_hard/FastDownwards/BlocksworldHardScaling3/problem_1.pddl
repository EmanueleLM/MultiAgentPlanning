(define (problem BlocksworldHardScaling3_Problem)
    (:domain blocksworld-hard-scaling3)
    (:objects
        red orange yellow blue - block
    )
    (:init
        (on orange yellow)
        (on yellow red)
        (ontable red)
        (ontable blue)
        
        (clear orange)
        (clear blue)
        
        (handempty)
        
        (= (total-cost) 0)
    )
    (:goal (and
        (on red orange)
        (on blue red)
        (on yellow blue)
    ))
    (:metric minimize (total-cost))
)