(define (problem hanoi-5disk-m-to-r)
    (:domain hanoi-5disk)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        ; Size constraints: A (smallest) < B < C < D < E (largest)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial stack configuration on M (E bottom, A top)
        (on-peg E M)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; Clearance states
        (clear A) ; Top disk A is clear
        (clear L) ; Left peg L is clear
        (clear R) ; Right peg R is clear

        (= (total-cost) 0)
    )
    (:goal (and
        ; Final stack configuration on R (E bottom, A top)
        (on-peg E R)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; L and M must be clear (empty)
        (clear L)
        (clear M)
    ))
    (:metric minimize (total-cost))
)