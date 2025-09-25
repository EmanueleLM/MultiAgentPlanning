(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants diane kelly deborah orchestrator - person)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled ?s - slot)
    (attended ?p - person)
    (scheduled-by ?s - slot ?a - person)
  )

  (:action schedule-by-diane
    :parameters (?s - slot)
    :precondition (and
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (attended diane)
      (attended kelly)
      (attended deborah)
      (scheduled-by ?s diane)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
    )
  )

  (:action schedule-by-kelly
    :parameters (?s - slot)
    :precondition (and
      (free kelly ?s)
      (free diane ?s)
      (free deborah ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (attended diane)
      (attended kelly)
      (attended deborah)
      (scheduled-by ?s kelly)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
    )
  )

  (:action schedule-by-deborah
    :parameters (?s - slot)
    :precondition (and
      (free deborah ?s)
      (free diane ?s)
      (free kelly ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (attended diane)
      (attended kelly)
      (attended deborah)
      (scheduled-by ?s deborah)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
    )
  )

  (:action schedule-by-orchestrator
    :parameters (?s - slot)
    :precondition (and
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (attended diane)
      (attended kelly)
      (attended deborah)
      (scheduled-by ?s orchestrator)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
    )
  )
)