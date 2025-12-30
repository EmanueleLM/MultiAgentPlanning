(define (problem hanoi-4disk-p1)
    (:domain hanoi-4disk)
    (:objects
        A B C D - disk  ; A smallest, D largest
        L M R - peg     ; Left, Middle, Right
    )
    
    (:init
        (= (total-cost) 0)
        
        ; Size Hierarchy: A < B < C < D
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)
        
        ; Initial State: Right peg holds D, C, B, A (bottom to top)
        (on D R)
        (on C D)
        (on B C)
        (on A B)
        
        ; Clear status
        (clear A) ; A is on top
        (clear L) ; Left peg is empty
        (clear M) ; Middle peg is empty
        ; D, C, B, R are NOT clear initially (implied by absence and action effects)
    )
    
    (:goal (and
        ; Final State: Left peg holds D, C, B, A (bottom to top)
        (on D L)
        (on C D)
        (on B C)
        (on A B)
        
        ; Ensure goal state is stable (A is on top, M and R are empty)
        (clear A)
        (clear M)
        (clear R)
    ))
    
    (:metric minimize (total-cost))
)