(define (domain san_francisco_day_trip)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?p - person ?l - location ?t - time)
    (can_travel ?from - location ?to - location ?start - time ?end - time)
    (met ?p - person)
    (awaiting_meeting ?p - person ?l - location ?start - time ?end - time)
  )

  (:action travel_to_bayview
    :parameters (?s - person)
    :precondition (and
      (at ?s richmond_district time_0900)
      (can_travel richmond_district bayview time_0900 time_1415)
    )
    :effect (and
      (at ?s bayview time_1415)
    )
  )

  (:action meet_sarah
    :parameters (?s - person)
    :precondition (and
      (at ?s bayview time_1415)
      (awaiting_meeting sarah bayview time_1415 time_1730)
      (not (met sarah))
    )
    :effect (and
      (met sarah)
      (at ?s bayview time_1815)
    )
  )

  (:action return_to_richmond
    :parameters (?s - person)
    :precondition (and
      (at ?s bayview time_1815)
      (can_travel bayview richmond_district time_1815 time_0900)
    )
    :effect (and
      (at ?s richmond_district time_0900)
    )
  )
)