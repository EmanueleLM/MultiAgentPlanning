(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types person timeslot)
  (:constants 
    donna john billy - person
  )
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_scheduled)
  )

  ;; Action to schedule a 30-minute meeting at a specific timeslot.
  ;; The meeting can only be scheduled if all participants (Donna, John, and Billy) are free.
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (free donna ?t)
      (free john ?t)
      (free billy ?t)
    )
    :effect (meeting_scheduled)
  )
)