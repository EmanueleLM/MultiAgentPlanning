(define (problem hanoi-6-problem)
  (:domain hanoi-6)
  (:objects
    a b c d e f - disk
    left middle right - peg
    st0 st1 st2 st3 st4 st5 st6 st7 st8 st9 st10 st11 st12 st13 st14 st15
    st16 st17 st18 st19 st20 st21 st22 st23 st24 st25 st26 st27 st28 st29 st30 st31
    st32 st33 st34 st35 st36 st37 st38 st39 st40 st41 st42 st43 st44 st45 st46 st47
    st48 st49 st50 st51 st52 st53 st54 st55 st56 st57 st58 st59 st60 st61 st62 st63 - stage
  )
  (:init
    ;; static size ordering (smallest -> largest: a < b < c < d < e < f)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)

    ;; initial stacking on the right peg (top -> bottom): a, b, c, d, e, f
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-peg f right)

    ;; top and clear for the top disk
    (top a right)
    (clear a)

    ;; peg occupancy
    (peg-empty left)
    (peg-empty middle)

    ;; stage ordering and initial stage
    (at-stage st0)
    (succ st0 st1) (succ st1 st2) (succ st2 st3) (succ st3 st4)
    (succ st4 st5) (succ st5 st6) (succ st6 st7) (succ st7 st8)
    (succ st8 st9) (succ st9 st10) (succ st10 st11) (succ st11 st12)
    (succ st12 st13) (succ st13 st14) (succ st14 st15) (succ st15 st16)
    (succ st16 st17) (succ st17 st18) (succ st18 st19) (succ st19 st20)
    (succ st20 st21) (succ st21 st22) (succ st22 st23) (succ st23 st24)
    (succ st24 st25) (succ st25 st26) (succ st26 st27) (succ st27 st28)
    (succ st28 st29) (succ st29 st30) (succ st30 st31) (succ st31 st32)
    (succ st32 st33) (succ st33 st34) (succ st34 st35) (succ st35 st36)
    (succ st36 st37) (succ st37 st38) (succ st38 st39) (succ st39 st40)
    (succ st40 st41) (succ st41 st42) (succ st42 st43) (succ st43 st44)
    (succ st44 st45) (succ st45 st46) (succ st46 st47) (succ st47 st48)
    (succ st48 st49) (succ st49 st50) (succ st50 st51) (succ st51 st52)
    (succ st52 st53) (succ st53 st54) (succ st54 st55) (succ st55 st56)
    (succ st56 st57) (succ st57 st58) (succ st58 st59) (succ st59 st60)
    (succ st60 st61) (succ st61 st62) (succ st62 st63)
  )
  (:goal (and
    ;; goal stacking on middle peg (top -> bottom): a, b, c, d, e, f
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-peg f middle)
    (top a middle)

    ;; terminal peg occupancy constraints
    (peg-empty left)
    (peg-empty right)

    ;; final stage must be reached exactly
    (at-stage st63)
  ))
)