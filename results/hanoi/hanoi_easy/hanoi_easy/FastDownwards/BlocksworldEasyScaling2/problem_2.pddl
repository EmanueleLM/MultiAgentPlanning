(define (problem hanoi-4-to-r)
    (:domain hanoi-4-disks)
    (:objects
        a b c d - disk
        l m r - peg
    )
    (:init
        ; Static size constraints (a smallest, d largest)
        (smaller a b) (smaller a c) (smaller a d)
        (smaller b c) (smaller b d)
        (smaller c d)

        ; Initial placement on Peg l: d, c, b, a (bottom up)
        (on d l)
        (on c d)
        (on b c)
        (on a b)

        ; Clear status
        (clear a) ; Top disk
        (clear m) ; Empty peg
        (clear r) ; Empty peg

        ; Cost initialization
        (= (total-cost) 0)
    )
    (:goal
        (and
            ; Goal state: d, c, b, a stack on r
            (on d r)
            (on c d)
            (on b c)
            (on a b)
        )
    )
    (:metric minimize (total-cost))
)