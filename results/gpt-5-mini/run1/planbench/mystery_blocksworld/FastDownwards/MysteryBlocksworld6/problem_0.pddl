(define (problem craving-problem)
  (:domain craving-domain)
  (:objects a b c d - obj)

  ;; Initial state: no craving relationships are true initially.
  (:init
  )

  ;; Global goal: enforce the required terminal craving relations.
  (:goal
    (and
      (craves a b)
      (craves b d)
      (craves d c)
    )
  )
)