(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types timeslot participant)

  (:predicates
    (within_work_hours ?t - timeslot)
    (busy ?p - participant ?t - timeslot)
    (next ?t1 - timeslot ?t2 - timeslot)
    (meeting_scheduled)
    (scheduled_at ?t - timeslot)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (within_work_hours ?t)
      (not (meeting_scheduled))
      (not (busy ?a ?t))
      (not (busy ?b ?t))
      (not (busy ?c ?t))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?t)
    )
  )
)