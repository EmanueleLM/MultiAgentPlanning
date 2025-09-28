(define (domain schedule-meeting)
  (:requirements :strips)
  (:predicates
    (slot ?t)
    (free ?a ?t)
    (scheduled ?t)
    (meeting-scheduled)
  )
  (:action schedule
    :parameters (?t ?michael ?samuel ?aaron ?judith ?kevin)
    :precondition (and
      (slot ?t)
      (free ?michael ?t)
      (free ?samuel ?t)
      (free ?aaron ?t)
      (free ?judith ?t)
      (free ?kevin ?t)
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
    )
  )
)