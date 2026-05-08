(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (carol_available ?t - time)
    (met ?p - person)
  )

  (:action travel_nob_hill_to_sunset_district_0900_0925
    :parameters ()
    :precondition (and
      (at traveler nob_hill)
      (current_time t0900)
    )
    :effect (and
      (not (at traveler nob_hill))
      (at traveler sunset_district)
      (not (current_time t0900))
      (current_time t0925)
    )
  )

  (:action wait_0925_to_1400
    :parameters ()
    :precondition (and
      (current_time t0925)
    )
    :effect (and
      (not (current_time t0925))
      (current_time t1400)
    )
  )

  (:action meet_carol_75_from_1400_to_1515
    :parameters ()
    :precondition (and
      (current_time t1400)
      (at traveler sunset_district)
      (at carol sunset_district)
      (carol_available t1400)
      (not (met carol))
    )
    :effect (and
      (not (current_time t1400))
      (current_time t1515)
      (met carol)
    )
  )
)