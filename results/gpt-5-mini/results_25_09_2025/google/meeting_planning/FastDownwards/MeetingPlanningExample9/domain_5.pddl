(define (domain meet-domain)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location)
    (time-is ?t - time)
    (succ9 ?t1 - time ?t2 - time)
    (succ7 ?t1 - time ?t2 - time)
    (succ75 ?t1 - time ?t2 - time)
    (succ-wait ?t1 - time ?t2 - time)
    (travel9 ?from - location ?to - location)
    (travel7 ?from - location ?to - location)
    (available-start ?a - agent ?t - time)
    (met)
  )

  (:action travel-9
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from) (time-is ?t1) (travel9 ?from ?to) (succ9 ?t1 ?t2))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (time-is ?t1))
      (time-is ?t2)
    )
  )

  (:action travel-7
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from) (time-is ?t1) (travel7 ?from ?to) (succ7 ?t1 ?t2))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
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
    :precondition (and (time-is ?t) (available-start ?a ?t))
    :effect (at ?a ?l)
  )

  (:action meet
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and (at traveler ?l) (at mary ?l) (time-is ?t1) (succ75 ?t1 ?t2) (not (met)))
    :effect (and
      (met)
      (not (time-is ?t1))
      (time-is ?t2)
    )
  )
)