(define (problem hanoi-5-disks-M_to_R)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk ; A smallest, E largest
        L M R - peg      ; Left, Middle, Right
    )
    (:init
        ; Size ordering: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; Initial stack: Middle holds E, D, C, B, A (bottom to top)
        (on E M)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Initial clearance status
        (clear A) ; A is on top
        (clear L) ; Left peg is empty
        (clear R) ; Right peg is empty
        ; B, C, D, E are covered. M is covered by E.
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; Final stack: Right holds E, D, C, B, A
        (on E R)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; L and M must be empty
        (clear L)
        (clear M)
    ))
    (:metric minimize (total-cost))
)