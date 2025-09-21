(define (domain multi-agent-meeting)
  (:requirements :typing :negative-preconditions :equality)
  (:types orchestrator attendee slot)

  (:predicates
    (free ?a - attendee ?s - slot)
    (slot-free ?s - slot)
    (scheduled)
    (scheduled-at ?s - slot)
  )

  (:action schedule-by-orchestrator
    :parameters (?o - orchestrator ?a1 - attendee ?a2 - attendee ?a3 - attendee ?s - slot)
    :precondition (and
      (slot-free ?s)
      (free ?a1 ?s)
      (free ?a2 ?s)
      (free ?a3 ?s)
      (not (= ?a1 ?a2))
      (not (= ?a1 ?a3))
      (not (= ?a2 ?a3))
    )
    :effect (and
      (not (slot-free ?s))
      (not (free ?a1 ?s))
      (not (free ?a2 ?s))
      (not (free ?a3 ?s))
      (scheduled)
      (scheduled-at ?s)
    )
  )
)