(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types timeslot participant)

  (:predicates
    (within_work_hours ?t - timeslot)
    (preferred_slot ?t - timeslot)
    (busy ?p - participant ?t - timeslot)
    (next ?t1 - timeslot ?t2 - timeslot)
    (meeting_scheduled)
    (scheduled_at ?t - timeslot)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (preferred_slot ?t)
      (within_work_hours ?t)
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