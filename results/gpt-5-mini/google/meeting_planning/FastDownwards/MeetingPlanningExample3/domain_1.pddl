(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (travel-leg ?from - location ?to - location ?t1 - time ?t2 - time)
    (barbara-present ?loc - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (met-with-barbara ?visitor - agent ?tstart - time ?tend - time)
  )

  ;; Travel action: depart at t1 and arrive at t2 according to a declared travel-leg.
  (:action travel
    :parameters (?ag - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag ?from ?t1)
      (travel-leg ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag ?from ?t1))
      (at ?ag ?to ?t2)
    )
  )

  ;; Meeting block action that represents continuous attendance across an explicitly
  ;; declared successor interval. The interval object (succ ?tstart ?tend) must exist
  ;; and barbara must be present at both endpoints; executing this action moves the
  ;; visitor's presence forward from the interval start to its end and records the meeting.
  (:action meet-with-barbara
    :parameters (?visitor - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at ?visitor ?loc ?tstart)
      (barbara-present ?loc ?tstart)
      (barbara-present ?loc ?tend)
      (succ ?tstart ?tend)
    )
    :effect (and
      (not (at ?visitor ?loc ?tstart))
      (at ?visitor ?loc ?tend)
      (met-with-barbara ?visitor ?tstart ?tend)
    )
  )
)