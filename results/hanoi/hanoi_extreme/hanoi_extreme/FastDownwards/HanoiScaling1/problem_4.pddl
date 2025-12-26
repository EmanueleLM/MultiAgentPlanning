(define (problem p-hanoi-4-disks-optimized)
    (:domain hanoi-4-disks-optimized)

    (:objects
        A B C D - disk      ; A < B < C < D
        Left Middle Right - peg
    )

    (:init
        ;; Size definitions (6 facts defining A < B < C < D transitively)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ;; Initial stack: A/B/C/D on Right peg (top to bottom) (4 facts)
        (on D Right)
        (on C D)
        (on B C)
        (on A B)

        ;; Clearance status (3 facts)
        ;; A is the top disk. Left and Middle are empty pegs.
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