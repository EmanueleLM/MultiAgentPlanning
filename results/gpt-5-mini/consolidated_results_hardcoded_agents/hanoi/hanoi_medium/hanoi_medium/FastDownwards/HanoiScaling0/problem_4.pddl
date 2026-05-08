(define (problem hanoi-5)
  (:domain hanoi-domain)
  (:objects
    a b c d e - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; stage objects
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4) (stage s5) (stage s6) (stage s7)
    (stage s8) (stage s9) (stage s10) (stage s11) (stage s12) (stage s13) (stage s14) (stage s15)
    (stage s16) (stage s17) (stage s18) (stage s19) (stage s20) (stage s21) (stage s22) (stage s23)
    (stage s24) (stage s25) (stage s26) (stage s27) (stage s28) (stage s29) (stage s30) (stage s31)

    ;; contiguous successor chain enforcing single-step progression
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16)
    (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24)
    (next s24 s25) (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30) (next s30 s31)

    ;; initial current stage
    (current s0)

    ;; Initial stacking on the middle peg (top to bottom): a b c d e
    ;; 'on' encodes immediate support relationships (not transitive)
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e middle)

    ;; Top/clear facts: only the top disk 'a' is clear; empty pegs left and right are clear
    (clear a)
    (clear left)
    (clear right)

    ;; Static size ordering (smaller relations) -- fully enumerated for safety
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal
    (and
      ;; Final immediate-support chain identical but rooted at right peg (top to bottom a b c d e)
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e right)

      ;; left and middle pegs must be empty in the final state
      (clear left)
      (clear middle)

      ;; exact stage reached (enforces exactly 2^5 - 1 = 31 moves / stage increments)
      (current s31)
    )
  )
)