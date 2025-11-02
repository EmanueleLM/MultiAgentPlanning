(define (domain integrated-meeting-schedule)
  (:requirements :strips :typing)
  (:types person slot)

  (:predicates
    (free ?p - person ?s - slot)
    (free-for-all ?s - slot)
    (earliest-precond ?s - slot)
    (meeting-available)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and (free-for-all ?s) (earliest-precond ?s) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at ?s))
  )
)