(define (domain integrated-meeting-schedule)
  (:requirements :strips :typing)
  (:types person slot)

  (:predicates
    (free ?p - person ?s - slot)
    (earliest ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (is-orchestrator ?o - person)
  )

  (:action schedule-meeting
    :parameters (?o - person ?p1 - person ?p2 - person ?p3 - person ?s - slot)
    :precondition (and
      (is-orchestrator ?o)
      (earliest ?s)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (not (free ?p1 ?s))
      (not (free ?p2 ?s))
      (not (free ?p3 ?s))
    )
  )
)