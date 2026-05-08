(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time_point)
  (:constants
    fishermans_wharf nob_hill - location
  )
  (:predicates
    (at ?l - location)
    (time ?t - time_point)
    (next ?t1 ?t2 - time_point)
    (move_time ?l1 ?l2 - location ?t1 ?t2 - time_point)
    (meet_time ?t1 ?t2 - time_point)
    (met_stephanie)
  )

  (:action move
    :parameters (?from - location ?to - location ?t1 - time_point ?t2 - time_point)
    :precondition (and (at ?from) (time ?t1) (move_time ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (time ?t1)) (time ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 - time_point ?t2 - time_point)
    :precondition (and (at ?l) (time ?t1) (next ?t1 ?t2))
    :effect (and (not (time ?t1)) (time ?t2))
  )

  (:action meet_stephanie
    :parameters (?t1 - time_point ?t2 - time_point)
    :precondition (and (at nob_hill) (time ?t1) (meet_time ?t1 ?t2))
    :effect (and (not (time ?t1)) (time ?t2) (met_stephanie))
  )
)