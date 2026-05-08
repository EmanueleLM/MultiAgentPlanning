(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types slot)
  (:predicates
    (heather_available ?s - slot)
    (nicholas_available ?s - slot)
    (zachary_available ?s - slot)
    (is_preferred ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and 
      (heather_available ?s)
      (nicholas_available ?s)
      (zachary_available ?s)
      (is_preferred ?s)
    )
    :effect (meeting_scheduled)
  )
)