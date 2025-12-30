(define (problem hanoi-5-disks-P1)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk
        Peg1 Peg2 Peg3 - peg
    )
    (:init
        (= (total-cost) 0)

        ; 1. Size relationships (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; 2. Initial Configuration: Stack on Peg2 (A top, E bottom)
        (on A B) (on B C) (on C D) (on D E) (on E Peg2)
        
        ; 3. Clear status
        (clear A)
        (clear Peg1)
        (clear Peg3)
    )
    (:goal (and
        ; Final stack on Peg3 (A top, E bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E Peg3)
        (clear A)
        
        ; Ensures Peg1 and Peg2 are clear bases, fulfilling the empty auxiliary requirement
        (clear Peg1)
        (clear Peg2)
    ))
    (:metric minimize (total-cost))
)