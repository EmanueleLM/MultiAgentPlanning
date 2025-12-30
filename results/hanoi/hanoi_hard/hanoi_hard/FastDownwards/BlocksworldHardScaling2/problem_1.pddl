(define (problem blocksworld-hard-scaling-2)
    (:domain blocksworld)
    (:objects
        yellow red orange blue - block
    )
    (:init
        ; Y on R, R on O, O on B, B on table
        (on yellow red)
        (on red orange)
        (on orange blue)
        (ontable blue)
        (clear yellow)
        (handempty)
    )
    (:goal (and
        (on red blue)
        (on yellow orange)
        (handempty)
    ))
)