(define (problem blocks-world-4-p1)
    (:domain blocks-world-4)
    
    (:objects
        B - block ; Blue
        O - block ; Orange
        Y - block ; Yellow
        R - block ; Red
    )

    ;; Initial State: B on O, O on Y, Y on R, R on Table. B is clear. Hand is empty.
    (:init
        (handempty)
        
        ;; Stacking configuration (tower of four)
        (on B O)
        (on O Y)
        (on Y R)
        (ontable R)
        
        ;; Clear states
        (clear B)
        
        ;; Implicit negatives handled by PDDL semantics:
        ;; (not (clear O)), (not (clear Y)), (not (clear R))
        ;; (not (ontable B)), (not (ontable O)), (not (ontable Y))
    )

    ;; Goal State: R on O, Y on R. (Goal stack: Y on R on O)
    (:goal
        (and
            (on R O)
            (on Y R)
        )
    )