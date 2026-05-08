(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time_point)
  (:predicates
    (at ?l - location)
    (current_time ?t - time_point)
    (next_time ?t1 ?t2 - time_point)
    (is_meeting ?t1 ?t2 - time_point)
    (connected ?l1 ?l2 - location)
    (met_stephanie)
  )

  (:action move
    :parameters (?from - location ?to - location ?t - time_point)
    :precondition (and (at ?from) (current_time ?t) (connected ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  (:action wait
    :parameters (?t1 - time_point ?t2 - time_point)
    :precondition (and (current_time ?t1) (next_time ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet_stephanie
    :parameters (?t1 - time_point ?t2 - time_point)
    :precondition (and (at nob_hill) (current_time ?t1) (is_meeting ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2) (met_stephanie))
  )
)