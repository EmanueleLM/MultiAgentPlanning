(define (problem meet_friends)
  (:domain san_francisco_visit)

  (:objects
    union_square nob_hill - location
    mary - friend
    stage_before_noon schedule_stage_mary_visit stage_after_mary_visit stage_end - stage
  )

  (:init
    (at union_square)
    (stage_at stage_before_noon)
    (friend_available mary nob_hill)
  )

  (:goal
    (visited_mary)
  )
)