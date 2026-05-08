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