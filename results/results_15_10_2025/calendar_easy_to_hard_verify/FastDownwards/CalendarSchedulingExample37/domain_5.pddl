(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person time)
  (:predicates
    (available ?p - person ?t - time)
    (meeting-scheduled)
    (scheduled-at ?t - time)
  )

  (:action schedule-meeting
    :parameters (?t - time)
    :precondition (and
      (not (meeting-scheduled))
      (available ronald ?t)
      (available stephen ?t)
      (available brittany ?t)
      (available dorothy ?t)
      (available rebecca ?t)
      (available jordan ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )
)