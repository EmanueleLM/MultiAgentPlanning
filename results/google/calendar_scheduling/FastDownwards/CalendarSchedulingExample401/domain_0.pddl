(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot meeting)
  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (meeting ?m - meeting)
    ; participant is available to start a 30-minute meeting at slot ?s
    (available ?p - participant ?s - slot)
    ; meeting has not yet been scheduled
    (unscheduled ?m - meeting)
    ; meeting ?m has been scheduled to start at slot ?s
    (scheduled ?m - meeting ?s - slot)
  )

  ; Schedule a meeting at a specific 30-minute slot for a participant.
  ; Precondition requires that the participant is available at that slot and
  ; that the meeting has not already been scheduled.
  (:action schedule
    :parameters (?m - meeting ?s - slot ?p - participant)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (participant ?p)
      (unscheduled ?m)
      (available ?p ?s)
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled ?m ?s)
    )
  )
)