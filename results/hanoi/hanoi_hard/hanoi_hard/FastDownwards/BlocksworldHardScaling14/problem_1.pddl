(define (problem hanoi-6-disks-M-to-L)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        ; Size relations: A < B < C < D < E < F (total 15 relations)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial Stack: Middle peg (M) holds F (bottom) up to A (top)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F M)

        ; Initial Clearness
        (clear A) ; Top disk
        (clear L) ; Left peg empty
        (clear R) ; Right peg empty
    )
    (:goal (and
        ; Target Stack: Left peg (L) holds F (bottom) up to A (top)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F L)

        ; Middle and Right pegs must be clear
        (clear M)
        (clear R)
    ))
)