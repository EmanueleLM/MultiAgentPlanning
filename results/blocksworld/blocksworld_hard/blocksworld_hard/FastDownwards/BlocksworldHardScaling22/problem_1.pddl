(define (problem BlocksworldHardScaling22)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        blue - block
        yellow - block
    )
    (:init
        (hand-empty)
        (clear orange)
        
        ;; Initial Stack: O -> Y -> R -> B (Table)
        (on orange yellow)
        (on yellow red)
        (on red blue)
        (on-table blue)
    )
    (:goal (and
        (on red orange)
        (on orange yellow)
        (on yellow blue)
    ))
)