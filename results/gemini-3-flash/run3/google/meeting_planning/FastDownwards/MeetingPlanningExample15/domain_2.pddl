(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (met ?p - person)
    (can_travel ?from ?to - location ?t1 ?t2 - time)
    (can_wait ?l - location ?t1 ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time)
  )

  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - time)
    :precondition (and (at ?from) (time_at ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l) (time_at ?t1) (can_wait ?l ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l) (time_at ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (met ?p) (not (time_at ?t1)) (time_at ?t2))
  )
)