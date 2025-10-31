(define (domain earliest-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (all-available ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  ;; Schedule the meeting at a slot that is marked all-available.
  ;; Prevent scheduling more than once with a negative precondition on meeting-scheduled.
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (all-available ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)