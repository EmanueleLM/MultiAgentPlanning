(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (attendee ?a - agent)
    (slot ?s - slot)
    (free ?a - agent ?s - slot) ; agent is free at a given half-hour slot
    (scheduled ?s - slot)       ; meeting scheduled at slot
    (meeting-scheduled)         ; meeting has been scheduled
  )

  ;; Single scheduling action: schedules meeting at a chosen slot if every required attendee is free.
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (free jesse ?s)
      (free nancy ?s)
      (free isabella ?s)
      (free harold ?s)
      (free linda ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
      (not (free jesse ?s))
      (not (free nancy ?s))
      (not (free isabella ?s))
      (not (free harold ?s))
      (not (free linda ?s))
    )
  )
)