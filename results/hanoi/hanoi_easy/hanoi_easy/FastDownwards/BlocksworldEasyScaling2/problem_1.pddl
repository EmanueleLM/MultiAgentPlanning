(define (problem hanoi-4-to-R)
    (:domain hanoi-4-disks)
    (:objects
        A B C D - disk
        L M R - peg
    )
    (:init
        ; Static size constraints (A smallest, D largest)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial placement on Peg L: D, C, B, A (bottom up)
        (on D L)
        (on C D)
        (on B C)
        (on A B)

        ; Clear status
        (clear A) ; Top disk
        (clear M) ; Empty peg
        (clear R) ; Empty peg

        ; Cost initialization
        (= (total-cost) 0)
    )
    (:goal
        (and
            ; Goal state: D, C, B, A stack on R
            (on D R)
            (on C D)
            (on B C)
            (on A B)
        )
    )
    (:metric minimize (total-cost))
)