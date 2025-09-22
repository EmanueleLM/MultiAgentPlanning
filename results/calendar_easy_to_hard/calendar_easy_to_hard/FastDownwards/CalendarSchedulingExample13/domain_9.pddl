(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-slot ?s - slot)
    (meeting-with ?p - person)
  )
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free diane ?s) (free jack ?s) (free eugene ?s) (free patricia ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-slot ?s)
      (meeting-with diane) (meeting-with jack) (meeting-with eugene) (meeting-with patricia)
      (not (free diane ?s)) (not (free jack ?s)) (not (free eugene ?s)) (not (free patricia ?s))
    )
  )
)