(define (domain calendar_scheduling_domain)
  (:requirements :strips :typing)
  (:types person time_slot)
  (:constants
    kathryn charlotte lauren - person
  )
  (:predicates
    (available ?p - person ?s - time_slot)
    (charlotte_prefers ?s - time_slot)
    (meeting_scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (available kathryn ?s)
      (available charlotte ?s)
      (charlotte_prefers ?s)
      (available lauren ?s)
    )
    :effect (meeting_scheduled ?s)
  )
)