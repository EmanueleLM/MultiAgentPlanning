(define (problem hanoi-6-disks)
    (:domain hanoi)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        ; Size ordering: A < B < C < D < E < F (15 relations)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial Configuration: L holds A, B, C, D, E, F (A top, F base)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F L) 

        ; Clearance Status
        (clear A)
        (peg-clear M)
        (peg-clear R)
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; Target Configuration: M holds A, B, C, D, E, F (A top, F base)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F M)

        ; Pegs L and R must be empty
        (peg-clear L)
        (peg-clear R)
    ))
    (:metric minimize (total-cost))