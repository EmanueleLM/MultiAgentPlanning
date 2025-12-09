(define (problem hanoi-5-instance)
  (:domain tower-of-hanoi-5)

  (:objects
    d1 d2 d3 d4 d5 baseA baseB baseC - disk
    pegA pegB pegC                   - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
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

    ;; size membership
    (is-s1 d1)
    (is-s2 d2)
    (is-s3 d3)
    (is-s4 d4)
    (is-s5 d5)

    ;; base markers
    (is-base baseA)
    (is-base baseB)
    (is-base baseC)

    ;; stage ordering (discrete time steps). We require exactly 31 move steps for a 5-disk optimal solution.
    (successor s0 s1) (successor s1 s2) (successor s2 s3) (successor s3 s4)
    (successor s4 s5) (successor s5 s6) (successor s6 s7) (successor s7 s8)
    (successor s8 s9) (successor s9 s10) (successor s10 s11) (successor s11 s12)
    (successor s12 s13) (successor s13 s14) (successor s14 s15) (successor s15 s16)
    (successor s16 s17) (successor s17 s18) (successor s18 s19) (successor s19 s20)
    (successor s20 s21) (successor s21 s22) (successor s22 s23) (successor s23 s24)
    (successor s24 s25) (successor s25 s26) (successor s26 s27) (successor s27 s28)
    (successor s28 s29) (successor s29 s30) (successor s30 s31)

    ;; initial active stage
    (stage-active s0)
  )

  (:goal (and
    ;; desired stacking on pegC: baseC <- d5 <- d4 <- d3 <- d2 <- d1
    (on-disk d5 baseC)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; top facts: pegC top is d1; pegA and pegB tops are their bases (empty)
    (top pegC d1)
    (top pegA baseA)
    (top pegB baseB)

    ;; final stage must be active (enforces exactly 31 successive move steps to reach goal)
    (stage-active s31)
  ))
)