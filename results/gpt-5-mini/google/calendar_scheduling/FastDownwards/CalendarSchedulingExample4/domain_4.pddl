(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot meeting)

  ; declare the three participants as domain constants
  (:constants donna john billy - agent)

  (:predicates
    ; agent a is blocked (busy) in slot s
    (blocked ?a - agent ?s - slot)
    ; agent a is assigned to meeting m at slot s
    (assigned ?a - agent ?m - meeting ?s - slot)
    ; marker that an agent already has an assignment for meeting m (prevents multiple slot assignments)
    (agent_assigned ?a - agent ?m - meeting)
    ; meeting has been scheduled (finalized)
    (meeting_scheduled ?m - meeting)
    ; meeting occupies a specific slot
    (meeting_at ?m - meeting ?s - slot)
  )

  ; Assign an agent to a meeting at a slot if the agent is not blocked at that slot,
  ; the agent does not already have an assignment for that meeting, and the meeting is not finalized.
  (:action assign-agent-to-slot
    :parameters (?a - agent ?m - meeting ?s - slot)
    :precondition (and
      (not (blocked ?a ?s))
      (not (agent_assigned ?a ?m))
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (assigned ?a ?m ?s)
      (agent_assigned ?a ?m)
    )
  )

  ; Confirm the meeting only when Donna, John, and Billy are each assigned to the same slot.
  ; This finalizes the meeting and records its slot.
  (:action confirm-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (assigned donna ?m ?s)
      (assigned john ?m ?s)
      (assigned billy ?m ?s)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (meeting_scheduled ?m)
      (meeting_at ?m ?s)
    )
  )
)