(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at_me ?l - location)
    (time_at ?t - time)
    (next ?t1 ?t2 - time)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (at_person ?p - person ?l - location ?t - time)
    (meeting_started ?p - person ?t_start - time)
    (is_90_min_gap ?t_start ?t_end - time)
    (has_met ?p - person)
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_me ?l) (time_at ?t1) (next ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2))
  )

  (:action travel
    :parameters (?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    :precondition (and (at_me ?l1) (time_at ?t1) (can_travel ?l1 ?l2 ?t1 ?t2))
    :effect (and (not (at_me ?l1)) (at_me ?l2) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action start_meeting
    :parameters (?p - person ?l - location ?t - time)
    :precondition (and (at_me ?l) (time_at ?t) (at_person ?p ?l ?t))
    :effect (and (meeting_started ?p ?t))
  )

  (:action complete_meeting
    :parameters (?p - person ?l - location ?t_start - time ?t_end - time)
    :precondition (and (at_me ?l) (time_at ?t_end) (meeting_started ?p ?t_start) (at_person ?p ?l ?t_end) (is_90_min_gap ?t_start ?t_end))
    :effect (and (has_met ?p))
  )
)