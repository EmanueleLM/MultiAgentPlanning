(define (problem hanoi-6disk-r-to-m)
    (:domain hanoi-6disk-bwhs13)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)

        ; Static Size Ordering (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial State: Stack F->A on Peg R (A is smallest, F is largest)
        (on F R)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; Initial Clear Status
        (clear A)
        (clear L)
        (clear M)
    )
    (:goal (and
        ; Target Stack F->A on Peg M
        (on F M)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        ; Other pegs must be empty/clear
        (clear L)
        (clear R)
    ))
    (:metric minimize (total-cost))
)