(define (problem BlocksworldHardScaling1)
    (:domain Blocksworld)
    (:objects
        blue - block
        orange - block
        red - block
        yellow - block
    )
    (:init
        (handempty)
        
        ;; Initial configuration: Yellow on Red on Orange on Blue, Blue on table
        (ontable blue)
        (on orange blue)
        (on red orange)
        (on yellow red)
        
        ;; Yellow is the only block initially clear
        (clear yellow)
    )
    (:goal (and
        (on red yellow)
        (on yellow blue)
    ))
)