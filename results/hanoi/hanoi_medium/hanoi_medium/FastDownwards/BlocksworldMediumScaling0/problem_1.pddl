(define (problem hanoi-5-disks)
    (:domain tower-of-hanoi)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        ; Size relations: A < B < C < D < E (A smallest, E largest)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial state: Stack A/B/C/D/E on Middle (M).
        ; A (top) on B on C on D on E (bottom). E on M.
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E M)

        ; Clear status
        (clear A) ; Top disk
        (clear L) ; Empty peg
        (clear R) ; Empty peg
    )
    (:goal (and
        ; Final stack A/B/C/D/E on Right (R)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E R)
        
        ; L and M must be empty
        (clear L)
        (clear M)
    ))
)