(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (travel-leg ?from - location ?to - location ?t1 - time ?t2 - time)
    (meeting-slot ?tstart - time ?tend - time)
    (barbara-present ?loc - location ?t - time)
    (met-with-barbara ?visitor - agent ?tstart - time ?tend - time)
  )

  ;; Travel action for an agent between two locations at specified timepoints.
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

  ;; Meeting action that enforces Barbara's continuous presence across the entire meeting interval
  ;; and produces the met-with-barbara fact for the exact interval.
  (:action meet-with-barbara
    :parameters (?visitor - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at ?visitor ?loc ?tstart)
      (barbara-present ?loc ?tstart)
      (barbara-present ?loc ?tend)
      (meeting-slot ?tstart ?tend)
    )
    :effect (and
      (not (at ?visitor ?loc ?tstart))
      (at ?visitor ?loc ?tend)
      (met-with-barbara ?visitor ?tstart ?tend)
    )
  )
)