(define (domain meet_jessica_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (road ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_time_10 ?from - location ?to - location ?depart - time ?arrive - time)
    (available ?p - person ?t - time)
    (person_at ?p - person ?l - location)
    (meeting_started ?p - person ?t - time)
    (met_minimum ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (road ?from ?to)
      (travel_time_10 ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting
    :parameters (?p - person ?l - location ?t - time)
    :precondition (and
      (current_time ?t)
      (at ?l)
      (person_at ?p ?l)
      (available ?p ?t)
      (not (meeting_started ?p ?t))
    )
    :effect (and
      (meeting_started ?p ?t)
    )
  )

  (:action complete_60min_meeting
    :parameters (?p - person ?l - location ?t_start - time ?t_end - time)
    :precondition (and
      (meeting_started ?p ?t_start)
      (current_time ?t_end)
      (at ?l)
      (person_at ?p ?l)
      (available ?p ?t_start)
      (available ?p ?t_end)
    )
    :effect (and
      (met_minimum ?p)
    )
  )
)