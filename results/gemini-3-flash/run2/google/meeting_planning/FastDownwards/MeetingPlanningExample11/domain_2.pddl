(define (domain meeting_planning_example_11)
  (:requirements :strips :typing)
  (:types location time_point)
  (:predicates
    (at_location ?l - location)
    (time_at ?t - time_point)
    (next ?t1 ?t2 - time_point)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time_point)
    (can_meet_carol ?l - location ?t1 ?t2 - time_point)
    (met_carol)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time_point ?t2 - time_point)
    :precondition (and (at_location ?from) (time_at ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and
      (not (at_location ?from))
      (at_location ?to)
      (not (time_at ?t1))
      (time_at ?t2)
    )
  )

  (:action wait
    :parameters (?t1 - time_point ?t2 - time_point)
    :precondition (and (time_at ?t1) (next ?t1 ?t2))
    :effect (and
      (not (time_at ?t1))
      (time_at ?t2)
    )
  )

  (:action meet_carol
    :parameters (?l - location ?t1 - time_point ?t2 - time_point)
    :precondition (and (at_location ?l) (time_at ?t1) (can_meet_carol ?l ?t1 ?t2))
    :effect (and
      (not (time_at ?t1))
      (time_at ?t2)
      (met_carol)
    )
  )
)