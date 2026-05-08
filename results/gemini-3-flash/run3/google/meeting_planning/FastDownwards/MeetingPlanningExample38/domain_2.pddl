(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time friend)
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (has_met ?f - friend)
    (can_wait ?l - location ?t_start ?t_end - time)
    (can_travel ?l1 ?l2 - location ?t_start ?t_end - time)
    (can_meet ?f - friend ?l - location ?t_start ?t_end - time)
  )

  (:action wait
    :parameters (?l - location ?t_start ?t_end - time)
    :precondition (and (at ?l) (time_at ?t_start) (can_wait ?l ?t_start ?t_end))
    :effect (and (not (time_at ?t_start)) (time_at ?t_end))
  )

  (:action travel
    :parameters (?l1 ?l2 - location ?t_start ?t_end - time)
    :precondition (and (at ?l1) (time_at ?t_start) (can_travel ?l1 ?l2 ?t_start ?t_end))
    :effect (and (not (at ?l1)) (at ?l2) (not (time_at ?t_start)) (time_at ?t_end))
  )

  (:action meet
    :parameters (?f - friend ?l - location ?t_start ?t_end - time)
    :precondition (and (at ?l) (time_at ?t_start) (can_meet ?f ?l ?t_start ?t_end))
    :effect (and (has_met ?f) (not (time_at ?t_start)) (time_at ?t_end))
  )
)