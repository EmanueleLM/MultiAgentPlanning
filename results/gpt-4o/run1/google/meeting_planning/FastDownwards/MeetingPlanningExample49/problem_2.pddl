(define (problem visit_friends)
  (:domain san_francisco_day_trip)

  (:objects
    richmond_district bayview - location
    sarah self - person
    time_0900 time_1415 time_1730 time_1815 - time
  )

  (:init
    (at self richmond_district time_0900)
    (can_travel richmond_district bayview time_0900 time_1415)
    (can_travel bayview richmond_district time_1815 time_0900)
    (awaiting_meeting sarah bayview time_1415 time_1730)
  )

  (:goal (and
    (met sarah)
  ))
)