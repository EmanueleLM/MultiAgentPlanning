(define (problem blocks-world-4-p1)
    (:domain blocks-world-4)
    
    (:objects
        B - block
        O - block
        Y - block
        R - block
    )

    (:init
        (handempty)
        
        (on B O)
        (on O Y)
        (on Y R)
        (ontable R)
        
        (clear B)
    )

    (:goal
        (and
            (on R O)
            (on Y R)
        )
    )
)