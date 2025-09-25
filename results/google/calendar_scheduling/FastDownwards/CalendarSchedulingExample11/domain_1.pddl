(define (domain meeting-scheduling-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (attending-ready ?a - agent ?s - slot)
    (slotted ?s - slot)
    (meeting-scheduled ?s - slot)
    (meeting-scheduled-done)
  )

  (:action prepare-attend-alexander
    :parameters (?s - slot)
    :precondition (and (free alexander ?s) (not (slotted ?s)))
    :effect (attending-ready alexander ?s)
  )

  (:action prepare-attend-elizabeth
    :parameters (?s - slot)
    :precondition (and (free elizabeth ?s) (not (slotted ?s)))
    :effect (attending-ready elizabeth ?s)
  )

  (:action prepare-attend-walter
    :parameters (?s - slot)
    :precondition (and (free walter ?s) (not (slotted ?s)))
    :effect (attending-ready walter ?s)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (attending-ready alexander ?s)
      (attending-ready elizabeth ?s)
      (attending-ready walter ?s)
      (not (slotted ?s))
    )
    :effect (and
      (meeting-scheduled ?s)
      (slotted ?s)
      (meeting-scheduled-done)
    )
  )
)