(define (problem san_francisco_meeting)
  (:domain san_francisco_schedule)

  (:objects
    nob_hill presidio - location
    timothy - friend
    morning afternoon evening - day_period
    you - agent
  )

  (:init
    (at you nob_hill)
    (free_to_meet timothy afternoon)
    (time_period morning)
    (time_period afternoon)
    (time_period evening)
    (next_period morning afternoon)
    (next_period afternoon evening)
    (different_time_period morning afternoon)
    (different_time_period afternoon evening)
  )

  (:goal
    (visited timothy)
  )
)