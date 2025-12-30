(define (problem BlocksworldHardScaling10)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    
    (:init
        (= (total-cost) 0)
        
        ; Size constraints: A < B < C < D < E < F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)
        
        ; Initial stack M: F (bottom) ... A (top)
        (on-peg F M)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Initial locations (All disks start on M)
        (loc A M) (loc B M) (loc C M) (loc D M) (loc E M) (loc F M)
        
        ; Clear status
        (clear A)
        (clear L)
        (clear R)
    )
    
    (:goal (and
        ; Final stack R: F (bottom) ... A (top)
        (on-peg F R)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Final locations (All disks end on R)
        (loc A R) (loc B R) (loc C R) (loc D R) (loc E R) (loc F R)
        
        ; Pegs L and M must be empty
        (clear L)
        (clear M)
    ))
    
    (:metric minimize (total-cost))
)