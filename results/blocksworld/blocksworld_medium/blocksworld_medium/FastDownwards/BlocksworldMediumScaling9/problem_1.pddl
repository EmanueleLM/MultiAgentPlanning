(define (problem hanoi-5-disk-p)
    (:domain hanoi-5-disk)
    (:objects
        A B C D E - disk ; A smallest, E largest
        L M R - peg      ; Left, Middle, Right
    )
    (:init
        (= (total-cost) 0)

        ; --- Static Size Relations (Smaller/Larger) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; --- Initial State: Stack E-D-C-B-A on Middle (M) ---
        
        ; Stack structure
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Base definition
        (base E M)

        ; Top definition
        (top A) 

        ; Location facts (All disks start on M)
        (location A M)
        (location B M)
        (location C M)
        (location D M)
        (location E M)

        ; Peg availability (L and R are empty)
        (available L)
        (available R)
    )
    (:goal (and
        ; Stack E-D-C-B-A must be on Right (R)
        (base E R)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; Location check
        (location A R)
        (location B R)
        (location C R)
        (location D R)
        (location E R)
        
        ; Pegs L and M must be empty
        (available L)
        (available M)
        
        ; Top status
        (top A) 
    ))
    (:metric minimize (total-cost))
)