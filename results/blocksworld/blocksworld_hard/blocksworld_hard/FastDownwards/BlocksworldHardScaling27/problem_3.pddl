(define (problem BlocksworldHardScaling27-P1)
    (:domain blocksworld)
    (:objects
        blue red orange yellow - block
    )
    (:init
        ; Initial stack B/R/O/Y (B on R, R on O, O on Y, Y on Table)
        (on blue red)
        (on red orange)
        (on orange yellow)
        (ontable yellow)
        
        ; Clear state based on initial stack (only B is clear)
        (clear blue)
        
        ; Hand state
        (handempty)
    )
    (:goal (and
        ; Target stack B/Y/R/O (R on O, Y on R, B on Y)
        (on red orange)
        (on yellow red)
        (on blue yellow)
    ))
)