(define (domain calendar_scheduling_26)
  (:requirements :strips :typing)
  (:types
    person
    time_point
  )

  (:predicates
    (can_meet_at ?p - person ?t - time_point)
    (meeting_scheduled_at ?t - time_point)
  )

  (:action schedule_meeting
    :parameters (?t - time_point)
    :precondition (and
      (can_meet_at katherine ?t)
      (can_meet_at nicole ?t)
      (can_meet_at kevin ?t)
    )
    :effect (meeting_scheduled_at ?t)
  )
)