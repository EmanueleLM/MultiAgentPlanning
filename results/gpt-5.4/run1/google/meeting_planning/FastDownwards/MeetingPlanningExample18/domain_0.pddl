(define (domain meet_friend_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (route_11 ?from - location ?to - location)
    (route_9 ?from - location ?to - location)
    (advance_11 ?from_t - time ?to_t - time)
    (advance_9 ?from_t - time ?to_t - time)
    (person_at ?p - person ?l - location)
    (meeting_start_ok ?p - person ?t - time)
  )

  (:action travel_11
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (route_11 ?from ?to)
      (advance_11 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_9
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (route_9 ?from ?to)
      (advance_9 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_betty
    :parameters (?t - time)
    :precondition (and
      (at richmond_district)
      (current_time ?t)
      (person_at betty richmond_district)
      (meeting_start_ok betty ?t)
      (not (met betty))
    )
    :effect (and
      (met betty)
    )
  )
)