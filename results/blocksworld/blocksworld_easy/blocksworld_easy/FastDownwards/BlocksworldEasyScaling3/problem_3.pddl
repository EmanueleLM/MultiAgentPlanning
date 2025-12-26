(define (problem blocksworld-easy-scaling-3)
    (:domain blocksworld)
    (:objects
        blue - block
        yellow - block
        red - block
        orange - block
    )

    (:init
        (hand-empty)
        
        ;; Orange block is on the table, and the yellow block is on the table.
        (ontable orange)
        (ontable yellow)

        ;; The red block is on top of the orange block.
        (on red orange)
        ;; The blue block is on top of the red block.
        (on blue red)

        ;; Both the blue block and the yellow block are currently clear.
        (clear blue)
        (clear yellow)
    )

    (:goal
        (and
            ;; The red block must be on top of the orange block
            (on red orange)
            ;; and the yellow block must be on top of the blue block.
            (on yellow blue)
        )
    )
)