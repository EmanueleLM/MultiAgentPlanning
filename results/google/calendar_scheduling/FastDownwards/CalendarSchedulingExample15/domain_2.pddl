(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    time_point - object
    agent - object
  )
  (:predicates
    (is_available ?a - agent ?t - time_point)
    (meeting_scheduled ?t - time_point)
  )

  (:action schedule_meeting_at
    :parameters (?t - time_point)
    :precondition (and
      (is_available joyce ?t)
      (is_available christine ?t)
      (is_available alexander ?t)
    )
    :effect (meeting_scheduled ?t)
  )
)