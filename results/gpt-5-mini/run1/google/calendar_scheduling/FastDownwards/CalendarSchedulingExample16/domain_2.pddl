(define (domain calendar_scheduling_example16)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time)
  (:predicates
    (available ?p - person ?t - time)
    (meeting_scheduled)
    (meeting_time ?t - time)
  )

  (:action schedule_at
    :parameters (?t - time)
    :precondition (and
      (not (meeting_scheduled))
      (available scott ?t)
      (available gabriel ?t)
      (available christine ?t)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_time ?t)
    )
  )
)