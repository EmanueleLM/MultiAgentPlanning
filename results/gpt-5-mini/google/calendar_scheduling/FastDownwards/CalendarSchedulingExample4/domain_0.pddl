(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot meeting)

  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    (meeting ?m - meeting)
    ; Busy / blocked slot for an agent (start-inclusive, end-exclusive)
    (blocked ?a - agent ?s - slot)
    ; Agent assigned to a meeting at a specific slot
    (assigned ?a - agent ?m - meeting ?s - slot)
    ; Meeting has been scheduled (finalized)
    (meeting-scheduled ?m - meeting)
    ; Meeting occupies a specific slot
    (meeting-at ?m - meeting ?s - slot)
    ; Successor relation for contiguous slots
    (next ?s1 - slot ?s2 - slot)
  )

  ; Assign a single agent to a meeting at a slot if that agent is not blocked at that slot.
  (:action assign-agent-to-slot
    :parameters (?a - agent ?m - meeting ?s - slot)
    :precondition (and
      (agent ?a)
      (meeting ?m)
      (slot ?s)
      (not (blocked ?a ?s))
      (not (assigned ?a ?m ?s))
    )
    :effect (and
      (assigned ?a ?m ?s)
    )
  )

  ; Confirm the meeting once all required agents are assigned to the same slot.
  ; This action enforces that the assign actions must precede confirmation and fixes the meeting slot.
  (:action confirm-meeting-with-three
    :parameters (?m - meeting ?s - slot ?a1 - agent ?a2 - agent ?a3 - agent)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (assigned ?a1 ?m ?s)
      (assigned ?a2 ?m ?s)
      (assigned ?a3 ?m ?s)
    )
    :effect (and
      (meeting-scheduled ?m)
      (meeting-at ?m ?s)
    )
  )
)