(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (has_met ?p - person)
    (link ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (time_next ?t1 - time ?t2 - time)
    (available_to_meet ?p - person ?l - location ?t_start - time ?t_end - time)
  )

  (:action move
    :parameters (?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l1) (current_time ?t1) (link ?l1 ?l2 ?t1 ?t2))
    :effect (and (not (at ?l1)) (at ?l2) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (current_time ?t1) (time_next ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (current_time ?t1) (available_to_meet ?p ?l ?t1 ?t2))
    :effect (and (has_met ?p) (not (current_time ?t1)) (current_time ?t2))
  )
)