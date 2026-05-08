(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    day
    slot
  )

  (:predicates
    (participant_free ?p - participant ?s - slot)
    (slot_on_day ?s - slot ?d - day)
    (allowed_for_meeting ?m - meeting ?s - slot)
    (requires ?m - meeting ?p - participant)
    (unscheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
    (is_monday ?d - day)
  )

  (:action schedule_meeting_at_slot
    :parameters (?m - meeting ?s - slot ?d - day ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (unscheduled ?m)
      (is_monday ?d)
      (slot_on_day ?s ?d)
      (allowed_for_meeting ?m ?s)
      (requires ?m ?p1)
      (requires ?m ?p2)
      (requires ?m ?p3)
      (participant_free ?p1 ?s)
      (participant_free ?p2 ?s)
      (participant_free ?p3 ?s)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (scheduled_at ?m ?s)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )
)