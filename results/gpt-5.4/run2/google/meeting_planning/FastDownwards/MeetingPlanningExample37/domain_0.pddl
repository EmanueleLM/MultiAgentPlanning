(define (domain meet_jeffrey_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (connected ?from - location ?to - location)
    (travel_reaches_by ?from - location ?to - location ?start - timepoint ?end - timepoint)
    (available ?p - person ?start - timepoint ?end - timepoint)
    (person_at ?p - person ?l - location)
    (met_minimum ?p - person)
  )

  (:action advance_time
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current_time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_reaches_by ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_minimum_interval
    :parameters (?p - person ?l - location ?t_start - timepoint ?t_end - timepoint)
    :precondition (and
      (current_time ?t_start)
      (at ?l)
      (person_at ?p ?l)
      (available ?p ?t_start ?t_end)
      (not (met_minimum ?p))
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (met_minimum ?p)
    )
  )
)