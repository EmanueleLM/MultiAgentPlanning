(define (domain single-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:constants diane kelly deborah - participant)
  (:predicates
    (free ?p - participant ?s - slot)
    (earliest-slot ?s - slot)
    (meeting-scheduled)
  )
  (:action schedule-meeting-at
    :parameters (?s - slot)
    :precondition (and
      (earliest-slot ?s)
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
    )
  )
)