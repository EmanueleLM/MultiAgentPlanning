(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (next ?t1 ?t2 - time)
    (travel_time ?from ?to - location ?t1 ?t2 - time)
    (meeting_window ?p - person ?l - location ?t1 ?t2 - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?l) (current_time ?t1) (next ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?from) (current_time ?t1) (travel_time ?from ?to ?t1 ?t2))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?me - person ?friend - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?me ?l) (at ?friend ?l) (current_time ?t1) (meeting_window ?friend ?l ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2) (met ?friend))
  )
)