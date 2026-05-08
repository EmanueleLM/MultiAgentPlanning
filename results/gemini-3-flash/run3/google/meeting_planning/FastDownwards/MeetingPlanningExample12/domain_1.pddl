(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (can_move ?l1 ?l2 - location ?t1 ?t2 - time)
    (next ?t1 ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time)
  )

  (:action move
    :parameters (?from ?to - location ?t1 ?t2 - time)
    :precondition (and (at ?from) (current_time ?t1) (can_move ?from ?to ?t1 ?t2))
    :effect (and (at ?to) (not (at ?from)) (current_time ?t2) (not (current_time ?t1)))
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l) (current_time ?t1) (next ?t1 ?t2))
    :effect (and (current_time ?t2) (not (current_time ?t1)))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l) (current_time ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (met ?p) (current_time ?t2) (not (current_time ?t1)))
  )
)