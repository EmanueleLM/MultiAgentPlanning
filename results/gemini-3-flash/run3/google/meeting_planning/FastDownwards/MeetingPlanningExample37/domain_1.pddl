(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time_step person)
  (:predicates
    (at ?l - location)
    (current_time ?t - time_step)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time_step)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time_step)
    (next ?t1 ?t2 - time_step)
    (met ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time_step ?t2 - time_step)
    :precondition (and (at ?from) (current_time ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait
    :parameters (?t1 - time_step ?t2 - time_step)
    :precondition (and (current_time ?t1) (next ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time_step ?t2 - time_step)
    :precondition (and (at ?l) (current_time ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (met ?p) (not (current_time ?t1)) (current_time ?t2))
  )
)