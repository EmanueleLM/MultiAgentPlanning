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
    :parameters (?p1 ?p2 ?p3 - person ?s - slot)
    :precondition (and
      (not (scheduled ?s))
      (not (busy ?p1 ?s))
      (not (busy ?p2 ?s))
      (not (busy ?p3 ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (scheduled-for ?p1 ?s)
      (scheduled-for ?p2 ?s)
      (scheduled-for ?p3 ?s)
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)