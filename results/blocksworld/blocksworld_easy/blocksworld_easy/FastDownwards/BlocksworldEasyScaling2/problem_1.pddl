(define (problem hanoi-4disk-p1)
    (:domain hanoi-4disk)
    (:objects
        A B C D - disk  ; A smallest, D largest
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ; Size ordering (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Configuration: Stack D, C, B, A on L (bottom to top)
        (on A B)
        (on B C)
        (on C D)
        (on-peg D L)

        ; Clearance states
        (clear-disk A)
        (clear-peg M)
        (clear-peg R)
    )
    (:goal (and
        ; Goal Configuration: Stack D, C, B, A on R
        (on A B)
        (on B C)
        (on C D)
        (on-peg D R)
        
        ; Pegs L and M must be empty
        (clear-peg L)
        (clear-peg M)
    ))
    (:metric minimize (total-cost))
)