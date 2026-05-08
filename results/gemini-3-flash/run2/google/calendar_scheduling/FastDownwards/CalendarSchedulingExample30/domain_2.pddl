(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types slot)
  (:predicates
    (jeffrey_available ?s - slot)
    (virginia_available ?s - slot)
    (melissa_available ?s - slot)
    (is_preferred ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (jeffrey_available ?s)
      (virginia_available ?s)
      (melissa_available ?s)
      (is_preferred ?s)
    )
    :effect (meeting_scheduled)
  )
)