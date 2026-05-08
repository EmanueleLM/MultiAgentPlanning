(define (domain meet_friend_san_francisco_day)
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
    (next_time ?t1 - time ?t2 - time)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (available_for_meeting ?p - person ?l - location ?start - time ?end - time)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
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

  (:action meet_minimum_60
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