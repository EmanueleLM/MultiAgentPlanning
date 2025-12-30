(define (problem hanoi-7disk-R-to-L)
    (:domain hanoi-7disk)
    (:objects
        a b c d e f g - disk
        l m r - peg
    )

    (:init
        (is-smaller a b) (is-smaller a c) (is-smaller a d) (is-smaller a e) (is-smaller a f) (is-smaller a g)
        (is-smaller b c) (is-smaller b d) (is-smaller b e) (is-smaller b f) (is-smaller b g)
        (is-smaller c d) (is-smaller c e) (is-smaller c f) (is-smaller c g)
        (is-smaller d e) (is-smaller d f) (is-smaller d g)
        (is-smaller e f) (is-smaller e g)
        (is-smaller f g)

        (on-disk a b)
        (on-disk b c)
        (on-disk c d)
        (on-disk d e)
        (on-disk e f)
        (on-disk f g)
        (on-peg g r) 

        (clear-disk a)
        (clear-peg l)
        (clear-peg m)

        (= (total-cost) 0)
    )

    (:goal (and
        (on-disk a b)
        (on-disk b c)
        (on-disk c d)
        (on-disk d e)
        (on-disk e f)
        (on-disk f g)
        (on-peg g l)

        (clear-peg r)
        (clear-peg m)
    ))

    (:metric minimize (total-cost))
)