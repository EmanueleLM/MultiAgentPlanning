(define (problem blocksworld-hard-scaling2)
    (:domain blocksworld)
    (:objects
        yellow red orange blue - block
    )
    (:init
        (ontable blue)
        (on orange blue)
        (on red orange)
        (on yellow red)
        
        (clear yellow)
        (handempty)
    )
    (:goal (and
        (on red blue)
        (on yellow orange)
        (handempty)
    ))
)