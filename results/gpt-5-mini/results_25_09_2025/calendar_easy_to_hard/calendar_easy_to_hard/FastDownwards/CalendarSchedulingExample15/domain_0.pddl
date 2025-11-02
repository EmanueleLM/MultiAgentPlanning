(define (domain multi-agent-meeting)
  (:requirements :strips)
  (:predicates
    (slot ?s)
    (free-joyce ?s)
    (free-christine ?s)
    (free-alexander ?s)
    (scheduled)
    (scheduled-at ?s)
  )

  ;; A meeting can be scheduled at a slot only if all participants are free at that slot.
  (:action schedule-meeting
    :parameters (?s)
    :precondition (and (slot ?s) (free-joyce ?s) (free-christine ?s) (free-alexander ?s))
    :effect (and (scheduled) (scheduled-at ?s))
  )
)