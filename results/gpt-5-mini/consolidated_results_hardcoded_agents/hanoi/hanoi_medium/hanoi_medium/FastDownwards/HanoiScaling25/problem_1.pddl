(define (problem hanoi-5-instance)
  (:domain tower-of-hanoi-5)

  (:objects
    d1 d2 d3 d4 d5 baseA baseB baseC - disk
    pegA pegB pegC                   - peg
  )

  (:init
    ;; base disks placed on their pegs (peg emptiness represented by the base being the top)
    (on-peg baseA pegA)
    (on-peg baseB pegB)
    (on-peg baseC pegC)

    ;; initial stacking on pegA (bottom to top): baseA <- d5 <- d4 <- d3 <- d2 <- d1
    (on-disk d5 baseA)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; top facts: pegA top is d1, pegB and pegC tops are their bases (empty)
    (top pegA d1)
    (top pegB baseB)
    (top pegC baseC)

    ;; size membership (unary facts instead of enumerating all pairwise smaller relations)
    (is-s1 d1)
    (is-s2 d2)
    (is-s3 d3)
    (is-s4 d4)
    (is-s5 d5)

    ;; base markers
    (is-base baseA)
    (is-base baseB)
    (is-base baseC)
  )

  (:goal (and
    ;; stack on pegC: baseC <- d5 <- d4 <- d3 <- d2 <- d1
    (on-disk d5 baseC)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; top facts: pegC top is d1; pegA and pegB tops are their bases
    (top pegC d1)
    (top pegA baseA)
    (top pegB baseB)
  ))
)