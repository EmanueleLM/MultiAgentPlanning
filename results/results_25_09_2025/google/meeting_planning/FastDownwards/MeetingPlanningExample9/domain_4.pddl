(define (domain meet-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location)
    (time-is ?t - time)
    (succ9 ?t1 - time ?t2 - time)
    (succ75 ?t1 - time ?t2 - time)
    (succ-wait ?t1 - time ?t2 - time)
    (met)
  )

  (:action travel
    :parameters (?a - agent ?from-l - location ?to-l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from-l) (time-is ?t1) (succ9 ?t1 ?t2))
    :effect (and
      (not (at ?a ?from-l))
      (at ?a ?to-l)
      (not (time-is ?t1))
      (time-is ?t2)
    )
  )

  (:action wait
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and (time-is ?t1) (succ-wait ?t1 ?t2))
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2)
    )
  )

  (:action start-at
    :parameters (?a - agent ?l - location ?t - time)
    :precondition (time-is ?t)
    :effect (at ?a ?l)
  )

  (:action meet
    :parameters (?a1 - agent ?a2 - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a1 ?l) (at ?a2 ?l) (time-is ?t1) (succ75 ?t1 ?t2) (not (met)))
    :effect (and
      (met)
      (not (time-is ?t1))
      (time-is ?t2)
    )
  )
)