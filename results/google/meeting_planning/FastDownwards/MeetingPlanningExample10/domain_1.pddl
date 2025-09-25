(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)
  )

  (:action travel-visitor
    :parameters (?from - location ?to - location)
    :precondition (at visitor ?from)
    :effect (and (not (at visitor ?from)) (at visitor ?to))
  )

  (:action travel-james
    :parameters (?from - location ?to - location)
    :precondition (at james ?from)
    :effect (and (not (at james ?from)) (at james ?to))
  )

  (:action meet-visitor-james
    :parameters (?loc - location)
    :precondition (and (at visitor ?loc) (at james ?loc))
    :effect (and (met))
  )
)