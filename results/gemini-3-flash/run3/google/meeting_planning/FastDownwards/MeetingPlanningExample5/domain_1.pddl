(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (time_at ?t - time)
    (met ?p - person)
    (travel_leg ?l1 ?l2 - location ?t1 ?t2 - time)
    (wait_leg ?l - location ?t1 ?t2 - time)
    (meeting_leg ?p - person ?l - location ?t1 ?t2 - time)
  )

  (:action travel
    :parameters (?p - person ?src ?dst - location ?t1 ?t2 - time)
    :precondition (and (at ?p ?src) (time_at ?t1) (travel_leg ?src ?dst ?t1 ?t2))
    :effect (and (not (at ?p ?src)) (at ?p ?dst) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 ?t2 - time)
    :precondition (and (at ?p ?l) (time_at ?t1) (wait_leg ?l ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2))
  )

  (:action meet
    :parameters (?me ?friend - person ?l - location ?t1 ?t2 - time)
    :precondition (and (at ?me ?l) (time_at ?t1) (meeting_leg ?friend ?l ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2) (met ?friend))
  )
)