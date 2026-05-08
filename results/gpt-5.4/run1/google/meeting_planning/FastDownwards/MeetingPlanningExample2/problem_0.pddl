(define (problem san_francisco_meet_jessica_instance)
  (:domain san_francisco_meet_jessica)

  (:objects
    haight_ashbury sunset_district - location
    jessica - person
    t_0900 t_0915 t_1515 t_1645 t_2015 - timepoint
  )

  (:init
    (at haight_ashbury)
    (current_time t_0900)

    (next t_0900 t_0915)
    (next t_0915 t_1515)
    (next t_1515 t_1645)
    (next t_1645 t_2015)

    (travel_link haight_ashbury sunset_district t_0900 t_0915)

    (available jessica t_1515)
    (meet_span t_1515 t_1645)
    (meetable_at jessica sunset_district)
  )

  (:goal
    (and
      (met jessica)
    )
  )
)