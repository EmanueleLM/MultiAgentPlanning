(define (problem hanoi-medium-5-disks)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        ; Size relationships: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial Configuration: All on R, A (smallest) on top
        ; Structure
        (on-peg E R)
        (on-disk D E)
        (on-disk C D)
        (on-disk B C)
        (on-disk A B)
        
        ; Status
        (clear A)
        ; Since A is on B, B is not clear, C is not clear, D is not clear, E is not clear
        (empty L)
        (empty M)
        
        ; Location status (All on R)
        (is-at A R) (is-at B R) (is-at C R) (is-at D R) (is-at E R)
        
        ; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and
        ; Target stack on L (A on top)
        (on-peg E L)
        (on-disk D E)
        (on-disk C D)
        (on-disk B C)
        (on-disk A B)
    ))
    
    (:metric minimize (total-cost))
)