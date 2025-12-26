(define (problem p-hanoi-4-disks)
    (:domain hanoi-4-disks)

    (:objects
        A B C D - disk
        Left Middle Right - peg
    )

    (:init
        ;; Size definitions (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ;; Initial stack: A/B/C/D on Right peg (A on top)
        (on D Right)
        (on C D)
        (on B C)
        (on A B)

        ;; Clearance status
        (clear A)           ; A is the top disk
        (clear Left)        ; Left peg is empty
        (clear Middle)      ; Middle peg is empty
        ;; B, C, D, and Right peg are implicitly NOT clear because disks are on them

        (= (total-cost) 0)
    )

    (:goal (and
        ;; Final stack: A/B/C/D on Left peg
        (on D Left)
        (on C D)
        (on B C)
        (on A B)
        
        ;; Implicitly, Right and Middle must be empty/clear if all disks are on Left.
    ))
    
    (:metric minimize (total-cost))
)