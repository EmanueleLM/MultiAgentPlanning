(define (problem meet_matthew)
  (:domain san_francisco_trip)

  (:objects
    alamo_square sunset_district - place
    you matthew - person
    nine_am one_thirty_pm two_thirty_pm - time_slot
  )

  (:init
    (at you alamo_square nine_am)
    (at matthew sunset_district one_thirty_pm)
    (available matthew one_thirty_pm)
    (time_order nine_am one_thirty_pm)
    (time_order one_thirty_pm two_thirty_pm)
  )
  
  (:goal (and
    (visited matthew)
    (at you sunset_district two_thirty_pm)
  ))
)