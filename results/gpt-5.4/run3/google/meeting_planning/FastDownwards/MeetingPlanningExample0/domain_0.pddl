(define (domain sf_day_meeting_stephanie)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (person_at ?p - person ?l - location)
    (current_time ?t - timepoint)
    (travel_edge ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (wait_edge ?l - location ?t1 - timepoint ?t2 - timepoint)
    (available_for_meeting ?p - person ?l - location ?start - timepoint ?end - timepoint)
    (met_minimum ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (travel_edge ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (wait_edge ?l ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_minimum_duration
    :parameters (?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?t1)
      (available_for_meeting ?p ?l ?t1 ?t2)
      (not (met_minimum ?p))
    )
    :effect (and
      (met_minimum ?p)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )
)