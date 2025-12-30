(define (problem blocksworldhardscaling19)
    (:domain blocksworld)
    (:objects
        B - block ; Blue
        R - block ; Red
        O - block ; Orange
        Y - block ; Yellow
    )
    (:init
        (handempty)
        
        ;; Initial configuration: B/O/R stack and Y on table
        (ontable R)
        (ontable Y)
        (on B O)
        (on O R)

        ;; Clearance
        (clear B)
        (clear Y)
    )
    (:goal (and
        ;; Goal configuration: Yellow on Orange, Orange on Red, Red on Blue
        (on Y O)
        (on O R)
        (on R B)
        (ontable B)
        (handempty)
    ))
)