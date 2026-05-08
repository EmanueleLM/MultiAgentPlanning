(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    arthur michael samantha - participant
  )

  (:predicates
    (next_slot ?s1 - slot ?s2 - slot)
    (candidate_start ?s - slot)
    (busy ?p - participant ?s - slot)
    (scheduled_at ?s - slot)
    (meeting_scheduled)
    (unscheduled)
  )

  (:action schedule_meeting_at
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled)
      (candidate_start ?s)
      (next_slot ?s ?s2)
      (not (busy arthur ?s))
      (not (busy arthur ?s2))
      (not (busy michael ?s))
      (not (busy michael ?s2))
      (not (busy samantha ?s))
      (not (busy samantha ?s2))
    )
    :effect (and
      (scheduled_at ?s)
      (meeting_scheduled)
      (not (unscheduled))
    )
  )
)