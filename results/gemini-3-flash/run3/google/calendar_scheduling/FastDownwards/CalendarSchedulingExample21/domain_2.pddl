(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  
  (:constants
    bobby scott kimberly - person
  )

  (:predicates
    (available ?p - person ?s - slot)
    (next_slot ?s1 ?s2 - slot)
    (meeting_scheduled)
  )

  (:action schedule_one_hour_meeting
    :parameters (?s1 ?s2 - slot)
    :precondition (and
      (next_slot ?s1 ?s2)
      ;; Everyone must be available for both consecutive 30-minute blocks
      (available bobby ?s1)
      (available bobby ?s2)
      (available scott ?s1)
      (available scott ?s2)
      (available kimberly ?s1)
      (available kimberly ?s2)
    )
    :effect (meeting_scheduled)
  )
)