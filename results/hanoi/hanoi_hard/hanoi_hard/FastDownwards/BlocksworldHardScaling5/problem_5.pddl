(define (problem Hanoi-6-Disks-P1)
    (:domain Hanoi-6-Disks)
    (:objects
        A B C D E F - disk ; A smallest, F largest
        L M R - peg        ; Left, Middle, Right
    )
    
    (:init
        (= (total-cost) 0)
        
        ;; Initial Stack on R: A (top) -> B -> C -> D -> E -> F (base)
        (on-disk A B)
        (on-disk B C)
        (on-disk C D)
        (on-disk D E)
        (on-disk E F)
        (on-base F R)
        
        ;; Initial status
        (clear A)
        (empty L)
        (empty M)
        
        ;; Static size relations (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)
    )
    
    (:goal (and
        ;; Target stack on L: A (top) -> B -> C -> D -> E -> F (base)
        (on-disk A B)
        (on-disk B C)
        (on-disk C D)
        (on-disk D E)
        (on-disk E F)
        (on-base F L)
        
        ;; Ensure terminal conditions
        (clear A)
        (empty R)
        (empty M)
    ))
    
    (:metric minimize (total-cost))
)