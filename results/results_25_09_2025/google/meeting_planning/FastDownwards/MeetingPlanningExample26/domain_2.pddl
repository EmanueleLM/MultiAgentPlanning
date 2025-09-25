(define (domain meeting-domain)
  (:requirements :typing :negative-preconditions :equality)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)
    (sarah-available ?l - location)
  )

  (:action traveler-move
    :parameters (?from - location ?to - location)
    :precondition (at traveler ?from)
    :effect (and (not (at traveler ?from)) (at traveler ?to))
  )

  (:action sarah-move
    :parameters (?from - location ?to - location)
    :precondition (at sarah ?from)
    :effect (and (not (at sarah ?from)) (at sarah ?to))
  )

  (:action meet
    :parameters (?loc - location)
    :precondition (and (at traveler ?loc) (at sarah ?loc) (sarah-available ?loc))
    :effect (and (met))
  )
)