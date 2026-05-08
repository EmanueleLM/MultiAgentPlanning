(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:constants gregory teresa carol - participant)
  (:predicates
    (work_slot ?s - timeslot)            ; timeslot is within meeting window (9:00-17:00)
    (blocked ?p - participant ?s - timeslot) ; participant p is busy during timeslot s
    (meeting_unscheduled)                ; meeting has not yet been scheduled
    (meeting_scheduled)                  ; meeting has been scheduled
    (scheduled_at ?s - timeslot)         ; meeting is scheduled at timeslot s
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