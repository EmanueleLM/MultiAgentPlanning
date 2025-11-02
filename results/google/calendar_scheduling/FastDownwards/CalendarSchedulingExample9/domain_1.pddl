(define (domain single-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:constants diane kelly deborah - participant)
  (:predicates
    (free ?p - participant ?s - slot)
    (meeting-scheduled)
  )
  (:action schedule-meeting-at
    :parameters (?s - slot)
    :precondition (and
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