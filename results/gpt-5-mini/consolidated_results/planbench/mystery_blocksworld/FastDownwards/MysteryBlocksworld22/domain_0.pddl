(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types thing)
  (:predicates
    (craves ?who - thing ?what - thing)
    (agent1_done)
    (agent2_done)
  )

  ;; Agent 1 action: creates the craving relation craves(c,a) and records completion.
  ;; This action represents an agent-identified capability and is named with an agent prefix.
  (:action agent1_make_crave_c_a
    :parameters ()
    :precondition (and)
    :effect (and
      (craves c a)
      (agent1_done)
    )
  )

  ;; Agent 2 action: can only run after agent1 has completed (enforces ordering).
  ;; Creates craves(d,b) and records completion.
  (:action agent2_make_crave_d_b
    :parameters ()
    :precondition (and
      (agent1_done)
    )
    :effect (and
      (craves d b)
      (agent2_done)
    )
  )
)