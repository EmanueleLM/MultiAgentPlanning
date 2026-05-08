(define (problem visit_sf_problem)
  (:domain san_francisco_visit)
  (:objects
    sunset_district union_square - location
    sarah - friend
    t9 t930 t1000 t1030 t1100 t1130 t1200 t1230 t1245 t1300 t1330 - time
  )
  (:init
    (at_location sunset_district)
    (current_time t9)
    (friend_available sarah union_square t1230 t1330)
    (next_time t9 t930)
    (next_time t930 t1000)
    (next_time t1000 t1030)
    (next_time t1030 t1100)
    (next_time t1100 t1130)
    (next_time t1130 t1200)
    (next_time t1200 t1230)
    (next_time t1230 t1245)
    (next_time t1245 t1300)
    (next_time t1300 t1330)
  )
  (:goal (and 
    (met_friend sarah)
    (can_meet sarah t1330)
  ))
)