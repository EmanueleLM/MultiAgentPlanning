(define (problem meet_matthew)
  (:domain san_francisco_trip)

  (:objects
    alamo_square sunset_district - place
    matthew - person
    nine_am one_thirty_pm two_thirty_pm - time_slot
  )

  (:init
    (you_at alamo_square)
    (available matthew one_thirty_pm)
    (at matthew sunset_district)
    (time_order nine_am one_thirty_pm)
    (time_order one_thirty_pm two_thirty_pm)
  )

  (:goal (and
    (visited matthew)
  ))
)