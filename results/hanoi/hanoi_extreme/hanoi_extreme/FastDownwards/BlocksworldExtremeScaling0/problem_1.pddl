(define (problem hanoi-7disk-7disks)
    (:domain hanoi-7disk)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    
    (:init
        (= (total-cost) 0)
        
        ; --- Peg status and location invariants ---
        (is-peg L) (is-peg M) (is-peg R)
        (at-peg L L) (at-peg M M) (at-peg R R)
        
        ; --- Size Relationships (D1 < D2) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)
        
        ; --- Initial Stacking: G (bottom) to A (top) on M ---
        (on G M) (on F G) (on E F) (on D E) (on C D) (on B C) (on A B)

        ; --- Initial Clear status ---
        (clear A)
        (clear L)
        (clear R)
        
        ; --- Initial Disk Locations (All on M) ---
        (at-peg A M) (at-peg B M) (at-peg C M) (at-peg D M) 
        (at-peg E M) (at-peg F M) (at-peg G M) 
    )
    
    (:goal (and
        ; --- Goal Stacking: G (bottom) to A (top) on R ---
        (on G R) (on F G) (on E F) (on D E) (on C D) (on B C) (on A B)
        
        ; --- Pegs L and M must be empty ---
        (clear L)
        (clear M)
        
        ; --- Disks A-G must be located at R ---
        (at-peg A R) (at-peg B R) (at-peg C R) (at-peg D R) 
        (at-peg E R) (at-peg F R) (at-peg G R) 
    ))

    (:metric minimize (total-cost))
)