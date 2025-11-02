(define (domain multi-agent-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule-by-diane
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
    )
  )

  (:action schedule-by-kelly
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
    )
  )

  (:action schedule-by-deborah
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
    )
  )
)