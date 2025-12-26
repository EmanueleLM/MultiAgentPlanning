(define (problem hanoi-6d-p1-to-p2)
    (:domain tower-of-hanoi-6d)
    (:objects
        A B C D E F - disk
        P1 P2 P3 - peg
    )
    (:init
        ; --- Size Ordering: A (smallest) < ... < F (largest) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; --- Initial Stack on P1: F, E, D, C, B, A (bottom to top) ---
        (on-base F P1)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; A is the top disk, available for movement
        (clear A)

        ; P2 and P3 are initially empty
        (empty P2)
        (empty P3)
    )
    (:goal (and
        ; Final Stack on P2: F, E, D, C, B, A (bottom to top)
        (on-base F P2)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; P1 and P3 must be empty
        (empty P1)
        (empty P3)
    ))
)