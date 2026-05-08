(define (problem cravings-problem)
  (:domain cravings)
  ; Modeling decisions:
  ; - planet, province, pain and craves are per-object predicates.
  ; - harmony is a single global predicate.
  ; - Discrete stages s1..s20 enforce ordered, contiguous occupancy: every action consumes the current
  ;   step and produces the next step as current. No auxiliary bookkeeping tokens or penalty actions are used.
  (:objects
    a b c d - object
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - step
  )

  (:init
    ; Initial object facts
    (craves c d)
    (craves d a)
    (harmony)
    (planet a)
    (planet b)
    (province b)
    (province c)

    ; Steps and ordering (20-stage horizon)
    (step s1) (step s2) (step s3) (step s4) (step s5) (step s6) (step s7) (step s8) (step s9) (step s10)
    (step s11) (step s12) (step s13) (step s14) (step s15) (step s16) (step s17) (step s18) (step s19) (step s20)

    (step-next s1 s2) (step-next s2 s3) (step-next s3 s4) (step-next s4 s5) (step-next s5 s6)
    (step-next s6 s7) (step-next s7 s8) (step-next s8 s9) (step-next s9 s10) (step-next s10 s11)
    (step-next s11 s12) (step-next s12 s13) (step-next s13 s14) (step-next s14 s15) (step-next s15 s16)
    (step-next s16 s17) (step-next s17 s18) (step-next s18 s19) (step-next s19 s20)

    ; Start at s1
    (step-current s1)
  )

  (:goal
    (and
      (craves a c)
      (craves b a)
      (craves d b)
    )
  )
)