(define (problem hanoi-4)
  (:domain tower-of-hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - stage
  )

  (:init
    ;; initial stack on middle peg from bottom to top: d (bottom), c, b, a (top)
    (on-peg d middle)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; initial peg clearness: left and right empty; middle not declared clear
    (clear-peg left)
    (clear-peg right)

    ;; only topmost disk a is clear initially
    (clear-disk a)

    ;; size ordering facts (explicit)
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)

    ;; explicit stage ordering (discrete time steps). There are 16 moves -> 17 stages.
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16)

    ;; start at stage s0
    (at-stage s0)
  )

  (:goal (and
    ;; final stack on left peg bottom-to-top: d, c, b, a
    (on-peg d left)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; middle and right pegs empty at the end
    (clear-peg middle)
    (clear-peg right)

    ;; final stage reached
    (at-stage s16)
  ))
)