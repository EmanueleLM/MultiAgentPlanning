(define (problem hanoi-5-to-P2)
    (:domain hanoi)
    (:objects
        A B C D E - disk
        P1 P2 P3 - peg
    )
    (:init
        (= (total-cost) 0)

        ;; Size relations (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ;; Initial stack on P1 (Bottom up: E, D, C, B, A)
        (on E P1)
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
        ;; Target Stack on P2 (E bottom to A top)
        (on E P2)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ;; P1 and P3 must be clear (empty)
        (clear P1)
        (clear P3)
    ))
)