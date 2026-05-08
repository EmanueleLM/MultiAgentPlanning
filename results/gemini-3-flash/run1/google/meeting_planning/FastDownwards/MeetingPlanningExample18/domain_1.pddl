(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person count)
  (:predicates
    (at_loc ?l - location)
    (at_time ?t - time)
    (next_time ?t1 ?t2 - time)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (person_at ?p - person ?l - location ?t1 ?t2 - time)
    (met_count ?p - person ?n - count)
    (next_count ?n1 ?n2 - count)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?from) (at_time ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at_loc ?from)) (at_loc ?to) (not (at_time ?t1)) (at_time ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?l) (at_time ?t1) (next_time ?t1 ?t2))
    :effect (and (not (at_time ?t1)) (at_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time ?n1 - count ?n2 - count)
    :precondition (and (at_loc ?l) (at_time ?t1) (next_time ?t1 ?t2) (person_at ?p ?l ?t1 ?t2) (met_count ?p ?n1) (next_count ?n1 ?n2))
    :effect (and (not (at_time ?t1)) (at_time ?t2) (not (met_count ?p ?n1)) (met_count ?p ?n2))
  )
)