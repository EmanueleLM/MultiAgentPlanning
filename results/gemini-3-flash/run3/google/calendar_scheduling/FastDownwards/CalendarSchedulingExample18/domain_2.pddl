(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants brian billy patricia - person)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (free brian ?s)
      (free billy ?s)
      (free patricia ?s)
    )
    :effect (meeting_scheduled)
  )
)