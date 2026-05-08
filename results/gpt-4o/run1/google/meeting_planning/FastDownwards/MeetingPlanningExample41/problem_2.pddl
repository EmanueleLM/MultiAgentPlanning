(define (problem meet_friends_in_san_francisco)
  (:domain san_francisco_visit)
  (:objects
    north_beach haight_ashbury - location
    george planner - person
  )
  (:init
    (at planner north_beach)
    (at george haight_ashbury)
    (next_visit_state north_beach haight_ashbury)
    (next_visit_state haight_ashbury north_beach)
    (can_meet george)
  )
  (:goal (and (met george)))
)