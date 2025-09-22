(define (domain meeting-orchestrator)
  (:requirements :typing :strips :negative-preconditions :equality :adl :action-costs)
  (:types agent location timepoint)

  (:predicates
    (at ?a - agent ?l - location)
    (meeting-done)
    (current-time ?t - timepoint)
    (can-wait ?t - timepoint ?tend - timepoint)
    (can-travel-d2 ?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    (can-travel-d4 ?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    (can-travel-d5 ?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    (meeting-span ?t - timepoint ?tend - timepoint)
    (can-start ?a - agent ?t - timepoint)
  )

  ;; Visitor (a1) travel actions with explicit action costs encoding travel durations
  (:action travel-a1-d2
    :parameters (?from - location ?to - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at a1 ?from) (current-time ?t) (can-travel-d2 a1 ?from ?to ?t ?tend))
    :effect (and
      (not (at a1 ?from))
      (at a1 ?to)
      (not (current-time ?t))
      (current-time ?tend)
    )
    :cost 2
  )

  (:action travel-a1-d5
    :parameters (?from - location ?to - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at a1 ?from) (current-time ?t) (can-travel-d5 a1 ?from ?to ?t ?tend))
    :effect (and
      (not (at a1 ?from))
      (at a1 ?to)
      (not (current-time ?t))
      (current-time ?tend)
    )
    :cost 5
  )

  ;; William (a2) travel actions (no cost for visitor objective)
  (:action travel-a2-d4
    :parameters (?from - location ?to - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at a2 ?from) (current-time ?t) (can-travel-d4 a2 ?from ?to ?t ?tend))
    :effect (and
      (not (at a2 ?from))
      (at a2 ?to)
      (not (current-time ?t))
      (current-time ?tend)
    )
    :cost 0
  )

  (:action travel-a2-d5
    :parameters (?from - location ?to - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at a2 ?from) (current-time ?t) (can-travel-d5 a2 ?from ?to ?t ?tend))
    :effect (and
      (not (at a2 ?from))
      (at a2 ?to)
      (not (current-time ?t))
      (current-time ?tend)
    )
    :cost 0
  )

  ;; Wait actions (advance global time by one step), namespaced per agent
  (:action wait-a1
    :parameters (?t - timepoint ?tend - timepoint)
    :precondition (and (current-time ?t) (can-wait ?t ?tend))
    :effect (and
      (not (current-time ?t))
      (current-time ?tend)
    )
    :cost 0
  )

  (:action wait-a2
    :parameters (?t - timepoint ?tend - timepoint)
    :precondition (and (current-time ?t) (can-wait ?t ?tend))
    :effect (and
      (not (current-time ?t))
      (current-time ?tend)
    )
    :cost 0
  )

  ;; Orchestrator starts and conducts meeting: consumes meeting duration (precomputed spans)
  (:action orchestrator_start_meeting
    :parameters (?loc - location ?t - timepoint ?tend - timepoint)
    :precondition (and
      (at a1 ?loc)
      (at a2 ?loc)
      (not (meeting-done))
      (current-time ?t)
      (meeting-span ?t ?tend)
      (can-start a1 ?t)
      (can-start a2 ?t)
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?tend)
      (meeting-done)
    )
    :cost 0
  )

)