(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (required_attendee ?m - meeting ?p - participant)
    (busy ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (hour_window ?s1 - slot ?s2 - slot)
    (scheduled ?m - meeting)
    (starts_at ?m - meeting ?s - slot)
    (uses_slot ?m - meeting ?s - slot)
  )

  (:action schedule_one_hour_meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition
      (and
        (not (scheduled ?m))
        (hour_window ?s1 ?s2)
        (required_attendee ?m jacob)
        (required_attendee ?m gabriel)
        (required_attendee ?m matthew)
        (not (busy jacob ?s1))
        (not (busy jacob ?s2))
        (not (busy gabriel ?s1))
        (not (busy gabriel ?s2))
        (not (busy matthew ?s1))
        (not (busy matthew ?s2))
      )
    :effect
      (and
        (scheduled ?m)
        (starts_at ?m ?s1)
        (uses_slot ?m ?s1)
        (uses_slot ?m ?s2)
      )
  )
)