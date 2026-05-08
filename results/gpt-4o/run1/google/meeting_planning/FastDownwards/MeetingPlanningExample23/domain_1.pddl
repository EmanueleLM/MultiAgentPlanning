(define (domain visit_friends)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person)

  (:predicates
    (at ?agent - person ?location - location)
    (meet ?agent - person ?friend - person)
    (visited ?location - location)
    (at_russian_hill ?agent - person)
  )

  (:action move_to_russian_hill
    :parameters (?agent - person)
    :precondition (and (at ?agent bayview) (not (visited russian_hill)))
    :effect (and (at ?agent russian_hill) (visited russian_hill) (not (at ?agent bayview)) (at_russian_hill ?agent))
  )

  (:action meet_john
    :parameters (?agent - person)
    :precondition (and (at_russian_hill ?agent) (at ?agent russian_hill))
    :effect (and (meet ?agent john))
  )
)