(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location person timepoint)
  (:predicates
    (at_loc ?l - location)
    (time_at ?t - timepoint)
    (met ?p - person)
    (can_travel ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (can_wait ?t1 - timepoint ?t2 - timepoint)
    (available ?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
  )

  (:action move
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at_loc ?from) (time_at ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at_loc ?from)) (at_loc ?to) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at_loc ?l) (time_at ?t1) (can_wait ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (at_loc ?l) (time_at ?t1) (available ?p ?l ?t1 ?t2))
    :effect (and (met ?p) (not (time_at ?t1)) (time_at ?t2))
  )
)