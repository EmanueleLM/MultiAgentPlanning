(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types
    location
    timepoint
    person
  )
  (:predicates
    (at_location ?l - location)
    (at_time ?t - timepoint)
    (next ?t1 ?t2 - timepoint)
    (travel_possible ?from ?to - location ?t1 ?t2 - timepoint)
    (can_meet ?p - person ?l - location ?t1 ?t2 - timepoint)
    (met ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at_location ?from)
      (at_time ?t1)
      (travel_possible ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at_location ?from))
      (at_location ?to)
      (not (at_time ?t1))
      (at_time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at_location ?l)
      (at_time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at_time ?t1))
      (at_time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at_location ?l)
      (at_time ?t1)
      (can_meet ?p ?l ?t1 ?t2)
    )
    :effect (and
      (not (at_time ?t1))
      (at_time ?t2)
      (met ?p)
    )
  )
)