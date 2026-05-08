(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:constants gregory teresa carol - participant)
  (:predicates
    (work_slot ?s - timeslot)
    (blocked ?p - participant ?s - timeslot)
    (meeting_unscheduled)
    (meeting_scheduled)
    (scheduled_at ?s - timeslot)
  )

  (:action schedule_meeting_at
    :parameters (?s - timeslot)
    :precondition (and
      (work_slot ?s)
      (meeting_unscheduled)
      (not (blocked gregory ?s))
      (not (blocked teresa ?s))
      (not (blocked carol ?s))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (not (meeting_unscheduled))
    )
  )
)