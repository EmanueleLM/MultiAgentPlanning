(define (domain meeting-schedule)
  (:requirements :strips :typing)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)
    (available ?a - agent)
  )
  (:action travel-traveler-bayview-to-russianhill
    :parameters ()
    :precondition (at traveler Bayview)
    :effect (and (not (at traveler Bayview)) (at traveler RussianHill))
  )
  (:action travel-traveler-russianhill-to-bayview
    :parameters ()
    :precondition (at traveler RussianHill)
    :effect (and (not (at traveler RussianHill)) (at traveler Bayview))
  )
  (:action travel-john-russianhill-to-bayview
    :parameters ()
    :precondition (at john RussianHill)
    :effect (and (not (at john RussianHill)) (at john Bayview))
  )
  (:action travel-john-bayview-to-russianhill
    :parameters ()
    :precondition (at john Bayview)
    :effect (and (not (at john Bayview)) (at john RussianHill))
  )
  (:action traveler-meet-john
    :parameters ()
    :precondition (and (at traveler RussianHill) (at john RussianHill) (available john))
    :effect (and (met) (not (available john)))
  )
)