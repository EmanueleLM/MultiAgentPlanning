(define (problem BlocksworldMediumScaling3)
    (:domain blocksworld)
    (:objects
        red - block
        blue - block
        yellow - block
        orange - block
    )
    
    (:init
        (hand-empty)
        
        ;; Stack 1: R on Y, Y on O, O on table.
        (on red yellow)
        (on yellow orange)
        (on-table orange)
        
        ;; Stack 2: B on table.
        (on-table blue)
        
        ;; Clear Status: R and B are initially clear. Y and O are not clear implicitly.
        (clear red)
        (clear blue)
    )
    
    (:goal
        (and
            (on blue orange)
            (on yellow red)
        )
    )
)