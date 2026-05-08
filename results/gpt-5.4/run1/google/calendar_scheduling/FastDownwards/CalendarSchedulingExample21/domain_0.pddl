(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (meeting_start_option ?s - slot)
    (scheduled_at ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_one_hour_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (not (meeting_scheduled))
      (meeting_start_option ?s1)
      (next_slot ?s1 ?s2)
      (not (busy bobby ?s1))
      (not (busy bobby ?s2))
      (not (busy scott ?s1))
      (not (busy scott ?s2))
      (not (busy kimberly ?s1))
      (not (busy kimberly ?s2))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s1)
    )
  )
)