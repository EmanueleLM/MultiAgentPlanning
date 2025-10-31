(define (domain multi-agent-next)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent object)
  (:predicates
    (handempty ?a - agent)
    (holding ?a - agent ?o - object)
    (ontable ?o - object)
    (next ?o1 - object ?o2 - object)
  )

  (:action pick-up
    :parameters (?ag - agent ?o - object)
    :precondition (and
      (handempty ?ag)
      (ontable ?o)
    )
    :effect (and
      (holding ?ag ?o)
      (not (ontable ?o))
      (not (handempty ?ag))
    )
  )

  (:action put-next
    :parameters (?ag - agent ?o1 - object ?o2 - object)
    :precondition (and
      (holding ?ag ?o1)
    )
    :effect (and
      (not (holding ?ag ?o1))
      (handempty ?ag)
      (ontable ?o1)
      (next ?o1 ?o2)
    )
  )
)