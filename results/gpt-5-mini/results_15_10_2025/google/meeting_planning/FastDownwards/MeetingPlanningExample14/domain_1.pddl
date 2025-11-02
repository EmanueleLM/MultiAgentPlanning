(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
  )
  (:functions
    (time)
    (num-meetings)
  )

  (:action travel_nobhill_to_marina
    :parameters ()
    :precondition (at traveler nobhill)
    :effect (and
      (not (at traveler nobhill))
      (at traveler marinadistrict)
      (increase (time) 11)
    )
  )

  (:action travel_marina_to_nobhill
    :parameters ()
    :precondition (at traveler marinadistrict)
    :effect (and
      (not (at traveler marinadistrict))
      (at traveler nobhill)
      (increase (time) 12)
    )
  )

  (:action wait_until_availability
    :parameters ()
    :precondition (and (< (time) 1200))
    :effect (and
      (assign (time) 1200)
    )
  )

  (:action meet_mary
    :parameters ()
    :precondition (and
      (at traveler marinadistrict)
      (at mary marinadistrict)
      (>= (time) 1200)
      (<= (+ (time) 120) 1320)
    )
    :effect (and
      (increase (num-meetings) 1)
      (increase (time) 120)
    )
  )
)