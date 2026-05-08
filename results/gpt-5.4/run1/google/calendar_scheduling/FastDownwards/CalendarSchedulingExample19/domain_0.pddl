(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    window
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (window_first ?w - window ?s - slot)
    (window_second ?w - window ?s - slot)
    (required ?p - participant)
    (scheduled ?w - window)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?w - window ?s1 - slot ?s2 - slot)
    :precondition
      (and
        (not (meeting_scheduled))
        (window_first ?w ?s1)
        (window_second ?w ?s2)
        (required stephen)
        (required edward)
        (required angela)
        (not (busy stephen ?s1))
        (not (busy stephen ?s2))
        (not (busy edward ?s1))
        (not (busy edward ?s2))
        (not (busy angela ?s1))
        (not (busy angela ?s2))
      )
    :effect
      (and
        (scheduled ?w)
        (meeting_scheduled)
      )
  )
)