(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person time)
  (:constants olivia anna virginia paul - person)
  (:predicates
    (free ?p - person ?t - time)
    (meeting-scheduled)
  )
  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (not (meeting-scheduled))
      (free olivia ?t)
      (free anna ?t)
      (free virginia ?t)
      (free paul ?t)
    )
    :effect (and
      (meeting-scheduled)
    )
  )
)