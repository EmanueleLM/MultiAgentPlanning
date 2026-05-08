(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    anthony pamela zachary - person
  )
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )
  (:action schedule_1h_meeting
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free anthony ?s1)
      (free anthony ?s2)
      (free pamela ?s1)
      (free pamela ?s2)
      (free zachary ?s1)
      (free zachary ?s2)
    )
    :effect (meeting_scheduled)
  )
)