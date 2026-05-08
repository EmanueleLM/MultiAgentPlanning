(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    adam jerry matthew - person
  )
  (:predicates
    (available ?p - person ?s - slot)
    (meeting_scheduled)
  )

  ;; The meeting must be scheduled in a slot where all three participants are available.
  ;; Since this model is instance-specific, we define the action to check the specific constants.
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