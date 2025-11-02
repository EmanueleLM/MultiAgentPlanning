(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    (free ?a - agent ?s - slot)        ; participant is free at slot
    (selected ?s - slot)               ; meeting selected at slot
    (meeting-scheduled)                ; meeting has been scheduled
  )

  ;; Schedule the meeting at a specific 30-minute slot.
  ;; Preconditions require that the meeting has not already been scheduled
  ;; and that every participant is free at that slot.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (meeting-scheduled))
      (free kathryn ?s)
      (free charlotte ?s)
      (free lauren ?s)
    )
    :effect (and
      (meeting-scheduled)
      (selected ?s)
    )
  )
)