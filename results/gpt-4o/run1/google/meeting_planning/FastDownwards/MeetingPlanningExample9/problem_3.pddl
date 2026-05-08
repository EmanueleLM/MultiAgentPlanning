(define (problem meet_friends)
  (:domain san_francisco_visit)

  (:objects
    union_square nob_hill - location
    mary - friend
    stage_before_noon schedule_stage_mary_visit stage_after_mary_visit stage_end - stage
    visit_mary - goal
  )

  (:init
    (at_location union_square)
    (stage_at stage_before_noon)
    (friend_available mary nob_hill)
  )

  (:goal
    (goal_met visit_mary)
  )
)