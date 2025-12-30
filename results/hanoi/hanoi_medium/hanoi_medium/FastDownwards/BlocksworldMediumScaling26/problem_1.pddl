(define (problem BlocksworldMediumScaling26-Hanoi)
    (:domain hanoi-5disks)
    (:objects
        A B C D E - disk
        Left Middle Right - peg
    )
    
    (:init
        ; --- Static Size Relationships (A < B < C < D < E) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; --- Initial Placement: Middle peg holds A, B, C, D, E (top to bottom) ---
        
        ; Stacking
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        
        ; Base disk location
        (on-peg E Middle)
        
        ; Clearance: only A is clear
        (clear-disk A)
        
        ; Peg status: Left and Right are empty
        (is-empty Left)
        (is-empty Right)
    )
    
    (:goal (and
        ; Target stack on Left peg (A on top of B, ..., E on Left peg base)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E Left)
        
        ; Remaining pegs must be empty
        (is-empty Middle)
        (is-empty Right)
    ))
)