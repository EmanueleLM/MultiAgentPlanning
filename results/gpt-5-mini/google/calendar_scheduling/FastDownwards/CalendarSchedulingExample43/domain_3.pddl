(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)

  (:predicates
    (busy ?p - person ?s - time_slot)
    (meeting_scheduled)
    (meeting_at ?s - time_slot)
  )

  ;; Schedule the meeting at a specific half-hour slot.
  ;; Precondition enforces that no participant is busy at that slot
  ;; and that no meeting has already been scheduled.
  (:action schedule_meeting_at
    :parameters (?s - time_slot)
    :precondition (and
      (not (meeting_scheduled))
      (not (busy albert ?s))
      (not (busy gregory ?s))
      (not (busy benjamin ?s))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?s)
    )
  )
)