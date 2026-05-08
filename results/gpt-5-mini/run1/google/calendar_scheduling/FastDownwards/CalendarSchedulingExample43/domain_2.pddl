(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)

  (:predicates
    (busy ?p - person ?s - time_slot)
    (slot_free ?s - time_slot)
    (meeting_scheduled)
    (meeting_scheduled_at ?s - time_slot)
  )

  (:action schedule_slot
    :parameters (?s - time_slot)
    :precondition (and
      (slot_free ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at ?s)
      (not (slot_free ?s))
    )
  )
)