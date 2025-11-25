(define (problem hanoi-5-3-staged)
  (:domain tower-of-hanoi-staged)
  (:objects
    a b c d e - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ;; successor chain
    (succ s0 s1)  (succ s1 s2)  (succ s2 s3)  (succ s3 s4)  (succ s4 s5)
    (succ s5 s6)  (succ s6 s7)  (succ s7 s8)  (succ s8 s9)  (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25)
    (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31)

    (cur s0)

    ;; size ordering: a smallest ... e largest
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; peg distinctness (ordered pairs)
    (diff-peg left middle) (diff-peg left right) (diff-peg middle left) (diff-peg middle right) (diff-peg right left) (diff-peg right middle)

    ;; disk distinctness (ordered pairs)
    (diff-disk a b) (diff-disk a c) (diff-disk a d) (diff-disk a e)
    (diff-disk b a) (diff-disk b c) (diff-disk b d) (diff-disk b e)
    (diff-disk c a) (diff-disk c b) (diff-disk c d) (diff-disk c e)
    (diff-disk d a) (diff-disk d b) (diff-disk d c) (diff-disk d e)
    (diff-disk e a) (diff-disk e b) (diff-disk e c) (diff-disk e d)

    ;; initial stack on left: bottom e, then d, c, b, top a
    (on-peg e left)
    (on-disk d e)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; only top disk clear initially
    (clear a)

    ;; other pegs empty initially
    (empty middle)
    (empty right)
  )

  (:goal (and
    ;; final stack on right: bottom e -> top a
    (on-peg e right)
    (on-disk d e)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; left and middle must be empty
    (empty left)
    (empty middle)

    ;; terminal stage after exactly 31 moves
    (cur s31)
  ))