(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (valid_move ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (valid_wait ?l - location ?t1 - time ?t2 - time)
    (valid_meeting ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from) (current_time ?t1) (valid_move ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?loc) (current_time ?t1) (valid_wait ?loc ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?loc) (current_time ?t1) (valid_meeting ?p ?loc ?t1 ?t2))
    :effect (and (met ?p) (not (current_time ?t1)) (current_time ?t2))
  )
)