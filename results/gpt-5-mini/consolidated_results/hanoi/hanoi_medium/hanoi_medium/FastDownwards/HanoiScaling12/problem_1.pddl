(define (problem hanoi-five)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ;; Initial tower on the right peg: bottom E, then D, C, B, A (A top)
    (on-peg E right)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; Top/clear facts: only top disk A is clear; left and middle pegs empty
    (clear-disk A)
    (clear-peg left)
    (clear-peg middle)
    ;; right peg is not listed as clear (implicitly false)
    ;; disks B,C,D,E are not listed as clear (implicitly false)

    ;; Size ordering (A smallest, E largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; Time / stage chain: s0 -> s1 -> ... -> s31
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31)

    ;; Start at stage s0
    (time-now s0)
  )

  (:goal
    (and
      ;; Desired tower on the left peg: bottom E, then D, C, B, A (A top)
      (on-peg E left)
      (on-disk D E)
      (on-disk C D)
      (on-disk B C)
      (on-disk A B)

      ;; Middle and right pegs must be empty at the end
      (clear-peg middle)
      (clear-peg right)

      ;; Terminal stage must be reached (enforces exact number of moves <= 31)
      (time-now s31)
    )
  )
)