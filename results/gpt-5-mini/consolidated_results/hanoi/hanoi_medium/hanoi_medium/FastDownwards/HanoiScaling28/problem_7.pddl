(define (problem hanoi-5)
  (:domain hanoi)

  (:objects
    a b c d e left middle right - object
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e right)

    (clear a)
    (clear left)
    (clear middle)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    (step-next s1 s2) (step-next s2 s3) (step-next s3 s4) (step-next s4 s5)
    (step-next s5 s6) (step-next s6 s7) (step-next s7 s8) (step-next s8 s9)
    (step-next s9 s10) (step-next s10 s11) (step-next s11 s12) (step-next s12 s13)
    (step-next s13 s14) (step-next s14 s15) (step-next s15 s16) (step-next s16 s17)
    (step-next s17 s18) (step-next s18 s19) (step-next s19 s20) (step-next s20 s21)
    (step-next s21 s22) (step-next s22 s23) (step-next s23 s24) (step-next s24 s25)
    (step-next s25 s26) (step-next s26 s27) (step-next s27 s28) (step-next s28 s29)
    (step-next s29 s30) (step-next s30 s31)

    (final-step s31)

    (phase-operator s1)
  )

  (:goal
    (and
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e middle)
      (clear left)
      (clear right)
      (finished)
    )
  )
)