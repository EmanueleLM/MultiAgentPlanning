(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (can_travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (can_wait ?t1 - time ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 - time ?t2 - time)
    (met ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from) (current_time ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (can_wait ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (current_time ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2) (met ?p))
  )
)