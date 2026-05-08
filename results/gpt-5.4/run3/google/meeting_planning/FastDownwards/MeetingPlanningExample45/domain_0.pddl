(define (domain meet_emily_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (connected ?from - location ?to - location)
    (travel_step ?from - location ?to - location ?start - time ?end - time)
    (wait_step ?start - time ?end - time)
    (meeting_step ?p - person ?loc - location ?start - time ?end - time)
  )

  (:action wait
    :parameters (?from_t - time ?to_t - time)
    :precondition (and
      (current_time ?from_t)
      (wait_step ?from_t ?to_t)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?start - time ?end - time)
    :precondition (and
      (at ?from)
      (current_time ?start)
      (connected ?from ?to)
      (travel_step ?from ?to ?start ?end)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?start))
      (current_time ?end)
    )
  )

  (:action meet_person
    :parameters (?p - person ?loc - location ?start - time ?end - time)
    :precondition (and
      (at ?loc)
      (current_time ?start)
      (meeting_step ?p ?loc ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
      (not (current_time ?start))
      (current_time ?end)
    )
  )
)