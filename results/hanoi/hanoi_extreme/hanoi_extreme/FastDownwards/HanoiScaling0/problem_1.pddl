(define (problem hanoi-4-m-to-r)
    (:domain hanoi-4-disks)
    (:objects
        A B C D - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)
        (on A B)
        (on B C)
        (on C D)
        (on-peg D M)
        (clear A)
        (clear L)
        (clear R)
    )
    (:goal (and
        (on A B)
        (on B C)
        (on C D)
        (on-peg D R)
        (clear L)
        (clear M)
    ))
    (:metric minimize (total-cost))
)