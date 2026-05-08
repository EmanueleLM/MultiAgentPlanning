(define (problem meet_margaret_in_san_francisco)
  (:domain san_francisco_meeting)
  (:objects
    marina_district pacific_heights - location
    you margaret - person
    time_9am time_7pm time_after_meeting_margaret - time_point
  )
  (:init
    (at you marina_district)
    (at margaret pacific_heights) 
    (can_travel marina_district pacific_heights)
    (can_travel pacific_heights marina_district)
    (time_point_order time_9am time_7pm)
    (time_point_order time_7pm time_after_meeting_margaret)
    (scheduled_meeting you margaret)
  )
  (:goal
    (and (met you margaret))
  )
)