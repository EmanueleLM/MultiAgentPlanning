(define (domain schedule_meeting)
  (:requirements :strips :typing)
  (:types person slot meeting_type)

  (:predicates
    (available ?p - person ?s - slot)        ; person is available to start the 60-min meeting at slot
    (unscheduled ?m - meeting_type)          ; meeting not yet scheduled
    (scheduled_at ?m - meeting_type ?s - slot)
    (scheduled ?m - meeting_type)
  )

  ; Single action schedules the meeting at a slot that is available for all required participants.
  ; This domain is instance-specific: it encodes that the meeting must include david, debra and kevin.
  (:action schedule
    :parameters (?m - meeting_type ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (available david ?s)
      (available debra ?s)
      (available kevin ?s)
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled_at ?m ?s)
      (scheduled ?m)
    )
  )
)