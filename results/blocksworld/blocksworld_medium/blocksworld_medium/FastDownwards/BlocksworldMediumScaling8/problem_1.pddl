(define (problem blocksworldmediumscaling8-toh)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk ; A smallest, E largest
        L M R - peg      ; Left, Middle, Right
    )

    (:init
        (= (total-cost) 0)

        ; Size hierarchy: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial State: All disks stacked on M (E bottom, A top)
        (on E M)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; Clear status
        (clear A) ; Top disk
        (clear L) ; Empty peg
        (clear R) ; Empty peg
        ; B, C, D, E, M are implicitly not clear
    )

    (:goal (and
        ; Final State: All disks stacked on R (E bottom, A top)
        (on E R)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
    ))

    (:metric minimize (total-cost))
)