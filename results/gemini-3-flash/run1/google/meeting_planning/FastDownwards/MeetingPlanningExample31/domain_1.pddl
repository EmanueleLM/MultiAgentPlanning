(define (domain meeting_planning_example_31)
  (:requirements :strips :typing)
  (:types
    location
    time
    person
  )

  (:predicates
    (at_location ?l - location)
    (at_time ?t - time)
    (met ?p - person)
    (travel_possible ?from - location ?to - location ?t1 - time ?t2 - time)
    (meeting_possible ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
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

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at_location ?l)
      (at_time ?t1)
      (meeting_possible ?p ?l ?t1 ?t2)
    )
    :effect (and
      (not (at_time ?t1))
      (at_time ?t2)
      (met ?p)
    )
  )
)