(define (problem cravings-problem)
  (:domain cravings-domain)
  (:objects a b c d - obj)

  ;; Initial state: no craving relations hold initially.
  (:init
  )

  ;; Global goal: enforce the required craving chain as hard constraints.
  ;; All three relations must hold in the final state.
  (:goal
    (and
      (craves a b)
      (craves b d)
      (craves d c)
    )
  )
)