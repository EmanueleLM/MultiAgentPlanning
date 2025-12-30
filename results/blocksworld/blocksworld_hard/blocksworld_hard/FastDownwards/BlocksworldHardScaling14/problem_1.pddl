(define (problem blocksworld-14)
    (:domain blocksworld)
    (:objects
        yellow red blue orange - block
    )
    (:init
        (hand-empty)
        
        ;; Initial structure: Yellow on Red, Red on Blue, Blue on Orange, Orange on Table
        (on yellow red)
        (on red blue)
        (on blue orange)
        (on-table orange)
        
        ;; Clearance status
        (clear yellow)
    )
    (:goal (and
        (on red orange)
        (on yellow blue)
    ))
)