(define (problem BlocksworldHardScaling2)
    (:domain blocksworld)
    (:objects
        yellow - block
        red - block
        orange - block
        blue - block
    )
    (:init
        ; Initial stack: Y on R, R on O, O on B. B on table.
        (on yellow red)
        (on red orange)
        (on orange blue)
        (ontable blue)
        (clear yellow)
        (handempty)
    )
    (:goal (and
        ; Goal: R on B, Y on O. Hand empty.
        (on red blue)
        (on yellow orange)
        (handempty)
    ))
)