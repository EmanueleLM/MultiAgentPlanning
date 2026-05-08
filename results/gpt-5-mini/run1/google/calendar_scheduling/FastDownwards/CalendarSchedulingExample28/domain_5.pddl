(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot day)

  ;; Declare the three participants as domain-level constants to avoid
  ;; duplicating them in the problem file.
  (:constants brittany emily doris - person)

  (:predicates
    (available ?p - person ?s - slot)
    (audited)
    (earliest-common ?s - slot)
    (slot-next ?s1 - slot ?s2 - slot)
    (slot-on ?s - slot ?d - day)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  ;; The auditor action: mark the availability as audited/corrected.
  (:action apply-audit-corrections
    :parameters ()
    :effect (and (audited))
  )

  ;; Schedule the meeting at a slot if the slot is audited as earliest-common
  ;; and every required participant is available at that slot and no meeting
  ;; has yet been scheduled.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (audited)
      (earliest-common ?s)
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