(define (problem BlocksworldHardScaling27-P1)
    (:domain blocksworld)
    (:objects
        blue red orange yellow - block
    )
    (:init
        ; Stack B/R/O/Y
        (on blue red)
        (on red orange)
        (on orange yellow)
        (ontable yellow)
        
        ; Clear and Hand State
        (clear blue)
        (handempty)
    )
    (:goal (and
        ; Target stack B/Y/R/O
        (on red orange)
        (on yellow red)
        (on blue yellow)
    ))
)