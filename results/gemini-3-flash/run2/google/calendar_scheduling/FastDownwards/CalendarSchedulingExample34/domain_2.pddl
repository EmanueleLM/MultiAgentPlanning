(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person time_slot)
  (:constants
    willie richard noah - person
  )
  (:predicates
    (free ?p - person ?s - time_slot)
    (consecutive ?s1 ?s2 - time_slot)
    (meeting_scheduled)
  )
  (:action schedule_1h_meeting
    :parameters (?s1 ?s2 - time_slot)
    :precondition (and
      (consecutive ?s1 ?s2)
      (free willie ?s1)
      (free willie ?s2)
      (free richard ?s1)
      (free richard ?s2)
      (free noah ?s1)
      (free noah ?s2)
    )
    :effect (meeting_scheduled)
  )
)