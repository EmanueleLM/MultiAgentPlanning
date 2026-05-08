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

  (:action apply-audit-corrections
    :parameters ()
    :precondition (and)
    :effect (and (audited))
  )

  (:action schedule-meeting
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (audited)
      (earliest-common ?s)
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)