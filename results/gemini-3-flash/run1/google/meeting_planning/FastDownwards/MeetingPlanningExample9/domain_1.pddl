(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (time_at ?t - time)
    (met ?p - person)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_wait ?t1 ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time)
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
    :parameters (?me - person ?friend - person ?l - location ?t1 ?t2 - time)
    :precondition (and (at ?me ?l) (at ?friend ?l) (time_at ?t1) (can_meet ?friend ?l ?t1 ?t2))
    :effect (and (met ?friend) (not (time_at ?t1)) (time_at ?t2))
  )
)