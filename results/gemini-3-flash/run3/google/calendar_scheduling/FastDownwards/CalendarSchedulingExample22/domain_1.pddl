(define (domain calendar_scheduling_domain)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    theresa charles betty - person
  )
  (:predicates
    (free ?p - person ?s - slot)
    (next_slot ?s1 ?s2 - slot)
    (meeting_scheduled)
  )
  (:action schedule_one_hour
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next_slot ?s1 ?s2)
      (free theresa ?s1)
      (free theresa ?s2)
      (free charles ?s1)
      (free charles ?s2)
      (free betty ?s1)
      (free betty ?s2)
    )
    :effect (meeting_scheduled)
  )
)