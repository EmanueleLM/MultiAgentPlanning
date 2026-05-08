(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types participant timeslot)
  (:constants ralph peter daniel - participant)
  (:predicates
    (available ?p - participant ?s - timeslot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (available ralph ?s)
      (available peter ?s)
      (available daniel ?s)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)