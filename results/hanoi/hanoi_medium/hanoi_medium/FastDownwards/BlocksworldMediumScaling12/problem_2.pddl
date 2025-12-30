(define (problem hanoi-5-disks-P_R-to-P_L)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk
        P_L P_M P_R - peg ; P_L=Left (Target), P_M=Middle (Aux), P_R=Right (Source)
    )
    (:init
        ; --- Size Hierarchy: A < B < C < D < E ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; --- Initial Stack on P_R (Right Peg) ---
        ; Stack: A (top) -> B -> C -> D -> E (bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-base E P_R)
        
        ; Clear status
        (clear A)
        (clear B) ; Falsified by (on A B)
        (clear C) ; Falsified by (on B C)
        (clear D) ; Falsified by (on C D)
        (clear E) ; Falsified by (on D E)
        ; Only clear A is necessary. The others are correctly omitted.
        
        ; Peg status
        (peg-empty P_L)
        (peg-empty P_M)
        ; P_R is NOT empty initially (implicitly, as disks are present)
        
        ; Location tracking (All disks start at P_R)
        (at A P_R) (at B P_R) (at C P_R) (at D P_R) (at E P_R)
    )
    (:goal (and
        ; Target Stack on P_L (Left Peg)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-base E P_L)
        (clear A)
        
        ; All disks must be located at P_L
        (at A P_L) (at B P_L) (at C P_L) (at D P_L) (at E P_L)
        
        ; Auxiliary (P_M) and Source (P_R) pegs must be empty
        (peg-empty P_M)
        (peg-empty P_R)
    ))