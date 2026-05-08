(define (domain meeting_schedule_michelle_steven_jerry)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    halfhour
    window
  )

  (:predicates
    (requires_participant ?m - meeting ?p - participant)
    (window_first_half ?w - window ?h - halfhour)
    (window_second_half ?w - window ?h - halfhour)
    (free ?p - participant ?h - halfhour)
    (window_feasible_for_meeting ?m - meeting ?w - window)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting)
    (scheduled_in ?m - meeting ?w - window)
  )

  (:action schedule_meeting_in_window
    :parameters (?m - meeting ?w - window)
    :precondition (and
      (unscheduled ?m)
      (window_feasible_for_meeting ?m ?w)
      (not (scheduled ?m))
    )
    :effect (and
      (scheduled ?m)
      (scheduled_in ?m ?w)
      (not (unscheduled ?m))
    )
  )
)