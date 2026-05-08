(define (domain meeting-scheduling)
  ;; PDDL domain intended for FastDownwards (classical STRIPS + typing + negative-preconditions)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (next ?s - slot ?s2 - slot)            ; adjacency of 30-min slots
    (available ?p - participant ?s - slot) ; participant free in slot
    (confirmed ?p - participant ?s - slot) ; participant confirmed for meeting starting at slot
    (meeting-scheduled)                    ; meeting scheduled (global flag)
    (scheduled-at ?s - slot)               ; meeting scheduled to start at slot
  )

  ;; Each participant confirms a proposed two-slot meeting start (requires two consecutive free slots)
  (:action confirm-arthur
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (available arthur ?s)
      (available arthur ?s2)
      (not (confirmed arthur ?s))
      (not (meeting-scheduled))
    )
    :effect (and (confirmed arthur ?s))
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
    :effect (and (confirmed michael ?s))
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
    :effect (and (confirmed samantha ?s))
  )

  ;; Orchestrator finalizes when everyone has confirmed the same start slot
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