(define (problem hanoi-6-right-to-middle)
    (:domain hanoi-6disks)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        ; Size relations: A < B < C < D < E < F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial structure: R holds A (top) through F (bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F R)

        ; Clearance and Peg status
        (clear A)
        (peg-empty L)
        (peg-empty M)
        (not (peg-empty R)) 
    )
    (:goal
        (and
            ; Goal: Stack A->F on Middle peg (M)
            (on-peg F M)
            (on E F)
            (on D E)
            (on C D)
            (on B C)
            (on A B)
        )
    )
)