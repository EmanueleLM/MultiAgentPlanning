(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates
    (at_loc ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (next_time ?t1 - time ?t2 - time)
    (travel_possible ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (meeting_possible ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?from) (current_time ?t1) (travel_possible ?from ?to ?t1 ?t2))
    :effect (and (not (at_loc ?from)) (at_loc ?to) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?l) (current_time ?t1) (next_time ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?l) (current_time ?t1) (meeting_possible ?p ?l ?t1 ?t2))
    :effect (and (met ?p) (not (current_time ?t1)) (current_time ?t2))
  )
)