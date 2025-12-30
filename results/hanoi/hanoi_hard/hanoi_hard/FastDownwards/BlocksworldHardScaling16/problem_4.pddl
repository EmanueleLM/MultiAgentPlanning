(define (problem Hanoi6Disks)
    (:domain hanoi)
    (:objects
        A B C D E F - disk ; A is smallest, F is largest
        L M R - peg        ; Left, Middle, Right
    )
    
    (:init
        ; --- Size Ordering (Static) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)
        
        ; --- Peg Status ---
        (empty L)
        (empty R)
        ; M is non-empty
        
        ; --- Initial Stack Configuration: A (top) ... F (bottom) on M ---
        (on_disk A B)
        (on_disk B C)
        (on_disk C D)
        (on_disk D E)
        (on_disk E F)
        (on_peg F M)
        
        ; --- Clear status ---
        (clear A)
        
        ; --- Location Tracking (All disks start on M) ---
        (belongs-to A M)
        (belongs-to B M)
        (belongs-to C M)
        (belongs-to D M)
        (belongs-to E M)
        (belongs-to F M)
        
        (= (total-cost) 0)
    )
    
    (:goal (and
        ; Target Stack on R: A (top) ... F (bottom)
        (on_disk A B)
        (on_disk B C)
        (on_disk C D)
        (on_disk D E)
        (on_disk E F)
        (on_peg F R)
        
        ; L and M must be empty
        (empty L)
        (empty M)
        
        ; All disks belong to R (Ensuring consistency)
        (belongs-to A R)
        (belongs-to B R)
        (belongs-to C R)
        (belongs-to D R)
        (belongs-to E R)
        (belongs-to F R)
    ))
    
    (:metric minimize (total-cost))
)