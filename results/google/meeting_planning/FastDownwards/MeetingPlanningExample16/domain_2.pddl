(define (domain meeting-planning-example16)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location person traveler
  )
  (:constants
    chinatown russianhill - location
    ronald - person
    me - traveler
  )
  (:predicates
    (at ?t - traveler ?l - location)
    (met-ronald)
  )
  (:functions
    (clock)
    (meeting-minutes)
  )

  (:action wait-at-chinatown
    :parameters ()
    :precondition (at me chinatown)
    :effect (increase (clock) 1)
  )

  (:action wait-at-russianhill
    :parameters ()
    :precondition (at me russianhill)
    :effect (increase (clock) 1)
  )

  (:action travel-ct-to-rh
    :parameters ()
    :precondition (at me chinatown)
    :effect (and
      (not (at me chinatown))
      (at me russianhill)
      (increase (clock) 7)
    )
  )

  (:action travel-rh-to-ct
    :parameters ()
    :precondition (at me russianhill)
    :effect (and
      (not (at me russianhill))
      (at me chinatown)
      (increase (clock) 9)
    )
  )

  (:action meet-ronald-105
    :parameters ()
    :precondition (and
      (at me russianhill)
      (not (met-ronald))
      (>= (clock) 375)
      (<= (+ (clock) 105) 750)
    )
    :effect (and
      (met-ronald)
      (increase (clock) 105)
      (increase (meeting-minutes) 105)
    )
  )
)