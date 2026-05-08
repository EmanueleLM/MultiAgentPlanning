(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    david eric roger - person
  )
  (:predicates
    (available ?p - person ?s - slot)
    (consecutive ?s1 ?s2 - slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (consecutive ?s1 ?s2)
      (available david ?s1)
      (available david ?s2)
      (available eric ?s1)
      (available eric ?s2)
      (available roger ?s1)
      (available roger ?s2)
    )
    :effect (meeting_scheduled)
  )
)