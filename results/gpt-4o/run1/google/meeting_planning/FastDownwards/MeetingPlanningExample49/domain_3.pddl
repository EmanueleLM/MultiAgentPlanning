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
    :parameters (?s - person ?start - time ?end - time)
    :precondition (and
      (at ?s richmond_district ?start)
      (can_travel richmond_district bayview ?start ?end)
    )
    :effect (and
      (at ?s bayview ?end)
    )
  )

  (:action meet_sarah
    :parameters (?s - person ?start - time ?end - time)
    :precondition (and
      (at ?s bayview ?start)
      (awaiting_meeting sarah bayview ?start ?end)
      (not (met sarah))
    )
    :effect (and
      (met sarah)
    )
  )

  (:action return_to_richmond
    :parameters (?s - person ?start - time ?end - time)
    :precondition (and
      (at ?s bayview ?start)
      (can_travel bayview richmond_district ?start ?end)
    )
    :effect (and
      (at ?s richmond_district ?end)
    )
  )
)