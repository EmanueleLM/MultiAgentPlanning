(define (problem hanoi-5-instance)
    (:domain hanoi-5)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        ;; Size relations (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ;; Initial Stack (L: A/B/C/D/E)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E L)

        ;; Clearance
        (clear A)
        (peg-clear M)
        (peg-clear R)
    )
    (:goal (and
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E R)
        (peg-clear L)
        (peg-clear M)
    ))
)