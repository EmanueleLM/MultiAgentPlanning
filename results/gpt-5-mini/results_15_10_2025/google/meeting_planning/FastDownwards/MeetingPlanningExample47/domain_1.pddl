(define (domain schedule-meetings)
  (:requirements :typing :negative-preconditions :adl :action-costs)
  (:types person location time duration)
  (:predicates
    (at ?p - person ?l - location)
    (at-time ?t - time)
    (time-add ?t1 - time ?d - duration ?t2 - time)
    (within-paul-availability ?t1 - time ?t2 - time)
    (met-paul)
  )

  (:action travel-richmond-to-nobhill
    :parameters (?tr - person ?t1 - time ?t2 - time)
    :precondition (and
      (at ?tr richmond-district)
      (at-time ?t1)
      (time-add ?t1 dur17 ?t2)
    )
    :effect (and
      (not (at ?tr richmond-district))
      (at ?tr nob-hill)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 0
  )

  (:action wait
    :parameters (?t1 - time ?d - duration ?t2 - time)
    :precondition (and
      (at-time ?t1)
      (time-add ?t1 ?d ?t2)
    )
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 0
  )

  (:action meet-with-paul
    :parameters (?tr - person ?t1 - time ?t2 - time)
    :precondition (and
      (at ?tr nob-hill)
      (at-time ?t1)
      (time-add ?t1 dur15 ?t2)
      (within-paul-availability ?t1 ?t2)
      (not (met-paul))
    )
    :effect (and
      (met-paul)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost -1
  )
)