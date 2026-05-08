(define (domain san_francisco_day_visit)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (met ?p - person)

    (travel_edge ?from - location ?to - location)
    (travel_arrival ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)

    (available_from ?p - person ?t - timepoint)
    (available_until ?p - person ?t - timepoint)

    (meeting_slot ?p - person ?l - location ?start - timepoint ?end - timepoint)
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_edge ?from ?to)
      (travel_arrival ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_minimum_duration
    :parameters (?p - person ?l - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?l)
      (current_time ?start)
      (meeting_slot ?p ?l ?start ?end)
      (available_from ?p ?start)
      (available_until ?p ?end)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
      (not (current_time ?start))
      (current_time ?end)
    )
  )
)