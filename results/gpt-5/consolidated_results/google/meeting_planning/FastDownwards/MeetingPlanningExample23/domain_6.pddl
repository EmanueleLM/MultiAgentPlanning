(define (domain meetingplanningexample23-strips-dt)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location)
    (current ?t - time)
    (succ ?t1 - time ?t2 - time)
    (plus23 ?t1 - time ?t2 - time)
    (plus75 ?t1 - time ?t2 - time)
    (edge-23 ?from - location ?to - location)
    (john-location ?l - location)
    (can-meet-start ?t - time)
    (met-john)
  )

  (:action wait-23
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current ?t1) (plus23 ?t1 ?t2))
    :effect (and (not (current ?t1)) (current ?t2))
  )

  (:action wait-1
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current ?t1) (succ ?t1 ?t2))
    :effect (and (not (current ?t1)) (current ?t2))
  )

  (:action travel-23
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (edge-23 ?from ?to)
      (current ?t1)
      (plus23 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?t1))
      (current ?t2)
    )
  )

  (:action meet-75
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc)
      (john-location ?loc)
      (current ?t1)
      (plus75 ?t1 ?t2)
      (can-meet-start ?t1)
      (not (met-john))
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
      (met-john)
    )
  )
)