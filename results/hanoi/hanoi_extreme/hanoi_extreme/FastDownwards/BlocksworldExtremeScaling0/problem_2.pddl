(define (problem hanoi-7disk-7disks)
    (:domain hanoi-7disk)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    
    (:init
        (= (total-cost) 0)
        
        ; --- Size Relationships (A < B < C < D < E < F < G) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)
        
        ; --- Initial Stacking on M (G bottom, A top) ---
        (on-peg G M) 
        (on-disk F G)
        (on-disk E F)
        (on-disk D E)
        (on-disk C D)
        (on-disk B C)
        (on-disk A B)

        ; --- Initial Clear status ---
        (clear-disk A)
        (clear-peg L)
        (clear-peg R)
        ; M is not clear-peg, nor are disks B, C, D, E, F, G clear-disk.
        
        ; --- Initial Disk Locations (All on M) ---
        (at-peg A M) (at-peg B M) (at-peg C M) (at-peg D M) 
        (at-peg E M) (at-peg F M) (at-peg G M) 
    )
    
    (:goal (and
        ; --- Goal Stacking: G (bottom) to A (top) on R ---
        (on-peg G R)
        (on-disk F G) (on-disk E F) (on-disk D E) (on-disk C D) (on-disk B C) (on-disk A B)
        
        ; --- Pegs L and M must be empty ---
        (clear-peg L)
        (clear-peg M)
        
        ; --- All Disks must be at R ---
        (at-peg A R) (at-peg B R) (at-peg C R) (at-peg D R) 
        (at-peg E R) (at-peg F R) (at-peg G R) 
    ))

    (:metric minimize (total-cost))
)