(define (problem BlocksworldHardScaling24)
    (:domain blocksworld)
    (:objects
        orange blue yellow red - block
    )
    
    (:init
        ; Cost initialization
        (= (total-cost) 0)

        ; Hand state
        (handempty)

        ; Initial Configuration: R is on the table. Y is on R. B is on Y. O is on B.
        (on orange blue)
        (on blue yellow)
        (on yellow red)
        (ontable red)
        
        ; Clearance: O is clear.
        (clear orange)
    )
    
    (:goal (and
        ; Target configuration predicates: (on R Y), (on O R), (on B O).
        (on red yellow)
        (on orange red)
        (on blue orange)
        ; Base block must be on table, top block must be clear
        (ontable yellow)
        (clear blue)
    ))

    (:metric minimize (total-cost))
)