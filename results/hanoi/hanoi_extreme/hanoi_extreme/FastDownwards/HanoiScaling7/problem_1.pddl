(define (problem HanoiScaling7Problem)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk
        P1 P2 P3 - peg
    )
    (:init
        (= (total-cost) 0)

        ; --- Initial Stacking (P2: F bottom to A top) ---
        ; P2 is the Middle peg.
        (on A B) (on B C) (on C D) (on D E) (on E F)
        (on-peg F P2)

        ; --- Clearance ---
        (clear A)
        (peg-clear P1)
        (peg-clear P3)

        ; F, E, D, C, B are not clear. P2 is not peg-clear.

        ; --- Static Size Relations (smaller ?d1 ?d2) ---
        ; A < B, C, D, E, F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        ; B < C, D, E, F
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        ; C < D, E, F
        (smaller C D) (smaller C E) (smaller C F)
        ; D < E, F
        (smaller D E) (smaller D F)
        ; E < F
        (smaller E F)
    )
    (:goal
        (and
            ; Goal: Stack F bottom to A top on P3 (Right peg)
            (on A B) (on B C) (on C D) (on D E) (on E F)
            (on-peg F P3)
            ; P1 (Left) and P2 (Middle) must be empty
            (peg-clear P1)
            (peg-clear P2)
        )
    )
    (:metric minimize (total-cost))
)