(define (problem hanoi-6-disks-6)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    
    (:init
        ; Initial State: F E D C B A on M (Bottom to top)
        
        ; Placement relations
        (is-on A B)
        (is-on B C)
        (is-on C D)
        (is-on D E)
        (is-on E F)
        (is-on F M)
        
        ; Clear statuses
        (is-clear A) ; A is on top
        (is-clear L) ; L is empty
        (is-clear R) ; R is empty
        ; M, F, E, D, C, B are NOT clear
        
        ; Static smaller relations (A < B < C < D < E < F)
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
        
        (= (total-cost) 0)
    )
    
    (:goal (and
        ; Final State: F E D C B A on R (Bottom to top)
        (is-on A B)
        (is-on B C)
        (is-on C D)
        (is-on D E)
        (is-on E F)
        (is-on F R)
    ))
    
    (:metric minimize (total-cost))
)