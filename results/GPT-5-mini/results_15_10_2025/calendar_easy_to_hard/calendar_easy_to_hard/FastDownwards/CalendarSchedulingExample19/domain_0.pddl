(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
    (unscheduled)
  )

  ;; Schedule meeting at a specific slot if every participant is available and a meeting has not yet been scheduled.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
    )
  )
)