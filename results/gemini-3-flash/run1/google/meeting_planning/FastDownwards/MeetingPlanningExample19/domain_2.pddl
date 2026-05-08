(define (domain meeting_planning_example_19)
  (:requirements :strips :typing)
  (:types
    location
    person
    time
  )
  (:predicates
    (at_location ?l - location)
    (current_time ?t - time)
    (has_met ?p - person)
    (travel_possible ?from - location ?to - location ?t1 - time ?t2 - time)
    (wait_possible ?t1 - time ?t2 - time)
    (meeting_possible ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - time)
    :precondition (and
      (at_location ?from)
      (current_time ?t1)
      (travel_possible ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at_location ?from))
      (at_location ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and
      (at_location ?l)
      (current_time ?t1)
      (wait_possible ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 ?t2 - time)
    :precondition (and
      (at_location ?l)
      (current_time ?t1)
      (meeting_possible ?p ?l ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (has_met ?p)
    )
  )
)