(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (time_is ?t - time)
    (met ?p - person)
    (can_travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (friend_available ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?from) (time_is ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (not (time_is ?t1)) (time_is ?t2))
  )

  (:action meet
    :parameters (?p - person ?f - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?l) (time_is ?t1) (friend_available ?f ?l ?t1 ?t2))
    :effect (and (met ?f) (not (time_is ?t1)) (time_is ?t2))
  )
)