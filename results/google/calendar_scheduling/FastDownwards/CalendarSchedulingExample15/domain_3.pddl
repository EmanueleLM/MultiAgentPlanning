(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    time_point - object
    agent - object
  )
  (:predicates
    (is_busy ?a - agent ?t - time_point)
    (meeting_scheduled ?t - time_point)
  )

  (:action schedule_meeting_at
    :parameters (?t - time_point)
    :precondition (and
      (not (is_busy joyce ?t))
      (not (is_busy christine ?t))
      (not (is_busy alexander ?t))
    )
    :effect (meeting_scheduled ?t)
  )