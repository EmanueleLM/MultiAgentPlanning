(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types item agent)

  (:predicates
    (craves ?x - item ?y - item)
    (declared-by ?ag - agent ?x - item ?y - item)
    (audited)
  )

  ;; Agent 1's responsibility: record that object a craves object b.
  ;; This action is specific to agent1 and to items a and b,
  ;; so the solver cannot substitute other items or reorder it with respect to auditor verification
  ;; that requires the craves facts to exist.
  (:action agent1_declare_crave_ab
    :parameters ()
    :precondition (and
      (not (craves a b))
    )
    :effect (and
      (craves a b)
      (declared-by agent1 a b)
    )
  )

  ;; Agent 2's responsibility: record that object d craves object c.
  (:action agent2_declare_crave_dc
    :parameters ()
    :precondition (and
      (not (craves d c))
    )
    :effect (and
      (craves d c)
      (declared-by agent2 d c)
    )
  )

  ;; Auditor action: can only mark the set as audited after both craves facts exist.
  ;; This enforces that both declaration actions must occur before auditing.
  (:action auditor_verify_craves
    :parameters ()
    :precondition (and
      (craves a b)
      (craves d c)
      (not (audited))
    )
    :effect (and
      (audited)
    )
  )
)