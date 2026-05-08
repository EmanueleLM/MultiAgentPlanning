(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types
    person slot
  )
  (:predicates
    (available ?p - person ?s - slot)
    (consecutive ?s1 - slot ?s2 - slot)
    (meeting_scheduled)
  )
  (:action schedule_1h_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (consecutive ?s1 ?s2)
      (available david ?s1)
      (available david ?s2)
      (available debra ?s1)
      (available debra ?s2)
      (available kevin ?s1)
      (available kevin ?s2)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)