(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person)
  (:predicates
    (at_person ?p - person ?l - location)
    (visited ?l - location)
    (can_meet ?p - person)
    (met ?p - person)
    (next_visit_state ?l1 - location ?l2 - location)
  )

  (:action move
    :parameters (?from - location ?to - location)
    :precondition (and (at_person planner ?from) (next_visit_state ?from ?to))
    :effect (and
      (not (at_person planner ?from))
      (at_person planner ?to)
      (visited ?to)
    )
  )

  (:action meet_george
    :parameters ()
    :precondition (and
      (at_person planner haight_ashbury)
      (can_meet george)
    )
    :effect (met george)
  )
)