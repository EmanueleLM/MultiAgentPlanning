(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (craves ?x - obj ?y - obj)
  )

  ;; Agent A's action: establish that object a craves object c
  (:action agentA_set_a_craves_c
    :parameters ()
    :precondition (not (craves a c))
    :effect (craves a c)
  )

  ;; Agent B's action: establish that object d craves object a
  (:action agentB_set_d_craves_a
    :parameters ()
    :precondition (not (craves d a))
    :effect (craves d a)
  )
)