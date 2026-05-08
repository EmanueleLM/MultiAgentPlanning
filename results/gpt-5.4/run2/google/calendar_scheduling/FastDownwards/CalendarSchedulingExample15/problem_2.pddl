(define (problem calendar_scheduling_example15_problem)
  (:domain calendar_scheduling_example15)

  (:init
    (free_t1200_1230)
    (free_t1230_1300)
    (free_t1300_1330)
    (free_t1600_1630)
  )

  (:goal
    (or
      (scheduled_t1200_1230)
      (scheduled_t1230_1300)
      (scheduled_t1300_1330)
      (scheduled_t1600_1630)
    )
  )
)