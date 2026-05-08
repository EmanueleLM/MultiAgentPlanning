(define (domain meet_margaret_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent person location timepoint
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - timepoint)
    (connected ?from - location ?to - location)
    (available_to_meet ?p - person ?l - location ?start - timepoint ?end - timepoint)
    (met ?p - person)

    (wait_link ?l - location ?from_t - timepoint ?to_t - timepoint)
    (travel_link ?from_l - location ?to_l - location ?from_t - timepoint ?to_t - timepoint)
  )

  (:action wait
    :parameters (?a - agent ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?a ?l)
      (current_time ?t1)
      (wait_link ?l ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?a ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_link ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_person
    :parameters (?a - agent ?p - person ?l - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?a ?l)
      (current_time ?start)
      (available_to_meet ?p ?l ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)