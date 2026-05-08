(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timepoint
    slot
  )

  (:predicates
    (required ?p - participant)
    (slot_start ?s - slot ?t - timepoint)
    (slot_end ?s - slot ?t - timepoint)
    (available ?p - participant ?s - slot)
    (pamela_acceptable ?s - slot)
    (one_hour_slot ?s - slot)
    (unscheduled)
    (scheduled ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (one_hour_slot ?s)
      (pamela_acceptable ?s)
      (available anthony ?s)
      (available pamela ?s)
      (available zachary ?s)
      (required anthony)
      (required pamela)
      (required zachary)
    )
    :effect (and
      (scheduled ?s)
      (not (unscheduled))
    )
  )
)