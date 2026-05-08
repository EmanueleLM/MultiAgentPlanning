(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (seq4 ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot)
    (scheduled ?s - slot)
    (scheduled_any)
  )

  (:action schedule
    :parameters (?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot)
    :precondition (and
      (seq4 ?s1 ?s2 ?s3 ?s4)
      ;; all participants must be free for all four 15-min slots composing the 60-min meeting
      (free bobby ?s1) (free bobby ?s2) (free bobby ?s3) (free bobby ?s4)
      (free scott ?s1) (free scott ?s2) (free scott ?s3) (free scott ?s4)
      (free kimberly ?s1) (free kimberly ?s2) (free kimberly ?s3) (free kimberly ?s4)
    )
    :effect (and
      (scheduled ?s1)
      (scheduled_any)
    )
  )
)