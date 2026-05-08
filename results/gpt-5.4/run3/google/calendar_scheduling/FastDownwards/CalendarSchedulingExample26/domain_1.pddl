(define (domain calendar_scheduling_example26)
  (:requirements :strips :typing)

  (:types
    participant
    start_time
    meeting
  )

  (:predicates
    (free_at ?p - participant ?t - start_time)
    (scheduled ?m - meeting)
    (starts_at ?m - meeting ?t - start_time)
  )

  (:action schedule_at
    :parameters (?m - meeting ?t - start_time)
    :precondition (and
      (free_at katherine ?t)
      (free_at nicole ?t)
      (free_at kevin ?t)
      (not (scheduled ?m))
    )
    :effect (and
      (scheduled ?m)
      (starts_at ?m ?t)
    )
  )
)