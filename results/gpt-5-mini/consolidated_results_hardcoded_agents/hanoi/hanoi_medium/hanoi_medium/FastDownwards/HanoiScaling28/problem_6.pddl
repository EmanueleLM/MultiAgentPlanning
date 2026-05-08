(define (problem hanoi-5)
  (:domain hanoi)

  (:objects
    a b c d e - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ;; Initial stack on right peg: top-to-bottom a b c d e
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e right)

    ;; Only the topmost disk is clear; empty pegs are clear
    (clear a)
    (clear left)
    (clear middle)

    ;; size ordering (smaller relations)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; step sequencing: s1 -> s2 -> ... -> s31 (2^5 - 1 moves)
    (step-next s1 s2) (step-next s2 s3) (step-next s3 s4) (step-next s4 s5)
    (step-next s5 s6) (step-next s6 s7) (step-next s7 s8) (step-next s8 s9)
    (step-next s9 s10) (step-next s10 s11) (step-next s11 s12) (step-next s12 s13)
    (step-next s13 s14) (step-next s14 s15) (step-next s15 s16) (step-next s16 s17)
    (step-next s17 s18) (step-next s18 s19) (step-next s19 s20) (step-next s20 s21)
    (step-next s21 s22) (step-next s22 s23) (step-next s23 s24) (step-next s24 s25)
    (step-next s25 s26) (step-next s26 s27) (step-next s27 s28) (step-next s28 s29)
    (step-next s29 s30) (step-next s30 s31)

    (final-step s31)

    ;; start with operator phase at the first step
    (phase-operator s1)

    ;; explicit distinctness facts for all ordered pairs of objects (disks and pegs)
    ;; objects: a b c d e left middle right
    ;; a distinct from others
    (different a b) (different a c) (different a d) (different a e)
    (different a left) (different a middle) (different a right)
    ;; b
    (different b a) (different b c) (different b d) (different b e)
    (different b left) (different b middle) (different b right)
    ;; c
    (different c a) (different c b) (different c d) (different c e)
    (different c left) (different c middle) (different c right)
    ;; d
    (different d a) (different d b) (different d c) (different d e)
    (different d left) (different d middle) (different d right)
    ;; e
    (different e a) (different e b) (different e c) (different e d)
    (different e left) (different e middle) (different e right)
    ;; pegs distinct
    (different left a) (different left b) (different left c) (different left d) (different left e)
    (different left middle) (different left right)
    (different middle a) (different middle b) (different middle c) (different middle d) (different middle e)
    (different middle left) (different middle right)
    (different right a) (different right b) (different right c) (different right d) (different right e)
    (different right left) (different right middle)
  )

  (:goal
    (and
      ;; All disks stacked on the middle peg in the same relative order (top-to-bottom a b c d e)
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e middle)

      ;; left and right pegs must be empty (no disk directly on them)
      (clear left)
      (clear right)

      ;; observer must have recorded the final step
      (finished)
    )
  )
)