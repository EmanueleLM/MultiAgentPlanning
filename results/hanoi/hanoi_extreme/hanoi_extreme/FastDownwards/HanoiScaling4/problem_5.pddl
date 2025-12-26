(define (problem hanoi-5-to-p2)
    (:domain hanoi)
    (:objects
        A B C D E - disk
        p1 p2 p3 - peg
    )
    (:init
        (= (total-cost) 0)

        ;; Size relations (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ;; Initial stack on p1 (Bottom up: E, D, C, B, A)
        (on E p1)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ;; Clearance
        (clear A)
        (clear p2)
        (clear p3)
    )
    (:goal (and
        ;; Target Stack on p2 (E bottom to A top)
        (on E p2)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ;; p1 and p3 must be clear (empty)
        (clear p1)
        (clear p3)
    ))
)