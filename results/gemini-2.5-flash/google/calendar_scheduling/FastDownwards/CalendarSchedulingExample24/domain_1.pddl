(define (domain calendar_scheduling_24)
  (:requirements :strips :typing :negative-preconditions :existential-preconditions)
  (:types time_slot)
  (:predicates
    (benjamin_available ?s - time_slot)
    (hannah_available ?s - time_slot)
    (brenda_available ?s - time_slot)
    (meeting_scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (benjamin_available ?s)
      (hannah_available ?s)
      (brenda_available ?s)
      (not (meeting_scheduled ?s))
    )
    :effect (meeting_scheduled ?s)
  )
)