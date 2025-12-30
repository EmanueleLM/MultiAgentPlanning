(define (problem BlocksworldHardScaling21)
    (:domain hanoi)
    (:objects 
        A B C D E F - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)

        ; Size definitions (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial stack L: A/B/C/D/E/F (A is top, F is base)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F L)

        ; Clear/Empty status
        (clear A)
        (peg-empty M)
        (peg-empty R)
    )
    (:goal (and
        ; Final stack M: A/B/C/D/E/F
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F M)
        
        ; L and R must be empty
        (peg-empty L)
        (peg-empty R)
    ))
    (:metric minimize (total-cost))
)