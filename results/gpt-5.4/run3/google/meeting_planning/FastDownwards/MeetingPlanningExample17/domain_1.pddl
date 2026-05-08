(define (domain meet_matthew_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_minute ?t1 - time ?t2 - time)
    (travel_arc ?from - location ?to - location ?depart - time ?arrive - time)
    (available ?p - person ?t - time)
    (meeting_started ?p - person)
    (meeting_completion_arc ?p - person ?start - time ?end - time)
    (met ?p - person)
    (is_sunset_district ?l - location)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current_time ?t1)
      (next_minute ?t1 ?t2)
      (at ?l)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_arc ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting
    :parameters (?p - person ?t - time ?l - location)
    :precondition (and
      (at ?l)
      (is_sunset_district ?l)
      (current_time ?t)
      (available ?p ?t)
      (not (meeting_started ?p))
      (not (met ?p))
    )
    :effect (and
      (meeting_started ?p)
    )
  )

  (:action complete_meeting_15
    :parameters (?p - person ?start - time ?end - time ?l - location)
    :precondition (and
      (meeting_started ?p)
      (at ?l)
      (is_sunset_district ?l)
      (current_time ?start)
      (meeting_completion_arc ?p ?start ?end)
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)