(define (problem san_francisco_meet_mary_instance)
  (:domain san_francisco_meet_mary)

  (:objects
    t_9_00_am t_9_09_am t_12_07_pm t_4_15_pm - timepoint
  )

  (:init
    (at union_square)
    (current_time t_9_00_am)

    (can_travel union_square nob_hill t_9_00_am t_9_09_am)

    (next_time t_9_09_am t_12_00_pm)
    (next_time t_12_00_pm t_12_07_pm)
    (next_time t_12_07_pm t_1_15_pm)
    (next_time t_1_15_pm t_4_15_pm)

    (available mary t_12_00_pm)
    (available mary t_12_07_pm)
    (available mary t_1_15_pm)
    (available mary t_4_15_pm)
  )

  (:goal
    (and
      (met_minimum mary)
    )
  )
)