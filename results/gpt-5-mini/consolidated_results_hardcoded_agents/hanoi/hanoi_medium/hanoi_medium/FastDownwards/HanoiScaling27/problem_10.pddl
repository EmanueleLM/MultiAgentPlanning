(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    a b c d e - disk
    left-peg middle-peg right-peg - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; stage chain: 31 moves requires 32 stages (s0 initial .. s31 final)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6)
    (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17) (next s17 s18)
    (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24)
    (next s24 s25) (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31)
    (current-stage s0)

    ;; initial stack on right-peg: top a, then b, c, d, bottom e
    (on-peg a right-peg)
    (on-peg b right-peg)
    (on-peg c right-peg)
    (on-peg d right-peg)
    (on-peg e right-peg)

    ;; direct support (immediate on relations)
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)

    ;; has-support indicates disk has another disk directly under it
    (has-support a) (has-support b) (has-support c) (has-support d)

    ;; top disk on the right peg
    (top a right-peg)

    ;; left and middle pegs empty initially
    (empty left-peg)
    (empty middle-peg)

    ;; size ordering: a < b < c < d < e
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal (and
    ;; all disks on left peg in same stacking order
    (on-peg a left-peg)
    (on-peg b left-peg)
    (on-peg c left-peg)
    (on-peg d left-peg)
    (on-peg e left-peg)

    ;; preserved immediate-on relations on the left peg
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)

    ;; top disk on left peg is a
    (top a left-peg)

    ;; other pegs empty
    (empty middle-peg)
    (empty right-peg)

    ;; reach final stage after 31 moves
    (current-stage s31)
  ))
)