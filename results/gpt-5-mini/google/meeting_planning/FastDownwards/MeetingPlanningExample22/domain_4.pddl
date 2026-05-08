(define (domain meeting_planning_example22)
  ;; Minimal classical PDDL model for this specific instance.
  ;; Time is modeled as discrete symbolic timepoints (objects of type time).
  ;; Actions explicitly move agents between locations and advance their timepoints.
  ;; Meeting action requires both the visitor and Andrew to be co-located and at the same start time,
  ;; and advances both agents to the meeting end time. This enforces Andrew's presence
  ;; (availability) structurally rather than via implicit bookkeeping.
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)                 ; agent located at location
    (at-time ?a - agent ?t - time)                ; agent's current discrete timepoint
    (can-travel ?from - location ?to - location ?t1 - time ?t2 - time) ; allowed travel start->end
    (can-wait ?t1 - time ?t2 - time)              ; allowed idle/start->end transitions
    (can-meet ?t1 - time ?t2 - time)              ; permitted meeting interval (availability & duration)
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

  ;; Meet Andrew: both visitor and Andrew must be co-located and share the meeting start time.
  ;; The can-meet fact ensures the chosen start->end interval respects Andrew's availability
  ;; and the minimum meeting duration (encoded by selecting appropriate time objects in the problem).
  ;; Effects advance both agents' timepoints to the meeting end and assert that the visitor met Andrew.
  (:action meet-andrew
    :parameters (?visitor - agent ?andrew - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and
                    (at ?visitor ?loc)
                    (at ?andrew ?loc)
                    (at-time ?visitor ?tstart)
                    (at-time ?andrew ?tstart)
                    (can-meet ?tstart ?tend)
                  )
    :effect (and
              (not (at-time ?visitor ?tstart)) (at-time ?visitor ?tend)
              (not (at-time ?andrew ?tstart)) (at-time ?andrew ?tend)
              (met-andrew)
            )
  )
)