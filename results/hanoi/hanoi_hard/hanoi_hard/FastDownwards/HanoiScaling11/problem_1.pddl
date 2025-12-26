(define (problem hanoi-scaling-6disk-instance)
    (:domain hanoi-6disk)
    
    (:objects
        A B C D E F - disk
        P1 P2 P3 - peg
    )
    
    (:init
        (= (total-cost) 0)
        
        ;; Size relations: A < B < C < D < E < F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ;; Initial stack on P2 (Middle): F (bottom) to A (top)
        (on A B) 
        (on B C) 
        (on C D)
        (on D E)
        (on E F)
        (on F P2) 
        
        ;; Clearness: Only A is clear
        (clear A)
        
        ;; Peg status
        (empty P1)
        (empty P3)
        ; P2 is not empty (implicitly, or explicitly by excluding (empty P2))
    )
    
    (:goal (and
        ;; Final stack on P3: F (bottom) to A (top)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F P3)
        
        ;; P1 and P2 must be empty
        (empty P1)
        (empty P2)
    ))
    
    (:metric minimize (total-cost))
)