(define (domain meeting_planning_46)
  (:requirements :strips :typing)
  (:types location time friend)
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (next ?t1 ?t2 - time)
    (travel_time ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_meet ?f - friend ?l - location ?t1 ?t2 - time)
    (met ?f - friend)
  )

  (:action travel
    :parameters (?l1 ?l2 - location ?t1 ?t2 - time)
    :precondition (and (at ?l1) (time_at ?t1) (travel_time ?l1 ?l2 ?t1 ?t2))
    :effect (and (not (at ?l1)) (at ?l2) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action wait
    :parameters (?t1 ?t2 - time)
    :precondition (and (time_at ?t1) (next ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2))
  )

  (:action meet
    :parameters (?f - friend ?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l) (time_at ?t1) (can_meet ?f ?l ?t1 ?t2))
    :effect (and (met ?f) (not (time_at ?t1)) (time_at ?t2))
  )
)