(define (problem san_francisco_meet_friends)
  (:domain san_francisco_visit)
  (:objects
    nob_hill - location
    marina_district - location
    mary - friend
    nine_am eight_pm ten_pm - time_block
  )
  (:init
    (at_location mary marina_district eight_pm)
    (can_travel nob_hill marina_district)
    (can_travel marina_district nob_hill)
    (current_time nine_am)
    (time_window_open eight_pm ten_pm)
  )
  (:goal (and
    (met mary)
    (visited marina_district)
  ))
)