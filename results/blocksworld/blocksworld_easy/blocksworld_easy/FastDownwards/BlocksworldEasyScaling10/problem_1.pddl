(define (problem blocksworld-instance)
    (:domain blocksworld)
    (:objects
        red yellow blue orange - block
    )
    (:init
        (hand-empty)
        
        ;; Stacks and clearance
        (on red blue)
        (on yellow orange)
        
        (clear red)
        (clear yellow)
        
        ;; Bases on table
        (on-table blue)
        (on-table orange)
    )
    (:goal (on orange red))
)