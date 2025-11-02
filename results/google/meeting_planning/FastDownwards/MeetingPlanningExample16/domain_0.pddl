(define (domain meet-ronald-time)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents)
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
    (clock)                ; minutes since 09:00
    (meeting-minutes)      ; total minutes spent meeting Ronald
  )

  (:action wait-at-chinatown
    :precondition (at me chinatown)
    :effect (increase (clock) 1)
  )

  (:action wait-at-russianhill
    :precondition (at me russianhill)
    :effect (increase (clock) 1)
  )

  (:action travel-ct-to-rh
    :precondition (at me chinatown)
    :effect (and
      (not (at me chinatown))
      (at me russianhill)
      (increase (clock) 7)
    )
  )

  (:action travel-rh-to-ct
    :precondition (at me russianhill)
    :effect (and
      (not (at me russianhill))
      (at me chinatown)
      (increase (clock) 9)
    )
  )

  (:action meet-ronald-105
    :precondition (and
      (at me russianhill)
      (not (met-ronald))
      (>= (clock) 375)              ; no earlier than 15:15
      (<= (+ (clock) 105) 750)      ; meeting must end by 21:30
    )
    :effect (and
      (met-ronald)
      (increase (clock) 105)
      (increase (meeting-minutes) 105)
    )
  )
)