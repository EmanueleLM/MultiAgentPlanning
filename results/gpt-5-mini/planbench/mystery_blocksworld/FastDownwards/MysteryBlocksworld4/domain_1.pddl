(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types item agent)

  (:predicates
    (craves ?x - item ?y - item)
    (declared_by ?ag - agent ?x - item ?y - item)
    (audited)
  )

  (:action agent1_declare_crave_ab
    :parameters ()
    :precondition (and (not (craves a b)))
    :effect (and
      (craves a b)
      (declared_by agent1 a b)
    )
  )

  (:action agent2_declare_crave_dc
    :parameters ()
    :precondition (and (not (craves d c)))
    :effect (and
      (craves d c)
      (declared_by agent2 d c)
    )
  )

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