(define (problem hanoi-5-medium)
    (:domain hanoi-5-disks)
    
    (:objects
        A B C D E - disk ; A is smallest, E is largest
        L M R - peg      ; Left, Middle, Right pegs
    )
    
    (:init
        (= (total-cost) 0)

        ; Initial Stack on R (E bottom, A top)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E R) 

        ; Initial Clearness
        (clear A) ; A is the top disk
        (clear L) ; L is empty
        (clear M) ; M is empty
        
        ; Static Size relations (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
    )
    
    (:goal (and
        ; Final stack on M (E bottom, A top)
        (on E M)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; A must be the top disk
        (clear A)
        
        ; Pegs L and R must be empty
        (clear L)
        (clear R)
    ))

    (:metric minimize (total-cost))
)