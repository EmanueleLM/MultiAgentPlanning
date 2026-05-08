(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    bobby scott kimberly - person
  )
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (scheduled)
  )
  (:action schedule_1_hour_meeting
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free bobby ?s1)
      (free bobby ?s2)
      (free scott ?s1)
      (free scott ?s2)
      (free kimberly ?s1)
      (free kimberly ?s2)
    )
    :effect (scheduled)
  )
)