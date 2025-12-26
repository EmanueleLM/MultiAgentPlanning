(define (problem hanoi-6-p2-p3)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk ; A smallest, F largest
        P1 P2 P3 - peg
    )
    
    (:init
        ; --- Size Relations (A < B < C < D < E < F) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; --- Initial Configuration (Stack on P2: F bottom, A top) ---
        
        ; 1. Base Disk placement
        (at F P2)
        
        ; 2. Stacking order (ON relations)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; 3. Clear/Top status
        (clear A)
        (top-of P2 A)
        
        ; 4. Peg status
        (empty P1)
        ; P2 is not empty (implicit from disk placement)
        (empty P3)
    )
    
    (:goal (and
        (empty P1)
        (empty P2)
        
        ; Stack on P3: F bottom, A top
        (at F P3)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Top/Clear Status
        (top-of P3 A)
        (clear A)
    ))
)