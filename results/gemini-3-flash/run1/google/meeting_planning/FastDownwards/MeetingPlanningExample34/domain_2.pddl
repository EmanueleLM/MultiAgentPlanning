(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at_location ?l - location)
    (current_time ?t - time)
    (can_wait ?t_from - time ?t_to - time)
    (can_travel ?from - location ?t_start - time ?to - location ?t_end - time)
    (can_meet_thomas ?loc - location ?t_start - time ?t_end - time)
    (has_met_thomas)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and (at_location ?from) (current_time ?t_start) (can_travel ?from ?t_start ?to ?t_end))
    :effect (and (not (at_location ?from)) (at_location ?to) (not (current_time ?t_start)) (current_time ?t_end))
  )

  (:action wait
    :parameters (?t_from - time ?t_to - time)
    :precondition (and (current_time ?t_from) (can_wait ?t_from ?t_to))
    :effect (and (not (current_time ?t_from)) (current_time ?t_to))
  )

  (:action meet_thomas
    :parameters (?loc - location ?t_start - time ?t_end - time)
    :precondition (and (at_location ?loc) (current_time ?t_start) (can_meet_thomas ?loc ?t_start ?t_end))
    :effect (and (not (current_time ?t_start)) (current_time ?t_end) (has_met_thomas))
  )
)