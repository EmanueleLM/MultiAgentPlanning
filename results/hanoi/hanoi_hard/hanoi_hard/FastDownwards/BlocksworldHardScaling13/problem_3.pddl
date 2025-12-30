(define (problem hanoi-6-disks-R-to-M)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk ; A is smallest, F is largest
        L M R - peg        ; Left, Middle, Right
    )
    
    (:init
        (= (total-cost) 0)
        
        ; Size relations: A < B < C < D < E < F
        ; A is smaller than B, C, D, E, F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        ; B is smaller than C, D, E, F
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        ; C is smaller than D, E, F
        (smaller C D) (smaller C E) (smaller C F)
        ; D is smaller than E, F
        (smaller D E) (smaller D F)
        ; E is smaller than F
        (smaller E F)
        
        ; Initial state: Stack on R (F bottom, A top)
        ; R -> F -> E -> D -> C -> B -> A
        (on F R)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Initial clearance status
        (clear L) ; L is empty
        (clear M) ; M is empty
        (clear A) ; A is the top disk
    )
    
    (:goal (and
        ; Final stack on M (F bottom, A top)
        (on F M)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; L and R must be empty/clear
        (clear L)
        (clear R)
    ))
    
    (:metric minimize (total-cost))
)