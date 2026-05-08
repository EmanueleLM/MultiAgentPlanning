(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (met ?p - person)
    (path ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (can_meet ?p - person ?l - location ?t_start - time ?t_end - time)
  )

  ;; Movement action between locations representing travel time
  (:action move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from) (time_at ?t1) (path ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (time_at ?t1)) (time_at ?t2))
  )

  ;; Meeting action representing the duration spent with a friend
  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (time_at ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (met ?p) (not (time_at ?t1)) (time_at ?t2))
  )
)