(define (problem hanoi-6-disks)
    (:domain tower-of-hanoi)
    (:objects
        A B C D E F - disk ; A is smallest, F is largest
        L M R - peg        ; Left, Middle, Right
    )
    (:init
        (handempty)

        ; Static size relations (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial Configuration: A (top) down to F (base) on L
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F L)

        ; Clear status
        (clear A)
        
        ; Peg status
        (peg-clear M)
        (peg-clear R)
    )
    (:goal (and
        ; Final stack A/B/C/D/E/F on R
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F R)
        
        ; Left and Middle pegs must be empty
        (peg-clear L)
        (peg-clear M)
        
        (handempty)
    ))