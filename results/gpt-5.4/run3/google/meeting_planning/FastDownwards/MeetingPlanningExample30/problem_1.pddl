(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:init
    (at richmond_district)
    (current_time t_900)
    (travel_17 richmond_district north_beach)
    (travel_18 north_beach richmond_district)
    (next t_900 t_917)
    (next t_917 t_930)
    (next t_930 t_1130)
    (next t_1130 t_1615)
    (after_17 t_900 t_917)
    (person_at stephanie north_beach)
    (available_at stephanie t_930)
  )

  (:goal
    (and
      (met_minimum stephanie)
      (at north_beach)
      (current_time t_1130)
    )
  )
)