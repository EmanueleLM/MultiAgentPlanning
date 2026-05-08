(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (time ?t - time)
    (has_met ?p - person)
    (can_travel ?l1 - location ?l2 - location ?t_start - time ?t_end - time)
    (can_wait ?t_start - time ?t_end - time)
    (can_meet ?p - person ?l - location ?t_start - time ?t_end - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and (at ?from) (time ?t_start) (can_travel ?from ?to ?t_start ?t_end))
    :effect (and (not (at ?from)) (at ?to) (not (time ?t_start)) (time ?t_end))
  )

  (:action wait
    :parameters (?l - location ?t_start - time ?t_end - time)
    :precondition (and (at ?l) (time ?t_start) (can_wait ?t_start ?t_end))
    :effect (and (not (time ?t_start)) (time ?t_end))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start - time ?t_end - time)
    :precondition (and (at ?l) (time ?t_start) (can_meet ?p ?l ?t_start ?t_end))
    :effect (and (has_met ?p) (not (time ?t_start)) (time ?t_end))
  )
)