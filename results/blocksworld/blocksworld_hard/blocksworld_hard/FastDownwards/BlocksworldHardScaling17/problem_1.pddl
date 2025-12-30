(define (problem blocksworld-17)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        orange - block
        blue - block
    )
    (:init
        (handempty)
        
        ;; Explicitly clear blocks
        (clear red)
        (clear yellow)
        
        ;; Initial Stack 1: R on O, O on B, B on table
        (on red orange)
        (on orange blue)
        (ontable blue)
        
        ;; Initial Stack 2: Y on table
        (ontable yellow)
    )
    (:goal (and
        ;; Goal stack R/B/Y/O
        (on red blue)
        (on blue yellow)
        (on yellow orange)
        
        ;; Base block must be on the table
        (ontable orange)
    ))
)