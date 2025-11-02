(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot agent)

  ;; Predicates (agent-specific availability and global scheduling flags)
  (:predicates
    ;; slot is free for the named agent for a 60-minute meeting
    (free-arthur ?s - slot)
    (free-michael ?s - slot)
    (free-samantha ?s - slot)

    ;; slot has been scheduled for the meeting
    (scheduled ?s - slot)

    ;; global flag: a meeting has been scheduled
    (meeting-scheduled)
  )

  ;; Single atomic action to schedule the meeting at one slot.
  ;; Requires each agent to be free for that slot and that no meeting is yet scheduled.
  ;; Effects: set meeting scheduled, mark the slot scheduled, and remove free facts.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (free-arthur ?s)
      (free-michael ?s)
      (free-samantha ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
      (not (free-arthur ?s))
      (not (free-michael ?s))
      (not (free-samantha ?s))
    )
  )
)