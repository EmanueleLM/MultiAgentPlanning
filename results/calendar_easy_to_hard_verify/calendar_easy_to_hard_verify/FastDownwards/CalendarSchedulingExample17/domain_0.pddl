(define (domain multi-agent-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (busy ?p - person ?t - slot)
    (scheduled ?t - slot)
    (meeting_scheduled)
  )

  ;; Action: schedule the single 30-minute meeting at a specific half-hour slot.
  ;; Preconditions require no participant is busy at that slot and the meeting is not yet scheduled.
  (:action schedule
    :parameters (?t - slot)
    :precondition (and
      (not (meeting_scheduled))
      (not (busy peter ?t))
      (not (busy judith ?t))
      (not (busy keith ?t))
      (not (busy evelyn ?t))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?t)
    )
  )
)