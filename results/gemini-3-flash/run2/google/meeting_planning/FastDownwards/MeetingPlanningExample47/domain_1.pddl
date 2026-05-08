(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types
    location
    time
    person
  )
  (:predicates
    (at ?l - location ?t - time)
    (met ?p - person)
    (travel_possible ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (wait_possible ?l - location ?t1 - time ?t2 - time)
    (meet_possible ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  ;; Move the agent between locations across a specific time interval.
  (:action travel
    :parameters (?l1 ?l2 - location ?t1 ?t2 - time)
    :precondition (and (at ?l1 ?t1) (travel_possible ?l1 ?l2 ?t1 ?t2))
    :effect (and (at ?l2 ?t2) (not (at ?l1 ?t1)))
  )

  ;; Wait at a location to transition between time points.
  (:action wait
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l ?t1) (wait_possible ?l ?t1 ?t2))
    :effect (and (at ?l ?t2) (not (at ?l ?t1)))
  )

  ;; Meet a person at a specific location and time interval.
  (:action meet
    :parameters (?p - person ?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l ?t1) (meet_possible ?p ?l ?t1 ?t2))
    :effect (and (met ?p) (at ?l ?t2) (not (at ?l ?t1)))
  )
)