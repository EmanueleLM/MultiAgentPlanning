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
    :parameters (?t - time_point ?j - agent ?c - agent ?a - agent)
    :precondition (and
      (is_available ?j ?t)
      (is_available ?c ?t)
      (is_available ?a ?t)
    )
    :effect (meeting_scheduled ?t)
  )
)