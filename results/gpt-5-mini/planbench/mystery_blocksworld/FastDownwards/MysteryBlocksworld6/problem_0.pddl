(define (problem cravings-problem)
  (:domain cravings-domain)
  (:objects
    ag1 - agent
    a b c d - item
  )

  ;; Initial state: only the agent declaration is required here.
  ;; No craves facts hold initially; the plan must use actions to establish them.
  (:init
    (agent ag1)
  )

  ;; Global goal: final state must contain the explicit craving chain:
  ;; a craves b, b craves d, d craves c.
  ;; These are hard constraints; the planner cannot satisfy the problem unless all three hold.
  (:goal (and
           (craves a b)
           (craves b d)
           (craves d c)
         ))
)