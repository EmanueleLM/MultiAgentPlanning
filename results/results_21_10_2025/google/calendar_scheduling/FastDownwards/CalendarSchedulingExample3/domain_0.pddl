(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot agent)

  ;; Predicates annotated with which agent they refer to:
  ;;  - free-arthur ?s : slot ?s is free for Arthur for a 60-min meeting
  ;;  - free-michael ?s : slot ?s is free for Michael for a 60-min meeting
  ;;  - free-samantha ?s : slot ?s is free for Samantha for a 60-min meeting
  ;;  - scheduled ?s : slot ?s has been scheduled for the meeting
  ;;  - meeting-scheduled : a meeting has been scheduled (global goal)
  (:predicates
    (free-arthur ?s - slot)
    (free-michael ?s - slot)
    (free-samantha ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  ;; Single action that schedules the one-hour meeting at a chosen slot.
  ;; Preconditions require that each agent is free at that slot (agent-specific predicates).
  ;; Also requires that no meeting has already been scheduled.
  ;; Effects assert the global meeting-scheduled flag and mark the slot as scheduled;
  ;; they also remove the per-agent free facts for that slot.
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