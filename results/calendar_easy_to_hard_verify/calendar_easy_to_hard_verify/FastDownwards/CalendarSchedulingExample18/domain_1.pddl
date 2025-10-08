(define (domain CalendarSchedulingExample18)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)
  (:constants lisa dorothy anthony ryan - person)
  (:predicates
    (meeting-scheduled)
    (scheduled-slot ?s - slot)
    (available ?p - person ?s - slot)
  )
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (available lisa ?s)
      (available dorothy ?s)
      (available anthony ?s)
      (available ryan ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-slot ?s)
    )
  )
)