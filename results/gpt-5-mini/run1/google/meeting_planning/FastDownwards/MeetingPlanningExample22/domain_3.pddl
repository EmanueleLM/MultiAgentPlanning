(define (domain meeting_planning_example22)
  ;; Minimal classical PDDL model for this specific instance.
  ;; Time is modeled as discrete symbolic timepoints. Temporal progression is
  ;; enforced by precomputed time-pair facts (can-travel, can-wait, can-meet).
  ;; This keeps the model compatible with FastDownwards (:strips, :typing, :negative-preconditions).
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)                 ; agent located at location
    (at-time ?a - agent ?t - time)                ; agent's current discrete timepoint
    (can-travel ?from - location ?to - location ?t1 - time ?t2 - time) ; allowed travel start->end
    (can-wait ?t1 - time ?t2 - time)              ; allowed wait/start->end (idle) transitions
    (can-meet ?t1 - time ?t2 - time)              ; allowed meeting interval (ensures availability & duration)
    (met-andrew)                                  ; goal predicate: visitor met Andrew for required interval
  )

  ;; Travel between distinct locations using a precomputed start->end timepair.
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from) (at-time ?a ?t1) (can-travel ?from ?to ?t1 ?t2))
    :effect (and
              (not (at ?a ?from)) (at ?a ?to)
              (not (at-time ?a ?t1)) (at-time ?a ?t2)
            )
  )

  ;; Wait/idling: advance from one precomputed timepoint to a later one while staying in place.
  (:action wait
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and (at-time ?a ?t1) (can-wait ?t1 ?t2))
    :effect (and
              (not (at-time ?a ?t1)) (at-time ?a ?t2)
            )
  )

  ;; Meet Andrew: consumes the visitor's timepoint at meeting start and produces the meeting end timepoint.
  ;; The can-meet fact guarantees Andrew's availability throughout and the minimum duration.
  (:action meet-andrew
    :parameters (?a - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and (at ?a ?loc) (at-time ?a ?tstart) (can-meet ?tstart ?tend))
    :effect (and
              (not (at-time ?a ?tstart)) (at-time ?a ?tend)
              (met-andrew)
            )
  )
)