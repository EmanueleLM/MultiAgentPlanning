(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot meeting)

  (:constants donna john billy - agent)

  (:predicates
    ; agent a is blocked (busy) in slot s
    (blocked ?a - agent ?s - slot)
    ; agent a is assigned to meeting m at slot s
    (assigned ?a - agent ?m - meeting ?s - slot)
    ; meeting has been scheduled (finalized)
    (meeting-scheduled ?m - meeting)
    ; meeting occupies a specific slot
    (meeting-at ?m - meeting ?s - slot)
  )

  ; Assign an agent to a meeting at a slot if the agent is not blocked at that slot,
  ; the agent is not already assigned there, and the meeting is not already finalized.
  (:action assign-agent-to-slot
    :parameters (?a - agent ?m - meeting ?s - slot)
    :precondition (and
      (not (blocked ?a ?s))
      (not (assigned ?a ?m ?s))
      (not (meeting-scheduled ?m))
    )
    :effect (and
      (assigned ?a ?m ?s)
    )
  )

  ; Confirm the meeting only when Donna, John, and Billy are each assigned to the same slot.
  ; This enforces that the meeting is only finalized when all required participants are assigned
  ; to the identical slot. The action guards against multiple confirmations.
  (:action confirm-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (assigned donna ?m ?s)
      (assigned john ?m ?s)
      (assigned billy ?m ?s)
      (not (meeting-scheduled ?m))
    )
    :effect (and
      (meeting-scheduled ?m)
      (meeting-at ?m ?s)
    )
  )
)