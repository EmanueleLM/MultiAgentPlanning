(define (problem meet_friend_instance)
  (:domain friend_meeting)
  (:objects 
    bayview chinatown - location
    jason - friend
    time9_00 time9_18 time9_22 time12_30 time90min_start - time
  )
  (:init
    (at bayview time9_00)
    (available jason chinatown time9_00 time12_30)
    (time_before time9_00 time9_18)
    (time_before time9_18 time9_22)
    (time_before time9_22 time12_30)
    (time_before time9_00 time90min_start)
    (not (meeting_planned jason))
  )
  (:goal
    (and
      (meeting_planned jason)
      (meeting_duration jason time9_00 time9_18 time90min_start)
    )
  )
)