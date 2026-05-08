(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time)
  (:predicates
    (at ?l - location ?t - time)
    (next ?t1 ?t2 - time)
    (can_travel ?from ?to - location ?t1 ?t2 - time)
    (can_meet_margaret ?l - location ?t1 ?t2 - time)
    (met_margaret)
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l ?t1) (next ?t1 ?t2))
    :effect (and (not (at ?l ?t1)) (at ?l ?t2))
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from ?t1)) (at ?to ?t2))
  )

  (:action meet_margaret
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l ?t1) (can_meet_margaret ?l ?t1 ?t2))
    :effect (and (not (at ?l ?t1)) (at ?l ?t2) (met_margaret))
  )
)