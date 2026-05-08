(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person)
  (:predicates
    (at ?p - person ?l - location)
    (visited ?l - location)
    (can_meet ?p - person)
    (met ?p - person)
    (next_visit_state ?l1 - location ?l2 - location)
  )

  (:action move
    :parameters (?person - person ?from - location ?to - location)
    :precondition (and (at ?person ?from) (next_visit_state ?from ?to))
    :effect (and
      (not (at ?person ?from))
      (at ?person ?to)
      (visited ?to)
    )
  )

  (:action meet
    :parameters (?person - person ?friend - person ?location - location)
    :precondition (and
      (at ?person ?location)
      (at ?friend ?location)
      (can_meet ?friend)
    )
    :effect (met ?friend)
  )
)