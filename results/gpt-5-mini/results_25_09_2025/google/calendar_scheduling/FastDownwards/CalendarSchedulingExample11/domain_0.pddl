(define (domain meeting-scheduling-multiagent)
  (:requirements :typing :negative-preconditions :disjunctive-preconditions :existential-preconditions)
  (:types agent slot)

  (:predicates
    (slot ?s - slot)
    (agent ?a - agent)
    (free ?a - agent ?s - slot)                ; agent is free at that slot (private availability)
    (attending-ready ?a - agent ?s - slot)     ; agent has prepared to attend at that slot
    (slotted ?s - slot)                        ; slot is taken by a scheduled meeting
    (meeting-scheduled ?s - slot)              ; meeting scheduled at slot
  )

  ;; Agent-specific actions to express "I can attend at slot S" (keeps actions distinct per agent).
  (:action prepare-attend-alexander
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free alexander ?s) (not (slotted ?s)))
    :effect (attending-ready alexander ?s)
  )

  (:action prepare-attend-elizabeth
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free elizabeth ?s) (not (slotted ?s)))
    :effect (attending-ready elizabeth ?s)
  )

  (:action prepare-attend-walter
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free walter ?s) (not (slotted ?s)))
    :effect (attending-ready walter ?s)
  )

  ;; Central action that schedules the meeting when all three agents are ready for the same slot.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (attending-ready alexander ?s)
      (attending-ready elizabeth ?s)
      (attending-ready walter ?s)
      (not (slotted ?s))
    )
    :effect (and
      (meeting-scheduled ?s)
      (slotted ?s)
    )
  )
)