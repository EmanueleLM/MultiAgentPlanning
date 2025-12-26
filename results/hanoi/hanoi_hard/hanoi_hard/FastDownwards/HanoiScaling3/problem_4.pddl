(define (problem hanoi-5disk-L-to-R)
    (:domain hanoi-5disk-optimized)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        ; Size relations (A < B < C < D < E) (10 facts - invariant transitive closure)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; Initial Stacking on L (A top, E bottom on peg L) (5 facts)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E L)
        
        ; Clearance (A is top disk, M and R are empty pegs) (3 facts)
        (clear A)
        (clear M)
        (clear R)
        
        ; Initial Metric (1 fact)
        (= (total-cost) 0)
    )
    (:goal (and
        ; Final Stacking on R
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E R)
        ; Clearance: L and M must be empty
        (clear L)
        (clear M)
    ))
    (:metric minimize (total-cost))