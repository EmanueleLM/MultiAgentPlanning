(define (problem blocksworld-medium-19)
    (:domain blocksworld)
    (:objects
        blue - block
        yellow - block
        orange - block
        red - block
    )
    (:init
        (hand-empty)

        ;; Initial structure: T -> B (Clear); T -> R -> O -> Y (Y Clear)
        
        (on-table blue)
        (clear blue)

        (on-table red)
        
        (on orange red)
        (on yellow orange)
        
        (clear yellow)
    )
    (:goal
        (and (on blue orange)
             (on yellow red))
    )
)