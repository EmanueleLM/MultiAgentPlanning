(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (time_at ?t - time)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_wait ?t1 ?t2 - time)
    (can_meet ?p1 ?p2 - person ?l - location ?t1 ?t2 - time)
    (has_met ?p1 ?p2 - person)
  )

  (:action travel
    :parameters (?p - person ?l1 ?l2 - location ?t1 ?t2 - time)
    :precondition (and (at ?p ?l1) (time_at ?t1) (can_travel ?l1 ?l2 ?t1 ?t2))
    :effect (and (not (at ?p ?l1)) (at ?p ?l2) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 ?t2 - time)
    :precondition (and (at ?p ?l) (time_at ?t1) (can_wait ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2))
  )

  (:action meet
    :parameters (?p1 ?p2 - person ?l - location ?t1 ?t2 - time)
    :precondition (and (at ?p1 ?l) (time_at ?t1) (can_meet ?p1 ?p2 ?l ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2) (has_met ?p1 ?p2))
  )
)