(define (domain meeting_planning)
  (:requirements :typing :strips)
  (:types location timepoint person)
  (:predicates
    (at_location ?l - location)
    (current_time ?t - timepoint)
    (met ?p - person)
    (can_travel ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (can_wait ?loc - location ?t1 - timepoint ?t2 - timepoint)
    (can_meet ?p - person ?loc - location ?t1 - timepoint ?t2 - timepoint)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at_location ?from) (current_time ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at_location ?from)) (at_location ?to) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait
    :parameters (?loc - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at_location ?loc) (current_time ?t1) (can_wait ?loc ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?loc - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at_location ?loc) (current_time ?t1) (can_meet ?p ?loc ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2) (met ?p))
  )
)