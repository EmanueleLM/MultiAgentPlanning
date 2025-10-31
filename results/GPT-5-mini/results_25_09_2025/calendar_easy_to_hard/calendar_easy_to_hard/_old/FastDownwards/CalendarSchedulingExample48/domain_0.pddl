(define (domain meeting-scheduling-unified)
  (:requirements :typing :negative-preconditions)
  (:types slot)

  (:predicates
    ;; Agent-specific busy predicates (true if the agent is known to be busy for a meeting
    ;; starting at the given 30-minute slot).
    (busy-noah ?s - slot)
    (busy-teresa ?s - slot)
    (busy-bradley ?s - slot)
    (busy-philip ?s - slot)
    (busy-joyce ?s - slot)
    (busy-ryan ?s - slot)
    (busy-aaron ?s - slot)

    ;; Markers that a slot has been used and that a meeting has been scheduled.
    (scheduled ?s - slot)
    (meeting-scheduled)

    ;; Attendance facts recorded when a meeting is scheduled (agent-specific).
    (attends-noah ?s - slot)
    (attends-teresa ?s - slot)
    (attends-bradley ?s - slot)
    (attends-philip ?s - slot)
    (attends-joyce ?s - slot)
    (attends-ryan ?s - slot)
    (attends-aaron ?s - slot)
  )

  ;; Schedule the 30-minute meeting at a start slot ?s.
  ;; Precondition: the chosen slot is not already scheduled and no agent is known busy at that slot.
  ;; Effect: record the meeting as scheduled and record attendance for every agent.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled ?s))
      (not (busy-noah ?s))
      (not (busy-teresa ?s))
      (not (busy-bradley ?s))
      (not (busy-philip ?s))
      (not (busy-joyce ?s))
      (not (busy-ryan ?s))
      (not (busy-aaron ?s))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
      (attends-noah ?s)
      (attends-teresa ?s)
      (attends-bradley ?s)
      (attends-philip ?s)
      (attends-joyce ?s)
      (attends-ryan ?s)
      (attends-aaron ?s)
    )
  )
)