(define (problem MeetingPlanningExample17-problem)
  (:domain meet-matthew-succ)
  (:objects
    trav - traveler
    alamo_square sunset_district - location
    matthew - person
    t09_00 t13_14 t13_30 t14_30 - tpoint
  )

  (:init
    (at trav alamo_square)
    (at-time t09_00)
    (next t09_00 t13_14)
    (next t13_14 t13_30)
    (next t13_30 t14_30)
    (leg alamo_square sunset_district t13_14 t13_30)
    (meeting-allowed matthew sunset_district t13_30 t14_30)
  )

  (:goal (and
    (met matthew)
  ))
)