(define (problem hanoi-6-m-to-r)
    (:domain tower-of-hanoi-6disk)
    (:objects
        A B C D E F - disk ; A smallest, F largest
        L M R - peg        ; Left, Middle, Right
    )
    (:init
        ;; Size relations: A < B < C < D < E < F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ;; Initial state: Stacked on M (Middle Peg)
        (clear A)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (bottom-on-peg F M)

        ;; Peg status (M is implicitly not peg-clear)
        (peg-clear L)
        (peg-clear R)
    )
    (:goal (and
        ;; Goal state: Stacked on R (Right Peg)
        (clear A)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (bottom-on-peg F R)

        ;; L and M must be empty
        (peg-clear L)
        (peg-clear M)
    ))