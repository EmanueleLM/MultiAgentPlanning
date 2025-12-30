(define (problem BW-R-on-O)
    (:domain blocks)
    (:objects
        red yellow blue orange - block
    )
    (:init
        (handempty)
        
        ;; Initial configuration: O -> B -> Y -> R (bottom to top)
        (ontable orange)
        (on blue orange)
        (on yellow blue)
        (on red yellow)
        
        ;; Clearance
        (clear red)
        ;; The lack of (clear yellow), (clear blue), (clear orange) is implied by 
        ;; the presence of blocks on top of them.
    )
    (:goal (on red orange))
)