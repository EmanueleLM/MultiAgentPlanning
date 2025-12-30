(define (problem BlocksworldEasyScaling9-Hanoi)
    (:domain hanoi-4disk)
    
    ; Objects/Constants defined in domain
    
    (:init
        (= (total-cost) 0)

        ; --- Stacking facts (Initial: D on Middle, C on D, B on C, A on B) ---
        (on D M)
        (on C D)
        (on B C)
        (on A B)

        ; --- Clear facts (Only top disk A, and empty pegs L, R are clear) ---
        (clear-top A) 
        (clear-top L) 
        (clear-top R) 
        
        ; --- Size constraints (A < B < C < D) ---
        (smaller A B)
        (smaller A C)
        (smaller A D)
        (smaller B C)
        (smaller B D)
        (smaller C D)
    )
    (:goal (and
        ; Final stack on Right Peg: D on R, C on D, B on C, A on B
        (on D R)
        (on C D)
        (on B C)
        (on A B)

        ; Pegs Left and Middle must be empty (clear)
        (clear-top L)
        (clear-top M)
    ))
    (:metric minimize (total-cost))
)