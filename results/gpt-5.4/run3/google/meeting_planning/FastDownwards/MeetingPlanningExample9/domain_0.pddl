(define (domain san_francisco_day_meeting_mary)
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

    (next ?t1 - timepoint ?t2 - timepoint)

    (travel_link ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)

    (available_start ?p - person ?l - location ?t - timepoint)
    (meeting_end ?p - person ?t_start - timepoint ?t_end - timepoint)
    (available_until ?p - person ?t - timepoint)
  )

  (:action advance_time
    :parameters (?from_t - timepoint ?to_t - timepoint ?l - location)
    :precondition (and
      (current_time ?from_t)
      (next ?from_t ?to_t)
      (at ?l)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_link ?from ?to ?depart ?arrive)
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
      (available_start ?p ?l ?start)
      (meeting_end ?p ?start ?end)
      (available_until ?p t1615)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)