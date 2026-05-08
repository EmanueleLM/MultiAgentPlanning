(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (has_met ?p - person)
    (can_travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l1) (time_at ?t1) (can_travel ?l1 ?l2 ?t1 ?t2))
    :effect (and (not (at ?l1)) (at ?l2) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (time_at ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (has_met ?p) (not (time_at ?t1)) (time_at ?t2))
  )
)