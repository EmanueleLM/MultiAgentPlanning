(define (domain meeting-scheduling)
  (:requirements :strips)
  (:predicates
    (free ?person ?slot)
    (scheduled)
    (meeting-at ?slot)
  )

  ;; Schedule the 30-minute meeting at a given discrete 30-min slot.
  ;; Preconditions require every participant to be free at that slot
  ;; and that no meeting has already been scheduled.
  (:action schedule
    :parameters (?s)
    :precondition (and
      (not (scheduled))
      (free nicholas ?s)
      (free emma ?s)
      (free catherine ?s)
      (free steven ?s)
      (free adam ?s)
      (free lori ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)