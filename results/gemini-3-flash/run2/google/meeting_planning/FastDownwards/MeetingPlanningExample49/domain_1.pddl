(define (domain meeting_planning_sf)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at_me ?l - location)
    (time_at ?t - time)
    (person_at ?p - person ?l - location ?t_start - time ?t_end - time)
    (can_travel ?l1 ?l2 - location ?t_start - time ?t_end - time)
    (can_wait ?t_start - time ?t_end - time)
    (met ?p - person)
  )

  (:action move
    :parameters (?from ?to - location ?t_start ?t_end - time)
    :precondition (and (at_me ?from) (time_at ?t_start) (can_travel ?from ?to ?t_start ?t_end))
    :effect (and (not (at_me ?from)) (at_me ?to) (not (time_at ?t_start)) (time_at ?t_end))
  )

  (:action wait
    :parameters (?l - location ?t_start ?t_end - time)
    :precondition (and (at_me ?l) (time_at ?t_start) (can_wait ?t_start ?t_end))
    :effect (and (not (time_at ?t_start)) (time_at ?t_end))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start ?t_end - time)
    :precondition (and (at_me ?l) (time_at ?t_start) (person_at ?p ?l ?t_start ?t_end))
    :effect (and (not (time_at ?t_start)) (time_at ?t_end) (met ?p))
  )
)