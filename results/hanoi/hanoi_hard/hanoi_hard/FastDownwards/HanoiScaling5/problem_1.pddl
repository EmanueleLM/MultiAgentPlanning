(define (problem hanoi-5-to-L)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk    ; A smallest, E largest
        L M R - peg         ; Left, Middle, Right
    )
    
    (:init
        ; --- Static Size Constraints (A < B < C < D < E) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; --- Initial Peg State ---
        (empty L)
        (empty M)

        ; --- Initial Stack R (A on B on C on D on E on R) ---
        
        ; Locations (All disks start at R)
        (at A R) (at B R) (at C R) (at D R) (at E R)
        
        ; Stacking
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E R) ; E rests directly on R
        
        ; Clearance
        (clear A) ; A is the top disk
    )

    (:goal (and
        ; Final State: L holds all disks, top to bottom A..E
        
        ; Target stacking
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E L)
        
        ; Target locations (Redundant but ensures completeness)
        (at A L) (at B L) (at C L) (at D L) (at E L)
        
        ; Cleanup: R and M must be empty
        (empty R)
        (empty M)
    ))
)