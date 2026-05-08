(define (domain calendar_scheduling_example_9)
  (:requirements :strips :typing)
  (:types timepoint)
  (:predicates
    (next ?t1 ?t2 - timepoint)
    (diane_available ?t - timepoint)
    (kelly_available ?t - timepoint)
    (deborah_available ?t - timepoint)
    (meeting_scheduled)
  )

  ;; Action to schedule a single 30-minute meeting block.
  ;; The meeting duration is exactly one time interval (e.g., from ?ts to ?te).
  (:action schedule_half_hour
    :parameters (?ts ?te - timepoint)
    :precondition (and
      (next ?ts ?te)
      (diane_available ?ts)
      (kelly_available ?ts)
      (deborah_available ?ts)
    )
    :effect (meeting_scheduled)
  )
)