(define (problem Hanoi-6Disk-RtoL)
    (:domain Hanoi)
    (:objects
        A B C D E F - disk ; Smallest (A) to Largest (F)
        L M R - peg      ; Left, Middle, Right
    )
    
    (:init
        (= (total-cost) 0)
        (handempty)
        
        ;; Peg state
        (empty L)
        (empty M)
        ;; R is occupied by F
        
        ;; Initial Stack: A/B/C/D/E/F on R (A is top, F is base)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F R)
        
        ;; A is clear
        (clear A)
        
        ;; Size relations (Smaller d1 d2 means d1 < d2)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)
    )
    
    (:goal (and
        ;; Goal stack: A/B/C/D/E/F on L (A is top, F is base)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F L)
        
        ;; Final state requirements
        (clear A)
        (handempty)
        
        ;; M and R must be empty
        (empty M)
        (empty R)
    ))
    
    (:metric minimize (total-cost))
)