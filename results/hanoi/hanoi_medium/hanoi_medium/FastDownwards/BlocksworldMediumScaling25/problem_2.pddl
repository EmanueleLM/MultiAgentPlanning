(define (problem hanoi-5disk-L-to-M)
    (:domain hanoi-5disk)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ;; Size relations (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ;; Initial state: Stacked L (E bottom to A top). M and R clear.
        (at-peg E L)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        (top A)
        
        (peg-clear M)
        (peg-clear R)
    )
    (:goal (and
        ;; Goal state: Stacked M (E bottom to A top). L and R clear.
        (at-peg E M)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        (top A) 
        
        (peg-clear L)
        (peg-clear R)
    ))
    (:metric minimize (total-cost))
)