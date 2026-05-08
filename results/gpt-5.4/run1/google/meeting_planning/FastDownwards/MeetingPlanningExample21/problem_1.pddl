(define (problem san_francisco_meet_margaret_instance)
  (:domain san_francisco_meet_margaret)

  (:init
    (at mission_district)
    (current_time t_900)

    (connected mission_district haight_ashbury)
    (connected haight_ashbury mission_district)

    (next_time t_900 t_912)
    (next_time t_912 t_315pm)
    (next_time t_315pm t_345pm)

    (travel_arrival mission_district haight_ashbury t_900 t_912)

    (available_at margaret haight_ashbury t_315pm)
    (available_at margaret haight_ashbury t_345pm)
  )

  (:goal
    (and
      (met margaret)
    )
  )
)