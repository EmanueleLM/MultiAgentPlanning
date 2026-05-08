(define (problem san_francisco_meet_friends)
  (:domain san_francisco_visit)
  (:objects
    nob_hill - location
    marina_district - location
    mary - friend
    nine_am ten_am eleven_am twelve_pm one_pm two_pm three_pm four_pm five_pm six_pm seven_pm eight_pm nine_pm ten_pm eleven_pm - time_step
  )
  (:init
    (at_location mary marina_district)
    (can_travel nob_hill marina_district)
    (can_travel marina_district nob_hill)
    (current_time nine_am)
    (before nine_am ten_am)
    (before ten_am eleven_am)
    (before eleven_am twelve_pm)
    (before twelve_pm one_pm)
    (before one_pm two_pm)
    (before two_pm three_pm)
    (before three_pm four_pm)
    (before four_pm five_pm)
    (before five_pm six_pm)
    (before six_pm seven_pm)
    (before seven_pm eight_pm)
    (before seven_pm eight_pm)
    (before eight_pm nine_pm)
    (before nine_pm ten_pm)
    (before ten_pm eleven_pm)
    (can_meet mary eight_pm ten_pm)
  )
  (:goal (and
    (met mary)
    (visited marina_district)
  ))
)