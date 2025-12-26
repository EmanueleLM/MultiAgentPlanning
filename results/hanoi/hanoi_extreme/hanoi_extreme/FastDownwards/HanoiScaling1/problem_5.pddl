(define (problem p-hanoi-4-disks-optimized)
    (:domain hanoi-4-disks-optimized)

    (:objects
        A B C D - disk
        Left Middle Right - peg
    )

    (:init
        ;; Size definitions
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ;; Initial stack: A/B/C/D on Right peg
        (on D Right)
        (on C D)
        (on B C)
        (on A B)

        ;; Clearance status
        (clear A)
        (clear Left)
        (clear Middle)

        (= (total-cost) 0)
    )

    (:goal (and
        ;; Final stack: A/B/C/D on Left peg
        (on D Left)
        (on C D)
        (on B C)
        (on A B)
    ))
    
    (:metric minimize (total-cost))
)