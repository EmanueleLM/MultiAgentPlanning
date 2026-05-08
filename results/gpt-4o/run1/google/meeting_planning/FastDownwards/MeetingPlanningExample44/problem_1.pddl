(define (problem meet_betty_problem)
  (:domain meet_friends_sf)
  (:objects 
    pacific_heights fishermans_wharf - location
    you betty - person
    9:00 9:13 9:45 11:00 12:45 5:00 5:12 - time
  )
  (:init 
    (at you pacific_heights)
    (at betty fishermans_wharf)
    (can_meet betty fishermans_wharf 11:00)
    (can_meet betty fishermans_wharf 12:45)
    (have_time 9:00)
  )
  (:goal 
    (and 
      (visited betty)
    )
  )
)