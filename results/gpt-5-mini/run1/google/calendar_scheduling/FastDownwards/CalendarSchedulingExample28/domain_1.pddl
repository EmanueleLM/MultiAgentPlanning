(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
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

  (:action apply-audit-corrections
    :parameters ()
    :effect (and (audited))
  )

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