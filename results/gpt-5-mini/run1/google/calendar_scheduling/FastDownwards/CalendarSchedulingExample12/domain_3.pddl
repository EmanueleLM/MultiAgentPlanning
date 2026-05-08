(define (domain schedule_meeting)
  (:requirements :strips :typing)
  (:types person slot meeting)

  (:predicates
    (available ?p - person ?s - slot)        ; person is available to start the 60-min meeting at slot
    (unscheduled ?m - meeting)               ; meeting not yet scheduled
    (scheduled_at ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
  )

  ;; Instance-specific action: schedule the meeting at a start slot that must be available
  ;; for all required participants (david, debra, kevin).
  (:action schedule
    :parameters (?m - meeting ?s - slot)
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