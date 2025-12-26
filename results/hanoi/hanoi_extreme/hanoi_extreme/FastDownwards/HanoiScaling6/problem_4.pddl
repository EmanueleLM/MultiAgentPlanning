(define (problem hanoi-6-scale)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ; Static: Smaller relations (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial Stack: L holds [A, B, C, D, E, F] (Top disk A, Bottom disk F)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F L)

        ; Clearance: A is exposed (top). M and R are empty pegs (clear).
        (clear A)
        (clear M)
        (clear R)
    )
    (:goal (and
        ; Target Stack: R holds [A, B, C, D, E, F]
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F R)
        
        ; Clearance: A is exposed. L and M are empty pegs (clear).
        (clear A)
        (clear L)
        (clear M)
    ))
    (:metric minimize (total-cost))
)