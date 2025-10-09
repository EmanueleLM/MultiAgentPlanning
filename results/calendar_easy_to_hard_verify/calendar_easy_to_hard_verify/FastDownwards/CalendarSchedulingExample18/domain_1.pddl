(define (domain CalendarSchedulingExample18)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (available lisa ?s)
      (available dorothy ?s)
      (available anthony ?s)
      (available ryan ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )
)