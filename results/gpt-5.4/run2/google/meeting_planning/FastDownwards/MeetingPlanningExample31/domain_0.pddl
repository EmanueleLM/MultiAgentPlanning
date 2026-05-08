(define (domain meet_friend_sf_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (available_for_meeting ?p - person ?l - location ?start - time ?end - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_edge ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_minimum_duration
    :parameters (?p - person ?l - location ?start - time ?end - time)
    :precondition (and
      (at ?l)
      (current_time ?start)
      (available_for_meeting ?p ?l ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
      (not (current_time ?start))
      (current_time ?end)
    )
  )
)