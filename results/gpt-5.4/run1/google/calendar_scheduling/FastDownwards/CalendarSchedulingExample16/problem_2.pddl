(define (problem calendar_scheduling_example16_problem)
  (:domain calendar_scheduling_example16)

  (:objects
    t_1000 t_1230 - start_time
  )

  (:init
    (available scott t_1000)
    (available scott t_1230)
    (available gabriel t_1000)
    (available gabriel t_1230)
    (available christine t_1000)
    (available christine t_1230)
  )

  (:goal
    (meeting_scheduled)
  )
)