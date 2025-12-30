(define (problem BW-HardScaling28-Instance)
    (:domain BlocksworldHardScaling28)
    (:objects
        red - block
        blue - block
        yellow - block
        orange - block
    )
    (:init
        ; Hand state
        (handempty)

        ; Initial Stack configuration: Table, Blue, Yellow, Red, Orange (bottom up)
        (ontable blue)
        (on yellow blue)
        (on red yellow)
        (on orange red)

        ; Clearance: Only Orange is clear
        (clear orange)
    )
    (:goal (and
        ; Goal configuration: Table, Yellow, Orange, Red, Blue (bottom up)
        (ontable yellow)
        (on orange yellow)
        (on red orange)
        (on blue red)
        (handempty)
    ))
)