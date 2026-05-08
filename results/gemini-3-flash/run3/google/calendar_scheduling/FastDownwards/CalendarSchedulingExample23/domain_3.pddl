(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants billy maria william - person)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free billy ?s1)
      (free billy ?s2)
      (free maria ?s1)
      (free maria ?s2)
      (free william ?s1)
      (free william ?s2)
    )
    :effect (meeting_scheduled)
  )
)