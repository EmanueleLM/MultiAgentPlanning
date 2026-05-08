(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_at ?t - timeslot)
  )

  ;; Action to schedule a 30-minute meeting at a specific timeslot.
  ;; The meeting is successful if all three required participants are free.
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (free roy ?t)
      (free kathryn ?t)
      (free amy ?t)
    )
    :effect (meeting_at ?t)
  )
)