(define (domain calendar_scheduling_domain)
  (:requirements :strips :typing)
  (:types person time_slot)
  (:constants
    stephen edward angela - person
  )
  (:predicates
    (free ?p - person ?s - time_slot)
    (next ?s1 ?s2 - time_slot)
    (meeting_scheduled)
  )
  (:action schedule_1hr_meeting
    :parameters (?s1 ?s2 - time_slot)
    :precondition (and
      (next ?s1 ?s2)
      (free stephen ?s1)
      (free stephen ?s2)
      (free edward ?s1)
      (free edward ?s2)
      (free angela ?s1)
      (free angela ?s2)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)