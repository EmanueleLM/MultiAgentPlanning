(define (problem hanoi-7-scale)
    (:domain hanoi-7-disks)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ; Static: Smaller relations (A < B < C < D < E < F < G)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)

        ; Initial Stack: L holds [A, B, C, D, E, F, G] (Top disk A, Bottom disk G)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on G L)

        ; Clearance: A is exposed. M and R are empty pegs.
        (clear A)
        (clear M)
        (clear R)
    )
    (:goal (and
        ; Target Stack: R holds [A, B, C, D, E, F, G]
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on G R)
        
        ; Clearance: A is exposed. L and M are empty pegs.
        (clear A)
        (clear L)
        (clear M)
    ))
    (:metric minimize (total-cost))
)