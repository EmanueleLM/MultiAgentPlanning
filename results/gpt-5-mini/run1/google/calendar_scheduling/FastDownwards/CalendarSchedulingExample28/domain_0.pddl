(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot day)
  (:predicates
    ;; availability of a person for a 30-minute slot
    (available ?p - person ?s - slot)
    ;; audit application flag (enforces audit step before scheduling)
    (audited)
    ;; marks which slot is the earliest common feasible start (computed from availabilities)
    (earliest-common ?s - slot)
    ;; contiguity / ordering of slots
    (slot-next ?s1 - slot ?s2 - slot)
    ;; assigns a slot to a day (explicit timeline mapping)
    (slot-on ?s - slot ?d - day)
    ;; result of scheduling
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  ;; Action that represents the auditor's correction and integration step.
  ;; This must appear in any valid plan before scheduling.
  (:action apply-audit-corrections
    :parameters ()
    :precondition (and)
    :effect (and (audited))
  )

  ;; Schedule the 30-minute meeting at a slot that has been marked
  ;; as the earliest common feasible slot and for which all required
  ;; participants are available. The negative precondition prevents
  ;; scheduling twice.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (audited)
      (earliest-common ?s)
      (available brittany ?s)
      (available emily ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)