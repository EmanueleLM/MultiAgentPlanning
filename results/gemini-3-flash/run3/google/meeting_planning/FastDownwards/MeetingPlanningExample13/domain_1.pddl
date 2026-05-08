(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time_point)

  (:predicates
    (at_location ?l - location)
    (at_time ?t - time_point)
    (can_travel ?from - location ?to - location ?t1 - time_point ?t2 - time_point)
    (can_meet_betty ?l - location ?t1 - time_point ?t2 - time_point)
    (met_betty)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - time_point ?t_end - time_point)
    :precondition (and (at_location ?from) (at_time ?t_start) (can_travel ?from ?to ?t_start ?t_end))
    :effect (and (not (at_location ?from)) (at_location ?to) (not (at_time ?t_start)) (at_time ?t_end))
  )

  (:action meet_betty
    :parameters (?l - location ?t_start - time_point ?t_end - time_point)
    :precondition (and (at_location ?l) (at_time ?t_start) (can_meet_betty ?l ?t_start ?t_end))
    :effect (and (not (at_time ?t_start)) (at_time ?t_end) (met_betty))
  )
)