(define (problem hanoi-scaling-10)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk
        Left Middle Right - peg
    )
    (:init
        (= (total-cost) 0)

        ; Static size constraints: A < B < C < D < E < F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial stack on Middle (F bottom, A top)
        (on-peg F Middle)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; Initial clear/empty states
        (clear A)
        (empty Left)
        (empty Right)
    )
    (:goal
        (and
            ; Target stack on Right peg (F bottom, A top)
            (on-peg F Right)
            (on E F)
            (on D E)
            (on C D)
            (on B C)
            (on A B)
        )
    )
    (:metric minimize (total-cost))
)