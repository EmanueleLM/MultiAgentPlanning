(define (problem hanoi-5-to-L)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk    ; A smallest, E largest
        L M R - peg         ; Left, Middle, Right
    )
    
    (:init
        ; --- Static Size Constraints (10 facts, A < B < C < D < E) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; --- Initial Peg State (2 facts) ---
        (empty L)
        (empty M)

        ; --- Initial Stack R Geometry (5 facts: A on B on C on D on E on R) ---
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E R) 
        
        ; --- Disk Status (1 fact) ---
        (clear A)
        
        ; --- Disk Locations (5 facts, required for action grounding) ---
        (at A R) (at B R) (at C R) (at D R) (at E R)
    )

    (:goal (and
        ; Final State: L holds all disks, top to bottom A..E
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E L)
        
        ; Cleanup: R and M must be empty
        (empty R)
        (empty M)
    ))
)