(define (domain meeting_planning)
  (:requirements :typing :negative-preconditions)
  (:types time location)

  (:constants
    chinatown russian_hill - location
  )

  (:predicates
    (current_time ?t - time)
    (at ?l - location)
    (met_ronald)
    (can_travel_cr ?t1 ?t2 - time)
    (can_travel_rc ?t1 ?t2 - time)
    (can_wait ?t1 ?t2 - time)
    (can_meet ?ts ?te - time)
  )

  (:action travel_chinatown_to_russian_hill
    :parameters (?t1 ?t2 - time)
    :precondition (and (current_time ?t1) (at chinatown) (can_travel_cr ?t1 ?t2))
    :effect (and
      (not (current_time ?t1)) (current_time ?t2)
      (not (at chinatown)) (at russian_hill)
    )
  )

  (:action travel_russian_hill_to_chinatown
    :parameters (?t1 ?t2 - time)
    :precondition (and (current_time ?t1) (at russian_hill) (can_travel_rc ?t1 ?t2))
    :effect (and
      (not (current_time ?t1)) (current_time ?t2)
      (not (at russian_hill)) (at chinatown)
    )
  )

  (:action wait_one_step
    :parameters (?t1 ?t2 - time)
    :precondition (and (current_time ?t1) (can_wait ?t1 ?t2))
    :effect (and
      (not (current_time ?t1)) (current_time ?t2)
    )
  )

  (:action meet_ronald
    :parameters (?ts ?te - time)
    :precondition (and (current_time ?ts) (at russian_hill) (can_meet ?ts ?te))
    :effect (and
      (not (current_time ?ts)) (current_time ?te)
      (met_ronald) (at russian_hill)
    )
  )
)