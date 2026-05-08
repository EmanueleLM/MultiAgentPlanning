(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    sarah - person
    sunset_district union_square - location
    t_9_00_am t_9_30_am t_12_30_pm t_12_45_pm t_9_30_pm - time
  )

  (:init
    (at traveler sunset_district)
    (at sarah union_square)
    (current_time t_9_00_am)

    (next_time t_9_00_am t_9_30_am)
    (next_time t_9_30_am t_12_30_pm)
    (next_time t_12_30_pm t_12_45_pm)
    (next_time t_12_45_pm t_9_30_pm)

    (travel_arrives sunset_district union_square t_9_00_am t_9_30_am)

    (available sarah union_square t_12_30_pm t_12_45_pm)
  )

  (:goal
    (and
      (met sarah)
    )
  )
)