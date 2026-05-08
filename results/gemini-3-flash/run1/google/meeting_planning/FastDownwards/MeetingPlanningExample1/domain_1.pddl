(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location timepoint friend)
  (:predicates
    (at ?l - location)
    (time_at ?t - timepoint)
    (met ?f - friend)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - timepoint)
    (can_wait ?t1 ?t2 - timepoint)
    (can_meet ?f - friend ?l - location ?t1 ?t2 - timepoint)
  )

  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - timepoint)
    :precondition (and (at ?from) (time_at ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action wait
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and (time_at ?t1) (can_wait ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2))
  )

  (:action meet
    :parameters (?f - friend ?l - location ?t1 ?t2 - timepoint)
    :precondition (and (at ?l) (time_at ?t1) (can_meet ?f ?l ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2) (met ?f))
  )
)