(define (domain meeting_scheduler_multi_agent)
  (:requirements :strips :typing)

  (:types
    agent time_slot
  )

  (:predicates
    (available ?a - agent ?t - time_slot)
    (meeting_scheduled ?t - time_slot)
  )

  (:action schedule_meeting
    :parameters (?a - agent ?t - time_slot)
    :precondition (available ?a ?t)
    :effect (not (available ?a ?t))
  )

  (:action schedule_global_meeting
    :parameters (?t - time_slot)
    :precondition (and (available michelle ?t)
                       (available steven ?t)
                       (available jerry ?t))
    :effect (meeting_scheduled ?t)
  )
)