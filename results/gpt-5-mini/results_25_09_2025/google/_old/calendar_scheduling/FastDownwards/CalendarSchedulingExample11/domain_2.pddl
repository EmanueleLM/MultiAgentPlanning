(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (busy ?p - person ?s - slot)
    (scheduled ?s - slot)
    (scheduled-for ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled ?s))
      (not (busy alexander ?s))
      (not (busy elizabeth ?s))
      (not (busy walter ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (scheduled-for alexander ?s)
      (scheduled-for elizabeth ?s)
      (scheduled-for walter ?s)
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)