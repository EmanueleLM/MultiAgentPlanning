(define (problem meet_friends)
  (:domain meeting_planning)
  (:objects
    sunset_district union_square - location
    t0900 t0930 t1230 t1245 - time
  )
  (:init
    (at_me sunset_district)
    (time_at t0900)
    (can_travel sunset_district union_square t0900 t0930)
    (can_wait t0930 t1230)
    (can_meet_sarah union_square t1230 t1245)
  )
  (:goal (met_sarah))
)