(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing)

  (:types
    slot
  )

  (:predicates
    (free_all ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (meeting_scheduled ?s1 - slot ?s2 - slot)
  )

  (:action schedule_one_hour_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (free_all ?s1)
      (free_all ?s2)
      (next_slot ?s1 ?s2)
    )
    :effect (and
      (meeting_scheduled ?s1 ?s2)
    )
  )
)