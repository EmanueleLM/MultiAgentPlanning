(define (domain meeting-planning)
  (:requirements :strips :typing)
  (:types
    location agent
  )
  (:predicates
    (at ?a - agent ?l - location)
    (available ?a - agent)
    (met ?a1 ?a2 - agent)
  )
  (:action travel
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and (at ?a ?from))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
  (:action meet
    :parameters (?a1 ?a2 - agent ?location - location)
    :precondition (and (available ?a1) (available ?a2) (at ?a1 ?location) (at ?a2 ?location) (not (met ?a1 ?a2)))
    :effect (met ?a1 ?a2)
  )
)