(define (problem hanoi-6-disks-R-to-M)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    
    (:init
        (= (total-cost) 0)
        
        ; Size relations: A < B < C < D < E < F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)
        
        ; Initial state: Stack on R (F bottom, A top)
        ; F rests on peg R
        (on F R)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Initial clearance status: L, M (pegs) and A (top disk) are clear
        (clear L)
        (clear M)
        (clear A)
    )
    
    (:goal (and
        ; Final stack on M (F bottom, A top)
        (on F M)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; L and R must be empty
        (clear L)
        (clear R)
    ))
    
    (:metric minimize (total-cost))
)