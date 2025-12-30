(define (problem hanoi-6-disks-P3-to-P2)
    (:domain tower-of-hanoi)
    (:objects 
        A B C D E F - disk ; A smallest, F largest
        P1 P2 P3 - peg    ; P1=Left, P2=Middle, P3=Right
    )
    (:init
        ; Static size definitions (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial State: Stack A-F on P3 (Right peg)
        ; (top to bottom: A, B, C, D, E, F)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F P3)

        ; Clearance and Empty Pegs
        (clear A)
        (empty P1)
        (empty P2)
    )
    (:goal (and
        ; Goal: Stack A-F on P2 (Middle peg)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F P2)

        ; P1 (Left) and P3 (Right) must be empty
        (empty P1)
        (empty P3)
    ))
)