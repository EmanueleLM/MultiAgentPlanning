(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    ;; disks from smallest (a) to largest (e)
    a b c d e - disk
    ;; the three pegs (pegs are subtypes of place)
    left middle right - peg
    ;; stages s0 .. s31 to enforce exactly 31 moves (2^5 - 1)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )
  (:init
    ;; initial tower on the right peg (top-to-bottom): a b c d e
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e right)

    ;; clear facts: top disk and empty pegs
    (clear a)
    (clear left)
    (clear middle)

    ;; size (smaller) relations: a < b < c < d < e (transitive pairs included)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; stage progression: start at s0 and have a linear successor chain to s31
    (at-stage s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31)
  )

  (:goal (and
    ;; full tower assembled on the left peg (top-to-bottom a b c d e)
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e left)

    ;; middle and right pegs must be empty (no disk directly on them)
    (not (on a middle)) (not (on b middle)) (not (on c middle)) (not (on d middle)) (not (on e middle))
    (not (on a right))  (not (on b right))  (not (on c right))  (not (on d right))  (not (on e right))

    ;; require reaching final stage after exactly 31 moves
    (at-stage s31)
  ))
)