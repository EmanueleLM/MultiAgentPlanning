(define (problem blocks-4-instance)
    (:domain blocksworld-4-blocks)
    (:objects
        orange yellow blue red - block
    )
    
    (:init
        (hand-empty)

        ; Initial Configuration: O->B->R on Table. Y on Table.
        (on orange blue)
        (on blue red)
        (on-table red)
        (on-table yellow)

        ; Clearness provided in spec:
        (clear orange)
        (clear yellow)
        
        ; Blue and Red are implicitly not clear because something is stacked on them.
    )

    (:goal (and
        (on orange yellow)
    ))
)