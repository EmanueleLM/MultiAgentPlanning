(define (problem san_francisco_nancy_meeting_instance)
  (:domain san_francisco_nancy_meeting)

  (:objects
    you - agent
    nancy - friend
    sunset_district haight_ashbury - location
    t_9_00_am t_7_15_pm t_7_30_pm t_8_45_pm t_9_45_pm - time
  )

  (:init
    (at you sunset_district)
    (current_time t_9_00_am)

    (next t_9_00_am t_7_15_pm)
    (next t_8_45_pm t_9_45_pm)

    (travel_15 sunset_district haight_ashbury t_7_15_pm t_7_30_pm)

    (nancy_available_for_75 haight_ashbury t_7_30_pm t_8_45_pm)
  )

  (:goal
    (and
      (met_nancy)
    )
  )
)