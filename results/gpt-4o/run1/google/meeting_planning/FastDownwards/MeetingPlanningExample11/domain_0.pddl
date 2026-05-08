(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)

  (:types 
    location person time_slot
  )

  (:predicates 
    (at_location ?l - location)
    (with_friend ?f - person)
    (time_ge ?t - time_slot)
    (time_le ?t - time_slot)
    (met_carol)
    (trip_completed)
  )

  (:action travel_nob_hill_to_sunset
    :parameters ()
    :precondition (and
      (at_location nob_hill)
      (time_ge morning)
    )
    :effect (and
      (not (at_location nob_hill))
      (at_location sunset_district)
      (time_ge after_2pm)
    )
  )

  (:action travel_sunset_to_nob_hill
    :parameters ()
    :precondition (and
      (at_location sunset_district)
      (time_ge morning)
    )
    :effect (and
      (not (at_location sunset_district))
      (at_location nob_hill)
      (time_ge end_of_day)
    )
  )

  (:action meet_carol
    :parameters ()
    :precondition (and
      (at_location sunset_district)
      (time_ge after_2pm)
      (time_le before_830pm)
    )
    :effect (met_carol)
  )

  (:action end_day
    :parameters ()
    :precondition (met_carol)
    :effect (trip_completed)
  )
)