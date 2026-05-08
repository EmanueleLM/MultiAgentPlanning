(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing)

  (:types
    participant
    slot
  )

  (:constants
    emily victoria nancy - participant
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting_unscheduled)
    (earlier ?s1 - slot ?s2 - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (meeting_unscheduled)
      (available emily ?s)
      (available victoria ?s)
      (available nancy ?s)
      (not (scheduled ?s))
      (forall (?e - slot) (not (and (earlier ?e ?s) (scheduled ?e))))
    )
    :effect (and
      (scheduled ?s)
      (not (meeting_unscheduled))
    )
  )
)