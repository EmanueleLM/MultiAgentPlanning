(define (problem hanoi-7disk-R-to-L)
    (:domain hanoi-7disk)
    (:objects
        a b c d e f g - disk
        l m r - peg
    )

    (:init
        ; --- Static Size Ordering (A < B < C < D < E < F < G) ---
        (is-smaller a b) (is-smaller a c) (is-smaller a d) (is-smaller a e) (is-smaller a f) (is-smaller a g)
        (is-smaller b c) (is-smaller b d) (is-smaller b e) (is-smaller b f) (is-smaller b g)
        (is-smaller c d) (is-smaller c e) (is-smaller c f) (is-smaller c g)
        (is-smaller d e) (is-smaller d f) (is-smaller d g)
        (is-smaller e f) (is-smaller e g)
        (is-smaller f g)

        ; --- Initial Stack on R (A top, G bottom) ---
        (on-disk a b)
        (on-disk b c)
        (on-disk c d)
        (on-disk d e)
        (on-disk e f)
        (on-disk f g)
        (on-peg g r) 

        ; --- Initial Clearance ---
        (clear-disk a)
        (clear-peg l)  ; Left peg is empty
        (clear-peg m)  ; Middle peg is empty
    )

    (:goal (and
        ; Final stack A (top) to G (bottom) on L peg
        (on-disk a b)
        (on-disk b c)
        (on-disk c d)
        (on-disk d e)
        (on-disk e f)
        (on-disk f g)
        (on-peg g l)

        ; R and M pegs must be empty
        (clear-peg r)
        (clear-peg m)
    ))
)