(define (problem craving-problem)
  (:domain craving-domain)

  (:objects
    a c b - obj
  )

  (:init
    ;; designate the required origin and target objects explicitly
    (is-origin a)
    (is-target c)

    ;; explicit "other-object" relation between the origin (a) and the target (c)
    (other-object a c)

    ;; additional explicit other-object relations (represented, not required)
    (other-object a b)
    (other-object b c)
  )

  ;; Goal: object a craves object c. The plan must produce this fact.
  (:goal
    (craves a c)
  )
)