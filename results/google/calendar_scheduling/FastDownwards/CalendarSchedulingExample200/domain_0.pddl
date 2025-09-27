(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)       ; agent is free during slot
    (attending ?a - agent)            ; agent is required to attend
    (scheduled ?s - slot)             ; meeting scheduled at slot
    (meeting-scheduled)               ; meeting has been scheduled
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      ; all listed participants must be free in the chosen slot
      (free stephen ?s)
      (free elijah ?s)
      (free william ?s)
      (free jeremy ?s)
      (free timothy ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)