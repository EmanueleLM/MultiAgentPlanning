(define (domain cravings-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  ;; Predicates
  (:predicates
    (craves ?from - obj ?to - obj)
  )

  ;; Actions: prefixed to keep action names explicitly scoped to the agent/fragment
  ;; Each action explicitly establishes a craving relation as a causal link.
  ;; Actions are monotonic (only add craves facts); there are no penalty or
  ;; bookkeeping actions that could undo or compensate violations.
  (:action ag_establish_crave
    :parameters (?x - obj ?y - obj)
    :precondition (not (craves ?x ?y))
    :effect (craves ?x ?y)
  )
)