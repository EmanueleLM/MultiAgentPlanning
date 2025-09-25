(define (domain meeting_multia)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?person - person ?slot - slot)
    (meeting-scheduled ?slot - slot)
    (attending ?person - person ?slot - slot)
  )

  (:action diane-schedule
    :parameters (?s - slot)
    :precondition (and (free diane ?s) (free kelly ?s) (free deborah ?s))
    :effect (and
      (meeting-scheduled ?s)
      (attending diane ?s)
      (attending kelly ?s)
      (attending deborah ?s)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
    )
  )

  (:action kelly-schedule
    :parameters (?s - slot)
    :precondition (and (free diane ?s) (free kelly ?s) (free deborah ?s))
    :effect (and
      (meeting-scheduled ?s)
      (attending diane ?s)
      (attending kelly ?s)
      (attending deborah ?s)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
    )
  )

  (:action deborah-schedule
    :parameters (?s - slot)
    :precondition (and (free diane ?s) (free kelly ?s) (free deborah ?s))
    :effect (and
      (meeting-scheduled ?s)
      (attending diane ?s)
      (attending kelly ?s)
      (attending deborah ?s)
      (not (free diane ?s))
      (not (free kelly ?s))
      (not (free deborah ?s))
    )
  )
)