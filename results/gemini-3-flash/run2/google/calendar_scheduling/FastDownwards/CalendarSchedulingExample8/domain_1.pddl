(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (meeting_scheduled)
  )

  ;; Action to schedule a 30-minute meeting in a specific slot.
  ;; The meeting requires all three specific participants to be available.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (available adam ?s)
      (available jerry ?s)
      (available matthew ?s)
    )
    :effect (meeting_scheduled)
  )
)