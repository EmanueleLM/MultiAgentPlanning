(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (busy ?p - person ?s - slot)
    (agreed ?p - person ?s - slot)
    (scheduled ?s - slot)
    (scheduled-for ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action agree-alexander
    :parameters (?s - slot)
    :precondition (and
      (not (busy alexander ?s))
      (not (agreed alexander ?s))
    )
    :effect (agreed alexander ?s)
  )

  (:action agree-elizabeth
    :parameters (?s - slot)
    :precondition (and
      (not (busy elizabeth ?s))
      (not (agreed elizabeth ?s))
    )
    :effect (agreed elizabeth ?s)
  )

  (:action agree-walter
    :parameters (?s - slot)
    :precondition (and
      (not (busy walter ?s))
      (not (agreed walter ?s))
    )
    :effect (agreed walter ?s)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled ?s))
      (not (meeting-scheduled))
      (agreed alexander ?s)
      (agreed elizabeth ?s)
      (agreed walter ?s)
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