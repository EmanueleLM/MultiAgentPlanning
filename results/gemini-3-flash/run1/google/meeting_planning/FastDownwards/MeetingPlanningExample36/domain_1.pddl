(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (time ?t - time)
    (has_met ?p - person)
    (can_travel ?from ?to - location ?t1 ?t2 - time)
    (can_wait ?l - location ?t1 ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time)
  )

  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - time)
    :precondition (and (at ?from) (time ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (time ?t1)) (time ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l) (time ?t1) (can_wait ?l ?t1 ?t2))
    :effect (and (not (time ?t1)) (time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l) (time ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (not (time ?t1)) (time ?t2) (has_met ?p))
  )
)