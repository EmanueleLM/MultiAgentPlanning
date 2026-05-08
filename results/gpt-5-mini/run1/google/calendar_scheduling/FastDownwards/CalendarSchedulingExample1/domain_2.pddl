(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot person)

  (:predicates
    (slot ?s - slot)
    (free ?p - person ?s - slot)
    (preferred_start ?s - slot)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  ;; Schedule during preferred hours (Billy's preference: starts before 15:00).
  (:action schedule-preferred
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (preferred_start ?s)
      (not (meeting_scheduled))
      (free raymond ?s)
      (free billy ?s)
      (free donald ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )

  ;; Fallback: schedule at any feasible slot if no preferred slot is used.
  (:action schedule-any
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (meeting_scheduled))
      (free raymond ?s)
      (free billy ?s)
      (free donald ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )
)