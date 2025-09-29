(define (domain schedule-meeting)
  (:requirements :strips)
  (:predicates
    (slot ?t)
    (free ?a ?t)
    (scheduled ?t)
    (meeting-scheduled)
  )

  ;; Schedule the meeting at a chosen time t if every participant is free at t.
  (:action schedule
    :parameters (?t)
    :precondition (and
      (slot ?t)
      (free michael ?t)
      (free samuel ?t)
      (free aaron ?t)
      (free judith ?t)
      (free kevin ?t)
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
    )
  )
)