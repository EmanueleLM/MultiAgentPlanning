(define (domain san_francisco_meet_mary)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (travel_nh_to_md ?from - location ?to - location ?t1 - time ?t2 - time)
    (next_time ?t1 - time ?t2 - time)
    (available ?p - person ?l - location ?start - time ?end - time)
    (met ?p - person)
  )

  (:action travel_to_marina
    :precondition (and
      (at traveler nob_hill)
      (current_time t0900)
      (travel_nh_to_md nob_hill marina_district t0900 t0911)
    )
    :effect (and
      (not (at traveler nob_hill))
      (at traveler marina_district)
      (not (current_time t0900))
      (current_time t0911)
    )
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_mary_for_120_minutes
    :precondition (and
      (current_time t2000)
      (at traveler marina_district)
      (at mary marina_district)
      (available mary marina_district t2000 t2200)
      (not (met mary))
    )
    :effect (and
      (met mary)
      (not (current_time t2000))
      (current_time t2200)
    )
  )
)