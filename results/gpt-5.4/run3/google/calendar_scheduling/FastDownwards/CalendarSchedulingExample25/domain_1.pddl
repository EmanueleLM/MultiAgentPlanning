(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (pamela_acceptable ?s - slot)
    (one_hour_slot ?s - slot)
    (unscheduled)
    (scheduled ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (unscheduled)
      (one_hour_slot ?s)
      (pamela_acceptable ?s)
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
    )
    :effect (and
      (scheduled ?s)
      (not (unscheduled))
    )
  )
)