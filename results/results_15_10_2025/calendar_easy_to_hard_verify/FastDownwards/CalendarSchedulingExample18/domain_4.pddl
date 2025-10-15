(define (domain calendar-scheduling-example18)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)
  (:constants lisa dorothy anthony ryan - person)
  (:predicates
    (available ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (available lisa ?s)
      (available dorothy ?s)
      (available anthony ?s)
      (available ryan ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)