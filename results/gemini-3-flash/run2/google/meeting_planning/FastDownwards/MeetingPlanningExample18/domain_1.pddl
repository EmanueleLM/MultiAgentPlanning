(define (domain meeting_planning_example_18)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location ?t - time)
    (met ?p - person)
    (can_wait ?l - location ?t1 - time ?t2 - time)
    (can_travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l ?t1) (can_wait ?l ?t1 ?t2))
    :effect (and (not (at ?l ?t1)) (at ?l ?t2))
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from ?t1)) (at ?to ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (not (at ?l ?t1)) (at ?l ?t2) (met ?p))
  )
)