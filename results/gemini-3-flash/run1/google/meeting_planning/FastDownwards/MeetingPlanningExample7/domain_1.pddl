(define (domain meeting_planning)
  (:requirements :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (time-at ?t - time)
    (met ?p - person)
    (can-travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (can-wait ?l - location ?t1 ?t2 - time)
    (can-meet ?p - person ?l - location ?t1 ?t2 - time)
  )

  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - time)
    :precondition (and (at ?from) (time-at ?t1) (can-travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (time-at ?t1)) (time-at ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l) (time-at ?t1) (can-wait ?l ?t1 ?t2))
    :effect (and (not (time-at ?t1)) (time-at ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start ?t_end - time)
    :precondition (and (at ?l) (time-at ?t_start) (can-meet ?p ?l ?t_start ?t_end))
    :effect (and (not (time-at ?t_start)) (time-at ?t_end) (met ?p))
  )
)