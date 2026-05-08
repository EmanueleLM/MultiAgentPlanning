(define (problem calendar_scheduling_example26_problem)
  (:domain calendar_scheduling_example26)

  (:objects
    start_10_00 start_11_00 start_15_30 - start_time
    meeting_1 - meeting
  )

  (:init
    (free_at katherine start_10_00)
    (free_at katherine start_11_00)
    (free_at katherine start_15_30)
    (free_at nicole start_10_00)
    (free_at nicole start_11_00)
    (free_at nicole start_15_30)
    (free_at kevin start_11_00)
    (free_at kevin start_15_30)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)