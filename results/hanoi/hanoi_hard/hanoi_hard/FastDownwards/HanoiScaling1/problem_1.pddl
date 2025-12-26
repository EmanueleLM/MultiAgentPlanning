(define (problem hanoi-4disks-problem)
    (:domain hanoi-4disks)
    (:objects
        A B C D - disk
        L M R - peg
    )
    (:init
        ; Static Size relationships (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial stack on Peg R (D bottom, A top)
        (on D R)
        (on C D)
        (on B C)
        (on A B)

        ; Items that are clear initially: A (top disk), L (empty peg), M (empty peg)
        (clear A)
        (clear L)
        (clear M)
        
        (= (total-cost) 0)
    )
    (:goal
        (and
            (on D L)
            (on C D)
            (on B C)
            (on A B)
        )
    )
    (:metric minimize (total-cost))
)