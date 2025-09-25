(define (domain meeting-scheduling-multiagent)
  (:requirements :typing :negative-preconditions :adl)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (attending_ready ?a - agent ?s - slot)
    (slotted ?s - slot)
    (meeting_scheduled ?s - slot)
    (meeting_scheduled_done)
  )

  (:action prepare_attend_alexander
    :parameters (?s - slot)
    :precondition (and (free alexander ?s) (not (slotted ?s)))
    :effect (and (attending_ready alexander ?s) (not (free alexander ?s)))
  )

  (:action prepare_attend_elizabeth
    :parameters (?s - slot)
    :precondition (and (free elizabeth ?s) (not (slotted ?s)))
    :effect (and (attending_ready elizabeth ?s) (not (free elizabeth ?s)))
  )

  (:action prepare_attend_walter
    :parameters (?s - slot)
    :precondition (and (free walter ?s) (not (slotted ?s)))
    :effect (and (attending_ready walter ?s) (not (free walter ?s)))
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (attending_ready alexander ?s)
      (attending_ready elizabeth ?s)
      (attending_ready walter ?s)
      (not (slotted ?s))
    )
    :effect (and
      (meeting_scheduled ?s)
      (slotted ?s)
      (meeting_scheduled_done)
      (not (attending_ready alexander ?s))
      (not (attending_ready elizabeth ?s))
      (not (attending_ready walter ?s))
    )
  )
)