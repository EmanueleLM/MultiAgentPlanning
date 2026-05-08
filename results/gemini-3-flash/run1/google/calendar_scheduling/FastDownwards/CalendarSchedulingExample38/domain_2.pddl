(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants catherine michael alexander - person)
  (:predicates
    (person_available ?p - person ?s - slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (person_available catherine ?s)
      (person_available michael ?s)
      (person_available alexander ?s)
    )
    :effect (meeting_scheduled)
  )
)