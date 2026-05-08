(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time count)
  (:constants chinatown nob_hill - location)
  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met_duration ?c - count)
    (next_time ?t1 ?t2 - time)
    (next_count ?c1 ?c2 - count)
    (joseph_at_nob_hill ?t - time)
    (dist8 ?t1 ?t2 - time)
    (dist6 ?t1 ?t2 - time)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (next_time ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action travel_to_nob_hill
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at chinatown) (current_time ?t1) (dist8 ?t1 ?t2))
    :effect (and (not (at chinatown)) (at nob_hill) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action travel_to_chinatown
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at nob_hill) (current_time ?t1) (dist6 ?t1 ?t2))
    :effect (and (not (at nob_hill)) (at chinatown) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet_joseph
    :parameters (?t1 - time ?t2 - time ?c1 - count ?c2 - count)
    :precondition (and (at nob_hill) (current_time ?t1) (next_time ?t1 ?t2) (joseph_at_nob_hill ?t1) (met_duration ?c1) (next_count ?c1 ?c2))
    :effect (and (not (current_time ?t1)) (current_time ?t2) (not (met_duration ?c1)) (met_duration ?c2))
  )
)