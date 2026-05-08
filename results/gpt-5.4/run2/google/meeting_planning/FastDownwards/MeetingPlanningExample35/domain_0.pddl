(define (domain san_francisco_meet_jason)
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
    (travel_slot ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (wait_slot ?l - location ?t1 - timepoint ?t2 - timepoint)
    (available_for_meeting ?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    (met_minimum ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_slot ?from ?to ?t1 ?t2)
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
      (wait_slot ?l ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_for_minimum
    :parameters (?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?l)
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