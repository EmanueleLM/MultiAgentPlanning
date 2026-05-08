(define (problem hanoi-5)
  (:domain hanoi)

  (:objects
    ; disks named from smallest to largest: a b c d e
    a b c d e - disk

    ; pegs
    pegLeft pegMiddle pegRight - peg

    ; steps (31 moves required for 5 disks)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ; Initial tower on right peg, top to bottom: a, b, c, d, e
    (on a pegRight)
    (on b a)
    (on c b)
    (on d c)
    (on e d)

    ; Clear places initially: top disk 'a' and empty pegs pegLeft and pegMiddle
    (clear a)
    (clear pegLeft)
    (clear pegMiddle)

    ; Size ordering (smaller relations)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ; Step sequencing: s1 -> s2 -> ... -> s31
    (step-next s1 s2)
    (step-next s2 s3)
    (step-next s3 s4)
    (step-next s4 s5)
    (step-next s5 s6)
    (step-next s6 s7)
    (step-next s7 s8)
    (step-next s8 s9)
    (step-next s9 s10)
    (step-next s10 s11)
    (step-next s11 s12)
    (step-next s12 s13)
    (step-next s13 s14)
    (step-next s14 s15)
    (step-next s15 s16)
    (step-next s16 s17)
    (step-next s17 s18)
    (step-next s18 s19)
    (step-next s19 s20)
    (step-next s20 s21)
    (step-next s21 s22)
    (step-next s22 s23)
    (step-next s23 s24)
    (step-next s24 s25)
    (step-next s25 s26)
    (step-next s26 s27)
    (step-next s27 s28)
    (step-next s28 s29)
    (step-next s29 s30)
    (step-next s30 s31)

    (final-step s31)

    ; Start with operator awaiting at first step
    (awaiting-operator s1)

    ; Distinctness facts for all ordered pairs of distinct places (disks and pegs).
    ; Places: a b c d e pegLeft pegMiddle pegRight
    ; Forbid from == to by requiring (different ?from ?to)
    (different a b) (different a c) (different a d) (different a e) (different a pegLeft) (different a pegMiddle) (different a pegRight)
    (different b a) (different b c) (different b d) (different b e) (different b pegLeft) (different b pegMiddle) (different b pegRight)
    (different c a) (different c b) (different c d) (different c e) (different c pegLeft) (different c pegMiddle) (different c pegRight)
    (different d a) (different d b) (different d c) (different d e) (different d pegLeft) (different d pegMiddle) (different d pegRight)
    (different e a) (different e b) (different e c) (different e d) (different e pegLeft) (different e pegMiddle) (different e pegRight)
    (different pegLeft a) (different pegLeft b) (different pegLeft c) (different pegLeft d) (different pegLeft e) (different pegLeft pegMiddle) (different pegLeft pegRight)
    (different pegMiddle a) (different pegMiddle b) (different pegMiddle c) (different pegMiddle d) (different pegMiddle e) (different pegMiddle pegLeft) (different pegMiddle pegRight)
    (different pegRight a) (different pegRight b) (different pegRight c) (different pegRight d) (different pegRight e) (different pegRight pegLeft) (different pegRight pegMiddle)
  )

  (:goal
    (and
      ; All disks stacked on the middle peg in the same relative order (top to bottom a,b,c,d,e)
      (on a pegMiddle)
      (on b a)
      (on c b)
      (on d c)
      (on e d)

      ; Left and right pegs must be empty at the end
      (clear pegLeft)
      (clear pegRight)

      ; Observer must have recorded the final step
      (finished)
    )
  )
)