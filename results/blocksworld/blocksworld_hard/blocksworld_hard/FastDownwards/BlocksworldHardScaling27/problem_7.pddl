(define (problem BlocksworldHardScaling27-P1)
    (:domain blocksworld)
    (:objects
        blue red orange yellow - block
    )
    (:init
        (on blue red)
        (on red orange)
        (on orange yellow)
        (ontable yellow)
        (clear blue)
        (handempty)
    )
    (:goal (and
        (on red orange)
        (on yellow red)
        (on blue yellow)
    ))
)