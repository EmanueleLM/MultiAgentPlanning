(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  ;; Domain-level constants for the three participants (declared here so actions can refer to them directly).
  (:constants p1 p2 p3 - participant)

  (:predicates
    (successor ?s1 - slot ?s2 - slot)          ; immediate next half-hour slot
    (available-slot ?s - slot)                 ; consolidated availability for all participants (atomic half-hour slots)
    (meeting-unscheduled)                      ; marker: meeting not yet scheduled
    (meeting-scheduled ?s - slot)              ; meeting has been scheduled to start at slot ?s
    (confirmed ?p - participant)               ; a participant has confirmed the scheduled meeting
    (blocked-by-earlier ?s - slot)             ; starts that are disallowed because an earlier feasible start must be chosen
  )

  ;; Choose a start slot (requires two consecutive available half-hour slots -> 60 minutes)
  (:action schedule-at
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (meeting-unscheduled)
      (successor ?s ?s2)
      (available-slot ?s)
      (available-slot ?s2)
      (not (blocked-by-earlier ?s))
    )
    :effect (and
      (not (meeting-unscheduled))
      (meeting-scheduled ?s)
    )
  )

  ;; Participant-specific confirmation actions (distinct actions per participant)
  ;; Confirmations are ordered: p1 -> p2 -> p3 (enforced through preconditions)
  (:action confirm-p1
    :parameters (?s - slot)
    :precondition (and
      (meeting-scheduled ?s)
      (not (confirmed p1))
    )
    :effect (and
      (confirmed p1)
    )
  )

  (:action confirm-p2
    :parameters (?s - slot)
    :precondition (and
      (meeting-scheduled ?s)
      (confirmed p1)
      (not (confirmed p2))
    )
    :effect (and
      (confirmed p2)
    )
  )

  (:action confirm-p3
    :parameters (?s - slot)
    :precondition (and
      (meeting-scheduled ?s)
      (confirmed p2)
      (not (confirmed p3))
    )
    :effect (and
      (confirmed p3)
    )
  )
)