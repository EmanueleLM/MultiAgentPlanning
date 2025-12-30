(define (problem BlocksworldHardScaling9)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        orange - block
        blue - block
    )
    (:init
        (handempty)
        
        ;; Initial positions
        (ontable red)
        (ontable blue)
        (on orange blue)
        (on yellow orange)
        
        ;; Initial clearance
        (clear red)
        (clear yellow)
    )
    (:goal (and
        (on red blue)
        (on orange yellow)
        (on yellow red)
    ))
)