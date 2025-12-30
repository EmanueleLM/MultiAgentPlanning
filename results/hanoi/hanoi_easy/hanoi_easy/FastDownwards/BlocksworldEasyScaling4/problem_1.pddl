(define (problem hanoi-4-disks-L-to-M)
    (:domain hanoi-4-disks)
    (:objects
        A B C D - disk
        L M R - peg
    )

    (:init
        (= (total-cost) 0)
        
        ; Static size relations (A smallest, D largest)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial State: A, B, C, D stacked on L (A top, D bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D L) 

        ; Clearances: A is clear (top disk). M and R are clear (empty pegs).
        (clear A) 
        (clear M) 
        (clear R)
    )

    (:goal (and
        ; Goal State: A, B, C, D stacked on M (A top, D bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D M)
        
        ; Pegs L and R must be empty/clear
        (clear L)
        (clear R)
    ))
    
    (:metric minimize (total-cost))
)