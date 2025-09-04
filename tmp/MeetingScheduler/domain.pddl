(define (domain meeting-scheduler)
  (:requirements :strips :typing :equality)
  (:types time_slot agent)

  (:predicates
    (available ?a - agent ?t - time_slot)
    (meeting-scheduled ?t - time_slot)
  )

  (:action schedule-meeting
    :parameters (?a - agent ?t - time_slot)
    :precondition (available ?a ?t)
    :effect (meeting-scheduled ?t)
  )
)