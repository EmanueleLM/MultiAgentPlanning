(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot)
  (:predicates
    (slot ?s - slot)
    (available-billy ?s - slot)
    (available-maria ?s - slot)
    (available-william ?s - slot)
    (token)
    (meeting-scheduled)
    (scheduled ?s - slot)
  )

  ;; Schedule a single meeting into one slot that all three participants can attend.
  ;; The token ensures only one scheduling action can succeed (so exactly one meeting is chosen).
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (available-billy ?s)
      (available-maria ?s)
      (available-william ?s)
      (token)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
      (not (token))
    )
  )
)