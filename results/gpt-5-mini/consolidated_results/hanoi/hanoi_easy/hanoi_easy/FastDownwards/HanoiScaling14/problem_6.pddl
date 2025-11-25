(define (problem hanoi-4)
  (:domain tower-of-hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; Initial physical configuration: bottom-to-top on middle: d (bottom), c, b, a (top)
    (on-peg d middle)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; Peg emptiness
    (empty left)
    (empty right)

    ;; Top flags: only 'a' is top initially
    (top a)

    ;; Size ordering facts (strict)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    ;; Explicit stage ordering: allow exactly 15 moves (s0 -> s15)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; start stage
    (at-stage s0)
  )

  (:goal (and
    ;; final stack on left peg bottom-to-top: d, c, b, a
    (on-peg d left)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; middle and right pegs empty at the end
    (empty middle)
    (empty right)

    ;; final stage reached exactly
    (at-stage s15)
  ))
)