(define (problem visit_san_francisco)
  (:domain san_francisco_visit)
  (:objects
    mission_district haight_ashbury - location
    margaret - person
    t9_00am t9_12am t9_42am t10_00am t3_45pm - time
  )
  (:init
    (at_location mission_district)
    (can_meet margaret)
    (next_time t9_00am t9_12am)
    (next_time t9_12am t9_42am)
    (next_time t9_42am t10_00am)
    (next_time t10_00am t3_45pm)
  )
  (:goal
    (visited margaret)
  )
)