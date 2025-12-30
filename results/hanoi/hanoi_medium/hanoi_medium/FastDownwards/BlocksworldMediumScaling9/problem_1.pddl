(define (problem hanoi-5disk-M_to_R)
    (:domain hanoi-5disk)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        ; --- Size Ordering: A < B < C < D < E ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; --- Initial State: M stack (E bottom, A top) ---
        
        ; Stack structure
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-base E M)
        
        ; Clear status
        (clear A)
        (not (clear B)) 
        (not (clear C)) 
        (not (clear D)) 
        (not (clear E)) 
        
        ; Peg status
        (clear-peg L)
        (not (clear-peg M))
        (clear-peg R)
    )
    (:goal
        (and
            ; Goal stack: A on B on C on D on E, E on R base.
            (on A B)
            (on B C)
            (on C D)
            (on D E)
            (on-base E R)
            
            ; Pegs L and M must be empty
            (clear-peg L)
            (clear-peg M)
        )
    )
)