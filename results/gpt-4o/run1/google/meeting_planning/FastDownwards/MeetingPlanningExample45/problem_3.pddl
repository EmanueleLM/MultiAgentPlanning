(define (problem meeting_schedule)
  (:domain travel_and_meeting)
  (:objects
    loc_north_beach loc_alamo_square - location
    agent emily - person
    time_0900 time_0916 time_1930 time_2100 - time
  )
  (:init
    (at agent loc_north_beach)
    (can_travel loc_north_beach loc_alamo_square)
    (can_travel loc_alamo_square loc_north_beach)
    (time_travel time_0900 time_0916)
    (time_travel time_0916 time_2100)
    (can_meet agent emily loc_alamo_square time_1930)
  )
  (:goal
    (meeting_scheduled agent emily)
  )
)