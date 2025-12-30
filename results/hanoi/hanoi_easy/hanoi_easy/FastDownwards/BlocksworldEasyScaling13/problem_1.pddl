(define (problem hanoi-4-r-to-m)
    (:domain hanoi)
    (:objects
        A B C D - disk ; A smallest, D largest
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ; Size relations: A < B < C < D
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Stack: R holds D, C, B, A (bottom to top)
        (on D R)
        (on C D)
        (on B C)
        (on A B)

        ; Clearance status
        (clear A) ; Top of stack
        (clear L) ; Empty peg
        (clear M) ; Empty peg
    )
    (:goal (and
        ; Goal Stack: M holds D, C, B, A
        (on D M)
        (on C D)
        (on B C)
        (on A B)

        ; L and R must be empty/clear
        (clear L)
        (clear R)
    ))
    (:metric minimize (total-cost))
)