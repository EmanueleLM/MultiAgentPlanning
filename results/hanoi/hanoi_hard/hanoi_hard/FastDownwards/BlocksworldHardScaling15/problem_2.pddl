(define (problem hanoi-6disk-RtoM)
    (:domain hanoi-6disk)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        ; Size constraints: A < B < C < D < E < F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial stack configuration: R holds A (top) through F (bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F R)

        ; Clear status
        (clear A)
        
        ; Peg status
        (peg-empty L)
        (peg-empty M)
    )
    (:goal (and
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F M)
        (peg-empty R)
        (peg-empty L)
    ))
)