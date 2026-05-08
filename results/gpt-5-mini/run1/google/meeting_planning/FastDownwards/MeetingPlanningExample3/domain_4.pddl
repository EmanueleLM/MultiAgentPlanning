(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    ;; an agent is at a location at a given symbolic timepoint
    (at ?a - agent ?l - location ?t - time)

    ;; declared travel leg: depart from ?from at time ?t1 and arrive at ?to at time ?t2
    (travel_leg ?from - location ?to - location ?t1 - time ?t2 - time)

    ;; Barbara is present at a location at a given symbolic timepoint
    (barbara_present ?loc - location ?t - time)

    ;; symbolic temporal successor relation: there is a contiguous interval from ?t1 to ?t2
    (succ ?t1 - time ?t2 - time)

    ;; record that the planner met Barbara over the chosen interval
    (met_with_barbara ?planner - agent ?tstart - time ?tend - time)
  )

  ;; Travel action: an agent departs at t1 and arrives at t2 according to a declared travel_leg.
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

  ;; Wait / remain at the same location across a declared contiguous interval.
  (:action wait
    :parameters (?ag - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag ?loc ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag ?loc ?t1))
      (at ?ag ?loc ?t2)
    )
  )

  ;; Meeting action: the planner meets Barbara at a location spanning a contiguous interval.
  ;; Requires planner present at meeting start, Barbara present at both endpoints, and the symbolic successor relation.
  (:action meet_with_barbara
    :parameters (?planner - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at ?planner ?loc ?tstart)
      (barbara_present ?loc ?tstart)
      (barbara_present ?loc ?tend)
      (succ ?tstart ?tend)
    )
    :effect (and
      ;; planner occupies the location at the end of the meeting interval
      (not (at ?planner ?loc ?tstart))
      (at ?planner ?loc ?tend)
      (met_with_barbara ?planner ?tstart ?tend)
    )
  )
)