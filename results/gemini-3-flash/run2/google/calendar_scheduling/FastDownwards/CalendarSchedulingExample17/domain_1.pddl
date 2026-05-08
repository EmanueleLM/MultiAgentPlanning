(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )

  ;; A meeting can only be scheduled at a timeslot where everyone is available.
  ;; All participants must have the available predicate for the specific timeslot.
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and 
      (available margaret ?t)
      (available donna ?t)
      (available helen ?t)
    )
    :effect (meeting_scheduled)
  )
)