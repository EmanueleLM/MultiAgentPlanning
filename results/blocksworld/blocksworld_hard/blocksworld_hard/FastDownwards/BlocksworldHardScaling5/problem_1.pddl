(define (problem blocksworld-hard-scaling5)
    (:domain blocksworld-hard-scaling5)
    (:objects
        red blue yellow orange - block
    )
    (:init
        (handempty)
        ; Specified clear blocks
        (clear red)
        (clear orange)
        
        ; Initial stack structure
        (on red blue)
        (on blue yellow)
        
        ; Blocks on table
        (ontable orange)
        (ontable yellow)
        
        ; Implicit: (clear blue) is false because R is on B.
        ; Implicit: (clear yellow) is false because B is on Y.
    )
    (:goal (and
        (on blue yellow)
        (on orange red)
        (on yellow orange)
    ))
)