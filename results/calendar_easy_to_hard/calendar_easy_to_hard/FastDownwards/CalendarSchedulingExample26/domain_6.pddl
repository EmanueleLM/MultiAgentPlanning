(define (domain calendarschedulingexample26)
  (:requirements :strips :typing :universal-preconditions)
  (:types participant slot)
  (:predicates
    (available ?p - participant ?s - slot)
    (allowed-slot ?s - slot)
    (scheduled-at ?s - slot)
    (meeting-scheduled)
  )
  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and
      (allowed-slot ?s)
      (forall (?p - participant) (available ?p ?s))
    )
    :effect (and (meeting-scheduled) (scheduled-at ?s))
  )
)