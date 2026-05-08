(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?p1 ?p2 ?p3 - person ?s1 ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free ?p1 ?s1)
      (free ?p1 ?s2)
      (free ?p2 ?s1)
      (free ?p2 ?s2)
      (free ?p3 ?s1)
      (free ?p3 ?s2)
    )
    :effect (meeting_scheduled)
  )
)