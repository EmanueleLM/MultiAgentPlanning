(define (domain meeting-scheduling-integrated)
  (:requirements :typing :negative-preconditions)
  (:types person timeslot meeting)

  (:predicates
    ;; Unified availability predicate (used by all agents' actions after mapping)
    (free ?p - person ?t - timeslot)

    ;; Work-hours marker (used by agent3's schedule action)
    (within-work-hours ?t - timeslot)

    ;; Agent2 meeting representation
    (meeting ?m - meeting)
    (scheduled ?m - meeting)

    ;; Agent3 per-person scheduling facts
    (scheduled-for ?p - person ?t - timeslot)
    (meeting-scheduled ?t - timeslot)

    ;; Agent1/agent-agnostic meeting-at marker
    (meeting-at ?t - timeslot)

    ;; Common goal fluent: meeting confirmed between Diane Kelly and Deborah
    (meeting-confirmed)
  )

  ;; Agent 1 action (from first agent), kept distinct and mapped to unified names
  (:action agent1-schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (free diane_kelly ?t)
      (free deborah ?t)
      (not (meeting-confirmed))
    )
    :effect (and
      (meeting-at ?t)
      (meeting-confirmed)
    )
  )

  ;; Agent 2 action (from second agent), kept distinct.
  ;; Removed the universal quantifier (forall) and explicitly checks Diane & Deborah.
  (:action agent2-schedule
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting ?m)
      (not (scheduled ?m))
      (free diane_kelly ?t)
      (free deborah ?t)
    )
    :effect (and
      (scheduled ?m)
      (meeting-confirmed)
    )
  )

  ;; Agent 3 scheduling action (from third agent), kept distinct.
  ;; Schedules two persons at the same timeslot and marks them no longer free.
  (:action agent3-schedule
    :parameters (?p1 - person ?p2 - person ?t - timeslot)
    :precondition (and
      (free ?p1 ?t)
      (free ?p2 ?t)
      (within-work-hours ?t)
    )
    :effect (and
      (scheduled-for ?p1 ?t)
      (scheduled-for ?p2 ?t)
      (meeting-scheduled ?t)
      (not (free ?p1 ?t))
      (not (free ?p2 ?t))
    )
  )

  ;; Agent 3 declarative action to confirm a meeting specifically for Diane Kelly and Deborah
  ;; (keeps agent3's original declare-meeting-diane-deborah behavior, mapped names).
  (:action agent3-declare-meeting-diane-deborah
    :parameters (?t - timeslot)
    :precondition (and
      (scheduled-for diane_kelly ?t)
      (scheduled-for deborah ?t)
    )
    :effect (meeting-confirmed)
  )
)