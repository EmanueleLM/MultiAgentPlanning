(define (problem blocks_problem_initial)
    (:domain blocksworld)

    (:objects
        red yellow blue orange - block
    )

    (:init
        ; Hand state
        (hand-empty)

        ; Tower 1: R on B, B on Table
        (on red blue)
        (on-table blue)
        (clear red) 
        
        ; Tower 2: Y on O, O on Table
        (on yellow orange)
        (on-table orange)
        (clear yellow) 
    )

    (:goal
        (and
            (on orange red)
        )
    )
)