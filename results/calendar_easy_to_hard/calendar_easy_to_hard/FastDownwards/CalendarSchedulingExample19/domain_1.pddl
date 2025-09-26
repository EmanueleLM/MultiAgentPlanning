(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:constants marie janice elijah theresa - agent)

  (:predicates
    (available ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
    (unscheduled)
  )

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