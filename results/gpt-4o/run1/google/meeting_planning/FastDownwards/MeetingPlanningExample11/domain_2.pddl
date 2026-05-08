(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)

  (:types 
    location person time_slot
  )

  (:predicates 
    (at_location ?l - location)
    (with_friend ?f - person)
    (time_slot_current ?t - time_slot)
    (met_carol)
  )

  (:action travel_nob_hill_to_sunset
    :parameters ()
    :precondition (and
      (at_location nob_hill)
      (time_slot_current morning)
    )
    :effect (and
      (not (at_location nob_hill))
      (at_location sunset_district)
      (time_slot_current afternoon)
    )
  )

  (:action travel_sunset_to_nob_hill
    :parameters ()
    :precondition (and
      (at_location sunset_district)
      (time_slot_current evening)
    )
    :effect (and
      (not (at_location sunset_district))
      (at_location nob_hill)
      (time_slot_current night)
    )
  )

  (:action meet_carol
    :parameters ()
    :precondition (and
      (at_location sunset_district)
      (time_slot_current afternoon)
    )
    :effect (and
      (met_carol)
      (time_slot_current evening)
    )
  )
)