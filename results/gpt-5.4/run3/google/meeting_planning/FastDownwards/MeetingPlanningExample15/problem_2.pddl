(define (problem san_francisco_john_meeting_instance)
  (:domain san_francisco_john_meeting)

  (:init
    (at russian_hill)
    (current_time t_9_00_am)
    (john_at john golden_gate_park)
    (john_available john t_1_00_pm t_6_15_pm)
    (next t_9_00_am t_12_39_pm)
    (next t_12_39_pm t_1_00_pm)
    (next t_1_00_pm t_2_30_pm)
    (next t_2_30_pm t_6_15_pm)
  )

  (:goal
    (and
      (met_minimum john)
    )
  )
)