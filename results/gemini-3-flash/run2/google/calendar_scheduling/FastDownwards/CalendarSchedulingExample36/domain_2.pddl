(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants ryan ruth denise - person)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )

  (:action schedule_one_hour
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free ryan ?s1)
      (free ryan ?s2)
      (free ruth ?s1)
      (free ruth ?s2)
      (free denise ?s1)
      (free denise ?s2)
    )
    :effect (meeting_scheduled)
  )
)