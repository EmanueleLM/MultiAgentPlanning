(define (domain calendar_scheduling_38)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  ;; declare the specific participants as domain constants so domain-level preconditions can refer to them
  (:constants catherine michael alexander - person)

  (:predicates
    (work_slot ?t - timeslot)            ;; slot is within working hours
    (busy ?p - person ?t - timeslot)     ;; person is busy during this slot
    (meeting_scheduled)                  ;; a meeting has been scheduled
    (meeting_at ?t - timeslot)           ;; meeting is scheduled at this slot
  )

  ;; single action to schedule the 30-minute meeting at one of the 30-min slots
  (:action schedule_meeting_at
    :parameters (?t - timeslot)
    :precondition (and
      (work_slot ?t)
      (not (busy catherine ?t))
      (not (busy michael ?t))
      (not (busy alexander ?t))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?t)
    )
  )
)