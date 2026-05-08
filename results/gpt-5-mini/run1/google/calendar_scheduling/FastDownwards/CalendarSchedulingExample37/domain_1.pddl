(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (work_slot ?s - timeslot)
    (blocked ?p - participant ?s - timeslot)
    (meeting_unscheduled)
    (meeting_scheduled)
    (scheduled_at ?s - timeslot)
  )

  (:action schedule_meeting_at
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s - timeslot)
    :precondition (and
      (work_slot ?s)
      (meeting_unscheduled)
      (not (blocked ?p1 ?s))
      (not (blocked ?p2 ?s))
      (not (blocked ?p3 ?s))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (not (meeting_unscheduled))
    )
  )
)