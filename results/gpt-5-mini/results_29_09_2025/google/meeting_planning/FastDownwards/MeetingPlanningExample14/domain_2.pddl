(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (mary-available)
    (time-at-or-after-1200)
    (time-at-or-after-1320)
    (met-mary)
  )

  (:action travel_nobhill_to_marina
    :parameters ()
    :precondition (at traveler nobhill)
    :effect (and
      (not (at traveler nobhill))
      (at traveler marinadistrict)
    )
  )

  (:action travel_marina_to_nobhill
    :parameters ()
    :precondition (at traveler marinadistrict)
    :effect (and
      (not (at traveler marinadistrict))
      (at traveler nobhill)
    )
  )

  (:action wait_until_1200
    :parameters ()
    :precondition (at traveler marinadistrict)
    :effect (and
      (time-at-or-after-1200)
    )
  )

  (:action meet_mary
    :parameters ()
    :precondition (and
      (at traveler marinadistrict)
      (at mary marinadistrict)
      (time-at-or-after-1200)
      (not (time-at-or-after-1320))
      (mary-available)
    )
    :effect (and
      (met-mary)
      (not (mary-available))
      (time-at-or-after-1320)
    )
  )
)