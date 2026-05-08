(define (problem feast-problem)
  (:domain feast-domain)
  ; Objects: four creatures named a, b, c, d as required.
  (:objects
    a b c d - creature
  )

  ; Initial state assumptions:
  ; - All creatures start alive.
  ; - No attack, defeat, hungry, fed, or craves facts are present initially.
  ; Note: The original specification did not explicitly list initial facts; these conservative
  ; assumptions allow the required goal to be achieved while avoiding invented resources.
  (:init
    (alive a)
    (alive b)
    (alive c)
    (alive d)
  )

  ; Goals: require that c craves b and d craves a in the final state.
  ; These must be achieved by executing the attack -> (succumb|overcome) -> feast sequences
  ; for the corresponding pairs so the solver cannot reorder or skip mandated steps.
  (:goal (and
    (craves c b)
    (craves d a)
  ))
)