(define (problem hanoi-5-m-to-r)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk ; A is smallest, E is largest
        L M R - peg      ; Left, Middle, Right
    )
    (:init
        (= (total-cost) 0)
        
        ; Static Size Ordering
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial State: [A, B, C, D, E] on Middle (M).
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E M)
        
        ; Initial Clearance (A is top, L and R are empty)
        (clear A)
        (clear L)
        (clear R)
    )
    (:goal (and
        ; Goal State: [A, B, C, D, E] on Right (R).
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E R)
        
        ; Other pegs must be empty
        (clear L)
        (clear M)
        
        ; Top disk must be clear
        (clear A)
    ))
    (:metric minimize (total-cost))
)