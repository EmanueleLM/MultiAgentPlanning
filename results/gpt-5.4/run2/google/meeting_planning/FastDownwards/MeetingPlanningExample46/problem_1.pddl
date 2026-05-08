(define (problem meet_robert_instance)
  (:domain meet_robert_san_francisco)

  (:objects
    t_9_00_am t_9_19_am t_4_30_pm t_6_00_pm t_7_30_pm t_9_30_pm - timepoint
  )

  (:init
    (at haight_ashbury)
    (current_time t_9_00_am)

    (connected haight_ashbury north_beach)
    (connected north_beach haight_ashbury)

    (travel_arrives haight_ashbury north_beach t_9_00_am t_9_19_am)

    (wait_step t_9_00_am t_4_30_pm)
    (wait_step t_9_19_am t_4_30_pm)
    (wait_step t_4_30_pm t_6_00_pm)
    (wait_step t_6_00_pm t_9_30_pm)
    (wait_step t_7_30_pm t_9_30_pm)

    (available_start robert t_4_30_pm)
    (available_start robert t_6_00_pm)

    (enough_time_for_90 robert t_4_30_pm)
    (enough_time_for_90 robert t_6_00_pm)

    (meet_90_ends t_4_30_pm t_6_00_pm)
    (meet_90_ends t_6_00_pm t_7_30_pm)
  )

  (:goal
    (and
      (met_90 robert)
    )
  )
)