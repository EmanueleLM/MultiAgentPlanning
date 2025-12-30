(define (problem Hanoi-5-L-to-R)
    (:domain Hanoi5Disks)
    (:objects
        A B C D E - disk ; A=smallest, E=largest
        L M R - peg      ; Left, Middle, Right
    )
    
    (:init
        ; --- Size Ordering (A < B < C < D < E) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; --- Initial Stacking: L holds A (top) through E (bottom) ---
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-base E L)
        
        ; --- Initial Clear Status ---
        (clear A) 
        (clear-base M) ; Middle peg empty
        (clear-base R) ; Right peg empty
        ; Peg L is not clear-base because E is on it
        ; Disks B, C, D, E are not clear because they are covered
    )

    (:goal (and
        ; --- Goal Stacking: R holds A (top) through E (bottom) ---
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-base E R)
        
        ; --- Ensure all pegs are correctly utilized/cleared ---
        (clear A)
        (clear-base L) ; Left peg empty
        (clear-base M) ; Middle peg empty
    ))
)