(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot day)

  (:predicates
    (available ?p - person ?s - slot)
    (audited)
    (earliest-common ?s - slot)
    (slot-next ?s1 - slot ?s2 - slot)
    (slot-on ?s - slot ?d - day)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  ;; Simple action that an auditor/orchestrator can take to mark
  ;; that availability reports have been checked/corrected.
  (:action apply-audit-corrections
    :parameters ()
    :precondition (and)
    :effect (and (audited))
  )

  ;; Instance-specific scheduling action that schedules the meeting
  ;; for the three named participants. Using explicit participant
  ;; checks prevents the planner from reusing the same person slot
  ;; parameter multiple times.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (audited)
      (earliest-common ?s)
      ;; Explicitly require each named participant to be available at ?s.
      (available brittany ?s)
      (available emily ?s)
      (available doris ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)