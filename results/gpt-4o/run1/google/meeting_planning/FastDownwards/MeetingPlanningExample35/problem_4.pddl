(define (problem meet_friend_instance)
  (:domain friend_meeting)
  (:objects 
    bayview chinatown - location
    jason - friend
    time9_00 time9_18 time9_36 time9_54 time10_12 time10_30 time10_48 time11_06 time11_24 time11_42 time12_00 time12_18 time12_30 - timepoint
  )
  (:init
    (at bayview time9_00)
    (available jason chinatown time9_00 time12_30)
    (next time9_00 time9_18)
    (next time9_18 time9_36)
    (next time9_36 time9_54)
    (next time9_54 time10_12)
    (next time10_12 time10_30)
    (next time10_30 time10_48)
    (next time10_48 time11_06)
    (next time11_06 time11_24)
    (next time11_24 time11_42)
    (next time11_42 time12_00)
    (next time12_00 time12_18)
    (next time12_18 time12_30)
    (meeting_duration time9_18)
    (meeting_duration time9_36)
    (not (visited jason))
  )
  (:goal
    (visited jason)
  )
)