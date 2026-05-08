(define (problem make-cravings)
  (:domain craving-domain)
  (:objects
    a b c d - object
    st0 st1 st2 st3 st4 st5 st6 st7 - stage
  )

  (:init
    (craves b d)
    (craves c a)
    (harmony)
    (planet a)
    (planet d)
    (province b)
    (province c)

    (next st0 st1)
    (next st1 st2)
    (next st2 st3)
    (next st3 st4)
    (next st4 st5)
    (next st5 st6)
    (next st6 st7)
    (now st0)
  )

  (:goal
    (and
      (craves b a)
      (craves c d)
      (craves d b)
    )
  )
)