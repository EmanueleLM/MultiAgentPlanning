(define (problem san_francisco_meeting)
  (:domain san_francisco_schedule)

  (:objects
    nob_hill presidio - location
    timothy - friend
    morning afternoon late_afternoon evening - time_slot
    you - agent
  )

  (:init
    (at you nob_hill)
    (present timothy presidio afternoon)
    (present timothy presidio late_afternoon)
    (present timothy presidio evening)
    (next morning afternoon)
    (next afternoon late_afternoon)
    (next late_afternoon evening)
    (can_meet you timothy presidio late_afternoon)
  )

  (:goal
    (visited timothy)
  )