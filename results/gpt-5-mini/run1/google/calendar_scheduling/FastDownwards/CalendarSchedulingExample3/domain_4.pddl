(define (domain meeting-scheduling)
  ;; PDDL domain for scheduling a 1-hour meeting using 30-minute slots
  ;; Intended for the FastDownwards solver
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (next ?s - slot ?s2 - slot)            ; adjacency: ?s immediately before ?s2
    (available ?p - participant ?s - slot) ; participant is free in slot
    (confirmed ?p - participant ?s - slot) ; participant confirmed meeting starting at slot ?s
    (meeting-scheduled)                    ; meeting has been finalized
    (scheduled-at ?s - slot)               ; meeting scheduled to start at slot ?s
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