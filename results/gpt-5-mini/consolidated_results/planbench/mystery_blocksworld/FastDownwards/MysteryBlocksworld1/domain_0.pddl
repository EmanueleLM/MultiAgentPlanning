(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent obj)
  (:predicates
    (craves ?x - obj ?y - obj)
  )

  ;; Agent 1 action: establishes a craves relation between two objects
  (:action agent1_make_crave
    :parameters (?s - obj ?t - obj)
    :precondition (not (craves ?s ?t))
    :effect (craves ?s ?t)
  )

  ;; Agent 2 action: establishes a craves relation between two objects
  (:action agent2_make_crave
    :parameters (?s - obj ?t - obj)
    :precondition (not (craves ?s ?t))
    :effect (craves ?s ?t)
  )
)