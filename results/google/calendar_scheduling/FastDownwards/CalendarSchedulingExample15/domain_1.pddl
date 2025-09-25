(define (domain multi-agent-meeting)
  (:requirements :typing :negative-preconditions)
  (:types slot)
  (:predicates
    (slot ?s - slot)
    (available-joyce ?s - slot)
    (available-christine ?s - slot)
    (available-alexander ?s - slot)
    (busy-joyce ?s - slot)
    (busy-christine ?s - slot)
    (busy-alexander ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )
  (:action joyce-schedule
    :parameters (?s - slot)
    :precondition (and
      (available-joyce ?s)
      (available-christine ?s)
      (available-alexander ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
  (:action christine-schedule
    :parameters (?s - slot)
    :precondition (and
      (available-joyce ?s)
      (available-christine ?s)
      (available-alexander ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
  (:action alexander-schedule
    :parameters (?s - slot)
    :precondition (and
      (available-joyce ?s)
      (available-christine ?s)
      (available-alexander ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)