(define (problem hanoi-p5)
    (:domain hanoi-5disk)
    (:objects
        A B C D E - disk
        R M L - peg
    )
    (:init
        ; Initial State: Stack on R (A smallest/top, E largest/bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E R)

        ; Clearance
        (clear A)
        (clear M)
        (clear L)

        ; Static Size hierarchy (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; Cost initialization
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal State: Stack on L (A smallest/top, E largest/bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E L)
        ; Pegs R and M must be empty (clear)
        (clear R)
        (clear M)
    ))
    (:metric minimize (total-cost))