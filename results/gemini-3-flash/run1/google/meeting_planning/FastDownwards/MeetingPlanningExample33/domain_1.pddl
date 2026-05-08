(define (domain meeting_planning)
  (:requirements :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at_me ?l - location)
    (time_at ?t - time)
    (met_sarah)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_wait ?t1 ?t2 - time)
    (can_meet_sarah ?l - location ?t1 ?t2 - time)
  )

  (:action travel
    :parameters (?l1 ?l2 - location ?t1 ?t2 - time)
    :precondition (and (at_me ?l1) (time_at ?t1) (can_travel ?l1 ?l2 ?t1 ?t2))
    :effect (and (not (at_me ?l1)) (at_me ?l2) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action wait
    :parameters (?t1 ?t2 - time)
    :precondition (and (time_at ?t1) (can_wait ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2))
  )

  (:action meet_sarah
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and (at_me ?l) (time_at ?t1) (can_meet_sarah ?l ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2) (met_sarah))
  )
)