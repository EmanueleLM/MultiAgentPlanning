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
    (scheduled ?w - window)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?w - window ?s1 - slot ?s2 - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition
      (and
        (not (meeting_scheduled))
        (window_first ?w ?s1)
        (window_second ?w ?s2)
        (not (busy ?p1 ?s1))
        (not (busy ?p1 ?s2))
        (not (busy ?p2 ?s1))
        (not (busy ?p2 ?s2))
        (not (busy ?p3 ?s1))
        (not (busy ?p3 ?s2))
      )
    :effect
      (and
        (scheduled ?w)
        (meeting_scheduled)
      )
  )
)