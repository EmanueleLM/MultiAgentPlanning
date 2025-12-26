(define (problem hanoi-7-disk)
    (:domain tower-of-hanoi)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ; Size ordering (A < B < C < D < E < F < G)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)
        
        ; Initial Stack: L holds A/B/C/D/E/F/G (top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on G L)
        
        ; Clear objects
        (clear A) ; Top disk
        (clear M) ; Empty peg
        (clear R) ; Empty peg
    )
    (:goal (and
        ; Target Stack: R holds A/B/C/D/E/F/G (top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on G R)
        
        ; L and M must be empty (clear)
        (clear L)
        (clear M)
    ))
    (:metric minimize (total-cost))
)