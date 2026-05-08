(define (domain meet_stephanie_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (connected ?from - location ?to - location)
    (travel_departure ?from - location ?to - location ?t_from - timepoint ?t_to - timepoint)
    (person_at ?p - person ?l - location)
    (available_start ?p - person ?t - timepoint)
    (available_end ?p - person ?t - timepoint)
    (meeting ?p - person)
    (met_minimum ?p - person)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (minimum_meeting_interval ?p - person ?t1 - timepoint ?t2 - timepoint)
  )

  (:action wait_to_next
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
      (not (meeting stephanie))
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_from - timepoint ?t_to - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?t_from)
      (connected ?from ?to)
      (travel_departure ?from ?to ?t_from ?t_to)
      (not (meeting stephanie))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t_from))
      (current_time ?t_to)
    )
  )

  (:action start_meeting
    :parameters (?p - person ?l - location ?t - timepoint)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?t)
      (available_start ?p ?t)
      (not (meeting ?p))
    )
    :effect (and
      (meeting ?p)
    )
  )

  (:action complete_minimum_meeting
    :parameters (?p - person ?t_start - timepoint ?t_end - timepoint ?l - location)
    :precondition (and
      (meeting ?p)
      (at ?l)
      (person_at ?p ?l)
      (current_time ?t_start)
      (minimum_meeting_interval ?p ?t_start ?t_end)
      (available_end ?p ?t_end)
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (met_minimum ?p)
      (not (meeting ?p))
    )
  )
)