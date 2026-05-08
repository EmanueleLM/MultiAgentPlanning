(define (domain calendar_scheduling_domain)
  (:requirements :strips :typing)
  (:types person time_slot)
  (:predicates
    (available ?p - person ?s - time_slot)
    (charlotte_prefers ?s - time_slot) ; True if Charlotte's preference allows meeting in this slot
    (meeting_scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (available kathryn ?s)
      (available charlotte ?s)
      (charlotte_prefers ?s) ; Incorporate Charlotte's specific preference
      (available lauren ?s)
    )
    :effect (meeting_scheduled ?s)
  )
)