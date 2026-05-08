(define (problem meet_betty_problem)
  (:domain meet_friends_sf)
  (:objects 
    pacific_heights fishermans_wharf - location
    you betty - person
    9:45AM 11:00AM 3:45PM - time
  )
  (:init 
    (at you pacific_heights)
    (at betty fishermans_wharf)
    (time_window_open fishermans_wharf 8:45AM 6:00PM)
    (meeting_possible betty fishermans_wharf)
    (have_time 9:45AM)
  )
  (:goal 
    (and 
      (visited betty)
      (have_time 3:45PM)
    )
  )
)