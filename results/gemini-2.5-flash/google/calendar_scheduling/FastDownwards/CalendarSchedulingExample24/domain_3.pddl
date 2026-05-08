(define (domain calendar_scheduling_24)
  (:requirements :strips :typing :negative-preconditions)
  (:types time_slot)
  (:predicates
    (benjamin_available ?s - time_slot)
    (hannah_available ?s - time_slot)
    (brenda_available ?s - time_slot)
    (meeting_scheduled ?s - time_slot)
    (meeting_is_scheduled) ; New predicate to mark that a meeting has been scheduled
  )

  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (benjamin_available ?s)
      (hannah_available ?s)
      (brenda_available ?s)
      (not (meeting_is_scheduled)) ; Ensure only one meeting is scheduled overall
    )
    :effect (and
      (meeting_scheduled ?s)
      (meeting_is_scheduled)
    )
  )