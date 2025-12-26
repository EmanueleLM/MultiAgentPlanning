(define (problem hanoi-5disk-L-to-R)
    (:domain hanoi-5disk)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        ; Size relations (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; Initial Stacking on L (A top, E bottom)
        (on-peg E L)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Clearance
        (disk-clear A)
        (peg-clear M)
        (peg-clear R)
        
        (= (total-cost) 0)
    )
    (:goal (and
        (on-peg E R)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        (peg-clear L)
        (peg-clear M)
    ))
    (:metric minimize (total-cost))
)