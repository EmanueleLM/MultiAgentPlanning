(define (problem BlocksworldHardScaling19)
    (:domain blocksworld-hard-scaling)
    (:objects
        B - block ; Blue
        O - block ; Orange
        R - block ; Red
        Y - block ; Yellow
    )
    (:init
        (handempty)
        
        ;; Initial configuration: B/O/R/Table and Y/Table
        (on B O)
        (on O R)
        (ontable R)
        (ontable Y)
        
        ;; Clearance status
        (clear B)
        (clear Y)
        
        ;; O and R are implicitly not clear because they have blocks on them.
    )
    (:goal (and
        ;; Goal stack Y/O/R/B/Table
        (on R B) ; Red on Blue
        (on O R) ; Orange on Red
        (on Y O) ; Yellow on Orange
        (ontable B) ; Blue must be on the table
    ))
)