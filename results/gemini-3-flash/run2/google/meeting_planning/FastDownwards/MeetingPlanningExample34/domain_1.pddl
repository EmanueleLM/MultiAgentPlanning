(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (travel_possible ?from - location ?to - location ?t1 - time ?t2 - time)
    (wait_possible ?l - location ?t1 - time ?t2 - time)
    (meet_possible ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from) (current_time ?t1) (travel_possible ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (current_time ?t1) (wait_possible ?l ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (current_time ?t1) (meet_possible ?p ?l ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2) (met ?p))
  )
)