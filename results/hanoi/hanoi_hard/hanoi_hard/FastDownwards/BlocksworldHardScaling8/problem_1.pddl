(define (problem hanoi-6-disks-P)
    (:domain hanoi-6-disks)
    
    (:objects
        A B C D E F - disk ; A (smallest) through F (largest)
        L M R - peg        ; Left, Middle, Right
    )
    
    (:init
        (= (total-cost) 0)
        
        ; --- Size relations (A < B < C < D < E < F) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)
        
        ; --- Initial State: All on Middle (M). A top, F bottom. ---
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F M)
        
        ; --- Clear status ---
        (clear A) ; A is on top
        (clear L) ; Left peg is empty
        (clear R) ; Right peg is empty
    )
    
    (:goal (and
        ; Goal: All on Right peg (R). A top, F bottom.
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F R)
        ; Ensure terminal clear states
        (clear A)
        (clear L)
        (clear M)
    ))
    
    (:metric minimize (total-cost))
)