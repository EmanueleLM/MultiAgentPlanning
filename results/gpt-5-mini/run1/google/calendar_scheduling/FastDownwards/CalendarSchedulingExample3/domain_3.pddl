(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (next ?s - slot ?s2 - slot)
    (available ?p - participant ?s - slot)
    (confirmed ?p - participant ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Arthur confirms a proposed two-slot meeting start
  (:action confirm-arthur
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (available arthur ?s)
      (available arthur ?s2)
      (not (confirmed arthur ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (confirmed arthur ?s)
    )
  )

  ;; Michael confirms a proposed two-slot meeting start
  (:action confirm-michael
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (available michael ?s)
      (available michael ?s2)
      (not (confirmed michael ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (confirmed michael ?s)
    )
  )

  ;; Samantha confirms a proposed two-slot meeting start
  (:action confirm-samantha
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (available samantha ?s)
      (available samantha ?s2)
      (not (confirmed samantha ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (confirmed samantha ?s)
    )
  )

  ;; Orchestrator finalizes when all three have confirmed the same start slot
  (:action orchestrator-finalize
    :parameters (?s - slot)
    :precondition (and
      (confirmed arthur ?s)
      (confirmed michael ?s)
      (confirmed samantha ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)