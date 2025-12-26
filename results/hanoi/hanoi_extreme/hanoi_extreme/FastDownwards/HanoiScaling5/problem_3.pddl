(define (problem hanoi-5-R-to-L)
    (:domain tower-of-hanoi-5)
    
    (:init
        (= (total-cost) 0)
        ; --- Static Size Relations (A < B < C < D < E) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; --- Initial State: All disks stacked on R (A top, E base) ---
        
        ; Stack connectivity
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        
        ; Base connection
        (on-peg E R)
        
        ; Clearance facts (only positive literals needed)
        (clear A) ; A is on top
        (clear L) ; L is empty
        (clear M) ; M is empty
    )
    (:goal (and
        ; Goal: All disks stacked on L (A top, E base)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E L)
        
        ; Terminal condition: R and M must be empty
        (clear R)
        (clear M)
    ))
    (:metric minimize (total-cost))
)