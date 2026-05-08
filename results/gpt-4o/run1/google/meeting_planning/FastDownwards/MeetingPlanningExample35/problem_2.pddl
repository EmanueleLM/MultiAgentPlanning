(define (problem meet_friend_instance)
  (:domain friend_meeting)
  (:objects 
    bayview chinatown - location
    jason - friend
    time9_00 time9_18 time9_22 time12_30 time9_90 time10_30 time11_00 time11_30 - timepoint
  )
  (:init
    (at bayview time9_00)
    (available jason chinatown time9_00 time12_30)
    (time_before time9_00 time9_18)
    (time_before time9_18 time9_22)
    (time_before time9_22 time12_30)
    (time_before time9_00 time10_30)
    (time_before time10_30 time11_30)
    (time_before time11_00 time12_30)
    (not (visited jason))
  )
  (:goal
    (visited jason)
  )
)