(define (domain schedule_meeting_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:constants
    madison diana shirley - participant
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (selected_start ?m - meeting ?s - slot)
    (selected_second ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
    (unscheduled ?m - meeting)
  )

  (:action schedule_one_hour_meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition
      (and
        (unscheduled ?m)
        (next_slot ?s1 ?s2)
        (not (busy madison ?s1))
        (not (busy madison ?s2))
        (not (busy diana ?s1))
        (not (busy diana ?s2))
        (not (busy shirley ?s1))
        (not (busy shirley ?s2))
      )
    :effect
      (and
        (selected_start ?m ?s1)
        (selected_second ?m ?s2)
        (scheduled ?m)
        (not (unscheduled ?m))
      )
  )
)