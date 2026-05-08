(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at_loc ?l - location)
    (at_time ?t - time)
    (met ?p - person)
    (can_move ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_wait ?l - location ?t1 ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time)
  )

  (:action move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?from) (at_time ?t1) (can_move ?from ?to ?t1 ?t2))
    :effect (and (not (at_loc ?from)) (at_loc ?to) (not (at_time ?t1)) (at_time ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?l) (at_time ?t1) (can_wait ?l ?t1 ?t2))
    :effect (and (not (at_time ?t1)) (at_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?l) (at_time ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (met ?p) (not (at_time ?t1)) (at_time ?t2))
  )
)