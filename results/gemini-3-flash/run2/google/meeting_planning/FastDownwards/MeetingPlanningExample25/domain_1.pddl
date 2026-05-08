(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time)

  (:predicates
    (at_location ?l - location)
    (at_time ?t - time)
    (can_travel ?from - location ?to - location ?t_start - time ?t_arrival - time)
    (can_wait ?t_start - time ?t_end - time)
    (can_meet_david ?l - location ?t_start - time ?t_end - time)
    (has_met_david)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at_location ?from) (at_time ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at_location ?from)) (at_location ?to) (not (at_time ?t1)) (at_time ?t2))
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at_time ?t1) (can_wait ?t1 ?t2))
    :effect (and (not (at_time ?t1)) (at_time ?t2))
  )

  (:action meet_david
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_location ?l) (at_time ?t1) (can_meet_david ?l ?t1 ?t2))
    :effect (and (not (at_time ?t1)) (at_time ?t2) (has_met_david))
  )
)