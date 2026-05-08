(define (problem meet_friends)
  (:domain san_francisco_visit)

  (:objects
    union_square nob_hill - location
    mary - friend
    9am 12pm 4_15pm – time
    schedule_stage_1 schedule_stage_2 schedule_stage_3 schedule_stage_4 – stage
    visit_mary – goal
  )

  (:init
    (at_location union_square 9am)
    (stage schedule_stage_1)
    (friend_available mary nob_hill 12pm)
  )

  (:goal
    (goal_met visit_mary)
  )
)