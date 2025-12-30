(define (problem BlocksworldMediumScaling18)
    (:domain TOWER-OF-HANOI-5)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)

        ; Size hierarchy: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial setup: L holds [A, B, C, D, E] (A on top)
        (on-peg E L)
        (on-disk D E)
        (on-disk C D)
        (on-disk B C)
        (on-disk A B)

        ; Clear status
        (clear A)

        ; Peg status
        (peg-empty M)
        (peg-empty R)
    )
    (:goal
        (and
            ; M holds [A, B, C, D, E]
            (on-peg E M)
            (on-disk D E)
            (on-disk C D)
            (on-disk B C)
            (on-disk A B)

            ; L and R are empty
            (peg-empty L)
            (peg-empty R)
        )
    )
    (:metric minimize (total-cost))
)