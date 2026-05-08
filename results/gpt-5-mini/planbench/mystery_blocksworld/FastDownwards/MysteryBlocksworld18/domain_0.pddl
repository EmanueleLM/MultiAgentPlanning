(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent)

  (:predicates
    (craves ?x - agent ?y - agent)
    (actor-is-a ?x - agent)
    (actor-is-b ?x - agent)
    (actor-is-c ?x - agent)
    (actor-is-d ?x - agent)
  )

  ; Action for agent b to form a craving for a
  (:action b-crave-a
    :parameters (?actor - agent ?target - agent)
    :precondition (and
      (actor-is-b ?actor)
      (actor-is-a ?target)
      (not (craves ?actor ?target))
    )
    :effect (and
      (craves ?actor ?target)
    )
  )

  ; Action for agent c to form a craving for d
  (:action c-crave-d
    :parameters (?actor - agent ?target - agent)
    :precondition (and
      (actor-is-c ?actor)
      (actor-is-d ?target)
      (not (craves ?actor ?target))
    )
    :effect (and
      (craves ?actor ?target)
    )
  )

  ; Action for agent d to form a craving for b
  (:action d-crave-b
    :parameters (?actor - agent ?target - agent)
    :precondition (and
      (actor-is-d ?actor)
      (actor-is-b ?target)
      (not (craves ?actor ?target))
    )
    :effect (and
      (craves ?actor ?target)
    )
  )
)