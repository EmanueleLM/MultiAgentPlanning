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

  (:action schedule-meeting-by-orchestrator
    :parameters (?o - person ?s - slot)
    :precondition (and
      (is-orchestrator ?o)
      (earliest ?s)
      (free jesse ?s)
      (free kathryn ?s)
      (free megan ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (not (free jesse ?s))
      (not (free kathryn ?s))
      (not (free megan ?s))
    )
  )
)