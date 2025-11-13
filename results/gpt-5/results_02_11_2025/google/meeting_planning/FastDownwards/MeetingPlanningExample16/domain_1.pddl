(define (domain meeting-planning-example16)
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
    (clock)               ; minutes since 09:00
    (meeting-minutes)     ; total minutes spent meeting Ronald
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
      (increase (clock) 7)   ; Chinatown -> Russian Hill: 7 minutes
    )
  )

  (:action travel-rh-to-ct
    :parameters ()
    :precondition (at me russianhill)
    :effect (and
      (not (at me russianhill))
      (at me chinatown)
      (increase (clock) 9)   ; Russian Hill -> Chinatown: 9 minutes
    )
  )

  (:action meet-ronald-105
    :parameters ()
    :precondition (and
      (at me russianhill)
      (not (met-ronald))
      (>= (clock) 375)            ; cannot start before 15:15
      (<= (+ (clock) 105) 750)    ; must finish by 21:30
    )
    :effect (and
      (met-ronald)
      (increase (clock) 105)
      (increase (meeting-minutes) 105)
    )
  )
)