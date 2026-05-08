(define (domain calendar_scheduling_example16)
  (:requirements :strips :typing)

  (:types
    participant
    start_time
  )

  (:predicates
    (available ?p - participant ?t - start_time)
    (meeting_scheduled)
    (chosen_start ?t - start_time)
  )

  (:action schedule_at
    :parameters (?t - start_time)
    :precondition (and
      (not (meeting_scheduled))
      (available scott ?t)
      (available gabriel ?t)
      (available christine ?t)
    )
    :effect (and
      (meeting_scheduled)
      (chosen_start ?t)
    )
  )
)