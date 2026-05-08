(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:constants lisa bobby randy - person)
  (:predicates
    (available ?p - person ?t - time)
    (meeting_scheduled)
  )

  (:action schedule_30min
    :parameters (?t - time)
    :precondition (and
      (available lisa ?t)
      (available bobby ?t)
      (available randy ?t)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)