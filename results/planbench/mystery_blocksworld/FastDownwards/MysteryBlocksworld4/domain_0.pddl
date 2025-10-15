(define (domain multi-agent-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)      ; agent ?a is available at slot ?s
    (free ?s - slot)                      ; slot ?s is free (not reserved)
    (allowed ?s - slot)                   ; slot ?s is allowed (respects preferences/constraints)
    (reserved ?s - slot)                  ; slot ?s has been reserved
    (reserved-for ?s - slot ?a - agent)   ; slot ?s is reserved for agent ?a
    (notified ?a - agent ?s - slot)       ; agent ?a has been notified/acknowledged for slot ?s
    (meeting-scheduled)                   ; meeting has been finalized/scheduled
  )

  ; An agent reserves a slot if the slot is free, the agent is available there, and the slot is allowed.
  (:action reserve
    :parameters (?a - agent ?s - slot)
    :precondition (and (free ?s) (available ?a ?s) (allowed ?s))
    :effect (and (reserved ?s) (reserved-for ?s ?a) (not (free ?s)))
  )

  ; An agent acknowledges / is notified of a reservation for the slot reserved for them.
  (:action notify
    :parameters (?a - agent ?s - slot)
    :precondition (and (reserved ?s) (reserved-for ?s ?a))
    :effect (notified ?a ?s)
  )

  ; Finalize the meeting: requires the slot to be reserved and both agents to be notified.
  ; NOTE: This domain version encodes finalization for exactly two agents (?a1 and ?a2).
  (:action finalize-meeting
    :parameters (?s - slot ?a1 - agent ?a2 - agent)
    :precondition (and (reserved ?s) (notified ?a1 ?s) (notified ?a2 ?s))
    :effect (meeting-scheduled)
  )
)