(define (problem blocks-4-instance)
    (:domain blocksworld-4-blocks)
    (:objects
        orange yellow blue red - block
    )
    
    (:init
        (hand-empty)

        ; Configuration: O->B->R on Table. Y on Table.
        (on orange blue)
        (on blue red)
        (on-table red)
        (on-table yellow)

        ; Initial clearness states
        (clear orange)
        (clear yellow)
    )

    (:goal (and
        (on orange yellow)
    ))
)