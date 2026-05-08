(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types timeslot participant)

  (:predicates
    (busy ?p - participant ?t - timeslot)
    (meeting_scheduled)
    (scheduled_at ?t - timeslot)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting_scheduled))
      (not (busy heather ?t))
      (not (busy nicholas ?t))
      (not (busy zachary ?t))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?t)
    )
  )
)