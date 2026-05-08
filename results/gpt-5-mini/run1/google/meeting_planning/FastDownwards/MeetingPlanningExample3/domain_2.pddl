(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (travel_leg ?from - location ?to - location ?t1 - time ?t2 - time)
    (barbara_present ?loc - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (met_with_barbara ?visitor - agent ?tstart - time ?tend - time)
  )

  ;; Travel action: depart at t1 and arrive at t2 according to a declared travel_leg.
  (:action travel
    :parameters (?ag - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag ?from ?t1)
      (travel_leg ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag ?from ?t1))
      (at ?ag ?to ?t2)
    )
  )

  ;; Meeting action: requires presence of Barbara at both endpoints of the chosen contiguous interval.
  ;; The succ relation encodes the contiguous interval between the declared timepoints.
  (:action meet_with_barbara
    :parameters (?visitor - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at ?visitor ?loc ?tstart)
      (barbara_present ?loc ?tstart)
      (barbara_present ?loc ?tend)
      (succ ?tstart ?tend)
    )
    :effect (and
      (not (at ?visitor ?loc ?tstart))
      (at ?visitor ?loc ?tend)
      (met_with_barbara ?visitor ?tstart ?tend)
    )
  )
)