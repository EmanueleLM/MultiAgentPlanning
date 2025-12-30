(define (problem Hanoi5toM)
    (:domain hanoi-5disks)
    (:objects
        A B C D E - disk 
        L M R - peg      
    )
    (:init
        ; Static smaller relations (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; Initial State: A, B, C, D, E on L (Top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E L)
        
        ; Clearance
        (is-clear A)
        (is-clear M)
        (is-clear R)
    )
    (:goal (and
        ; Goal State: A, B, C, D, E on M (Top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E M)
        
        ; Final clearance requirements: L and R must be empty
        (is-clear L)
        (is-clear R)
    ))
)