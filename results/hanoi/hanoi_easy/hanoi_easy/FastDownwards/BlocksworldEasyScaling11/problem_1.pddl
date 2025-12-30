(define (problem hanoi-problem-4disk)
    (:domain hanoi-4disk)
    (:objects
        A B C D - disk
        L M R - peg
    )
    (:init
        ; Static Size relations: A < B < C < D
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Stack on M: A (smallest) on B on C on D (largest) on Peg M
        (on A B)
        (on B C)
        (on C D)
        (on-peg D M)

        ; Clearance and Peg Status
        (clear A)
        (peg-clear L)
        (peg-clear R)
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; Final Stack on R: A on B on C on D on Peg R
        (on A B)
        (on B C)
        (on C D)
        (on-peg D R)

        ; L and M must be empty
        (peg-clear L)
        (peg-clear M)
    ))
    (:metric minimize (total-cost))
)