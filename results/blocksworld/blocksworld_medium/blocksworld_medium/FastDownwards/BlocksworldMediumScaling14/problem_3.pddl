```pddl
(define (problem BlocksworldMediumScaling14)
    (:domain tower-of-hanoi-5)
    (:objects 
        A B C D E - disk ; A is smallest, E is largest
        L M R - peg      ; Left, Middle, Right
    )
    
    (:init 
        ; --- Static size constraints: A < B < C < D < E ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; --- Initial State: All on Middle (M) ---
        
        ; Stacking: E bottom, A top
        (base E M)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Location tracking
        (at A M) (at B M) (at C M) (at D M) (at E M)
        
        ; Clearance
        (top A) 
        
        ; Empty pegs
        (empty L)
        (empty R)
    )
    
    (:goal (and 
        ; Goal State: All on Left (L), E bottom, A top
        (base E L)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; All disks must be located at L
        (at A L) (at B L) (at C L) (at D L) (at E L)
        
        ; Middle and Right pegs must be empty
        (empty M)
        (empty R)
    ))
)
```