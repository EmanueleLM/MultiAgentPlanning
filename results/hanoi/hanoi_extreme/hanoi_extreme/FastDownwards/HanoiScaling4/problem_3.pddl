(define (problem hanoi-7-to-P2)
    (:domain hanoi)
    (:objects
        A B C D E F G - disk
        P1 P2 P3 - peg
    )
    (:init
        ;; Size relations (A < B < C < D < E < F < G)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)

        ;; Initial stack on P1 (Bottom up: G, F, E, D, C, B, A)
        (on G P1)
        (on F G)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ;; Clearance
        (clear A)
        (clear P2)
        (clear P3)
    )
    (:goal (and
        ;; Target Stack on P2 (G bottom to A top)
        (on G P2)
        (on F G)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ;; P1 and P3 must be empty
        (clear P1)
        (clear P3)
    ))
)