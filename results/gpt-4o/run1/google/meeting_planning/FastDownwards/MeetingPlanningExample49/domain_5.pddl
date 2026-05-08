(define (domain san_francisco_day_trip)
  (:requirements :strips :typing)

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
      (at ?s - person richmond_district - location ?start - time)
      (can_travel richmond_district - location bayview - location ?start - time ?end - time)
    )
    :effect (and
      (not (at ?s - person richmond_district - location ?start - time))
      (at ?s - person bayview - location ?end - time)
    )
  )

  (:action meet_sarah
    :parameters (?s - person ?start - time ?end - time)
    :precondition (and
      (at ?s - person bayview - location ?start - time)
      (awaiting_meeting sarah - person bayview - location ?start - time ?end - time)
      (not (met sarah - person))
    )
    :effect (met sarah - person)
  )

  (:action return_to_richmond
    :parameters (?s - person ?start - time ?end - time)
    :precondition (and
      (at ?s - person bayview - location ?start - time)
      (can_travel bayview - location richmond_district - location ?start - time ?end - time)
    )
    :effect (and
      (not (at ?s - person bayview - location ?start - time))
      (at ?s - person richmond_district - location ?end - time)
    )
  )
)