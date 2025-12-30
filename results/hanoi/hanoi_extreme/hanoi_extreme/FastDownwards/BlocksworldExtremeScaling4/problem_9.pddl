(define (problem hanoi-7d-L-M)
    (:domain hanoi-7d)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    
    (:init
        ; Initial stack L: A/B/C/D/E/F/G (Top to Bottom)
        (at-base G L)
        (on F G)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; A is the topmost disk
        (clear A)
        
        ; Peg status
        (peg-empty M)
        (peg-empty R)
        
        ; Location tracking: All disks are on L initially
        (on-peg A L) (on-peg B L) (on-peg C L) (on-peg D L) (on-peg E L) (on-peg F L) (on-peg G L)
        
        ; Size relations (A < B < C < D < E < F < G)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)

        ; Metric initialization
        (= (total-cost) 0)
    )
    
    (:goal (and
        ; Final stack M: A/B/C/D/E/F/G (Top to Bottom)
        (at-base G M)
        (on F G)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Pegs must be empty
        (peg-empty L)
        (peg-empty R)
    ))
    
    (:metric minimize (total-cost))
)