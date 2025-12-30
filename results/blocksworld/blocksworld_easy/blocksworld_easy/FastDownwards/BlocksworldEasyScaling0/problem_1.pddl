(define (problem hanoi-4-disks-M-to-R)
    (:domain hanoi-4disks)
    (:objects
        A B C D - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)

        ;; Static size relations (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ;; Initial Stack configuration on Peg M: D bottom, C on D, B on C, A on B
        (on C D)
        (on B C)
        (on A B)
        (on-peg D M)

        ;; Clear/Empty status
        (clear A) ; A is on top
        (empty L)
        (empty R)
    )
    (:goal (and
        ;; Goal Stack configuration on Peg R
        (on C D)
        (on B C)
        (on A B)
        (on-peg D R)

        ;; Pegs L and M must be empty
        (empty L)
        (empty M)
    ))
    (:metric minimize (total-cost))
)