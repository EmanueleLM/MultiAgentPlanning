(define (problem meet_george_instance)
  (:domain meet_george_san_francisco_day)

  (:objects
    t_0730 t_0745 t_0800 t_0815 t_0830 t_0845 t_0900 t_0915 t_0918 t_0930
    t_0945 t_1000 t_1003 t_1015 t_1030 t_1045 t_1100 t_1115 t_1130 t_1145
    t_1200 t_1215 t_1230 t_1245 t_1315 - time
  )

  (:init
    (at north_beach)
    (current_time t_0900)
    (person_at george haight_ashbury)

    (next_time t_0730 t_0745)
    (next_time t_0745 t_0800)
    (next_time t_0800 t_0815)
    (next_time t_0815 t_0830)
    (next_time t_0830 t_0845)
    (next_time t_0845 t_0900)
    (next_time t_0900 t_0915)
    (next_time t_0915 t_0918)
    (next_time t_0918 t_0930)
    (next_time t_0930 t_0945)
    (next_time t_0945 t_1000)
    (next_time t_1000 t_1003)
    (next_time t_1003 t_1015)
    (next_time t_1015 t_1030)
    (next_time t_1030 t_1045)
    (next_time t_1045 t_1100)
    (next_time t_1100 t_1115)
    (next_time t_1115 t_1130)
    (next_time t_1130 t_1145)
    (next_time t_1145 t_1200)
    (next_time t_1200 t_1215)
    (next_time t_1215 t_1230)
    (next_time t_1230 t_1245)
    (next_time t_1245 t_1315)

    (travel_edge north_beach haight_ashbury t_0900 t_0918)

    (meet45_edge t_0918 t_1003)
    (available_start george t_0918)
  )

  (:goal
    (and
      (met george)
    )
  )
)