(define (domain calendarscheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    willie richard noah - person
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