(define (domain meet_sarah_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (can_travel ?from - location ?to - location)
    (travel_arrives ?from - location ?to - location ?depart - time ?arrive - time)
    (next_time ?t1 - time ?t2 - time)
    (available_for_meeting ?p - person ?start - time ?end - time)
    (met ?p - person)
  )

  (:action wait_to_next
    :parameters (?from_t - time ?to_t - time)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (can_travel ?from ?to)
      (travel_arrives ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_min_duration
    :parameters (?p - person ?start - time ?end - time)
    :precondition (and
      (at bayview)
      (current_time ?start)
      (available_for_meeting ?p ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)