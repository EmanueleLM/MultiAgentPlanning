(define (problem hanoi-5-disk)
    (:domain tower-of-hanoi)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ; Size ordering (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; Initial Stack: L holds A/B/C/D/E (top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E L)
        
        ; Clear objects
        (clear A) ; Top disk
        (clear M) ; Empty peg
        (clear R) ; Empty peg
    )
    (:goal (and
        ; Target Stack: R holds A/B/C/D/E (top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E R)
        
        ; L and M must be empty (clear)
        (clear L)
        (clear M)
    ))
    (:metric minimize (total-cost))
)