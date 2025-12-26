(define (problem hanoi-7-p2-p3)
    (:domain hanoi-7-disks)
    (:objects
        A B C D E F G - disk ; A smallest, G largest
        P1 P2 P3 - peg
    )
    
    (:init
        ; --- Size Relations (A < B < C < D < E < F < G) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)

        ; --- Initial Configuration (Stack on P2: G bottom, A top) ---
        
        ; 1. Base Disk placement
        (at G P2)
        
        ; 2. Stacking order (ON relations)
        (on F G)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; 3. Clear/Top status
        (clear A)
        (top-of P2 A)
        (clear G)
        (not (clear F))
        (not (clear E))
        (not (clear D))
        (not (clear C))
        (not (clear B))

        ; 4. Peg status
        (empty P1)
        (empty P3)
        (not (empty P2))
    )
    
    (:goal (and
        (empty P1)
        (empty P2)
        
        ; Stack on P3: G bottom, A top
        (at G P3)
        (on F G)
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