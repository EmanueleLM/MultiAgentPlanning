(define (problem craving-instance)
  (:domain craving-conflict)
  (:objects
    a b c d - agent
    s1 s2 s3 s4 s5 - step
    p1 - province
    pl1 - planet
  )

  (:init
    ;; Agents and steps declared
    (agent a) (agent b) (agent c) (agent d)
    (step s1) (step s2) (step s3) (step s4) (step s5)

    ;; Province and planet existence (typed objects)
    (province p1)
    (planet pl1)

    ;; Initial current step is s1
    (current s1)

    ;; Explicit successor links enforce a strict order of four actions
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)

    ;; No initial attacks, pains, harmony, or cravings
    ;; (These facts are omitted because their absence is the intended initial state.)
  )

  ;; Goal requires the two specified cravings and that the plan has advanced to the terminal step s5.
  (:goal (and
    (craves a c)
    (craves d a)
    (current s5)
  ))