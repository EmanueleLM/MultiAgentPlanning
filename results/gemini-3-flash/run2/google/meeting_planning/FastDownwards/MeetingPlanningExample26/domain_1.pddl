(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at_loc ?l - location)
    (at_time ?t - time)
    (can_travel ?from - location ?to - location ?t1 - time ?t2 - time)
    (can_wait ?t1 - time ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 - time ?t2 - time)
    (has_met ?p - person)
  )

  (:action travel
    :parameters (?f - location ?t - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?f) (at_time ?t1) (can_travel ?f ?t ?t1 ?t2))
    :effect (and (not (at_loc ?f)) (at_loc ?t) (not (at_time ?t1)) (at_time ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?l) (at_time ?t1) (can_wait ?t1 ?t2))
    :effect (and (not (at_time ?t1)) (at_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?l) (at_time ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (not (at_time ?t1)) (at_time ?t2) (has_met ?p))
  )
)