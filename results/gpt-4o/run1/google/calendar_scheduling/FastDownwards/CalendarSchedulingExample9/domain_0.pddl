(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)
  (:predicates
    (is_busy ?p - participant ?s - time_slot)
    (meeting_scheduled)
    (slot_chosen ?s - time_slot)
  )
  (:action Schedule_Meeting
    :parameters (?s - time_slot)
    :precondition (and
      (not (meeting_scheduled))
      (not (is_busy diane ?s))
      (not (is_busy kelly ?s))
      (not (is_busy deborah ?s))
    )
    :effect (and
      (meeting_scheduled)
      (slot_chosen ?s)
    )
  )
)