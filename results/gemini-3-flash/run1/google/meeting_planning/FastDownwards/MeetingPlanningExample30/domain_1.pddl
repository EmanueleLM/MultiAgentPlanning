(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (travel_possible ?from - location ?to - location ?t1 - time ?t2 - time)
    (wait_possible ?l - location ?t1 - time ?t2 - time)
    (meet_possible ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?from) (current_time ?t1) (travel_possible ?from ?to ?t1 ?t2))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?l) (current_time ?t1) (wait_possible ?l ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?me - person ?friend - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?me ?l) (at ?friend ?l) (current_time ?t1) (meet_possible ?friend ?l ?t1 ?t2))
    :effect (and (met ?friend) (not (current_time ?t1)) (current_time ?t2))
  )
)