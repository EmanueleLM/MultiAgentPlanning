(define (problem hanoi-4disk-M-to-R)
    (:domain hanoi-4disk)
    (:objects
        A B C D - disk ; A is smallest, D is largest
        L M R - peg
    )
    (:init
        ; Static Size relations (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller C D) (smaller B D)

        ; Initial Stack: A on B, B on C, C on D, D on M (Stack is on peg M)
        (on A B)
        (on B C)
        (on C D)
        (on D M)

        ; Clearance: Only the top disk (A) and empty pegs (L, R) are clear
        (clear A)
        (clear L)
        (clear R)
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; Final State: Stack is on peg R
        (on A B)
        (on B C)
        (on C D)
        (on D R)
        
        ; Pegs L and M must be empty
        (clear L)
        (clear M)
    ))
    
    (:metric minimize (total-cost))
)