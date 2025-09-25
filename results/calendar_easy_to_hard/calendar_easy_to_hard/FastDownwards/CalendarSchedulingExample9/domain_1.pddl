(define (domain meeting_multia)
  (:requirements :strips :adl)
  (:predicates
    (free ?person ?slot)
    (meeting-scheduled ?slot)
    (attending ?person ?slot)
  )

  (:action diane-schedule
    :parameters (?slot)
    :precondition (and (free diane ?slot) (free kelly ?slot) (free deborah ?slot))
    :effect (and
      (meeting-scheduled ?slot)
      (attending diane ?slot)
      (attending kelly ?slot)
      (attending deborah ?slot)
      (not (free diane ?slot))
      (not (free kelly ?slot))
      (not (free deborah ?slot))
    )
  )

  (:action kelly-schedule
    :parameters (?slot)
    :precondition (and (free diane ?slot) (free kelly ?slot) (free deborah ?slot))
    :effect (and
      (meeting-scheduled ?slot)
      (attending diane ?slot)
      (attending kelly ?slot)
      (attending deborah ?slot)
      (not (free diane ?slot))
      (not (free kelly ?slot))
      (not (free deborah ?slot))
    )
  )

  (:action deborah-schedule
    :parameters (?slot)
    :precondition (and (free diane ?slot) (free kelly ?slot) (free deborah ?slot))
    :effect (and
      (meeting-scheduled ?slot)
      (attending diane ?slot)
      (attending kelly ?slot)
      (attending deborah ?slot)
      (not (free diane ?slot))
      (not (free kelly ?slot))
      (not (free deborah ?slot))
    )
  )
)