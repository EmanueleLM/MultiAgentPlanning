(define (problem visit_friends)
  (:domain san_francisco_day_trip)

  (:objects
    richmond_district bayview - location
    sarah self - person
    time_0900 time_1415 time_1530 time_1815 - time
  )

  (:init
    (at self - person richmond_district - location time_0900 - time)
    (can_travel richmond_district - location bayview - location time_0900 - time time_1415 - time)
    (can_travel bayview - location richmond_district - location time_1530 - time time_1815 - time)
    (awaiting_meeting sarah - person bayview - location time_1415 - time time_1815 - time)
  )

  (:goal (and
    (met sarah - person)
  ))
)