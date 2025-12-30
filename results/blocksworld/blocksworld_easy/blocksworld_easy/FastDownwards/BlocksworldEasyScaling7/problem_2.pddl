(define (problem hanoi-4-disks-P2-to-P3)
    (:domain tower-of-hanoi)
    (:objects
        A B C D - disk ; A smallest, D largest
        P1 P2 P3 - peg ; P2 Middle, P3 Right
    )
    (:init
        ; Size relations (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Configuration: D, C, B, A stacked on P2
        (on-peg D P2)
        (on-disk C D)
        (on-disk B C)
        (on-disk A B)

        ; Clearance: A is clear (top disk), P1 and P3 are clear (empty pegs)
        (clear-disk A)
        (clear-peg P1)
        (clear-peg P3)

        ; Cost initialization
        (= (total-cost) 0)
    )

    (:goal (and
        ; Goal: D, C, B, A stacked on P3
        (on-peg D P3)
        (on-disk C D)
        (on-disk B C)
        (on-disk A B)
    ))

    (:metric minimize (total-cost))
)