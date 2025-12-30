(define (problem hanoi-5-p)
    (:domain hanoi-5-disk)
    (:objects
        A B C D E - disk
        Peg1 Peg2 Peg3 - peg
    )
    (:init
        (= (total-cost) 0)
        
        ; Initial Stacks on Peg2 (E=bottom, A=top)
        (at E Peg2)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Initial Clearance & Empty Pegs
        (clear A)
        (empty Peg1)
        (empty Peg3)
        
        ; Static Size Relations (Smaller D1 D2)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
    )
    (:goal (and
        ; Stack is built on Peg3: E, D, C, B, A
        (at E Peg3)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Intermediate peg (Peg1) must be empty
        (empty Peg1)
    ))
    (:metric minimize (total-cost))
)