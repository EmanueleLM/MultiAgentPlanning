(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    you - traveler
    mission_district haight_ashbury - location
    margaret - friend
    t_9_00_am t_9_11_am t_9_12_am t_9_30_am t_9_41_am t_9_42_am t_10_00_am t_10_11_am t_10_12_am t_3_45_pm - time
  )

  (:init
    (at you mission_district)
    (current_time t_9_00_am)

    (connected mission_district haight_ashbury)
    (connected haight_ashbury mission_district)

    (travel_arrives mission_district haight_ashbury t_9_00_am t_9_12_am)
    (travel_arrives mission_district haight_ashbury t_9_30_am t_9_42_am)
    (travel_arrives haight_ashbury mission_district t_9_00_am t_9_11_am)
    (travel_arrives haight_ashbury mission_district t_9_30_am t_9_41_am)
    (travel_arrives haight_ashbury mission_district t_10_00_am t_10_11_am)

    (meet30_end t_9_00_am t_9_30_am)
    (meet30_end t_9_12_am t_9_42_am)
    (meet30_end t_9_41_am t_10_11_am)
    (meet30_end t_9_42_am t_10_12_am)

    (friend_at margaret haight_ashbury)

    (available_start_for_meeting margaret t_9_00_am)
    (available_start_for_meeting margaret t_9_12_am)
    (available_start_for_meeting margaret t_9_41_am)
    (available_start_for_meeting margaret t_9_42_am)
  )

  (:goal
    (and
      (met margaret)
    )
  )
)