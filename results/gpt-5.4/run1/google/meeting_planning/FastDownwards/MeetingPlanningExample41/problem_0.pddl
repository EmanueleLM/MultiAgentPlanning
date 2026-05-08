(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    north_beach haight_ashbury - location
    george - person
    t_0900 t_0918 t_1003 t_1315 - timepoint
    george_slot_0918_1003 - interval
  )

  (:init
    (at north_beach)
    (current_time t_0900)

    (person_at george haight_ashbury)

    (route north_beach haight_ashbury t_0900 t_0918)

    (available_interval george george_slot_0918_1003)
    (interval_start george_slot_0918_1003 t_0918)
    (interval_end george_slot_0918_1003 t_1003)
  )

  (:goal
    (and
      (met george)
    )
  )
)