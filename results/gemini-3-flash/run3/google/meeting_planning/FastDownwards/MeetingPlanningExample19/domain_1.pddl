(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time)

  (:predicates
    (at_location ?l - location)
    (time_at ?t - time)
    (next ?t1 - time ?t2 - time)
    (can_travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (can_meet_john ?l - location ?t1 - time ?t2 - time)
    (met_john)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and (at_location ?from) (time_at ?t_start) (can_travel ?from ?to ?t_start ?t_end))
    :effect (and (not (at_location ?from)) (at_location ?to) (not (time_at ?t_start)) (time_at ?t_end))
  )

  (:action wait
    :parameters (?t_start - time ?t_end - time)
    :precondition (and (time_at ?t_start) (next ?t_start ?t_end))
    :effect (and (not (time_at ?t_start)) (time_at ?t_end))
  )

  (:action meet_john
    :parameters (?loc - location ?t_start - time ?t_end - time)
    :precondition (and (at_location ?loc) (time_at ?t_start) (can_meet_john ?loc ?t_start ?t_end))
    :effect (and (met_john) (not (time_at ?t_start)) (time_at ?t_end))
  )
)